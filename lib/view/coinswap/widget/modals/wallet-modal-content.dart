// ignore_for_file: file_names, use_build_context_synchronously

import 'package:flutter/material.dart';
import 'package:smart_web/utils/utils.dart';
import 'package:web3dart/web3dart.dart';
import 'package:http/http.dart'; // For making HTTP requests

import '../../../../../apis/wallet-connect-apis.dart';
import '../../../../view/coinswap/helpers/custom-toast.dart';

class WalletsOptions extends StatefulWidget {
  final Function(String, String) onWalletConnected;

  const WalletsOptions({super.key, required this.onWalletConnected});

  @override
  State<WalletsOptions> createState() => _WalletsOptionsState();
}

class _WalletsOptionsState extends State<WalletsOptions> {
  String selectedWallet = "";
  bool isConnecting = false;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: 220.w,
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          mainAxisSize: MainAxisSize.min, // Makes modal height dynamic
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                SizedBox(
                  width: 1.w,
                ),
                Text(
                  "Connect Wallet",
                  style: TextstyleConstant().commonText,
                ),
                SizedBox(
                  width: 100.w,
                ),
                IconButton(
                  onPressed: () {
                    Navigator.pop(context);
                  },
                  icon: Icon(
                    Icons.close,
                    color: Colors.white,
                    size: 7.sp,
                  ),
                ),
              ],
            ),
            SizedBox(height: 10),
            Padding(
              padding: EdgeInsets.only(left: 10.w),
              child: Column(
                children: List.generate(
                  TextConst.wallets.length,
                  (index) => GestureDetector(
                    onTap: () async {
                      setState(() {
                        selectedWallet = TextConst.wallets[index];
                        isConnecting = true;
                      });

                      try {
                        // Handle wallet selection and connection
                        String address = await _handleWalletSelection(
                          TextConst.wallets[index],
                        );

                        // Fetch the real balance
                        String balance = await _fetchBalance(address);

                        // Pass the wallet address and balance back to the parent widget
                        widget.onWalletConnected(address, balance);
                      } catch (e) {
                        CustomToast.show(context, "Failed to connect wallet.");
                      } finally {
                        setState(() {
                          isConnecting = false;
                        });
                      }
                    },
                    child: Padding(
                      padding: EdgeInsets.only(bottom: 15.h),
                      child: Networks(
                        TextConst.walletIcons[index],
                        isConnecting && selectedWallet == TextConst.wallets[index]
                            ? "Connecting..."
                            : TextConst.wallets[index],
                      ),
                    ),
                  ),
                ),
              ),
            ),
            SizedBox(height: 20),
          ],
        ),
      ),
    );
  }

  Future<String> _handleWalletSelection(String wallet) async {
    final web3Http = WalletHttp();

    // Simulate a delay for wallet connection
    await Future.delayed(Duration(seconds: 2));

    switch (wallet) {
      case 'Metamask':
        return await web3Http.connectMetamask(context);
      case 'Coin98':
        return await web3Http.connectCoin98(context);
      case 'WalletConnect':
        return await web3Http.connectWalletConnect(context);
      case 'Coinbase Wallet':
        return await web3Http.connectWalletConnect(context);
      case 'BiKeep':
        return await web3Http.connectWalletConnect(context);
      default:
        CustomToast.show(context, "Unknown wallet selected");
        return "0x000...000"; // Fallback address
    }
  }

  Future<String> _fetchBalance(String walletAddress) async {
    try {
      // Replace with your Ethereum RPC URL (e.g., Infura or Alchemy)
      final rpcUrl = "https://mainnet.infura.io/v3/${TextConst.apiKey}";
      final client = Web3Client(rpcUrl, Client());

      final address = EthereumAddress.fromHex(walletAddress);
      final balance = await client.getBalance(address);

      client.dispose();

      // Convert balance to Ether and return as a string
      return balance.getValueInUnit(EtherUnit.ether).toStringAsFixed(4);
    } catch (e) {
      print('Error fetching balance: $e');
      CustomToast.show(context, "Failed to fetch wallet balance.");
      return "0.0"; // Return 0.0 as fallback
    }
  }
}