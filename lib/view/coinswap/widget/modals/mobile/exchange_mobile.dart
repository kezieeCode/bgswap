// ignore_for_file: file_names

import 'dart:ui';


import 'package:flutter/material.dart';
import 'package:smart_web/utils/utils.dart';
import 'package:smart_web/view/coinswap/helpers/input-form.dart';
import 'package:smart_web/view/coinswap/widget/modals/desktop/select-token.dart';

import '../desktop/recent-transactions-modal.dart';

class ExchangeMobile extends StatefulWidget {
  const ExchangeMobile({super.key});

  @override
  State<ExchangeMobile> createState() => _ExchangeMobileState();
}

class _ExchangeMobileState extends State<ExchangeMobile> {
  final _formKey = GlobalKey<FormState>();

  final TextEditingController senderController = TextEditingController();
  final TextEditingController recieverController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        children: [
          Padding(
            padding: EdgeInsets.only(top: 30.h, bottom: 30.h, right: 430.w),
            child: Text(
              TextConst.coinSwap,
              style: TextStyle(
                  fontFamily: 'Sora',
                  fontWeight: FontWeight.w500,
                  fontSize: 35.sp,
                  color: AppColors.textColor),
            ),
          ),
          Padding(
            padding: EdgeInsets.only(right: 350.w),
            child: InkWell(
              onTap: () {
                showRecentDialog(context);
              },
              child: RichText(
                  text: TextSpan(
                      text: '(0)',
                      style: TextstyleConstant()
                          .navBarDefault
                          .copyWith(fontSize: 25.sp),
                      children: [
                    TextSpan(
                        text: 'Recent Transactions',
                        style: TextstyleConstant()
                            .commonTextBlue
                            .copyWith(fontSize: 25.sp))
                  ])),
            ),
          ),
          SizedBox(
            height: 30.h,
          ),
          Container(
            height: 550.h,
            width: 650.w,
            decoration: BoxDecoration(
                color: AppColors.appBarColor,
                borderRadius: BorderRadius.circular(30.sp)),
            child: Form(
              key: _formKey,
              child: Column(
                children: [
                  Padding(
                    padding: EdgeInsets.only(top: 25.h),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text(
                          'From: --',
                          style: TextstyleConstant()
                              .navBarDefault
                              .copyWith(fontSize: 25.sp),
                        ),
                        SizedBox(
                          width: 250.w,
                        ),
                        InkWell(
                          onTap: () {
                            showTokenOptions(context);
                          },
                          child: Row(
                            children: [
                              Text(
                                'Select Token',
                                style: TextstyleConstant().commonText.copyWith(
                                    fontSize: 23.sp,
                                    fontWeight: FontWeight.bold),
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
                    padding: EdgeInsets.only(right: 350.w),
                    child: RichText(
                        text: TextSpan(
                            text: 'Balance: ',
                            style: TextstyleConstant()
                                .navBarDefault
                                .copyWith(fontSize: 25.sp),
                            children: [
                          TextSpan(
                              text: '0.0 ',
                              style: TextstyleConstant()
                                  .navBarDefault
                                  .copyWith(fontSize: 25.sp)),
                          TextSpan(
                              text: 'MAX',
                              style: TextstyleConstant()
                                  .commonTextBlue
                                  .copyWith(fontSize: 25.sp))
                        ])),
                  ),
                  Padding(
                    padding: EdgeInsets.only(top: 30.h),
                    child: Icon(
                      Icons.arrow_drop_down_circle_outlined,
                      color: AppColors.textColor,
                      size: 50.sp,
                    ),
                  ),
                  Padding(
                    padding: EdgeInsets.only(left: 10.w),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text(
                          'To --',
                          style: TextstyleConstant()
                              .navBarDefault
                              .copyWith(fontSize: 25.sp),
                        ),
                        SizedBox(
                          width: 300.w,
                        ),
                        Text(
                          'Select Token',
                          style: TextstyleConstant()
                              .commonText
                              .copyWith(fontSize: 22.sp),
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
                    padding: EdgeInsets.only(right: 350.w),
                    child: RichText(
                        text: TextSpan(
                            text: 'Balance: ',
                            style: TextstyleConstant()
                                .navBarDefault
                                .copyWith(fontSize: 25.sp),
                            children: [
                          TextSpan(
                              text: '0.0 ',
                              style: TextstyleConstant()
                                  .navBarDefault
                                  .copyWith(fontSize: 25.sp)),
                          TextSpan(
                              text: 'MAX',
                              style: TextstyleConstant()
                                  .commonTextBlue
                                  .copyWith(fontSize: 25.sp))
                        ])),
                  ),
                  SizedBox(
                    height: 50.h,
                  ),
                  SizedBox(
                    width: 570.w,
                    height: 70.h,
                    child: ButtonConstant().createButton(
                      context: context,
                        onPressed: () {},
                        color: AppColors.buttonColor,
                        child: Text(
                          'Connect Wallet',
                          style: TextstyleConstant().commonText.copyWith(
                              fontSize: 30.sp, fontWeight: FontWeight.bold),
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
