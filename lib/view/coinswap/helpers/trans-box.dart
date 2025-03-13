// ignore_for_file: file_names

import 'package:flutter/material.dart';

import 'package:smart_web/utils/utils.dart';

class TransactionBox extends StatefulWidget {
  final String status;

  final String date;

  final String sendingAmount;

  final String sendingNetwork;

  final String recieversAmount;

  final String recieversNetwork;

  final String sendingNetworkLogo;

  final String recieversNetworkLogo;

  const TransactionBox({
    required this.date,
    required this.recieversAmount,
    required this.recieversNetwork,
    required this.sendingAmount,
    required this.sendingNetworkLogo,
    required this.recieversNetworkLogo,
    required this.sendingNetwork,
    required this.status,
    super.key,
  });

  @override
  State<TransactionBox> createState() => _TransactionBoxState();
}

class _TransactionBoxState extends State<TransactionBox> {
  @override
  Widget build(BuildContext context) {
    return Container(
      height: 150.h,
      width: 220.w,
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(8.r),
          border: Border.all(
            color: const Color.fromARGB(243, 34, 37, 54),
          )),
      child: Column(
        children: [
          Container(
            height: 50.h,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(8.r),
                  topRight: Radius.circular(8.r)),
              color: const Color.fromARGB(243, 34, 37, 54),
            ),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                Text(
                  widget.date,
                  style: TextStyle(
                      color: AppColors.defaultText,
                      fontFamily: 'Sora',
                      fontSize: 5.sp,
                      fontWeight: FontWeight.w500),
                ),
                SizedBox(
                  width: 50.w,
                ),
                Text(
                  widget.status,
                  style: widget.status == "Completed"
                      ? TextstyleConstant().commonTextGreenF2SemiBold
                      : widget.status == "Confirming"
                          ? TextstyleConstant().commonText2
                          : TextstyleConstant().commonTextredF2SemiBold,
                )
              ],
            ),
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              Expanded(
                  child: ListTile(
                horizontalTitleGap: 2.w,
                leading: Image.asset(
                  widget.sendingNetworkLogo,
                  width: 15.w,
                ),
                title: Text(
                  widget.sendingAmount,
                  style: TextstyleConstant().commonTextDangerF3SemiBold,
                ),
                subtitle: Text(
                  widget.sendingNetwork,
                  style: TextstyleConstant().commonTextDefaultF2Regular,
                ),
              )),
              Icon(
                Icons.arrow_forward,
                color: AppColors.textColor,
                size: 7.sp,
              ),
              Expanded(
                  child: ListTile(
                horizontalTitleGap: 2.w,
                leading: Image.asset(
                  widget.recieversNetworkLogo,
                  width: 15.w,
                ),
                title: Text(
                  '+${widget.recieversAmount}',
                  style: TextstyleConstant().commonTextGreenF2SemiBold,
                ),
                subtitle: Text(
                  widget.recieversNetwork,
                  style: TextstyleConstant().commonTextDefaultF2Regular,
                ),
              )),
            ],
          )
        ],
      ),
    );
  }
}
