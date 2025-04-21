// ignore_for_file: file_names

import 'package:flutter/material.dart';

import '../../../../../utils/utils.dart';

class SelectToken extends StatefulWidget {
  const SelectToken({super.key});

  @override
  State<SelectToken> createState() => _SelectTokenState();
}

class _SelectTokenState extends State<SelectToken> {
  TextEditingController searchToken = TextEditingController();
  int? selectedIndex; // To track the selected icon
  @override
  Widget build(BuildContext context) {
    final List<Map<String, dynamic>> items = MediaQuery.of(context).size.width <
            600
        ? [
            {
              'images': 'assets/images/bnb.png',
              'content': () => Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Padding(
                        padding: EdgeInsets.only(left: 10.w),
                        child: Text(
                          'BNB Chain Network',
                          style: TextstyleConstant()
                              .commonText2
                              .copyWith(fontSize: 23.sp),
                        ),
                      ),
                      SizedBox(height: 10),
                      Padding(
                        padding: EdgeInsets.only(
                          left: 10.w,
                        ),
                        child: Container(
                          height: 60.h,
                          width: 180.w,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(10.r),
                            border: Border.all(
                                color: AppColors.defaultText, width: 0.1),
                          ),
                          child: Padding(
                            padding: EdgeInsets.symmetric(
                                horizontal: 1.0), // Adjust padding as needed
                            child: Row(
                              children: [
                                Image.asset('assets/images/bnb.png',
                                    width: 50.w,
                                    height: 50.h), // Adjust size as needed
                                SizedBox(
                                    width:
                                        1.w), // Spacing between icon and text
                                Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    Text(
                                      'BNB',
                                      style: TextstyleConstant()
                                          .commonText2
                                          .copyWith(fontSize: 23.sp),
                                    ),
                                    Text(
                                      'Binance',
                                      style: TextstyleConstant()
                                          .navBarDefault
                                          .copyWith(
                                              fontSize:
                                                  20.sp), // Adjust styling
                                    ),
                                  ],
                                ),
                              ],
                            ),
                          ),
                        ),
                      ),
                      SizedBox(
                        height: 10.h,
                      ),
                      Padding(
                        padding: EdgeInsets.only(
                          left: 10.w,
                        ),
                        child: Container(
                          height: 60.h,
                          width: 180.w,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(10.r),
                            border: Border.all(
                                color: AppColors.defaultText, width: 0.1),
                          ),
                          child: Padding(
                            padding: EdgeInsets.symmetric(
                                horizontal: 1.0), // Adjust padding as needed
                            child: Row(
                              children: [
                                Image.asset('assets/images/bnb.png',
                                    width: 50.w,
                                    height: 50.h), // Adjust size as needed
                                SizedBox(
                                    width:
                                        1.w), // Spacing between icon and text
                                Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    Text(
                                      'BNB',
                                      style: TextstyleConstant()
                                          .commonText2
                                          .copyWith(fontSize: 23.sp),
                                    ),
                                    Text(
                                      'Binance',
                                      style: TextstyleConstant()
                                          .navBarDefault
                                          .copyWith(
                                              fontSize:
                                                  20.sp), // Adjust styling
                                    ),
                                  ],
                                ),
                              ],
                            ),
                          ),
                        ),
                      ),
                      SizedBox(
                        height: 10.h,
                      ),
                      Padding(
                        padding: EdgeInsets.only(
                          left: 10.w,
                        ),
                        child: Container(
                          height: 60.h,
                          width: 180.w,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(10.r),
                            border: Border.all(
                                color: AppColors.defaultText, width: 0.1),
                          ),
                          child: Padding(
                            padding: EdgeInsets.symmetric(
                                horizontal: 1.0), // Adjust padding as needed
                            child: Row(
                              children: [
                                Image.asset('assets/images/bnb.png',
                                    width: 50.w,
                                    height: 50.h), // Adjust size as needed
                                SizedBox(
                                    width:
                                        1.w), // Spacing between icon and text
                                Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    Text(
                                      'BNB',
                                      style: TextstyleConstant()
                                          .commonText2
                                          .copyWith(fontSize: 23.sp),
                                    ),
                                    Text(
                                      'Binance',
                                      style: TextstyleConstant()
                                          .navBarDefault
                                          .copyWith(
                                              fontSize:
                                                  20.sp), // Adjust styling
                                    ),
                                  ],
                                ),
                              ],
                            ),
                          ),
                        ),
                      ),
                      // SizedBox(
                      //   height: 35.h,
                      // ),
                    ],
                  ),
            },
            {
              'images': 'assets/images/eth.png',
              'content': () => Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Padding(
                        padding: EdgeInsets.only(left: 10.w),
                        child: Text(
                          'Ethereum Network',
                          style: TextstyleConstant()
                              .commonText2
                              .copyWith(fontSize: 23.sp),
                        ),
                      ),
                      SizedBox(height: 10),
                      Padding(
                        padding: EdgeInsets.only(
                          left: 10.w,
                        ),
                        child: Container(
                          height: 60.h,
                          width: 180.w,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(10.r),
                            border: Border.all(
                                color: AppColors.defaultText, width: 0.1),
                          ),
                          child: Padding(
                            padding: EdgeInsets.symmetric(
                                horizontal: 1.0), // Adjust padding as needed
                            child: Row(
                              children: [
                                Image.asset('assets/images/eth.png',
                                    width: 50.w,
                                    height: 50.h), // Adjust size as needed
                                SizedBox(
                                    width:
                                        1.w), // Spacing between icon and text
                                Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    Text(
                                      'ETH',
                                      style: TextstyleConstant()
                                          .commonText2
                                          .copyWith(fontSize: 23.sp),
                                    ),
                                    Text(
                                      'Ethereum',
                                      style: TextstyleConstant()
                                          .navBarDefault
                                          .copyWith(
                                              fontSize:
                                                  20.sp), // Adjust styling
                                    ),
                                  ],
                                ),
                              ],
                            ),
                          ),
                        ),
                      ),
                      SizedBox(
                        height: 10.h,
                      ),
                      Padding(
                        padding: EdgeInsets.only(
                          left: 10.w,
                        ),
                        child: Container(
                          height: 60.h,
                          width: 180.w,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(10.r),
                            border: Border.all(
                                color: AppColors.defaultText, width: 0.1),
                          ),
                          child: Padding(
                            padding: EdgeInsets.symmetric(
                                horizontal: 1.0), // Adjust padding as needed
                            child: Row(
                              children: [
                                Image.asset('assets/images/bnb.png',
                                    width: 50.w,
                                    height: 50.h), // Adjust size as needed
                                SizedBox(
                                    width:
                                        1.w), // Spacing between icon and text
                                Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    Text(
                                      'USDT',
                                      style: TextstyleConstant()
                                          .commonText2
                                          .copyWith(fontSize: 23.sp),
                                    ),
                                    Text(
                                      'Tether USD',
                                      style: TextstyleConstant()
                                          .navBarDefault
                                          .copyWith(
                                              fontSize:
                                                  20.sp), // Adjust styling
                                    ),
                                  ],
                                ),
                              ],
                            ),
                          ),
                        ),
                      ),
                      SizedBox(
                        height: 10.h,
                      ),
                      Padding(
                        padding: EdgeInsets.only(
                          left: 10.w,
                        ),
                        child: Container(
                          height: 60.h,
                          width: 180.w,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(10.r),
                            border: Border.all(
                                color: AppColors.defaultText, width: 0.1),
                          ),
                          child: Padding(
                            padding: EdgeInsets.symmetric(
                                horizontal: 1.0), // Adjust padding as needed
                            child: Row(
                              children: [
                                Image.asset('assets/images/bnb.png',
                                    width: 50.w,
                                    height: 50.h), // Adjust size as needed
                                SizedBox(
                                    width:
                                        1.w), // Spacing between icon and text
                                Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    Text(
                                      'BVSP',
                                      style: TextstyleConstant()
                                          .commonText2
                                          .copyWith(fontSize: 23.sp),
                                    ),
                                    Text(
                                      'BV Swap',
                                      style: TextstyleConstant()
                                          .navBarDefault
                                          .copyWith(
                                              fontSize:
                                                  20.sp), // Adjust styling
                                    ),
                                  ],
                                ),
                              ],
                            ),
                          ),
                        ),
                      ),
                      // SizedBox(
                      //   height: 35.h,
                      // ),
                    ],
                  ),
            },
            {
              'images': 'assets/images/polygon.png',
              'content': () => Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Padding(
                        padding: EdgeInsets.only(left: 10.w),
                        child: Text(
                          'Polygon Network',
                          style: TextstyleConstant()
                              .commonText2
                              .copyWith(fontSize: 23.sp),
                        ),
                      ),
                      SizedBox(height: 10),
                      Padding(
                        padding: EdgeInsets.only(
                          left: 10.w,
                        ),
                        child: Container(
                          height: 60.h,
                          width: 180.w,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(10.r),
                            border: Border.all(
                                color: AppColors.defaultText, width: 0.1),
                          ),
                          child: Padding(
                            padding: EdgeInsets.symmetric(
                                horizontal: 1.0), // Adjust padding as needed
                            child: Row(
                              children: [
                                Image.asset('assets/images/polygon.png',
                                    width: 50.w,
                                    height: 50.h), // Adjust size as needed
                                SizedBox(
                                    width:
                                        1.w), // Spacing between icon and text
                                Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    Text(
                                      'Matic',
                                      style: TextstyleConstant()
                                          .commonText2
                                          .copyWith(fontSize: 23.sp),
                                    ),
                                    Text(
                                      'Matic',
                                      style: TextstyleConstant()
                                          .navBarDefault
                                          .copyWith(
                                              fontSize:
                                                  20.sp), // Adjust styling
                                    ),
                                  ],
                                ),
                              ],
                            ),
                          ),
                        ),
                      ),
                      SizedBox(
                        height: 10.h,
                      ),
                      Padding(
                        padding: EdgeInsets.only(
                          left: 10.w,
                        ),
                        child: Container(
                          height: 60.h,
                          width: 180.w,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(10.r),
                            border: Border.all(
                                color: AppColors.defaultText, width: 0.1),
                          ),
                          child: Padding(
                            padding: EdgeInsets.symmetric(
                                horizontal: 1.0), // Adjust padding as needed
                            child: Row(
                              children: [
                                Image.asset('assets/images/bnb.png',
                                    width: 50.w,
                                    height: 50.h), // Adjust size as needed
                                SizedBox(
                                    width:
                                        1.w), // Spacing between icon and text
                                Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    Text(
                                      'USDC',
                                      style: TextstyleConstant()
                                          .commonText2
                                          .copyWith(fontSize: 23.sp),
                                    ),
                                    Text(
                                      'USD Coin',
                                      style: TextstyleConstant()
                                          .navBarDefault
                                          .copyWith(
                                              fontSize:
                                                  20.sp), // Adjust styling
                                    ),
                                  ],
                                ),
                              ],
                            ),
                          ),
                        ),
                      ),
                      SizedBox(
                        height: 10.h,
                      ),
                      Padding(
                        padding: EdgeInsets.only(
                          left: 10.w,
                        ),
                        child: Container(
                          height: 60.h,
                          width: 180.w,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(10.r),
                            border: Border.all(
                                color: AppColors.defaultText, width: 0.1),
                          ),
                          child: Padding(
                            padding: EdgeInsets.symmetric(
                                horizontal: 1.0), // Adjust padding as needed
                            child: Row(
                              children: [
                                Image.asset('assets/images/bnb.png',
                                    width: 50.w,
                                    height: 50.h), // Adjust size as needed
                                SizedBox(
                                    width:
                                        1.w), // Spacing between icon and text
                                Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    Text(
                                      'BVSP',
                                      style: TextstyleConstant()
                                          .commonText2
                                          .copyWith(fontSize: 23.sp),
                                    ),
                                    Text(
                                      'BV Swap',
                                      style: TextstyleConstant()
                                          .navBarDefault
                                          .copyWith(
                                              fontSize:
                                                  20.sp), // Adjust styling
                                    ),
                                  ],
                                ),
                              ],
                            ),
                          ),
                        ),
                      ),
                      // SizedBox(
                      //   height: 35.h,
                      // ),
                    ],
                  ),
            },
            {
              'images': 'assets/images/fantom.png',
              'content': () => Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Padding(
                        padding: EdgeInsets.only(left: 10.w),
                        child: Text(
                          'Fantom Network',
                          style: TextstyleConstant()
                              .commonText2
                              .copyWith(fontSize: 23.sp),
                        ),
                      ),
                      SizedBox(height: 10),
                      Padding(
                        padding: EdgeInsets.only(
                          left: 10.w,
                        ),
                        child: Container(
                          height: 60.h,
                          width: 180.w,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(10.r),
                            border: Border.all(
                                color: AppColors.defaultText, width: 0.1),
                          ),
                          child: Padding(
                            padding: EdgeInsets.symmetric(
                                horizontal: 1.0), // Adjust padding as needed
                            child: Row(
                              children: [
                                Image.asset('assets/images/fantom.png',
                                    width: 50.w,
                                    height: 50.h), // Adjust size as needed
                                SizedBox(
                                    width:
                                        1.w), // Spacing between icon and text
                                Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    Text(
                                      'FTM',
                                      style: TextstyleConstant()
                                          .commonText2
                                          .copyWith(fontSize: 23.sp),
                                    ),
                                    Text(
                                      'Fantom',
                                      style: TextstyleConstant()
                                          .navBarDefault
                                          .copyWith(
                                              fontSize:
                                                  20.sp), // Adjust styling
                                    ),
                                  ],
                                ),
                              ],
                            ),
                          ),
                        ),
                      ),
                      SizedBox(
                        height: 10.h,
                      ),
                      Padding(
                        padding: EdgeInsets.only(
                          left: 10.w,
                        ),
                        child: Container(
                          height: 60.h,
                          width: 180.w,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(10.r),
                            border: Border.all(
                                color: AppColors.defaultText, width: 0.1),
                          ),
                          child: Padding(
                            padding: EdgeInsets.symmetric(
                                horizontal: 1.0), // Adjust padding as needed
                            child: Row(
                              children: [
                                Image.asset('assets/images/bnb.png',
                                    width: 50.w,
                                    height: 50.h), // Adjust size as needed
                                SizedBox(
                                    width:
                                        1.w), // Spacing between icon and text
                                Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    Text(
                                      'USDC',
                                      style: TextstyleConstant()
                                          .commonText2
                                          .copyWith(fontSize: 23.sp),
                                    ),
                                    Text(
                                      'USD Coin',
                                      style: TextstyleConstant()
                                          .navBarDefault
                                          .copyWith(
                                              fontSize:
                                                  20.sp), // Adjust styling
                                    ),
                                  ],
                                ),
                              ],
                            ),
                          ),
                        ),
                      ),
                      SizedBox(
                        height: 10.h,
                      ),
                      Padding(
                        padding: EdgeInsets.only(
                          left: 10.w,
                        ),
                        child: Container(
                          height: 60.h,
                          width: 180.w,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(10.r),
                            border: Border.all(
                                color: AppColors.defaultText, width: 0.1),
                          ),
                          child: Padding(
                            padding: EdgeInsets.symmetric(
                                horizontal: 1.0), // Adjust padding as needed
                            child: Row(
                              children: [
                                Image.asset('assets/images/bnb.png',
                                    width: 50.w,
                                    height: 50.h), // Adjust size as needed
                                SizedBox(
                                    width:
                                        1.w), // Spacing between icon and text
                                Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    Text(
                                      'BVSP',
                                      style: TextstyleConstant()
                                          .commonText2
                                          .copyWith(fontSize: 23.sp),
                                    ),
                                    Text(
                                      'BV Swap',
                                      style: TextstyleConstant()
                                          .navBarDefault
                                          .copyWith(
                                              fontSize:
                                                  20.sp), // Adjust styling
                                    ),
                                  ],
                                ),
                              ],
                            ),
                          ),
                        ),
                      ),
                      // SizedBox(
                      //   height: 35.h,
                      // ),
                    ],
                  ),
            },
            {
              'images': 'assets/images/cronos.png',
              'content': () => Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Padding(
                        padding: EdgeInsets.only(left: 10.w),
                        child: Text(
                          'Cronos Network',
                          style: TextstyleConstant()
                              .commonText2
                              .copyWith(fontSize: 23.sp),
                        ),
                      ),
                      SizedBox(height: 10),
                      Padding(
                        padding: EdgeInsets.only(
                          left: 10.w,
                        ),
                        child: Container(
                          height: 60.h,
                          width: 180.w,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(10.r),
                            border: Border.all(
                                color: AppColors.defaultText, width: 0.1),
                          ),
                          child: Padding(
                            padding: EdgeInsets.symmetric(
                                horizontal: 1.0), // Adjust padding as needed
                            child: Row(
                              children: [
                                Image.asset('assets/images/cronos.png',
                                    width: 50.w,
                                    height: 50.h), // Adjust size as needed
                                SizedBox(
                                    width:
                                        1.w), // Spacing between icon and text
                                Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    Text(
                                      'CRO',
                                      style: TextstyleConstant()
                                          .commonText2
                                          .copyWith(fontSize: 23.sp),
                                    ),
                                    Text(
                                      'Cronos',
                                      style: TextstyleConstant()
                                          .navBarDefault
                                          .copyWith(
                                              fontSize:
                                                  20.sp), // Adjust styling
                                    ),
                                  ],
                                ),
                              ],
                            ),
                          ),
                        ),
                      ),
                      SizedBox(
                        height: 10.h,
                      ),
                      Padding(
                        padding: EdgeInsets.only(
                          left: 10.w,
                        ),
                        child: Container(
                          height: 60.h,
                          width: 180.w,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(10.r),
                            border: Border.all(
                                color: AppColors.defaultText, width: 0.1),
                          ),
                          child: Padding(
                            padding: EdgeInsets.symmetric(
                                horizontal: 1.0), // Adjust padding as needed
                            child: Row(
                              children: [
                                Image.asset('assets/images/bnb.png',
                                    width: 50.w,
                                    height: 50.h), // Adjust size as needed
                                SizedBox(
                                    width:
                                        1.w), // Spacing between icon and text
                                Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    Text(
                                      'USDC',
                                      style: TextstyleConstant()
                                          .commonText2
                                          .copyWith(fontSize: 23.sp),
                                    ),
                                    Text(
                                      'USD Coin',
                                      style: TextstyleConstant()
                                          .navBarDefault
                                          .copyWith(
                                              fontSize:
                                                  20.sp), // Adjust styling
                                    ),
                                  ],
                                ),
                              ],
                            ),
                          ),
                        ),
                      ),
                      SizedBox(
                        height: 10.h,
                      ),
                      Padding(
                        padding: EdgeInsets.only(
                          left: 10.w,
                        ),
                        child: Container(
                          height: 60.h,
                          width: 180.w,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(10.r),
                            border: Border.all(
                                color: AppColors.defaultText, width: 0.1),
                          ),
                          child: Padding(
                            padding: EdgeInsets.symmetric(
                                horizontal: 1.0), // Adjust padding as needed
                            child: Row(
                              children: [
                                Image.asset('assets/images/bnb.png',
                                    width: 50.w,
                                    height: 50.h), // Adjust size as needed
                                SizedBox(
                                    width:
                                        1.w), // Spacing between icon and text
                                Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    Text(
                                      'BVSP',
                                      style: TextstyleConstant()
                                          .commonText2
                                          .copyWith(fontSize: 23.sp),
                                    ),
                                    Text(
                                      'BV Swap',
                                      style: TextstyleConstant()
                                          .navBarDefault
                                          .copyWith(
                                              fontSize:
                                                  20.sp), // Adjust styling
                                    ),
                                  ],
                                ),
                              ],
                            ),
                          ),
                        ),
                      ),
                      // SizedBox(
                      //   height: 35.h,
                      // ),
                    ],
                  ),
            }
          ]
        : [
            {
              'images': 'assets/images/bnb.png',
              'content': () => Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Padding(
                        padding: EdgeInsets.only(left: 10.w),
                        child: Text(
                          'BNB Chain Network',
                          style: TextstyleConstant().commonText2,
                        ),
                      ),
                      SizedBox(height: 10),
                      Padding(
                        padding: EdgeInsets.only(
                          left: 10.w,
                        ),
                        child: Container(
                          height: 60.h,
                          width: 180.w,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(10.r),
                            border: Border.all(
                                color: AppColors.defaultText, width: 0.1),
                          ),
                          child: Padding(
                            padding: EdgeInsets.symmetric(
                                horizontal: 1.0), // Adjust padding as needed
                            child: Row(
                              children: [
                                Image.asset('assets/images/bnb.png',
                                    width: 30.w,
                                    height: 30.h), // Adjust size as needed
                                SizedBox(
                                    width:
                                        1.w), // Spacing between icon and text
                                Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    Text(
                                      'BNB',
                                      style: TextstyleConstant().commonText2,
                                    ),
                                    Text(
                                      'Binance',
                                      style: TextstyleConstant()
                                          .navBarDefault
                                          .copyWith(
                                              fontSize: 7.sp), // Adjust styling
                                    ),
                                  ],
                                ),
                              ],
                            ),
                          ),
                        ),
                      ),
                      SizedBox(
                        height: 10.h,
                      ),
                      Padding(
                        padding: EdgeInsets.only(
                          left: 10.w,
                        ),
                        child: Container(
                          height: 60.h,
                          width: 180.w,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(10.r),
                            border: Border.all(
                                color: AppColors.defaultText, width: 0.1),
                          ),
                          child: Padding(
                            padding: EdgeInsets.symmetric(
                                horizontal: 1.0), // Adjust padding as needed
                            child: Row(
                              children: [
                                Image.asset('assets/images/bnb.png',
                                    width: 30.w,
                                    height: 30.h), // Adjust size as needed
                                SizedBox(
                                    width:
                                        1.w), // Spacing between icon and text
                                Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    Text(
                                      'BNB',
                                      style: TextstyleConstant().commonText2,
                                    ),
                                    Text(
                                      'Binance',
                                      style: TextstyleConstant()
                                          .navBarDefault
                                          .copyWith(
                                              fontSize: 7.sp), // Adjust styling
                                    ),
                                  ],
                                ),
                              ],
                            ),
                          ),
                        ),
                      ),
                      SizedBox(
                        height: 10.h,
                      ),
                      Padding(
                        padding: EdgeInsets.only(
                          left: 10.w,
                        ),
                        child: Container(
                          height: 60.h,
                          width: 180.w,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(10.r),
                            border: Border.all(
                                color: AppColors.defaultText, width: 0.1),
                          ),
                          child: Padding(
                            padding: EdgeInsets.symmetric(
                                horizontal: 1.0), // Adjust padding as needed
                            child: Row(
                              children: [
                                Image.asset('assets/images/bnb.png',
                                    width: 30.w,
                                    height: 30.h), // Adjust size as needed
                                SizedBox(
                                    width:
                                        1.w), // Spacing between icon and text
                                Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    Text(
                                      'BNB',
                                      style: TextstyleConstant().commonText2,
                                    ),
                                    Text(
                                      'Binance',
                                      style: TextstyleConstant()
                                          .navBarDefault
                                          .copyWith(
                                              fontSize: 7.sp), // Adjust styling
                                    ),
                                  ],
                                ),
                              ],
                            ),
                          ),
                        ),
                      ),
                      // SizedBox(
                      //   height: 35.h,
                      // ),
                    ],
                  ),
            },
            {
              'images': 'assets/images/eth.png',
              'content': () => Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Padding(
                        padding: EdgeInsets.only(left: 10.w),
                        child: Text(
                          'Ethereum Network',
                          style: TextstyleConstant().commonText2,
                        ),
                      ),
                      SizedBox(height: 10),
                      Padding(
                        padding: EdgeInsets.only(
                          left: 10.w,
                        ),
                        child: Container(
                          height: 60.h,
                          width: 180.w,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(10.r),
                            border: Border.all(
                                color: AppColors.defaultText, width: 0.1),
                          ),
                          child: Padding(
                            padding: EdgeInsets.symmetric(
                                horizontal: 1.0), // Adjust padding as needed
                            child: Row(
                              children: [
                                Image.asset('assets/images/eth.png',
                                    width: 30.w,
                                    height: 30.h), // Adjust size as needed
                                SizedBox(
                                    width:
                                        1.w), // Spacing between icon and text
                                Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    Text(
                                      'ETH',
                                      style: TextstyleConstant().commonText2,
                                    ),
                                    Text(
                                      'Ethereum',
                                      style: TextstyleConstant()
                                          .navBarDefault
                                          .copyWith(
                                              fontSize: 7.sp), // Adjust styling
                                    ),
                                  ],
                                ),
                              ],
                            ),
                          ),
                        ),
                      ),
                      SizedBox(
                        height: 10.h,
                      ),
                      Padding(
                        padding: EdgeInsets.only(
                          left: 10.w,
                        ),
                        child: Container(
                          height: 60.h,
                          width: 180.w,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(10.r),
                            border: Border.all(
                                color: AppColors.defaultText, width: 0.1),
                          ),
                          child: Padding(
                            padding: EdgeInsets.symmetric(
                                horizontal: 1.0), // Adjust padding as needed
                            child: Row(
                              children: [
                                Image.asset('assets/images/bnb.png',
                                    width: 30.w,
                                    height: 30.h), // Adjust size as needed
                                SizedBox(
                                    width:
                                        1.w), // Spacing between icon and text
                                Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    Text(
                                      'USDT',
                                      style: TextstyleConstant().commonText2,
                                    ),
                                    Text(
                                      'Tether USD',
                                      style: TextstyleConstant()
                                          .navBarDefault
                                          .copyWith(
                                              fontSize: 7.sp), // Adjust styling
                                    ),
                                  ],
                                ),
                              ],
                            ),
                          ),
                        ),
                      ),
                      SizedBox(
                        height: 10.h,
                      ),
                      Padding(
                        padding: EdgeInsets.only(
                          left: 10.w,
                        ),
                        child: Container(
                          height: 60.h,
                          width: 180.w,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(10.r),
                            border: Border.all(
                                color: AppColors.defaultText, width: 0.1),
                          ),
                          child: Padding(
                            padding: EdgeInsets.symmetric(
                                horizontal: 1.0), // Adjust padding as needed
                            child: Row(
                              children: [
                                Image.asset('assets/images/bnb.png',
                                    width: 30.w,
                                    height: 30.h), // Adjust size as needed
                                SizedBox(
                                    width:
                                        1.w), // Spacing between icon and text
                                Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    Text(
                                      'BVSP',
                                      style: TextstyleConstant().commonText2,
                                    ),
                                    Text(
                                      'BV Swap',
                                      style: TextstyleConstant()
                                          .navBarDefault
                                          .copyWith(
                                              fontSize: 7.sp), // Adjust styling
                                    ),
                                  ],
                                ),
                              ],
                            ),
                          ),
                        ),
                      ),
                      // SizedBox(
                      //   height: 35.h,
                      // ),
                    ],
                  ),
            },
            {
              'images': 'assets/images/polygon.png',
              'content': () => Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Padding(
                        padding: EdgeInsets.only(left: 10.w),
                        child: Text(
                          'Polygon Network',
                          style: TextstyleConstant().commonText2,
                        ),
                      ),
                      SizedBox(height: 10),
                      Padding(
                        padding: EdgeInsets.only(
                          left: 10.w,
                        ),
                        child: Container(
                          height: 60.h,
                          width: 180.w,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(10.r),
                            border: Border.all(
                                color: AppColors.defaultText, width: 0.1),
                          ),
                          child: Padding(
                            padding: EdgeInsets.symmetric(
                                horizontal: 1.0), // Adjust padding as needed
                            child: Row(
                              children: [
                                Image.asset('assets/images/polygon.png',
                                    width: 30.w,
                                    height: 30.h), // Adjust size as needed
                                SizedBox(
                                    width:
                                        1.w), // Spacing between icon and text
                                Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    Text(
                                      'Matic',
                                      style: TextstyleConstant().commonText2,
                                    ),
                                    Text(
                                      'Matic',
                                      style: TextstyleConstant()
                                          .navBarDefault
                                          .copyWith(
                                              fontSize: 7.sp), // Adjust styling
                                    ),
                                  ],
                                ),
                              ],
                            ),
                          ),
                        ),
                      ),
                      SizedBox(
                        height: 10.h,
                      ),
                      Padding(
                        padding: EdgeInsets.only(
                          left: 10.w,
                        ),
                        child: Container(
                          height: 60.h,
                          width: 180.w,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(10.r),
                            border: Border.all(
                                color: AppColors.defaultText, width: 0.1),
                          ),
                          child: Padding(
                            padding: EdgeInsets.symmetric(
                                horizontal: 1.0), // Adjust padding as needed
                            child: Row(
                              children: [
                                Image.asset('assets/images/bnb.png',
                                    width: 30.w,
                                    height: 30.h), // Adjust size as needed
                                SizedBox(
                                    width:
                                        1.w), // Spacing between icon and text
                                Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    Text(
                                      'USDC',
                                      style: TextstyleConstant().commonText2,
                                    ),
                                    Text(
                                      'USD Coin',
                                      style: TextstyleConstant()
                                          .navBarDefault
                                          .copyWith(
                                              fontSize: 7.sp), // Adjust styling
                                    ),
                                  ],
                                ),
                              ],
                            ),
                          ),
                        ),
                      ),
                      SizedBox(
                        height: 10.h,
                      ),
                      Padding(
                        padding: EdgeInsets.only(
                          left: 10.w,
                        ),
                        child: Container(
                          height: 60.h,
                          width: 180.w,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(10.r),
                            border: Border.all(
                                color: AppColors.defaultText, width: 0.1),
                          ),
                          child: Padding(
                            padding: EdgeInsets.symmetric(
                                horizontal: 1.0), // Adjust padding as needed
                            child: Row(
                              children: [
                                Image.asset('assets/images/bnb.png',
                                    width: 30.w,
                                    height: 30.h), // Adjust size as needed
                                SizedBox(
                                    width:
                                        1.w), // Spacing between icon and text
                                Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    Text(
                                      'BVSP',
                                      style: TextstyleConstant().commonText2,
                                    ),
                                    Text(
                                      'BV Swap',
                                      style: TextstyleConstant()
                                          .navBarDefault
                                          .copyWith(
                                              fontSize: 7.sp), // Adjust styling
                                    ),
                                  ],
                                ),
                              ],
                            ),
                          ),
                        ),
                      ),
                      // SizedBox(
                      //   height: 35.h,
                      // ),
                    ],
                  ),
            },
            {
              'images': 'assets/images/fantom.png',
              'content': () => Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Padding(
                        padding: EdgeInsets.only(left: 10.w),
                        child: Text(
                          'Fantom Network',
                          style: TextstyleConstant().commonText2,
                        ),
                      ),
                      SizedBox(height: 10),
                      Padding(
                        padding: EdgeInsets.only(
                          left: 10.w,
                        ),
                        child: Container(
                          height: 60.h,
                          width: 180.w,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(10.r),
                            border: Border.all(
                                color: AppColors.defaultText, width: 0.1),
                          ),
                          child: Padding(
                            padding: EdgeInsets.symmetric(
                                horizontal: 1.0), // Adjust padding as needed
                            child: Row(
                              children: [
                                Image.asset('assets/images/fantom.png',
                                    width: 30.w,
                                    height: 30.h), // Adjust size as needed
                                SizedBox(
                                    width:
                                        1.w), // Spacing between icon and text
                                Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    Text(
                                      'FTM',
                                      style: TextstyleConstant().commonText2,
                                    ),
                                    Text(
                                      'Fantom',
                                      style: TextstyleConstant()
                                          .navBarDefault
                                          .copyWith(
                                              fontSize: 7.sp), // Adjust styling
                                    ),
                                  ],
                                ),
                              ],
                            ),
                          ),
                        ),
                      ),
                      SizedBox(
                        height: 10.h,
                      ),
                      Padding(
                        padding: EdgeInsets.only(
                          left: 10.w,
                        ),
                        child: Container(
                          height: 60.h,
                          width: 180.w,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(10.r),
                            border: Border.all(
                                color: AppColors.defaultText, width: 0.1),
                          ),
                          child: Padding(
                            padding: EdgeInsets.symmetric(
                                horizontal: 1.0), // Adjust padding as needed
                            child: Row(
                              children: [
                                Image.asset('assets/images/bnb.png',
                                    width: 30.w,
                                    height: 30.h), // Adjust size as needed
                                SizedBox(
                                    width:
                                        1.w), // Spacing between icon and text
                                Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    Text(
                                      'USDC',
                                      style: TextstyleConstant().commonText2,
                                    ),
                                    Text(
                                      'USD Coin',
                                      style: TextstyleConstant()
                                          .navBarDefault
                                          .copyWith(
                                              fontSize: 7.sp), // Adjust styling
                                    ),
                                  ],
                                ),
                              ],
                            ),
                          ),
                        ),
                      ),
                      SizedBox(
                        height: 10.h,
                      ),
                      Padding(
                        padding: EdgeInsets.only(
                          left: 10.w,
                        ),
                        child: Container(
                          height: 60.h,
                          width: 180.w,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(10.r),
                            border: Border.all(
                                color: AppColors.defaultText, width: 0.1),
                          ),
                          child: Padding(
                            padding: EdgeInsets.symmetric(
                                horizontal: 1.0), // Adjust padding as needed
                            child: Row(
                              children: [
                                Image.asset('assets/images/bnb.png',
                                    width: 30.w,
                                    height: 30.h), // Adjust size as needed
                                SizedBox(
                                    width:
                                        1.w), // Spacing between icon and text
                                Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    Text(
                                      'BVSP',
                                      style: TextstyleConstant().commonText2,
                                    ),
                                    Text(
                                      'BV Swap',
                                      style: TextstyleConstant()
                                          .navBarDefault
                                          .copyWith(
                                              fontSize: 7.sp), // Adjust styling
                                    ),
                                  ],
                                ),
                              ],
                            ),
                          ),
                        ),
                      ),
                      // SizedBox(
                      //   height: 35.h,
                      // ),
                    ],
                  ),
            },
            {
              'images': 'assets/images/cronos.png',
              'content': () => Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Padding(
                        padding: EdgeInsets.only(left: 10.w),
                        child: Text(
                          'Cronos Network',
                          style: TextstyleConstant().commonText2,
                        ),
                      ),
                      SizedBox(height: 10),
                      Padding(
                        padding: EdgeInsets.only(
                          left: 10.w,
                        ),
                        child: Container(
                          height: 60.h,
                          width: 180.w,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(10.r),
                            border: Border.all(
                                color: AppColors.defaultText, width: 0.1),
                          ),
                          child: Padding(
                            padding: EdgeInsets.symmetric(
                                horizontal: 1.0), // Adjust padding as needed
                            child: Row(
                              children: [
                                Image.asset('assets/images/cronos.png',
                                    width: 30.w,
                                    height: 30.h), // Adjust size as needed
                                SizedBox(
                                    width:
                                        1.w), // Spacing between icon and text
                                Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    Text(
                                      'CRO',
                                      style: TextstyleConstant().commonText2,
                                    ),
                                    Text(
                                      'Cronos',
                                      style: TextstyleConstant()
                                          .navBarDefault
                                          .copyWith(
                                              fontSize: 7.sp), // Adjust styling
                                    ),
                                  ],
                                ),
                              ],
                            ),
                          ),
                        ),
                      ),
                      SizedBox(
                        height: 10.h,
                      ),
                      Padding(
                        padding: EdgeInsets.only(
                          left: 10.w,
                        ),
                        child: Container(
                          height: 60.h,
                          width: 180.w,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(10.r),
                            border: Border.all(
                                color: AppColors.defaultText, width: 0.1),
                          ),
                          child: Padding(
                            padding: EdgeInsets.symmetric(
                                horizontal: 1.0), // Adjust padding as needed
                            child: Row(
                              children: [
                                Image.asset('assets/images/bnb.png',
                                    width: 30.w,
                                    height: 30.h), // Adjust size as needed
                                SizedBox(
                                    width:
                                        1.w), // Spacing between icon and text
                                Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    Text(
                                      'USDC',
                                      style: TextstyleConstant().commonText2,
                                    ),
                                    Text(
                                      'USD Coin',
                                      style: TextstyleConstant()
                                          .navBarDefault
                                          .copyWith(
                                              fontSize: 7.sp), // Adjust styling
                                    ),
                                  ],
                                ),
                              ],
                            ),
                          ),
                        ),
                      ),
                      SizedBox(
                        height: 10.h,
                      ),
                      Padding(
                        padding: EdgeInsets.only(
                          left: 10.w,
                        ),
                        child: Container(
                          height: 60.h,
                          width: 180.w,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(10.r),
                            border: Border.all(
                                color: AppColors.defaultText, width: 0.1),
                          ),
                          child: Padding(
                            padding: EdgeInsets.symmetric(
                                horizontal: 1.0), // Adjust padding as needed
                            child: Row(
                              children: [
                                Image.asset('assets/images/bnb.png',
                                    width: 30.w,
                                    height: 30.h), // Adjust size as needed
                                SizedBox(
                                    width:
                                        1.w), // Spacing between icon and text
                                Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    Text(
                                      'BVSP',
                                      style: TextstyleConstant().commonText2,
                                    ),
                                    Text(
                                      'BV Swap',
                                      style: TextstyleConstant()
                                          .navBarDefault
                                          .copyWith(
                                              fontSize: 7.sp), // Adjust styling
                                    ),
                                  ],
                                ),
                              ],
                            ),
                          ),
                        ),
                      ),
                      // SizedBox(
                      //   height: 35.h,
                      // ),
                    ],
                  ),
            },
          ];

    return MediaQuery.of(context).size.width < 600
        ? Container(
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(5.sp),
              color: AppColors.backgroundColor,
            ),
            width: 1000.w,
            height: 600.h,
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
                        "Select Token",
                        style: TextstyleConstant().commonText.copyWith(
                            fontSize: 25.sp, fontWeight: FontWeight.bold),
                      ),
                      SizedBox(
                        width: 120.w,
                      ),
                      IconButton(
                          onPressed: () {
                            Navigator.pop(context);
                          },
                          icon: Icon(
                            Icons.close,
                            color: Colors.white,
                            size: 25.sp,
                          ))
                    ],
                  ),
                  SizedBox(
                    height: 5.w,
                  ),
                  Padding(
                    padding: EdgeInsets.only(left: 20.w, right: 20.w),
                    child: Container(
                      height: 50.h,
                      width: 450.w,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(5.sp),
                        color: const Color.fromARGB(22, 155, 160, 206),
                      ),
                      child: TextFormField(
                        style: TextstyleConstant().navBarDefault,
                        textAlign: TextAlign.center,
                        controller: searchToken,
                        decoration: InputDecoration(
                          contentPadding: EdgeInsets.symmetric(
                            vertical: 25.h,
                          ),
                          label: Row(spacing: 50.w, children: [
                            Padding(
                              padding: EdgeInsets.only(
                                left: 20.w,
                              ),
                              child: Icon(
                                Icons.search,
                                size: 30.sp,
                                color: AppColors.defaultText,
                              ),
                            ),
                            Text(
                              'Search tokens',
                              style: TextstyleConstant()
                                  .navBarDefault
                                  .copyWith(fontSize: 23.sp),
                            ),
                          ]),
                          labelStyle: TextstyleConstant()
                              .navBarDefault
                              .copyWith(fontSize: 25.sp),
                          enabled: true,
                          border: InputBorder.none,
                          floatingLabelBehavior: FloatingLabelBehavior.never,
                        ),
                      ),
                    ),
                  ),
                  SizedBox(
                    height: 10.h,
                  ),
                  Row(
                    children: [
                      // Vertical List of Icons
                      Padding(
                        padding: EdgeInsets.only(left: 20.w, top: 10.h),
                        child: Container(
                          decoration: BoxDecoration(
                              color: const Color.fromARGB(22, 155, 160, 206),
                              borderRadius: BorderRadius.circular(8.r)),
                          width: 150.w,
                          child: SizedBox(
                            height: 370.h,
                            width: 100.w,
                            child: ListView.builder(
                              itemCount: items.length,
                              itemBuilder: (context, index) {
                                return IconButton(
                                  icon: Container(
                                      height: 50.h,
                                      width: 100.w,
                                      decoration: BoxDecoration(
                                        borderRadius:
                                            BorderRadius.circular(8.r),
                                        color: const Color.fromARGB(
                                            21, 173, 178, 227),
                                      ),
                                      child: Image.asset(
                                        items[index]['images'],
                                        // width: 5.w,
                                        height: 50.h,
                                      )
                                      // Icon(
                                      //   items[index]['icon'],
                                      //   size: 20.sp,
                                      //   color: selectedIndex == index
                                      //       ? Colors.blue
                                      //       : Colors.black,
                                      // ),
                                      ),
                                  onPressed: () {
                                    setState(() {
                                      selectedIndex = index;
                                    });
                                  },
                                );
                              },
                            ),
                          ),
                        ),
                      ),

                      // Display Different Content for Each Icon
                      Expanded(
                        child: Padding(
                          padding: EdgeInsets.only(bottom: 150.h),
                          child: selectedIndex == null
                              ? Center(
                                  child: Text(
                                  "Tap an icon to see details",
                                  style: TextstyleConstant()
                                      .commonText
                                      .copyWith(fontSize: 23.sp),
                                ))
                              : items[selectedIndex!]['content'](),
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
          )
        : Container(
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(5.sp),
              color: AppColors.backgroundColor,
            ),
            width: 260.w,
            height: 600.h,
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
                        "Select Token",
                        style: TextstyleConstant().commonText,
                      ),
                      SizedBox(
                        width: 120.w,
                      ),
                      IconButton(
                          onPressed: () {
                            Navigator.pop(context);
                          },
                          icon: Icon(
                            Icons.close,
                            color: Colors.white,
                            size: 7.sp,
                          ))
                    ],
                  ),
                  SizedBox(
                    height: 5.w,
                  ),
                  Padding(
                    padding: EdgeInsets.only(left: 20.w, right: 20.w),
                    child: Container(
                      height: 50.h,
                      width: 280.w,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(5.sp),
                        color: const Color.fromARGB(22, 155, 160, 206),
                      ),
                      child: TextFormField(
                        style: TextstyleConstant().navBarDefault,
                        textAlign: TextAlign.center,
                        controller: searchToken,
                        decoration: InputDecoration(
                          contentPadding: EdgeInsets.symmetric(
                            vertical: 25.h,
                          ),
                          label: Row(spacing: 50.w, children: [
                            Padding(
                              padding: EdgeInsets.only(
                                left: 20.w,
                              ),
                              child: Icon(
                                Icons.search,
                                size: 10.sp,
                                color: AppColors.defaultText,
                              ),
                            ),
                            Text(
                              'Search token',
                              style: TextstyleConstant().navBarDefault,
                            ),
                          ]),
                          labelStyle: TextstyleConstant().navBarDefault,
                          enabled: true,
                          border: InputBorder.none,
                          floatingLabelBehavior: FloatingLabelBehavior.never,
                        ),
                      ),
                    ),
                  ),
                  SizedBox(
                    height: 10.h,
                  ),
                  Row(
                    children: [
                      // Vertical List of Icons
                      Padding(
                        padding: EdgeInsets.only(left: 20.w, top: 10.h),
                        child: Container(
                          decoration: BoxDecoration(
                              color: const Color.fromARGB(22, 155, 160, 206),
                              borderRadius: BorderRadius.circular(8.r)),
                          width: 30.w,
                          child: SizedBox(
                            height: 370.h,
                            width: 60.w,
                            child: ListView.builder(
                              itemCount: items.length,
                              itemBuilder: (context, index) {
                                return IconButton(
                                  icon: Container(
                                      height: 50.h,
                                      width: 60.w,
                                      decoration: BoxDecoration(
                                        borderRadius:
                                            BorderRadius.circular(8.r),
                                        color: const Color.fromARGB(
                                            21, 173, 178, 227),
                                      ),
                                      child: Image.asset(
                                        items[index]['images'],
                                        // width: 5.w,
                                        height: 5.h,
                                      )
                                      // Icon(
                                      //   items[index]['icon'],
                                      //   size: 20.sp,
                                      //   color: selectedIndex == index
                                      //       ? Colors.blue
                                      //       : Colors.black,
                                      // ),
                                      ),
                                  onPressed: () {
                                    setState(() {
                                      selectedIndex = index;
                                    });
                                  },
                                );
                              },
                            ),
                          ),
                        ),
                      ),

                      // Display Different Content for Each Icon
                      Expanded(
                        child: Padding(
                          padding: EdgeInsets.only(bottom: 150.h),
                          child: selectedIndex == null
                              ? Center(
                                  child: Text(
                                  "Tap an icon to see details",
                                  style: TextstyleConstant().commonText,
                                ))
                              : items[selectedIndex!]['content'](),
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
          );
  }
}
