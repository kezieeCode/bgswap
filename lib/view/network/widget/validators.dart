import 'package:flutter/material.dart';
import 'package:smart_web/utils/utils.dart';
import 'package:smart_web/view/network/helper/overview-box.dart';

class ValidatorsOverview extends StatefulWidget {
  const ValidatorsOverview({super.key});

  @override
  State<ValidatorsOverview> createState() => _ValidatorsOverviewState();
}

class _ValidatorsOverviewState extends State<ValidatorsOverview> {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(left: 80.w),
      child: Row(
        spacing: 10.w,
        //  mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: [
          OverViewBox(
            mainText: '100',
            header: 'Nodes',
          ),
          OverViewBox(
            header: 'Chains',
            mainText: '41',
          ),
          OverViewBox(
            header: 'Bridges',
            mainText: '1684',
          ),
          OverViewBox(
            header: 'TVL',
            mainText: '\$5.32B',
          )
        ],
      ),
    );
  }
}