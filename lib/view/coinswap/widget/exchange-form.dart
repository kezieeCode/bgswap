// ignore_for_file: file_names

import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:smart_web/view/coinswap/helpers/input-form.dart';
import 'package:smart_web/view/coinswap/widget/modals/recent-transactions-modal.dart';
import 'package:smart_web/view/coinswap/widget/modals/select-token.dart';

import '../../../utils/utils.dart';

class ExchangeForm extends StatelessWidget {
  ExchangeForm({
    super.key,
  });
  final _formKey = GlobalKey<FormState>();

  final TextEditingController senderController = TextEditingController();
  final TextEditingController recieverController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        children: [
          Padding(
            padding: EdgeInsets.only(top: 100.h, bottom: 20.h),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  TextConst.coinSwap,
                  style: TextStyle(
                      fontFamily: 'Fractul',
                      fontWeight: FontWeight.w600,
                      fontSize: 17.sp,
                      color: AppColors.textColor),
                ),
                SizedBox(
                  width: 150.w,
                ),
                InkWell(
                  onTap: () {
                    showRecentDialog(context);
                  },
                  child: RichText(
                      text: TextSpan(
                          text: '(0)',
                          style: TextstyleConstant().navBarDefault,
                          children: [
                        TextSpan(
                            text: 'Recent Transactions',
                            style: TextstyleConstant().commonTextBlue)
                      ])),
                )
              ],
            ),
          ),
          Container(
            height: 600.h,
            width: 328.w,
            decoration: BoxDecoration(
                color: AppColors.appBarColor,
                borderRadius: BorderRadius.circular(5.sp)),
            child: Form(
              key: _formKey,
              child: Column(
                children: [
                  Padding(
                    padding: EdgeInsets.only(top: 45.h),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text(
                          'From --',
                          style: TextstyleConstant().navBarDefault,
                        ),
                        SizedBox(
                          width: 200.w,
                        ),
                        InkWell(
                          onTap: () {
                            showTokenOptions(context);
                          },
                          child: Row(
                            children: [
                              Text(
                                'Select Token',
                                style: TextstyleConstant().commonText,
                              ),
                              Icon(
                                Icons.arrow_drop_down_outlined,
                                color: AppColors.textColor,
                              ),
                            ],
                          ),
                        )
                      ],
                    ),
                  ),
                  SizedBox(
                    height: 10.h,
                  ),
                  InputForm(senderController),
                  SizedBox(
                    height: 10.h,
                  ),
                  Padding(
                    padding: EdgeInsets.only(right: 220.w),
                    child: RichText(
                        text: TextSpan(
                            text: 'Balance: ',
                            style: TextstyleConstant().navBarDefault,
                            children: [
                          TextSpan(
                              text: '0.0 ',
                              style: TextstyleConstant().navBarDefault),
                          TextSpan(
                              text: 'MAX',
                              style: TextstyleConstant().commonTextBlue)
                        ])),
                  ),
                  Padding(
                    padding: EdgeInsets.only(top: 30.h),
                    child: Icon(
                      Icons.arrow_drop_down_circle_outlined,
                      color: AppColors.textColor,
                      size: 15.sp,
                    ),
                  ),
                  Padding(
                    padding: EdgeInsets.only(top: 25.h),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text(
                          'To --',
                          style: TextstyleConstant().navBarDefault,
                        ),
                        SizedBox(
                          width: 200.w,
                        ),
                        Text(
                          'Select Token',
                          style: TextstyleConstant().commonText,
                        ),
                        Icon(
                          Icons.arrow_drop_down_outlined,
                          color: AppColors.textColor,
                        )
                      ],
                    ),
                  ),
                  SizedBox(
                    height: 10.h,
                  ),
                  InputForm(recieverController),
                  SizedBox(
                    height: 10.h,
                  ),
                  Padding(
                    padding: EdgeInsets.only(right: 220.w),
                    child: RichText(
                        text: TextSpan(
                            text: 'Balance: ',
                            style: TextstyleConstant().navBarDefault,
                            children: [
                          TextSpan(
                              text: '0.0 ',
                              style: TextstyleConstant().navBarDefault),
                          TextSpan(
                              text: 'MAX',
                              style: TextstyleConstant().commonTextBlue)
                        ])),
                  ),
                  SizedBox(
                    height: 50.h,
                  ),
                  SizedBox(
                    width: 280.w,
                    height: 70.h,
                    child: ButtonConstant().createButton(
                        onPressed: () {},
                        color: AppColors.buttonColor,
                        child: Text(
                          'Connect Wallet',
                          style: TextstyleConstant().commonText,
                        )),
                  )
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }

  void showRecentDialog(BuildContext context) {
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
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(10.sp),
              ),
              elevation: 0,
              backgroundColor: AppColors.appBarColor,
              child: RecentTransactions(),
            ),
          ),
        );
      },
    );
  }

  void showTokenOptions(BuildContext context) {
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
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(10.sp),
              ),
              elevation: 0,
              backgroundColor: AppColors.appBarColor,
              child: SelectToken(),
            ),
          ),
        );
      },
    );
  }
}
