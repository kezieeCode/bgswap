import 'package:flutter/material.dart';
import 'package:smart_web/utils/utils.dart';

class OverViewBox extends StatefulWidget {
    final String header;
  final String mainText;
  const OverViewBox({required this.header, required this.mainText, super.key});

  @override
  State<OverViewBox> createState() => _OverViewBoxState();
}

class _OverViewBoxState extends State<OverViewBox> {
  @override
  Widget build(BuildContext context) {
    return Container(
      height: 120.h,
      width: 150.w,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(10.r),
        color: const Color.fromARGB(243, 27, 29, 37),
      ),
      child: Padding(
        padding: EdgeInsets.only(top: 20.h, left: 10.w),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              widget.header,
              style: TextstyleConstant().navBarDefault,
            ),
            SizedBox(
              height: 10.h,
            ),
            Text(
              widget.mainText,
              style: TextStyle(
                  fontFamily: 'Fractul',
                  fontWeight: FontWeight.w600,
                  fontSize: 12.sp,
                  color: AppColors.textColor),
            )
          ],
        ),
      ),
    );
  }
}