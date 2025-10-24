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
    final isMobile = MediaQuery.of(context).size.width < 600;
    
    return Padding(
      padding: EdgeInsets.symmetric(
        horizontal: isMobile ? 20.w : 75.w,
        vertical: isMobile ? 10.h : 30.h,
      ),
      child: isMobile 
          ? Column(
              children: [
                // Search Input
                Container(
                  height: 45.h,
                  width: double.infinity,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(8.r),
                    color: AppColors.greyButton.withOpacity(0.3),
                    border: Border.all(
                      color: AppColors.buttonColor.withOpacity(0.1),
                      width: 1,
                    ),
                  ),
                  child: TextFormField(
                    style: TextStyle(
                      color: AppColors.textColor,
                      fontFamily: 'Sora',
                      fontSize: 14.sp,
                      fontWeight: FontWeight.w400,
                    ),
                    textAlign: TextAlign.left,
                    controller: widget.searchBridge,
                    decoration: InputDecoration(
                      contentPadding: EdgeInsets.symmetric(
                        horizontal: 16.w,
                        vertical: 12.h,
                      ),
                      hintText: 'Search bridge name, address, or symbol',
                      hintStyle: TextStyle(
                        color: AppColors.defaultText,
                        fontFamily: 'Sora',
                        fontSize: 14.sp,
                        fontWeight: FontWeight.w400,
                      ),
                      prefixIcon: Icon(
                        Icons.search,
                        size: 18.sp,
                        color: AppColors.defaultText,
                      ),
                      border: InputBorder.none,
                      enabled: true,
                    ),
                  ),
                ),
                SizedBox(height: 12.h),
                // Search Button
                Container(
                  height: 40.h,
                  width: double.infinity,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(8.r),
                    color: AppColors.buttonColor,
                  ),
                  child: Material(
                    color: Colors.transparent,
                    child: InkWell(
                      onTap: () {},
                      borderRadius: BorderRadius.circular(8.r),
                      child: Center(
                        child: Text(
                          'Search',
                          style: TextStyle(
                            color: AppColors.textColor,
                            fontFamily: 'Sora',
                            fontSize: 14.sp,
                            fontWeight: FontWeight.w500,
                          ),
                        ),
                      ),
                    ),
                  ),
                ),
              ],
            )
          : Row(
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
                SizedBox(width: 20.w),
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
