import 'package:flutter/material.dart';
import 'package:smart_web/utils/utils.dart';

class Boxes extends StatefulWidget {
  final String header;
  final String mainText;
  const Boxes({required this.mainText, required this.header, super.key});

  @override
  State<Boxes> createState() => _BoxesState();
}

class _BoxesState extends State<Boxes> {
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
