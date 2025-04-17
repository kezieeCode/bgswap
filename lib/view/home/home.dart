// ignore_for_file: deprecated_member_use

import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:http/http.dart';
import 'package:smart_web/view/coinswap/helpers/custom-toast.dart';
import 'package:smart_web/view/coinswap/widget/modals/mobile/network-modal-mobile.dart';
import 'package:walletconnect_dart/walletconnect_dart.dart';
import 'package:smart_web/view/home/widget/address-info.dart';
import 'package:web3dart/web3dart.dart';

import '../../utils/utils.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  int _currentIndex = 0;

  String selectedNetwork = 'BSC Mainnet';
  String selectedNetworkIcon = 'assets/images/bnb.png';

  String? userAddress;
  String? userBalance;
  final List<Widget> _pages = [
    CrossChainScreen(),
    ExploreScreen(),
    BridgesScreen(),
    NetworkScreen(),
  ];

  late WalletConnect connector;

  // @override
  // void initState() {
  //   super.initState();
  //   connector = WalletConnect(
  //     bridge: 'wss://bridge.walletconnect.org',
  //     clientMeta: PeerMeta(
  //       name: 'Smart Web',
  //       description: 'A decentralized app for cross-chain swaps',
  //       url: 'https://yourapp.com',
  //       icons: ['https://yourapp.com/icon.png'],
  //     ),
  //   );
  // }

  void _onTabSelected(int index) {
    setState(() {
      _currentIndex = index;
    });
  }

  updateSelectedNetwork(String newNetwork, String newIcon) {
    setState(() {
      selectedNetwork = newNetwork;
      selectedNetworkIcon = newIcon;
    });
    Navigator.pop(context);
  }

  void updateWalletDetails(String address, String balance) {
    setState(() {
      userAddress = address;
      userBalance = balance;
    });
  }

  Future connectWallet(BuildContext context, String walletOption) async {
    if (!connector.connected) {
      try {
        final session = await connector.createSession(
          chainId: 1, // Ethereum Mainnet
          onDisplayUri: (uri) {
            // Display the WalletConnect QR code or deep link
            print('WalletConnect URI: $uri');
            CustomToast.show(
                context, "Scan the QR code to connect your wallet.");
          },
        );

        // Get the wallet address from the session
        String walletAddress = session.accounts.first;

        // Validate the wallet address
        if (walletAddress.length != 42 || !walletAddress.startsWith("0x")) {
          throw Exception("Invalid wallet address: $walletAddress");
        }

        // Update the state with the wallet address
        setState(() {
          userAddress = walletAddress;
        });

        // Fetch the wallet balance
        await fetchBalance(walletAddress);

        CustomToast.show(context, "$walletOption connected successfully!");
      } catch (e) {
        print('Error during wallet connection: $e');
        CustomToast.show(context, "Failed to connect $walletOption.");
      }
    }
  }

  Future<void> fetchBalance(String walletAddress) async {
    try {
      // Replace with your Ethereum RPC URL (e.g., Infura or Alchemy)
      final rpcUrl = "https://mainnet.infura.io/v3/${TextConst.APIKEY}";
      final client = Web3Client(rpcUrl, Client());

      // Convert the wallet address to an EthereumAddress object
      final address = EthereumAddress.fromHex(walletAddress);

      // Fetch the balance from the blockchain
      final balance = await client.getBalance(address);

      // Update the state with the fetched balance
      setState(() {
        userBalance =
            balance.getValueInUnit(EtherUnit.ether).toStringAsFixed(4);
      });

      client.dispose();
    } catch (e) {
      print('Error fetching balance: $e');
      CustomToast.show(context, "Failed to fetch wallet balance.");
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: PreferredSize(
        preferredSize: MediaQuery.of(context).size.width < 600
            ? Size.fromHeight(80.h)
            : Size.fromHeight(100.h),
        child: AppBar(
          elevation: 0,
          leading: MediaQuery.of(context).size.width < 600
              ? Builder(builder: (context) {
                  return Padding(
                    padding: EdgeInsets.only(top: 10.h),
                    child: GestureDetector(
                      child: Icon(
                        Icons.menu,
                        color: AppColors.textColor,
                        size: 35.sp,
                      ),
                      onTap: () {
                        Scaffold.of(context).openDrawer();
                      },
                    ),
                  );
                })
              : null,
          title: MediaQuery.of(context).size.width < 600
              ? Container(
                  child: Padding(
                    padding: EdgeInsets.only(top: 20.h),
                    child: Row(
                      // mainAxisAlignment: MainAxisAlignment.,
                      children: [
                        Image.asset("assets/images/logo-mobile.png",
                            height: 50.h, width: 50.w),
                        SizedBox(
                          width: 180.w,
                        ),
                        Container(
                          height: 50.h,
                          width: 50.h,
                          decoration: BoxDecoration(
                            color: const Color.fromARGB(243, 32, 36, 53),
                            borderRadius: BorderRadius.circular(10.sp),
                          ),
                          child: InkWell(
                            onTap: () {
                              showCustomDialogMobile(context);
                            },
                            child: Image.asset(selectedNetworkIcon,
                                height: 50.h, width: 50.w),
                          ),
                        ),
                        ButtonConstantMobile().createButton(
                          onPressed: () {
                            print("Connect Wallet button pressed");
                          },
                          child: Text('Connect Wallet',
                              style: TextStyle(
                                  color: AppColors.textColor,
                                  fontSize: 23.sp,
                                  fontFamily: 'Sora')),
                        )
                      ],
                    ),
                  ),
                )
              : Padding(
                  padding: EdgeInsets.only(top: 30.h),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    spacing: 10.sp,
                    children: [
                      Image.asset(
                        "assets/images/logo.png",
                        height: 500.h,
                        width: 200.w,
                      ),
                      SizedBox(
                        width: 200.w,
                      ),
                      InkWell(
                        onTap: () {
                          _onTabSelected(0);
                        },
                        child: Text(
                          'Cross Swap',
                          style: _currentIndex == 0
                              ? TextstyleConstant()
                                  .navBarColored // Active style
                              : TextstyleConstant().navBarDefault,
                        ),
                      ),
                      PopupMenuButton<int>(
                        onSelected: (index) => _onTabSelected(index),
                        color: AppColors.appBarColor,
                        shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(5.sp)),
                        itemBuilder: (context) => [
                          PopupMenuItem(
                            value: 1,
                            child: InkWell(
                              onTap: () {
                                _onTabSelected(1);
                              },
                              child: Text('Explore',
                                  style: TextstyleConstant().commonText),
                            ),
                          ),
                          PopupMenuItem(
                            value: 2,
                            child: InkWell(
                              onTap: () {
                                _onTabSelected(2);
                              },
                              child: Text('Bridges',
                                  style: TextstyleConstant().commonText),
                            ),
                          ),
                          PopupMenuItem(
                            value: 3,
                            child: InkWell(
                              onTap: () {
                                _onTabSelected(3);
                              },
                              child: Text('Network',
                                  style: TextstyleConstant().commonText),
                            ),
                          ),
                        ],
                        child: Row(
                          children: [
                            Text(
                              "Explore",
                              style: TextstyleConstant().navBarDefault,
                            ),
                            Icon(Icons.arrow_drop_down, color: Colors.white),
                          ],
                        ),
                      ),
                      ButtonConstant().createButton(
                        context: context,
                          color: const Color.fromARGB(243, 54, 61, 92),
                          onPressed: () {
                            showCustomDialog(context);
                          },
                          child: Row(
                            children: [
                              Image.asset(
                                selectedNetworkIcon,
                                width: 10.w,
                              ),
                              SizedBox(
                                width: 5.w,
                              ),
                              Text(
                                selectedNetwork,
                                style: TextstyleConstant().commonText,
                              ),
                            ],
                          )),
                      userAddress != null
                          ? InkWell(
                              onTap: () {
                                showAddressDialog(context,
                                    "${userAddress!.substring(0, 6)}...${userAddress!.substring(userAddress!.length - 3)}");
                              },
                              child: Container(
                                height: 40.h,
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(10.sp),
                                ),
                                child: Row(
                                  children: [
                                    Container(
                                      padding:
                                          EdgeInsets.symmetric(horizontal: 8.w),
                                      decoration: BoxDecoration(
                                        color: const Color.fromARGB(
                                            243, 54, 61, 92), // Custom Color
                                        borderRadius: BorderRadius.only(
                                            topLeft: Radius.circular(4.sp),
                                            bottomLeft: Radius.circular(4.sp)),
                                      ),
                                      child: Center(
                                        child: Text(
                                          "$userBalance BNB",
                                          style: TextstyleConstant().commonText,
                                        ),
                                      ),
                                    ),
                                    Container(
                                      padding: EdgeInsets.symmetric(
                                          horizontal: 12.w),
                                      decoration: BoxDecoration(
                                        color: AppColors
                                            .buttonColor, // Normal blue
                                        borderRadius: BorderRadius.only(
                                            topRight: Radius.circular(4.sp),
                                            topLeft: Radius.circular(4.sp),
                                            bottomLeft: Radius.circular(4.sp),
                                            bottomRight: Radius.circular(4.sp)),
                                      ),
                                      child: Center(
                                        child: Text(
                                          "${userAddress!.substring(0, 6)}...${userAddress!.substring(userAddress!.length - 3)}",
                                          style: TextstyleConstant().commonText,
                                        ),
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                            )
                          : ButtonConstant().createButton(
                            context: context,
                              color: AppColors.buttonColor,
                              onPressed: () => showWalletDialog(context),
                              child: Text('Connect Wallet',
                                  style: TextstyleConstant().commonText),
                            ),
                    ],
                  ),
                ),
          backgroundColor: AppColors.appBarColor,
        ),
      ),
      // drawerScrimColor: Colors.transparent,
      drawer: MediaQuery.of(context).size.width < 600
          ? Drawer(
              child: ListView(
                padding: EdgeInsets.zero,
                children: [
                  DrawerHeader(
                    decoration: BoxDecoration(
                      color: AppColors.appBarColor,
                    ),
                    child: Text(
                      'Menu',
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 24.sp,
                      ),
                    ),
                  ),
                  ListTile(
                    leading: Icon(Icons.swap_horiz),
                    title: Text('Cross Swap'),
                    onTap: () {
                      _onTabSelected(0);
                      Navigator.pop(context);
                    },
                  ),
                  ListTile(
                    leading: Icon(Icons.explore),
                    title: Text('Explore'),
                    onTap: () {
                      _onTabSelected(1);
                      Navigator.pop(context);
                    },
                  ),
                  ListTile(
                    leading: Icon(Icons.currency_bitcoin),
                    title: Text('Bridges'),
                    onTap: () {
                      _onTabSelected(2);
                      Navigator.pop(context);
                    },
                  ),
                  ListTile(
                    leading: Icon(Icons.network_cell),
                    title: Text('Network'),
                    onTap: () {
                      _onTabSelected(3);
                      Navigator.pop(context);
                    },
                  ),
                ],
              ),
            )
          : null,
      body: IndexedStack(
        index: _currentIndex.clamp(0, _pages.length - 1),
        children: _pages,
      ),
    );
  }

  void showWalletDialog(BuildContext context) {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return Dialog(
          shape:
              RoundedRectangleBorder(borderRadius: BorderRadius.circular(5.sp)),
          elevation: 0,
          backgroundColor: AppColors.appBarColor,
          child: WalletsOptions(
            onWalletConnected: (String walletOption, String balance) async {
              // Wrap connectWallet to match the expected signature
              await connectWallet(context, walletOption);
            }, // Pass the callback
          ),
        );
      },
    );
  }

  void showCustomDialog(BuildContext context) {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return Dialog(
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(5.sp),
          ),
          elevation: 0,
          backgroundColor: AppColors.appBarColor,
          child: CoinOptions(onNetworkSelected: (String network, String icon) {
            updateSelectedNetwork(network, icon);
          }),
        );
      },
    );
  }

  void showCustomDialogMobile(BuildContext context) {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return Dialog(
          alignment: Alignment.center,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(5.sp),
          ),
          elevation: 0,
          backgroundColor: AppColors.appBarColor,
          child: CoinOptionsMobile(
              onNetworkSelected: (String network, String icon) {
            updateSelectedNetwork(network, icon);
          }),
        );
      },
    );
  }

  void showAddressDialog(BuildContext context, String address) {
    showDialog(
      context: context,
      barrierDismissible: true,
      builder: (BuildContext context) {
        return BackdropFilter(
          filter: ImageFilter.blur(sigmaX: 5, sigmaY: 5),
          child: Container(
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(10.sp),
              color: const Color.fromARGB(255, 55, 54, 54).withOpacity(0.2),
            ),
            child: Dialog(
              alignment: Alignment.topRight,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(10.sp),
              ),
              elevation: 0,
              backgroundColor: AppColors.appBarColor,
              child: AddressInfo(
                address: address,
              ),
            ),
          ),
        );
      },
    );
  }
}
