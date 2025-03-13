import 'package:flutter/material.dart';
import 'package:smart_web/view/network/widget/network-list.dart';
import 'package:smart_web/view/network/widget/search.dart';
import 'package:smart_web/view/network/widget/validators.dart';

import '../../utils/utils.dart';

class NetworkScreen extends StatefulWidget {
  const NetworkScreen({super.key});

  @override
  State<NetworkScreen> createState() => _NetworkScreenState();
}

class _NetworkScreenState extends State<NetworkScreen> {
  TextEditingController searchValidator = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.backgroundColor,
      body: SingleChildScrollView(
        child: Column(
          children: [
            Padding(
              padding: EdgeInsets.only(right: 550.w, top: 100.h),
              child: Text(
                TextConst.network,
                style: TextStyle(
                    fontFamily: 'Fractul',
                    fontWeight: FontWeight.w600,
                    fontSize: 17.sp,
                    color: AppColors.textColor),
              ),
            ),
            SizedBox(
              height: 50.h,
            ),
            ValidatorsOverview(),
            SearchValidator(searchValidator: searchValidator),
            NetworkList()
          ],
        ),
      ),
    );
  }
}
