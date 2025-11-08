import 'package:flutter/material.dart';

import '../../../utils/utils.dart';

class CustomDialog {
  final String status;
  final String sourceHash;
  final String sourceChain;
  final String destChain;
  final String date;
  final String senderAddress;
  final String sendValue;
  final String recievedValue;
  CustomDialog(
      {required this.date,
      required this.destChain,
      required this.recievedValue,
      required this.sendValue,
      required this.sourceChain,
      required this.senderAddress,
      required this.sourceHash,
      required this.status});
  void showDetailDialog(BuildContext context) {
    final isMobile = MediaQuery.of(context).size.width < 600;
    
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return Dialog(
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(isMobile ? 20.r : 5.sp),
          ),
          elevation: 0,
          backgroundColor: AppColors.appBarColor,
          child: Container(
            width: isMobile ? double.infinity : 250.w,
            constraints: BoxConstraints(
              maxWidth: isMobile ? 400.w : 250.w,
              maxHeight: isMobile ? 600.h : 500.h,
            ),
            child: Padding(
              padding: EdgeInsets.all(isMobile ? 24.w : 16.w),
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  // Header
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        "Transaction Detail",
                        style: TextStyle(
                          color: AppColors.textColor,
                          fontFamily: 'Sora',
                          fontSize: isMobile ? 24.sp : 12.sp,
                          fontWeight: FontWeight.w700,
                        ),
                      ),
                      IconButton(
                        onPressed: () {
                          Navigator.pop(context);
                        },
                        icon: Icon(
                          Icons.close,
                          color: AppColors.textColor,
                          size: isMobile ? 28.sp : 7.sp,
                        ),
                      ),
                    ],
                  ),
                  SizedBox(height: isMobile ? 20.h : 10.h),
                  
                  // Content
                  Expanded(
                    child: SingleChildScrollView(
                      child: Column(
                        children: [
                          // Source Hash
                          _buildDetailRow(
                            'Source Hash:',
                            '0x9e56b601b61f9d7db9f34d89b2f220c8c7c87c5877b7e2387be1d0d7f3e8356e',
                            isMobile,
                            isAddress: true,
                          ),
                          
                          // Dest Hash
                          _buildDetailRow(
                            'Dest Hash:',
                            '0x9e56b601b61f9d7db9f34d89b2f220c8c7c87c5877b7e2387be1d0d7f3e8356e',
                            isMobile,
                            isAddress: true,
                          ),
                          
                          // Source Chain
                          _buildDetailRow(
                            'Source Chain:',
                            sourceChain,
                            isMobile,
                          ),
                          
                          // Dest Chain
                          _buildDetailRow(
                            'Dest Chain:',
                            destChain,
                            isMobile,
                          ),
                          
                          // From
                          _buildDetailRow(
                            'From:',
                            senderAddress,
                            isMobile,
                            isAddress: true,
                          ),
                          
                          // To
                          _buildDetailRow(
                            'To:',
                            senderAddress,
                            isMobile,
                            isAddress: true,
                          ),
                          
                          // Date
                          _buildDetailRow(
                            'Date:',
                            date,
                            isMobile,
                          ),
                          
                          // Send Value
                          _buildDetailRow(
                            'Send Value:',
                            sendValue,
                            isMobile,
                            isAmount: true,
                          ),
                          
                          // Receive Value
                          _buildDetailRow(
                            'Receive Value:',
                            recievedValue,
                            isMobile,
                            isAmount: true,
                          ),
                          
                          // Status
                          _buildDetailRow(
                            'Status:',
                            status,
                            isMobile,
                            isStatus: true,
                          ),
                        ],
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
        );
      },
    );
  }

  Widget _buildDetailRow(String label, String value, bool isMobile, {bool isAddress = false, bool isAmount = false, bool isStatus = false}) {
    return Container(
      margin: EdgeInsets.only(bottom: isMobile ? 16.h : 8.h),
      padding: EdgeInsets.all(isMobile ? 16.w : 8.w),
      decoration: BoxDecoration(
        color: AppColors.greyButton.withOpacity(0.3),
        borderRadius: BorderRadius.circular(isMobile ? 12.r : 6.r),
        border: Border.all(
          color: AppColors.buttonColor.withOpacity(0.1),
          width: 1,
        ),
      ),
      child: isMobile
          ? Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  label,
                  style: TextStyle(
                    color: AppColors.defaultText,
                    fontFamily: 'Sora',
                    fontSize: 18.sp,
                    fontWeight: FontWeight.w600,
                  ),
                ),
                SizedBox(height: 8.h),
                Text(
                  value,
                  style: TextStyle(
                    color: isAddress 
                        ? AppColors.buttonColor 
                        : isAmount 
                            ? AppColors.greenColor 
                            : isStatus 
                                ? (value == "Completed" 
                                    ? AppColors.greenColor 
                                    : value == "Confirming" 
                                        ? AppColors.textColor 
                                        : AppColors.dangerColor)
                                : AppColors.textColor,
                    fontFamily: 'Sora',
                    fontSize: 20.sp,
                    fontWeight: FontWeight.w700,
                  ),
                ),
              ],
            )
          : Row(
              children: [
                Text(
                  label,
                  style: TextstyleConstant().navBarDefault,
                ),
                SizedBox(width: 15.w),
                Expanded(
                  child: Text(
                    value,
                    style: isAddress 
                        ? TextstyleConstant().commonTextBlue
                        : isStatus
                            ? TextStyle(
                                fontWeight: FontWeight.bold,
                                fontSize: 7.sp,
                                fontFamily: 'Sora',
                                color: value == "Completed"
                                    ? Colors.green
                                    : value == "Confirming"
                                        ? Colors.white
                                        : AppColors.dangerColor,
                              )
                            : TextstyleConstant().commonText,
                  ),
                ),
              ],
            ),
    );
  }
}
