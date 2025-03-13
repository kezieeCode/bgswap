// ignore_for_file: file_names

import 'package:flutter/material.dart';
import 'package:smart_web/utils/utils.dart';

class Networks extends StatelessWidget {
  final String images;
  final String trailing;

  const Networks(this.images, this.trailing, {super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(right: 10.w, left: 10.w),
      child: Container(
        height: 50.h,
        padding: EdgeInsets.only(left: 10.w),
        decoration: BoxDecoration(
            border: Border.all(
                color: const Color.fromARGB(243, 109, 114, 133), width: 0.1.w),
            borderRadius: BorderRadius.circular(3.sp)),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.start,
          spacing: 5.sp,
          children: [
            Image.asset(
              images,
              height: 30.h,
            ),
            Text(
              trailing,
              style: TextstyleConstant().commonText,
            )
          ],
        ),
      ),
    );
  }
}
