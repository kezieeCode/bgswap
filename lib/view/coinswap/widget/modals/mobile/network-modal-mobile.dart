// ignore_for_file: public_member_api_docs, sort_constructors_first
// ignore_for_file: file_names, avoid_print

import 'package:flutter/material.dart';

import 'package:smart_web/utils/utils.dart';
import 'package:smart_web/view/coinswap/widget/modals/mobile/network_list_mobile.dart';

import '../../../../../apis/network-connect-apis.dart';

class CoinOptionsMobile extends StatefulWidget {
  final Function(String, String) onNetworkSelected;
  const CoinOptionsMobile({
    super.key,
   
    required this.onNetworkSelected,
  });

  @override
  State<CoinOptionsMobile> createState() => _CoinOptionsMobileState();
}

class _CoinOptionsMobileState extends State<CoinOptionsMobile> {
  late String selectedWallet = "";
  @override
  // void initState() {
  //   super.initState();
  //   selectedWallet =
  //       widget.selectedNet; // Initialize with the current network
  // }

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: 100.w,
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
                  "Switch Network",
                  style: TextstyleConstantMobile().commonText2,
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
                      size: 30.sp,
                    ))
              ],
            ),
            SizedBox(height: 10),
            Padding(
              padding: EdgeInsets.only(left: 10.w),
              child: Column(
                // crossAxisAlignment: CrossAxisAlignment.stretch,
                children: List.generate(
                    TextConst.networks.length,
                    (index) => Padding(
                          padding: EdgeInsets.only(bottom: 15.h),
                          child: GestureDetector(
                            onTap: () {
                              setState(() {
                                selectedWallet = TextConst
                                    .network[index]; // Update selected wallet
                              });

                              _handleNetworkSelection(
                                  TextConst.networks[index]);
                              widget.onNetworkSelected(TextConst.networks[index],TextConst.networkIcons[index]);
                            },
                            child: NetworksMobile(TextConst.networkIcons[index],
                                TextConst.networks[index]),
                          ),
                        )),
              ),
            ),
            SizedBox(height: 20),
          ],
        ),
      ),
    );
  }
}

// Handle wallet-specific actions
void _handleNetworkSelection(String network) {
  final networkHttp = NetworkHttp();

  // Debugging log to check the network name
  print("Selected network: $network");

  switch (network) {
    case 'BSC Mainnet':
      networkHttp.connectBNBChain();
      break;
    case 'Cronos Mainnet':
      networkHttp.connectCronos();
      break;
    case 'Ethereum Mainnet':
      networkHttp.connectEthereum();
      break;
    case 'Fantom mainnet':
      networkHttp.connectFantom();
      break;
    case 'Polygon Mainnet':
      networkHttp.connectPolygon();
      break;
    default:
      print("Unknown network selected: $network");
  }
}
