// ignore_for_file: unused_element, file_names, avoid_print, use_build_context_synchronously

import 'package:flutter/material.dart';
import '../services/reown_wallet_service.dart';

class WalletHttp {

  Future<String> connectMetamask(BuildContext context) async {
    try {
      print('🔵 Attempting to connect wallet...');
      
      // Initialize Reown if needed
      if (ReownWalletService.appKitModal == null) {
        print('🔄 Initializing Reown...');
        await ReownWalletService.initialize(context);
      }
      
      // Open Reown modal and wait for connection
      print('📱 Opening Reown modal...');
      final address = await ReownWalletService.openModalAndConnect(context);
      
      if (address != null && address.isNotEmpty) {
        print('✅ Connected! Address: $address');
        if (Navigator.canPop(context)) Navigator.pop(context);
        return address;
      }

      print('⚠️ No address received');
      return "";
    } catch (e) {
      print('❌ Connection error: $e');
      if (Navigator.canPop(context)) Navigator.pop(context);
      return "";
    }
  }

  // All other wallets use the same Reown connection
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

  // Fetch wallet balance
  Future<String> fetchBalance(String walletAddress) async {
    try {
      return await ReownWalletService.getBalance();
    } catch (e) {
      print('Error fetching balance: $e');
      return "0.0";
    }
  }

  // Disconnect wallet
  Future<void> disconnect() async {
    await ReownWalletService.disconnect();
  }
}
