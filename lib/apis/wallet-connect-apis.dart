// ignore_for_file: unused_element, file_names, avoid_print, use_build_context_synchronously

import 'package:flutter/material.dart';

import '../services/wallet_backend_service.dart';
import '../view/coinswap/widget/modals/components/wallet_connection_dialog.dart';

class WalletHttp {
  WalletHttp({WalletBackendService? backendService})
      : _service = backendService ?? WalletBackendService();

  final WalletBackendService _service;

  Future<String> connectMetamask(BuildContext context) async {
    try {
      final session = await _service.createSession(
        relayProtocol: 'irn',
        chains: const ['eip155:1'],
        methods: const ['eth_sendTransaction', 'personal_sign'],
      );

      final address = await showDialog<String>(
        context: context,
        barrierDismissible: false,
        builder: (dialogContext) => WalletConnectionDialog(
          session: session,
          walletName: 'Metamask',
          service: _service,
        ),
      );

      return address ?? "";
    } catch (e) {
      debugPrint('Wallet connection error: $e');
      return "";
    }
  }

  Future<String> connectCoin98(BuildContext context) async {
    return await connectMetamask(context);
  }

  Future<String> connectWalletConnect(BuildContext context) async {
    return await connectMetamask(context);
  }

  Future<String> connectCoinbaseWallet(BuildContext context) async {
    return await connectMetamask(context);
  }

  Future<String> connectBiKeep(BuildContext context) async {
    return await connectMetamask(context);
  }

  Future<String> fetchBalance(String walletAddress) async {
    // Balance fetching is handled elsewhere via on-chain queries.
    return "0.0";
  }

  Future<void> disconnect() async {
    // Session management handled server-side; nothing to do here yet.
  }
}
