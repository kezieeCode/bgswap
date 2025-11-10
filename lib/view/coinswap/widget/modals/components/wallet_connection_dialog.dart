import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:qr_flutter/qr_flutter.dart';
import 'package:url_launcher/url_launcher.dart';

import '../../../../../services/wallet_backend_service.dart';

class WalletConnectionDialog extends StatefulWidget {
  const WalletConnectionDialog({
    super.key,
    required this.session,
    required this.walletName,
    required this.service,
  });

  final WalletSession session;
  final String walletName;
  final WalletBackendService service;

  @override
  State<WalletConnectionDialog> createState() =>
      _WalletConnectionDialogState();
}

class _WalletConnectionDialogState extends State<WalletConnectionDialog> {
  Timer? _pollTimer;
  String _statusMessage = 'Awaiting approval in your wallet...';
  bool _hasError = false;

  @override
  void initState() {
    super.initState();
    _startPolling();
  }

  @override
  void dispose() {
    _pollTimer?.cancel();
    super.dispose();
  }

  void _startPolling() {
    _pollTimer?.cancel();
    _pollTimer = Timer.periodic(const Duration(seconds: 2), (_) async {
      try {
        final status =
            await widget.service.fetchSessionStatus(widget.session.sessionId);
        final address = _extractAddress(status.wallet);

        if (!mounted) return;

        if (address != null && address.isNotEmpty) {
          _pollTimer?.cancel();
          Navigator.of(context).pop(address);
          return;
        }

        if (!status.isPending) {
          setState(() {
            _hasError = true;
            _statusMessage = 'Connection ${status.status}. Please try again.';
          });
          _pollTimer?.cancel();
        }
      } catch (e) {
        if (!mounted) return;
        setState(() {
          _hasError = true;
          _statusMessage = 'Failed to check status. Please try again.';
        });
        _pollTimer?.cancel();
      }
    });
  }

  String? _extractAddress(Map<String, dynamic> wallet) {
    if (wallet.isEmpty) return null;
    if (wallet['address'] is String) return wallet['address'] as String;

    if (wallet['accounts'] is List &&
        (wallet['accounts'] as List).isNotEmpty) {
      final account = wallet['accounts'].first;
      if (account is String) return account;
      if (account is Map<String, dynamic>) {
        if (account['address'] is String) return account['address'] as String;
      }
    }

    if (wallet['addresses'] is List &&
        (wallet['addresses'] as List).isNotEmpty) {
      final address = wallet['addresses'].first;
      if (address is String) return address;
    }

    return null;
  }

  Future<void> _copyUri() async {
    await Clipboard.setData(ClipboardData(text: widget.session.uri));
    if (mounted) {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text('WalletConnect URI copied to clipboard')),
      );
    }
  }

  Future<void> _launchDeepLink() async {
    final encoded = Uri.encodeComponent(widget.session.uri);
    final deepLink = Uri.parse('https://link.trustwallet.com/wc?uri=$encoded');

    if (await canLaunchUrl(deepLink)) {
      await launchUrl(deepLink, mode: LaunchMode.externalApplication);
    } else {
      if (mounted) {
        ScaffoldMessenger.of(context).showSnackBar(
          const SnackBar(
            content: Text('Could not open wallet link. Please scan the QR code.'),
          ),
        );
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    return Dialog(
      backgroundColor: const Color(0xFF0F1115),
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(16)),
      child: Padding(
        padding: const EdgeInsets.all(24),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Row(
              children: [
                Expanded(
                  child: Text(
                    'Connect ${widget.walletName}',
                    style: const TextStyle(
                      color: Colors.white,
                      fontSize: 20,
                      fontWeight: FontWeight.w700,
                    ),
                  ),
                ),
                IconButton(
                  onPressed: () => Navigator.of(context).pop(),
                  icon: const Icon(Icons.close, color: Colors.white),
                ),
              ],
            ),
            const SizedBox(height: 16),
            Container(
              padding: const EdgeInsets.all(16),
              decoration: BoxDecoration(
                color: const Color(0xFF171A21),
                borderRadius: BorderRadius.circular(20),
                border: Border.all(color: const Color(0xFF2A2F3A)),
              ),
              child: Column(
                children: [
                  QrImageView(
                    data: widget.session.uri,
                    size: 220,
                    eyeStyle: const QrEyeStyle(
                      eyeShape: QrEyeShape.square,
                      color: Colors.white,
                    ),
                    dataModuleStyle: const QrDataModuleStyle(
                      dataModuleShape: QrDataModuleShape.circle,
                      color: Colors.white,
                    ),
                  ),
                  const SizedBox(height: 16),
                  Text(
                    'Scan this QR code with your ${widget.walletName} app or copy the link below.',
                    textAlign: TextAlign.center,
                    style: const TextStyle(color: Colors.white70, fontSize: 14),
                  ),
                  const SizedBox(height: 12),
                  Container(
                    padding: const EdgeInsets.symmetric(
                      horizontal: 12,
                      vertical: 12,
                    ),
                    decoration: BoxDecoration(
                      color: const Color(0xFF0F1115),
                      borderRadius: BorderRadius.circular(12),
                      border: Border.all(color: const Color(0xFF2A2F3A)),
                    ),
                    child: Text(
                      widget.session.uri,
                      maxLines: 2,
                      overflow: TextOverflow.ellipsis,
                      style: const TextStyle(
                        color: Colors.white54,
                        fontSize: 12,
                      ),
                    ),
                  ),
                  const SizedBox(height: 12),
                  Row(
                    children: [
                      Expanded(
                        child: OutlinedButton.icon(
                          onPressed: _copyUri,
                          icon: const Icon(Icons.copy, size: 16),
                          style: OutlinedButton.styleFrom(
                            foregroundColor: Colors.white,
                            side: const BorderSide(color: Color(0xFF2A2F3A)),
                          ),
                          label: const Text('Copy Link'),
                        ),
                      ),
                      const SizedBox(width: 12),
                      Expanded(
                        child: ElevatedButton.icon(
                          onPressed: _launchDeepLink,
                          style: ElevatedButton.styleFrom(
                            backgroundColor: const Color(0xFF3D6EFF),
                            foregroundColor: Colors.white,
                          ),
                          icon: const Icon(Icons.open_in_new, size: 16),
                          label: const Text('Open Wallet'),
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
            const SizedBox(height: 20),
            Row(
              children: [
                Expanded(
                  child: Text(
                    _statusMessage,
                    style: TextStyle(
                      color: _hasError ? Colors.redAccent : Colors.white70,
                    ),
                  ),
                ),
              ],
            ),
            const SizedBox(height: 12),
            Align(
              alignment: Alignment.centerRight,
              child: TextButton(
                onPressed: () => Navigator.of(context).pop(),
                style: TextButton.styleFrom(foregroundColor: Colors.white70),
                child: const Text('Cancel'),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

