// ignore_for_file: deprecated_member_use

import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:smart_web/view/coinswap/helpers/custom-toast.dart';
import 'package:smart_web/view/coinswap/widget/modals/mobile/network-modal-mobile.dart';
import 'package:smart_web/view/home/widget/address-info.dart';
import 'package:web3dart/web3dart.dart';

import '../../services/wallet_backend_service.dart';
import '../../utils/utils.dart';
import '../../ui/drawer/mobile_drawer.dart';
import '../../routing/app_routes.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  int _currentIndex = 0;
  bool _drawerOpen = false;

  String selectedNetwork = 'BSC Mainnet';
  String selectedNetworkIcon = 'assets/images/bnb.png';

  String? userAddress;
  String? userBalance;
  final WalletBackendService _walletBackendService = WalletBackendService();
  final List<Widget> _pages = [
    CrossChainScreen(),
    ExploreScreen(),
    BridgesScreen(),
    NetworkScreen(),
  ];

  @override
  void initState() {
    super.initState();
    _checkExistingConnection();
  }

  Future<void> _checkExistingConnection() async {
    // Backend-managed sessions will be restored in a future iteration.
    // For now simply ensure UI is ready.
    await Future.delayed(const Duration(milliseconds: 200));
  }

  void _onTabSelected(int index) {
    setState(() {
      _currentIndex = index;
    });
  }

  String get _selectedTicker => TextConst.tickerForNetwork(selectedNetwork);

  updateSelectedNetwork(String newNetwork, String newIcon) {
    setState(() {
      selectedNetwork = newNetwork;
      selectedNetworkIcon = newIcon;
    });
    Navigator.pop(context);

    final address = userAddress;
    if (address != null &&
        address.isNotEmpty &&
        address.startsWith('0x') &&
        address.length == 42) {
      fetchBalance(address, networkLabel: newNetwork);
    }
  }

  void updateWalletDetails(String address, String balance) {
    setState(() {
      userAddress = address;
      userBalance = balance;
    });
  }

  Future connectWallet(BuildContext context, String walletOption) async {
    try {
      // Connection handled by WalletHttp in wallet-connect-apis.dart
      // This method is called after successful connection
      print('✅ Wallet connection initiated for $walletOption');
    } catch (e) {
      print('Error during wallet connection: $e');
      CustomToast.show(context, "Failed to connect $walletOption");
    }
  }

  Future<void> fetchBalance(
    String walletAddress, {
    String? networkLabel,
  }) async {
    try {
      if (!walletAddress.startsWith('0x') || walletAddress.length != 42) {
        return;
      }

      final targetNetwork = networkLabel ?? selectedNetwork;
      final balanceWei = await _walletBackendService.fetchBalance(
        networkLabel: targetNetwork,
        address: walletAddress,
      );
      final amount = EtherAmount.fromBigInt(EtherUnit.wei, balanceWei)
          .getValueInUnit(EtherUnit.ether);

      if (!mounted) return;

      setState(() {
        userBalance = amount.toStringAsFixed(4);
      });
    } catch (e) {
      print('Error fetching balance: $e');
      CustomToast.show(context, "Failed to fetch wallet balance.");
    }
  }

  @override
  Widget build(BuildContext context) {
    final scaffold = Scaffold(
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
                        setState(() {
                          _drawerOpen = true;
                        });
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
                      children: [
                        Image.asset("assets/images/logo-mobile.png",
                            height: 50.h, width: 50.w),
                        SizedBox(width: 180.w),
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
                        userAddress != null
                            ? Container(
                                padding: EdgeInsets.symmetric(
                                    horizontal: 20.w, vertical: 15.h),
                                decoration: BoxDecoration(
                                  color: AppColors.buttonColor,
                                  borderRadius: BorderRadius.circular(15.sp),
                                ),
                                child: Text(
                                  userBalance != null
                                      ? '$userBalance $_selectedTicker'
                                      : '${userAddress!.substring(0, 4)}...${userAddress!.substring(userAddress!.length - 4)}',
                                  style: TextStyle(
                                      color: AppColors.textColor,
                                      fontSize: 20.sp,
                                      fontWeight: FontWeight.w600,
                                      fontFamily: 'Sora'),
                                ),
                              )
                            : ButtonConstantMobile().createButton(
                                onPressed: () {
                                  showWalletDialog(context);
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
                      SizedBox(width: 200.w),
                      InkWell(
                        onTap: () {
                          _onTabSelected(0);
                        },
                        child: Text(
                          'Cross Swap',
                          style: _currentIndex == 0
                              ? TextstyleConstant().navBarColored
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
                              onTap: () { _onTabSelected(1); },
                              child: Text('Explore',
                                  style: TextstyleConstant().commonText),
                            ),
                          ),
                          PopupMenuItem(
                            value: 2,
                            child: InkWell(
                              onTap: () { _onTabSelected(2); },
                              child: Text('Bridges',
                                  style: TextstyleConstant().commonText),
                            ),
                          ),
                          PopupMenuItem(
                            value: 3,
                            child: InkWell(
                              onTap: () { _onTabSelected(3); },
                              child: Text('Network',
                                  style: TextstyleConstant().commonText),
                            ),
                          ),
                        ],
                        child: Row(
                          children: [
                            Text("Explore", style: TextstyleConstant().navBarDefault),
                            Icon(Icons.arrow_drop_down, color: Colors.white),
                          ],
                        ),
                      ),
                      ButtonConstant().createButton(
                        context: context,
                        color: const Color.fromARGB(243, 54, 61, 92),
                        onPressed: () { showCustomDialog(context); },
                        child: Row(
                          children: [
                            Image.asset(selectedNetworkIcon, width: 10.w),
                            SizedBox(width: 5.w),
                            Text(selectedNetwork, style: TextstyleConstant().commonText),
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
                                      padding: EdgeInsets.symmetric(horizontal: 8.w),
                                      decoration: BoxDecoration(
                                        color: const Color.fromARGB(243, 54, 61, 92),
                                        borderRadius: BorderRadius.only(
                                            topLeft: Radius.circular(4.sp),
                                            bottomLeft: Radius.circular(4.sp)),
                                      ),
                                      child: Center(
                                        child: Text(
                                          userBalance != null
                                              ? "$userBalance $_selectedTicker"
                                              : "--",
                                          style: TextstyleConstant().commonText,
                                        ),
                                      ),
                                    ),
                                    Container(
                                      padding: EdgeInsets.symmetric(horizontal: 12.w),
                                      decoration: BoxDecoration(
                                        color: AppColors.buttonColor,
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
                              child: Text('Connect Wallet', style: TextstyleConstant().commonText),
                            ),
                    ],
                  ),
                ),
          backgroundColor: AppColors.appBarColor,
        ),
      ),
      drawer: null,
      body: IndexedStack(
        index: _currentIndex.clamp(0, _pages.length - 1),
        children: _pages,
      ),
    );

    // Wrap with overlay drawer for mobile
    final isMobile = MediaQuery.of(context).size.width < 600;
    return Stack(
      children: [
        scaffold,
        if (isMobile)
          MobileDrawer(
            visible: _drawerOpen,
            activeRoute: _activeRouteForIndex(_currentIndex),
            onClose: () => setState(() => _drawerOpen = false),
            onNavigate: (route) {
              setState(() {
                _currentIndex = _indexForRoute(route);
                _drawerOpen = false;
              });
            },
          ),
      ],
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
            selectedNetwork: selectedNetwork,
            onWalletConnected: (String address, String balance) async {
              // Update wallet details
              setState(() {
                userAddress = address;
                userBalance = balance;
              });
              await connectWallet(context, address);
              await fetchBalance(address, networkLabel: selectedNetwork);
            },
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

  String _activeRouteForIndex(int index) {
    switch (index) {
      case 1:
        return AppRoutes.explorer;
      case 2:
        return AppRoutes.bridges;
      case 3:
        return AppRoutes.network;
      default:
        return AppRoutes.bridges;
    }
  }

  int _indexForRoute(String route) {
    switch (route) {
      case AppRoutes.explorer:
        return 1;
      case AppRoutes.bridges:
        return 2;
      case AppRoutes.network:
        return 3;
      default:
        return 0;
    }
  }
}

