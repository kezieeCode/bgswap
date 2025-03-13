// ignore_for_file: file_names

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:smart_web/constants/textStyle-constant.dart';

class InputForm extends StatefulWidget {
  final TextEditingController controller;
  // final String labelText;
  const InputForm(this.controller, {super.key});

  @override
  State<InputForm> createState() => _InputFormState();
}

class _InputFormState extends State<InputForm> {
  @override
  Widget build(
    BuildContext context,
  ) {
    return Container(
        height: 70.h,
        width: 280.w,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(5.sp),
          color: const Color.fromARGB(22, 155, 160, 206),
        ),
        child: Center(
            child: TextFormField(
          style: TextstyleConstant().navBarDefault,
          textAlign: TextAlign.center,
          controller: widget.controller,
          decoration: InputDecoration(
            contentPadding: EdgeInsets.symmetric(
              vertical: 35.h,
            ),
            label: Center(
              child: Text(
                '0.0',
                style: TextstyleConstant().navBarDefault,
              ),
            ),
            // labelText: '0.0',
            labelStyle: TextstyleConstant().navBarDefault,
            enabled: true,
            border: InputBorder.none,
            floatingLabelBehavior: FloatingLabelBehavior.never,
          ),
        )));
  }
}
