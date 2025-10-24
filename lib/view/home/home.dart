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

  @override
  void initState() {
    super.initState();
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
    } catch (e) {
      print('WalletConnect initialization failed: $e');
      // Initialize with a dummy connector to prevent null errors
      connector = WalletConnect(
        bridge: 'wss://bridge.walletconnect.org',
        clientMeta: PeerMeta(
          name: 'Smart Web',
          description: 'A decentralized app for cross-chain swaps',
          url: 'https://yourapp.com',
          icons: ['https://yourapp.com/icon.png'],
        ),
      );
    }
  }

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
        // Show a more user-friendly error message
        String errorMessage = "Failed to connect $walletOption.";
        if (e.toString().contains('WebSocket')) {
          errorMessage = "Network connection failed. Please check your internet connection.";
        }
        CustomToast.show(context, errorMessage);
      }
    }
  }

  Future<void> fetchBalance(String walletAddress) async {
    try {
      // Replace with your Ethereum RPC URL (e.g., Infura or Alchemy)
      final rpcUrl = "https://mainnet.infura.io/v3/${TextConst.apiKey}";
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
              backgroundColor: AppColors.backgroundColor,
              child: Column(
                children: [
                  // Custom Drawer Header
                  Container(
                    height: 200.h,
                    width: double.infinity,
                    decoration: BoxDecoration(
                      gradient: LinearGradient(
                        begin: Alignment.topLeft,
                        end: Alignment.bottomRight,
                        colors: [
                          AppColors.appBarColor,
                          AppColors.buttonColor.withOpacity(0.8),
                        ],
                      ),
                    ),
                    child: SafeArea(
                      child: Padding(
                        padding: EdgeInsets.all(20.w),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            SizedBox(height: 20.h),
                            Row(
                              children: [
                                Image.asset(
                                  "assets/images/logo-mobile.png",
                                  height: 50.h,
                                  width: 50.w,
                                ),
                                SizedBox(width: 15.w),
                                Expanded(
                                  child: Column(
                                    crossAxisAlignment: CrossAxisAlignment.start,
                                    children: [
                                      Text(
                                        'BV Swap',
                      style: TextStyle(
                                          color: AppColors.textColor,
                                          fontFamily: 'Sora',
                        fontSize: 24.sp,
                                          fontWeight: FontWeight.bold,
                                        ),
                                      ),
                                      SizedBox(height: 5.h),
                                      Text(
                                        'Cross-Chain DeFi Platform',
                                        style: TextStyle(
                                          color: AppColors.textColor.withOpacity(0.7),
                                          fontFamily: 'Sora',
                                          fontSize: 12.sp,
                                          fontWeight: FontWeight.w400,
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                              ],
                            ),
                            SizedBox(height: 20.h),
                            if (userAddress != null) ...[
                              Container(
                                padding: EdgeInsets.symmetric(
                                  horizontal: 12.w,
                                  vertical: 8.h,
                                ),
                                decoration: BoxDecoration(
                                  color: AppColors.buttonColor.withOpacity(0.2),
                                  borderRadius: BorderRadius.circular(20.r),
                                  border: Border.all(
                                    color: AppColors.buttonColor.withOpacity(0.3),
                                    width: 1,
                                  ),
                                ),
                                child: Row(
                                  mainAxisSize: MainAxisSize.min,
                                  children: [
                                    Icon(
                                      Icons.account_balance_wallet,
                                      color: AppColors.buttonColor,
                                      size: 16.sp,
                                    ),
                                    SizedBox(width: 8.w),
                                    Text(
                                      "${userAddress!.substring(0, 6)}...${userAddress!.substring(userAddress!.length - 4)}",
                                      style: TextStyle(
                                        color: AppColors.buttonColor,
                                        fontFamily: 'Sora',
                                        fontSize: 12.sp,
                                        fontWeight: FontWeight.w500,
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                            ],
                          ],
                        ),
                      ),
                    ),
                  ),
                  
                  // Navigation Items
                  Expanded(
                    child: ListView(
                      padding: EdgeInsets.symmetric(vertical: 20.h),
                      children: [
                        _buildDrawerItem(
                          context: context,
                          icon: Icons.swap_horiz,
                          title: 'Cross Swap',
                          subtitle: 'Exchange tokens across chains',
                          index: 0,
                          isSelected: _currentIndex == 0,
                        ),
                        SizedBox(height: 8.h),
                        _buildDrawerItem(
                          context: context,
                          icon: Icons.explore,
                          title: 'Explore',
                          subtitle: 'Discover DeFi opportunities',
                          index: 1,
                          isSelected: _currentIndex == 1,
                        ),
                        SizedBox(height: 8.h),
                        _buildDrawerItem(
                          context: context,
                          icon: Icons.account_balance,
                          title: 'Bridges',
                          subtitle: 'Cross-chain bridge protocols',
                          index: 2,
                          isSelected: _currentIndex == 2,
                        ),
                        SizedBox(height: 8.h),
                        _buildDrawerItem(
                          context: context,
                          icon: Icons.network_cell,
                          title: 'Network',
                          subtitle: 'Manage blockchain networks',
                          index: 3,
                          isSelected: _currentIndex == 3,
                        ),
                        
                        SizedBox(height: 30.h),
                        
                        // Divider
                        Container(
                          margin: EdgeInsets.symmetric(horizontal: 20.w),
                          height: 1,
                          color: AppColors.greyButton.withOpacity(0.3),
                        ),
                        
                        SizedBox(height: 20.h),
                        
                        // Network Selection
                        Padding(
                          padding: EdgeInsets.symmetric(horizontal: 20.w),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                'Current Network',
                                style: TextStyle(
                                  color: AppColors.defaultText,
                                  fontFamily: 'Sora',
                                  fontSize: 12.sp,
                                  fontWeight: FontWeight.w500,
                                ),
                              ),
                              SizedBox(height: 8.h),
                              InkWell(
                    onTap: () {
                      Navigator.pop(context);
                                  showCustomDialogMobile(context);
                                },
                                child: Container(
                                  padding: EdgeInsets.symmetric(
                                    horizontal: 16.w,
                                    vertical: 12.h,
                                  ),
                                  decoration: BoxDecoration(
                                    color: AppColors.greyButton,
                                    borderRadius: BorderRadius.circular(12.r),
                                    border: Border.all(
                                      color: AppColors.buttonColor.withOpacity(0.2),
                                      width: 1,
                                    ),
                                  ),
                                  child: Row(
                                    children: [
                                      Image.asset(
                                        selectedNetworkIcon,
                                        height: 24.h,
                                        width: 24.w,
                                      ),
                                      SizedBox(width: 12.w),
                                      Expanded(
                                        child: Text(
                                          selectedNetwork,
                                          style: TextStyle(
                                            color: AppColors.textColor,
                                            fontFamily: 'Sora',
                                            fontSize: 14.sp,
                                            fontWeight: FontWeight.w500,
                                          ),
                                        ),
                                      ),
                                      Icon(
                                        Icons.arrow_forward_ios,
                                        color: AppColors.defaultText,
                                        size: 16.sp,
                                      ),
                                    ],
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),
                  
                  // Footer
                  Container(
                    padding: EdgeInsets.all(20.w),
                    child: Column(
                      children: [
                        Container(
                          width: double.infinity,
                          padding: EdgeInsets.symmetric(vertical: 12.h),
                          decoration: BoxDecoration(
                            color: AppColors.greyButton,
                            borderRadius: BorderRadius.circular(12.r),
                          ),
                          child: Text(
                            'Version 1.0.0',
                            textAlign: TextAlign.center,
                            style: TextStyle(
                              color: AppColors.defaultText,
                              fontFamily: 'Sora',
                              fontSize: 12.sp,
                              fontWeight: FontWeight.w400,
                            ),
                          ),
                        ),
                      ],
                    ),
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

  Widget _buildDrawerItem({
    required BuildContext context,
    required IconData icon,
    required String title,
    required String subtitle,
    required int index,
    required bool isSelected,
  }) {
    return Container(
      margin: EdgeInsets.symmetric(horizontal: 20.w),
      decoration: BoxDecoration(
        color: isSelected 
            ? AppColors.buttonColor.withOpacity(0.1)
            : Colors.transparent,
        borderRadius: BorderRadius.circular(12.r),
        border: isSelected 
            ? Border.all(
                color: AppColors.buttonColor.withOpacity(0.3),
                width: 1,
              )
            : null,
      ),
      child: Material(
        color: Colors.transparent,
        child: InkWell(
          onTap: () {
            _onTabSelected(index);
            Navigator.pop(context);
          },
          borderRadius: BorderRadius.circular(12.r),
          child: Padding(
            padding: EdgeInsets.symmetric(
              horizontal: 16.w,
              vertical: 16.h,
            ),
            child: Row(
              children: [
                Container(
                  padding: EdgeInsets.all(12.w),
                  decoration: BoxDecoration(
                    color: isSelected 
                        ? AppColors.buttonColor.withOpacity(0.2)
                        : AppColors.greyButton,
                    borderRadius: BorderRadius.circular(10.r),
                  ),
                  child: Icon(
                    icon,
                    color: isSelected 
                        ? AppColors.buttonColor
                        : AppColors.defaultText,
                    size: 20.sp,
                  ),
                ),
                SizedBox(width: 16.w),
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        title,
                        style: TextStyle(
                          color: isSelected 
                              ? AppColors.buttonColor
                              : AppColors.textColor,
                          fontFamily: 'Sora',
                          fontSize: 16.sp,
                          fontWeight: FontWeight.w600,
                        ),
                      ),
                      SizedBox(height: 2.h),
                      Text(
                        subtitle,
                        style: TextStyle(
                          color: AppColors.defaultText,
                          fontFamily: 'Sora',
                          fontSize: 12.sp,
                          fontWeight: FontWeight.w400,
                        ),
                      ),
                    ],
                  ),
                ),
                if (isSelected)
                  Icon(
                    Icons.check_circle,
                    color: AppColors.buttonColor,
                    size: 20.sp,
                  ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
