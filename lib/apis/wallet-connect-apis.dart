// ignore_for_file: unused_element, file_names, avoid_print, use_build_context_synchronously

import 'package:flutter/material.dart';
import 'package:smart_web/view/coinswap/helpers/custom-toast.dart';
import 'package:walletconnect_dart/walletconnect_dart.dart';

class WalletHttp {
  WalletConnect? connector;

  Future<String> connectMetamask(BuildContext context) async {
    try {
      connector = WalletConnect(
        bridge: 'wss://bridge.walletconnect.org',
        clientMeta: PeerMeta(
          name: 'Smart Web',
          description: 'A decentralized app for cross-chain swaps',
          url: 'https://yourapp.com',
          icons: ['https://yourapp.com/icon.png'],
        ),
      );

      final session = await connector!.createSession(
        chainId: 1, // Ethereum Mainnet
        onDisplayUri: (uri) {
          CustomToast.show(context, "Scan the QR code to connect MetaMask.");
        },
      );

      String walletAddress = session.accounts.first;
      CustomToast.show(context, "MetaMask connected successfully!");
      Navigator.pop(context);
      return walletAddress;
    } catch (e) {
      print('MetaMask connection error: $e');
      String errorMessage = "Failed to connect MetaMask.";
      if (e.toString().contains('WebSocket')) {
        errorMessage = "Network connection failed. Please check your internet connection.";
      }
      CustomToast.show(context, errorMessage);
      Navigator.pop(context);
      return "";
    }
  }

  // Connect to Coin98
  Future<String> connectCoin98(BuildContext context) async {
    try {
      connector = WalletConnect(
        bridge: 'wss://bridge.walletconnect.org',
        clientMeta: PeerMeta(
          name: 'Smart Web',
          description: 'A decentralized app for cross-chain swaps',
          url: 'https://yourapp.com',
          icons: ['https://yourapp.com/icon.png'],
        ),
      );

      final session = await connector!.createSession(
        chainId: 56, // BSC Mainnet
        onDisplayUri: (uri) {
          CustomToast.show(context, "Scan the QR code to connect Coin98.");
        },
      );

      String walletAddress = session.accounts.first;
      CustomToast.show(context, "Coin98 connected successfully!");
      Navigator.pop(context);
      return walletAddress;
    } catch (e) {
      CustomToast.show(context, "Failed to connect Coin98: $e");
      Navigator.pop(context);
      return "";
    }
  }

  // Connect to WalletConnect
  Future<String> connectWalletConnect(BuildContext context) async {
    try {
      connector = WalletConnect(
        bridge: 'wss://bridge.walletconnect.org',
        clientMeta: PeerMeta(
          name: 'Smart Web',
          description: 'A decentralized app for cross-chain swaps',
          url: 'https://yourapp.com',
          icons: ['https://yourapp.com/icon.png'],
        ),
      );

      final session = await connector!.createSession(
        chainId: 1, // Ethereum Mainnet
        onDisplayUri: (uri) {
          CustomToast.show(context, "Scan the QR code to connect WalletConnect.");
        },
      );

      String walletAddress = session.accounts.first;
      CustomToast.show(context, "WalletConnect connected successfully!");
      Navigator.pop(context);
      return walletAddress;
    } catch (e) {
      CustomToast.show(context, "Failed to connect WalletConnect: $e");
      Navigator.pop(context);
      return "";
    }
  }

  // Connect to Coinbase Wallet
  Future<String> connectCoinbaseWallet(BuildContext context) async {
    try {
      connector = WalletConnect(
        bridge: 'wss://bridge.walletconnect.org',
        clientMeta: PeerMeta(
          name: 'Smart Web',
          description: 'A decentralized app for cross-chain swaps',
          url: 'https://yourapp.com',
          icons: ['https://yourapp.com/icon.png'],
        ),
      );

      final session = await connector!.createSession(
        chainId: 1, // Ethereum Mainnet
        onDisplayUri: (uri) {
          CustomToast.show(context, "Scan the QR code to connect Coinbase Wallet.");
        },
      );

      String walletAddress = session.accounts.first;
      CustomToast.show(context, "Coinbase Wallet connected successfully!");
      Navigator.pop(context);
      return walletAddress;
    } catch (e) {
      CustomToast.show(context, "Failed to connect Coinbase Wallet: $e");
      Navigator.pop(context);
      return "";
    }
  }

  // Connect to BiKeep
  Future<String> connectBiKeep(BuildContext context) async {
    try {
      connector = WalletConnect(
        bridge: 'wss://bridge.walletconnect.org',
        clientMeta: PeerMeta(
          name: 'Smart Web',
          description: 'A decentralized app for cross-chain swaps',
          url: 'https://yourapp.com',
          icons: ['https://yourapp.com/icon.png'],
        ),
      );

      final session = await connector!.createSession(
        chainId: 137, // Polygon Mainnet
        onDisplayUri: (uri) {
          CustomToast.show(context, "Scan the QR code to connect BiKeep.");
        },
      );

      String walletAddress = session.accounts.first;
      CustomToast.show(context, "BiKeep connected successfully!");
      Navigator.pop(context);
      return walletAddress;
    } catch (e) {
      CustomToast.show(context, "Failed to connect BiKeep: $e");
      Navigator.pop(context);
      return "";
    }
  }
}
