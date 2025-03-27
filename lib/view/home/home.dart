// ignore_for_file: deprecated_member_use

import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:smart_web/view/home/widget/address-info.dart';
import 'package:reown_walletkit/reown_walletkit.dart';
import '../../utils/utils.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  int _currentIndex = 0;
  late final ReownWalletKit _walletKit;
  late Sessions? session;
  String selectedNetwork = 'BSC Mainnet';
  String selectedNetworkIcon = 'assets/images/bnb.png';
  String? _walletAddress;
  String? userAddress;
  String? userBalance;
  final List<Widget> _pages = [
    CrossChainScreen(),
    ExploreScreen(),
    BridgesScreen(),
    NetworkScreen(),
  ];

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    _initWalletKit();
  }

  void _initWalletKit() {
    _walletKit = ReownWalletKit(
      core: ReownCore(
        projectId: TextConst.reownProjectID,
      ),
      metadata: PairingMetadata(
        name: 'BGSwap',
        description: 'Multi-chain bridge swap',
        url: 'https://bgswap.vercel.app',
        icons: ['https://yourapp.com/icon.png'],
        redirect: Redirect(
          native: 'yourapp://',
          universal: 'https://yourapp.com',
        ),
      ),
    );

    // _registerWallets();
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

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: PreferredSize(
        preferredSize: Size.fromHeight(100.h),
        child: AppBar(
          elevation: 0,
          title: Padding(
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
                        ? TextstyleConstant().navBarColored // Active style
                        : TextstyleConstant().navBarDefault,
                  ),
                ),
                // Explore Dropdown
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
                // Wallet Button Logic
                userAddress != null && userBalance != null
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
                              // Balance Section
                              Container(
                                padding: EdgeInsets.symmetric(horizontal: 8.w),
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
                              // Address Section
                              Container(
                                padding: EdgeInsets.symmetric(horizontal: 12.w),
                                decoration: BoxDecoration(
                                  color: AppColors.buttonColor, // Normal blue
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
      body: IndexedStack(
        index: _currentIndex.clamp(0, _pages.length - 1),
        children: _pages,
      ),
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
            onWalletConnected: updateWalletDetails, // Pass the callback
          ),
        );
      },
    );
  }

  void showAddressDialog(BuildContext context, String address) {
    showDialog(
      context: context,
      barrierDismissible: true, // Allow tapping outside to dismiss
      builder: (BuildContext context) {
        return BackdropFilter(
          filter:
              ImageFilter.blur(sigmaX: 5, sigmaY: 5), // Adjust blur strength
          child: Container(
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(10.sp),
              color: const Color.fromARGB(255, 55, 54, 54)
                  .withOpacity(0.2), // Adjust opacity for dim effect
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
