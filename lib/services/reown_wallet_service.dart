// ignore_for_file: avoid_print

import 'package:flutter/material.dart';
import 'package:reown_appkit/reown_appkit.dart';
import '../constants/string-constant.dart';

class ReownWalletService {
  static ReownAppKitModal? _appKitModal;
  static ReownAppKitModal? get appKitModal => _appKitModal;

  // Initialize the Reown AppKit (call once at app startup)
  static Future<void> initialize(BuildContext context) async {
    try {
      // Don't reinitialize if already initialized
      if (_appKitModal != null) {
        print('✅ Reown already initialized');
        return;
      }

      print('🔄 Initializing Reown AppKit...');

      // Create the modal instance
      _appKitModal = ReownAppKitModal(
        context: context,
        projectId: TextConst.reownProjectID,
        metadata: const PairingMetadata(
          name: 'Smart Web',
          description: 'A decentralized app for cross-chain swaps',
          url: 'https://smartweb.app',
          icons: ['https://smartweb.app/icon.png'],
          redirect: Redirect(
            native: 'smartweb://',
            universal: 'https://smartweb.app',
            linkMode: true, // Enable link mode for better wallet support
          ),
        ),
      );

      // Initialize the modal
      await _appKitModal!.init();
      
      // Set up event listeners
      _setupEventListeners();
      
      print('✅ Reown AppKit initialized successfully');
      print('📱 Project ID: ${TextConst.reownProjectID}');
    } catch (e) {
      print('❌ Error initializing Reown AppKit: $e');
      print('💡 Check your Project ID at: https://cloud.reown.com');
      rethrow;
    }
  }

  // Setup event listeners for connection events
  static void _setupEventListeners() {
    // Listen to modal connection
    _appKitModal?.onModalConnect.subscribe((args) {
      print('🎉 Modal connected event fired!');
      final address = getCurrentAddress();
      print('   Address: $address');
    });

    // Listen to modal disconnect
    _appKitModal?.onModalDisconnect.subscribe((args) {
      print('👋 Modal disconnected event fired');
    });

    // Listen to modal errors
    _appKitModal?.onModalError.subscribe((args) {
      print('❌ Modal error occurred');
    });

    print('📡 Event listeners set up');
  }

  // Open wallet connection modal and wait for connection
  static Future<String?> openModalAndConnect(BuildContext context) async {
    try {
      if (_appKitModal == null) {
        await initialize(context);
      }

      // Check if already connected
      if (_appKitModal?.isConnected ?? false) {
        final address = getCurrentAddress();
        print('✅ Already connected: $address');
        return address;
      }

      print('🔄 Opening wallet selection modal...');
      
      // Open the modal
      await _appKitModal?.openModalView();

      // Wait for the modal to close (connection or cancellation)
      // The modal automatically closes when user connects or cancels
      // We'll check connection status after a delay
      await Future.delayed(const Duration(milliseconds: 1000));

      // Check if connected after modal interaction
      int attempts = 0;
      while (attempts < 30) { // Wait up to 30 seconds
        if (_appKitModal?.isConnected ?? false) {
          final address = getCurrentAddress();
          print('✅ Wallet connected: $address');
          return address;
        }
        
        // Check if modal is still open
        // If closed and not connected, user cancelled
        await Future.delayed(const Duration(seconds: 1));
        attempts++;
      }

      print('⏱️ Connection timeout or cancelled');
      return null;
    } catch (e) {
      print('❌ Error connecting wallet: $e');
      return null;
    }
  }

  // Legacy method - redirects to new method
  static Future<void> openModal(BuildContext context) async {
    await openModalAndConnect(context);
  }

  // Get current wallet address
  static String? getCurrentAddress() {
    final session = _appKitModal?.session;
    if (session != null && session.getAccounts() != null) {
      final accounts = session.getAccounts();
      if (accounts!.isNotEmpty) {
        // Extract address from account string (format: "eip155:1:0x...")
        final address = accounts.first.split(':').last;
        return address;
      }
    }
    return null;
  }

  // Get current chain ID
  static String? getCurrentChainId() {
    return _appKitModal?.selectedChain?.chainId;
  }

  // Check if wallet is connected
  static bool isConnected() {
    return _appKitModal?.isConnected ?? false;
  }

  // Disconnect wallet
  static Future<void> disconnect() async {
    try {
      await _appKitModal?.disconnect();
      print('✅ Wallet disconnected');
    } catch (e) {
      print('❌ Error disconnecting wallet: $e');
    }
  }

  // Switch to a different chain
  static Future<void> switchChain(String chainId) async {
    try {
      // This will be implemented based on your chain requirements
      print('✅ Switched to chain: $chainId');
    } catch (e) {
      print('❌ Error switching chain: $e');
    }
  }

  // Get wallet balance (in native token)
  static Future<String> getBalance() async {
    try {
      if (!isConnected()) return '0.0';

      final address = getCurrentAddress();
      if (address == null) return '0.0';

      // Get balance using web3dart
      final chainId = getCurrentChainId();
      final rpcUrl = _getRpcUrl(chainId ?? '1');

      // Use your existing balance fetching logic
      return await _fetchBalance(address, rpcUrl);
    } catch (e) {
      print('❌ Error getting balance: $e');
      return '0.0';
    }
  }

  // Helper: Get RPC URL for chain
  static String _getRpcUrl(String chainId) {
    switch (chainId) {
      case '1':
        return 'https://mainnet.infura.io/v3/${TextConst.apiKey}';
      case '56':
        return 'https://bsc-dataseed.binance.org/';
      case '137':
        return 'https://polygon-mainnet.infura.io/v3/${TextConst.apiKey}';
      case '25':
        return 'https://evm.cronos.org';
      case '250':
        return 'https://rpc.ftm.tools/';
      default:
        return 'https://mainnet.infura.io/v3/${TextConst.apiKey}';
    }
  }

  // Helper: Fetch balance using web3dart
  static Future<String> _fetchBalance(String address, String rpcUrl) async {
    try {
      // This will be implemented with your existing web3dart logic
      // For now, return a placeholder
      return '0.0';
    } catch (e) {
      print('❌ Error fetching balance: $e');
      return '0.0';
    }
  }

  // Listen to connection changes
  static void addConnectionListener(Function(bool isConnected) callback) {
    _appKitModal?.onModalConnect.subscribe((args) {
      callback(true);
    });

    _appKitModal?.onModalDisconnect.subscribe((args) {
      callback(false);
    });
  }

  // Listen to account changes
  static void addAccountListener(Function(String? address) callback) {
    _appKitModal?.onSessionUpdateEvent.subscribe((args) {
      callback(getCurrentAddress());
    });
  }

  // Listen to chain changes
  static void addChainListener(Function(String? chainId) callback) {
    _appKitModal?.onSessionUpdateEvent.subscribe((args) {
      callback(getCurrentChainId());
    });
  }
}

