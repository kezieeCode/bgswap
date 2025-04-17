// ignore_for_file: file_names

import 'package:flutter/material.dart';
import 'package:smart_web/utils/utils.dart';

class SearchBridge extends StatefulWidget {
  final TextEditingController searchBridge;
  const SearchBridge({required this.searchBridge, super.key});

  @override
  State<SearchBridge> createState() => _SearchBridgeState();
}

class _SearchBridgeState extends State<SearchBridge> {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(left: 75.w, top: 30.h),
      child: Row(
        children: [
          Container(
            height: 70.h,
            width: 280.w,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(5.sp),
              color: const Color.fromARGB(22, 155, 160, 206),
            ),
            child: TextFormField(
              style: TextstyleConstant().navBarDefault,
              textAlign: TextAlign.center,
              controller: widget.searchBridge,
              decoration: InputDecoration(
                contentPadding: EdgeInsets.symmetric(
                  vertical: 35.h,
                ),
                label: Row(spacing: 80.w, children: [
                  Padding(
                    padding: EdgeInsets.only(left: 20.w),
                    child: Icon(
                      Icons.search,
                      size: 10.sp,
                      color: AppColors.defaultText,
                    ),
                  ),
                  Text(
                    'Search name/address/symbol',
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
          SizedBox(
            width: 20.w,
          ),
          SizedBox(
            height: 70.h,
            width: 70.w,
            child: ButtonConstant().createButton(
              context: context,
              color: AppColors.buttonColor,
              onPressed: () {},
              child: Text('Search', style: TextstyleConstant().commonText2),
            ),
          ),
        ],
      ),
    );
  }
}
