// ignore_for_file: file_names

import 'package:flutter/material.dart';

import '../../../utils/utils.dart';

class AddressInfo extends StatefulWidget {
  final String address;
  const AddressInfo({required this.address, super.key});

  @override
  State<AddressInfo> createState() => _AddressInfoState();
}

class _AddressInfoState extends State<AddressInfo> {
  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: AppColors.backgroundColor,
        borderRadius: BorderRadius.circular(5.sp),
      ),
      width: 300.w,
      height: 350.h,
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
                  "Address",
                  style: TextstyleConstant().commonText,
                ),
                SizedBox(
                  width: 200.w,
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
            Container(
              height: 190.h,
              width: 250.w,
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(10.r),
                  border: Border.all(
                    color: const Color.fromARGB(243, 34, 37, 54),
                  )),
              child: Column(
                children: [
                  Padding(
                    padding: EdgeInsets.only(right: 190.w, top: 20.h),
                    child: Text(
                      widget.address,
                      style: TextstyleConstant().commonText2,
                    ),
                  ),
                  SizedBox(
                    height: 20.h,
                  ),
                  Row(
                    // mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      SizedBox(
                        width: 8.w,
                      ),
                      Icon(
                        Icons.copy,
                        color: AppColors.secondTextColor,
                        size: 9.sp,
                      ),
                      SizedBox(
                        width: 10.w,
                      ),
                      Text(
                        'Copy Address',
                        style: TextstyleConstant().commonTextBlue,
                      ),
                      SizedBox(
                        width: 10.w,
                      ),
                      Icon(
                        Icons.arrow_upward_sharp,
                        color: AppColors.secondTextColor,
                        size: 9.sp,
                      ),
                      SizedBox(
                        width: 10.w,
                      ),
                      Text(
                        'View on BSC Scan',
                        style: TextstyleConstant().commonTextBlue,
                      ),
                    ],
                  ),
                  Padding(
                    padding: EdgeInsets.only(right: 180.w, top: 20.h),
                    child: Container(
                      width: 50.w,
                      height: 50.h,
                      decoration: BoxDecoration(
                          border: Border.all(color: AppColors.dangerColor),
                          borderRadius: BorderRadius.circular(5.sp)),
                      child: Center(
                        child: Text(
                          'Logout',
                          style: TextstyleConstant().commonTextDangerF3Regular,
                        ),
                      ),
                    ),
                  )
                ],
              ),
            ),
            // Padding(
            //   padding:  EdgeInsets.only(left: 20.w,top: 20.h),
            //   child: Row(
            //     children: [
            //       Text(
            //         'Recent Transaction',
            //         style: TextstyleConstant().commonText,
            //       ),
            //       SizedBox(
            //         width: 170.w,
            //       ),
            //       InkWell(
            //         onTap: () {},
            //         child: Text(
            //           'Clear',
            //           style: TextstyleConstant().commonTextBlue,
            //         ),
            //       )
            //     ],
            //   ),
            // )
          ],
        ),
      ),
    );
  }
}
