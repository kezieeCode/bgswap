// ignore_for_file: avoid_print

import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';
import 'package:web3dart/web3dart.dart';
import 'package:smart_web/services/wallet_backend_service.dart';
import '../constants/string-constant.dart';

/// Simple wallet connection service without heavy dependencies
/// Works with your existing UI
class SimpleWalletService {
  static String? _connectedAddress;
  static String? _connectedChain;
  static final WalletBackendService _backendService = WalletBackendService();
  
  // Get connected address
  static String? getAddress() => _connectedAddress;
  
  // Check if connected
  static bool isConnected() => _connectedAddress != null;
  
  // Connect via WalletConnect deep link
  static Future<String?> connectMetamask(BuildContext context) async {
    try {
      // For web: Try to connect via MetaMask extension
      // For mobile: Open MetaMask app
      
      // Generate a mock address for now (replace with actual connection)
      const testAddress = '0x742d35Cc6634C0532925a3b844Bc9e7595f0bEb';
      
      _connectedAddress = testAddress;
      _connectedChain = 'eip155:1';
      
      print('✅ MetaMask connected: $testAddress');
      return testAddress;
    } catch (e) {
      print('❌ MetaMask connection error: $e');
      return null;
    }
  }
  
  // Connect other wallets
  static Future<String?> connectWallet(String walletName) async {
    try {
      // Deep link URLs for different wallets
      final deepLinks = {
        'MetaMask': 'https://metamask.app.link/dapp/smartweb.app',
        'Coinbase Wallet': 'https://go.cb-w.com/dapp?cb_url=https://smartweb.app',
        'Trust Wallet': 'https://link.trustwallet.com/open_url?url=https://smartweb.app',
      };
      
      final url = deepLinks[walletName];
      if (url != null) {
        final uri = Uri.parse(url);
        if (await canLaunchUrl(uri)) {
          await launchUrl(uri, mode: LaunchMode.externalApplication);
        }
      }
      
      // For testing: Return a mock address
      const testAddress = '0x742d35Cc6634C0532925a3b844Bc9e7595f0bEb';
      
      _connectedAddress = testAddress;
      print('✅ $walletName connected: $testAddress');
      return testAddress;
    } catch (e) {
      print('❌ $walletName connection error: $e');
      return null;
    }
  }
  
  // Fetch balance
  static Future<String> fetchBalance(String address,
      {String? networkLabel}) async {
    try {
      final targetNetwork = networkLabel ?? TextConst.networks.first;
      final balanceWei = await _backendService.fetchBalance(
        networkLabel: targetNetwork,
        address: address,
      );

      final balance = EtherAmount.fromBigInt(
        EtherUnit.wei,
        balanceWei,
      ).getValueInUnit(EtherUnit.ether);

      return balance.toStringAsFixed(4);
    } catch (e) {
      print('❌ Error fetching balance: $e');
      return "0.0";
    }
  }
  
  // Disconnect
  static void disconnect() {
    _connectedAddress = null;
    _connectedChain = null;
    print('✅ Wallet disconnected');
  }
  
  // Get RPC URL for chain
  static String getRpcUrl(String chainId) {
    switch (chainId) {
      case '1':
      case 'eip155:1':
        return 'https://mainnet.infura.io/v3/${TextConst.apiKey}';
      case '56':
      case 'eip155:56':
        return 'https://bsc-dataseed.binance.org/';
      case '137':
      case 'eip155:137':
        return 'https://polygon-mainnet.infura.io/v3/${TextConst.apiKey}';
      case '25':
      case 'eip155:25':
        return 'https://evm.cronos.org';
      case '250':
      case 'eip155:250':
        return 'https://rpc.ftm.tools/';
      default:
        return 'https://mainnet.infura.io/v3/${TextConst.apiKey}';
    }
  }
}

