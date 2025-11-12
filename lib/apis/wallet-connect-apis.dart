// ignore_for_file: unused_element, file_names, avoid_print, use_build_context_synchronously

import 'package:flutter/material.dart';

import 'package:web3dart/web3dart.dart';

import '../services/metamask_service.dart';
import '../services/wallet_backend_service.dart';
import '../view/coinswap/widget/modals/components/wallet_connection_dialog.dart';

class WalletHttp {
  WalletHttp({WalletBackendService? backendService})
      : _service = backendService ?? WalletBackendService();

  final WalletBackendService _service;

  Future<String> connectWallet(
    BuildContext context,
    String walletName, {
    List<String> chains = const ['eip155:1'],
    List<String> methods = const ['eth_sendTransaction', 'personal_sign'],
  }) async {
    try {
      if (walletName.toLowerCase() == 'metamask') {
        final address = await connectMetaMask();
        if (address != null && address.isNotEmpty) {
          return address;
        }

        debugPrint('MetaMask connection failed or was rejected.');
        return "";
      }

      final session = await _service.createSession(
        relayProtocol: 'irn',
        chains: chains,
        methods: methods,
      );

      final address = await showDialog<String>(
        context: context,
        barrierDismissible: false,
        builder: (dialogContext) => WalletConnectionDialog(
          session: session,
          walletName: walletName,
          service: _service,
        ),
      );

      return address ?? "";
    } catch (e) {
      debugPrint('Wallet connection error: $e');
      return "";
    }
  }

  Future<String> fetchBalance(
    String walletAddress, {
    required String networkLabel,
  }) async {
    try {
      final balanceWei = await _service.fetchBalance(
        networkLabel: networkLabel,
        address: walletAddress,
      );
      final balance = EtherAmount.fromBigInt(
        EtherUnit.wei,
        balanceWei,
      ).getValueInUnit(EtherUnit.ether);

      return balance.toStringAsFixed(4);
    } catch (error, stackTrace) {
      debugPrint('Wallet balance fetch failed: $error\n$stackTrace');
      rethrow;
    }
  }

  Future<void> disconnect() async {
    // Session management handled server-side; nothing to do here yet.
  }
}
