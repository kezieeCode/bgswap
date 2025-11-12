// ignore_for_file: file_names, use_build_context_synchronously

import 'package:flutter/material.dart';
import 'package:smart_web/utils/utils.dart';
import 'package:web3dart/web3dart.dart';

import '../../../../../apis/wallet-connect-apis.dart';
import '../../../../../services/wallet_backend_service.dart';
import '../../../../view/coinswap/helpers/custom-toast.dart';

class WalletsOptions extends StatefulWidget {
  final Function(String, String) onWalletConnected;
  final String selectedNetwork;

  const WalletsOptions({
    super.key,
    required this.onWalletConnected,
    required this.selectedNetwork,
  });

  @override
  State<WalletsOptions> createState() => _WalletsOptionsState();
}

class _WalletsOptionsState extends State<WalletsOptions> {
  String selectedWallet = "";
  bool isConnecting = false;
  final WalletBackendService _backendService = WalletBackendService();

  @override
  Widget build(BuildContext context) {
    const Color dialogBg = Color(0xFF0F1115);
    return ConstrainedBox(
      constraints: const BoxConstraints(maxWidth: 480),
      child: Material(
        color: dialogBg,
        borderRadius: BorderRadius.circular(16.sp),
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 20),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                children: [
                  Expanded(
                    child: Text(
                      "Connect Wallet",
                      style: TextStyle(
                        color: Colors.white,
                        fontFamily: 'Sora',
                        fontSize: 32.sp,
                        fontWeight: FontWeight.w800,
                      ),
                    ),
                  ),
                  IconButton(
                    onPressed: () => Navigator.pop(context),
                    icon: Icon(Icons.close, color: Colors.white, size: 28.sp),
                  ),
                ],
              ),
              SizedBox(height: 12),
              Flexible(
                child: SingleChildScrollView(
                  child: Column(
                    children: List.generate(
                      TextConst.wallets.length,
                      (index) => Padding(
                        padding: EdgeInsets.only(bottom: 16),
                        child: _WalletOptionCard(
                          iconAsset: TextConst.walletIcons[index],
                          label: isConnecting && selectedWallet == TextConst.wallets[index]
                              ? "Connecting..."
                              : TextConst.wallets[index],
                          onTap: () async {
                            setState(() {
                              selectedWallet = TextConst.wallets[index];
                              isConnecting = true;
                            });
                            try {
                              final address = await _handleWalletSelection(TextConst.wallets[index]);
                              if (address.isEmpty) {
                                return;
                              }
                              final balance = await _fetchBalance(address);
                              widget.onWalletConnected(address, balance);
                            } catch (e) {
                              CustomToast.show(context, "Failed to connect wallet.");
                            } finally {
                              if (mounted) {
                                setState(() { isConnecting = false; });
                              }
                            }
                          },
                        ),
                      ),
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Future<String> _handleWalletSelection(String wallet) async {
    final web3Http = WalletHttp();
    final address = await web3Http.connectWallet(context, wallet);
    if (address.isEmpty) {
      CustomToast.show(context, "Wallet connection cancelled or failed.");
    }
    return address;
  }

  Future<String> _fetchBalance(String walletAddress) async {
    try {
      if (!walletAddress.startsWith('0x') || walletAddress.length != 42) {
        return "0.0";
      }

      final balanceWei = await _backendService.fetchBalance(
        networkLabel: widget.selectedNetwork,
        address: walletAddress,
      );
      final balance = EtherAmount.fromBigInt(
        EtherUnit.wei,
        balanceWei,
      ).getValueInUnit(EtherUnit.ether);

      // Convert balance to Ether and return as a string
      return balance.toStringAsFixed(4);
    } catch (e) {
      print('Error fetching balance: $e');
      CustomToast.show(context, "Failed to fetch wallet balance.");
      return "0.0"; // Return 0.0 as fallback
    }
  }
}

class _WalletOptionCard extends StatelessWidget {
  final String iconAsset;
  final String label;
  final VoidCallback onTap;

  const _WalletOptionCard({
    required this.iconAsset,
    required this.label,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    const Color cardBg = Color(0xFF171A21);
    const Color border = Color(0xFF2A2F3A);
    const Color textPrimary = Color(0xFFE6EAF2);

    return Material(
      color: cardBg,
      borderRadius: BorderRadius.circular(20.sp),
      child: InkWell(
        onTap: onTap,
        borderRadius: BorderRadius.circular(20.sp),
        child: Container(
          height: 100,
          padding: EdgeInsets.symmetric(horizontal: 24),
          decoration: BoxDecoration(
            border: Border.all(color: border, width: 1),
            borderRadius: BorderRadius.circular(20.sp),
          ),
          child: Row(
            children: [
              Image.asset(iconAsset, height: 58, width: 58),
              SizedBox(width: 20),
              Expanded(
                child: Text(
                  label,
                  maxLines: 1,
                  overflow: TextOverflow.ellipsis,
                  style: TextStyle(
                    color: textPrimary,
                    fontFamily: 'Sora',
                    fontSize: 24.sp,
                    fontWeight: FontWeight.w800,
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}