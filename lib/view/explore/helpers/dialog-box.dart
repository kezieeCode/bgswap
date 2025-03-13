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
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return Dialog(
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(5.sp),
          ),
          elevation: 0,
          backgroundColor: AppColors.appBarColor,
          child: SizedBox(
            width: 250.w,
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
                        "Transaction Detail",
                        style: TextstyleConstant().commonText,
                      ),
                      SizedBox(
                        width: 100.w,
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
                  SizedBox(height: 10),
                  Padding(
                    padding: EdgeInsets.only(left: 10.w),
                    child: Column(
                        // crossAxisAlignment: CrossAxisAlignment.stretch,
                        children: [
                          Row(
                            children: [
                              Text(
                                'Source Hash:',
                                style: TextstyleConstant().navBarDefault,
                              ),
                              SizedBox(
                                width: 15.w,
                              ),
                              Expanded(
                                flex: 2,
                                child: Text(
                                  textAlign: TextAlign.center,
                                  '0x9e56b601b61f9d7db9f34d89b2f220c8c7c87c5877b7e2387be1d0d7f3e8356e',
                                  style: TextstyleConstant().commonTextBlue,
                                ),
                              )
                            ],
                          ),
                          SizedBox(
                            height: 20.h,
                          ),
                          Divider(
                            thickness: 0.2,
                          ),
                          Row(
                            children: [
                              Text(
                                'Dest Hash:',
                                style: TextstyleConstant().navBarDefault,
                              ),
                              SizedBox(
                                width: 15.w,
                              ),
                              Expanded(
                                flex: 2,
                                child: Text(
                                  textAlign: TextAlign.center,
                                  '0x9e56b601b61f9d7db9f34d89b2f220c8c7c87c5877b7e2387be1d0d7f3e8356e',
                                  style: TextstyleConstant().commonTextBlue,
                                ),
                              )
                            ],
                          ),
                          SizedBox(
                            height: 20.h,
                          ),
                          Divider(
                            thickness: 0.2,
                          ),
                          Row(
                            children: [
                              Text(
                                'Source Chain:',
                                style: TextstyleConstant().navBarDefault,
                              ),
                              SizedBox(
                                width: 50.w,
                              ),
                              Text(
                                sourceChain,
                                style: TextstyleConstant().commonText,
                              )
                            ],
                          ),
                          SizedBox(
                            height: 20.h,
                          ),
                          Divider(
                            thickness: 0.2,
                          ),
                          Row(
                            children: [
                              Text(
                                'Dest Chain:',
                                style: TextstyleConstant().navBarDefault,
                              ),
                              SizedBox(
                                width: 60.w,
                              ),
                              SizedBox(
                                width: 50.w,
                                child: Text(
                                  textAlign: TextAlign.center,
                                  destChain,
                                  style: TextstyleConstant().commonText,
                                ),
                              )
                            ],
                          ),
                          SizedBox(
                            height: 20.h,
                          ),
                          Divider(
                            thickness: 0.2,
                          ),
                          Row(
                            children: [
                              Text(
                                'From:',
                                style: TextstyleConstant().navBarDefault,
                              ),
                              SizedBox(
                                width: 70.w,
                              ),
                              Expanded(
                                flex: 2,
                                child: Text(
                                  senderAddress,
                                  style: TextstyleConstant().commonTextBlue,
                                ),
                              )
                            ],
                          ),
                          SizedBox(
                            height: 20.h,
                          ),
                          Divider(
                            thickness: 0.2,
                          ),
                          Row(
                            children: [
                              Text(
                                'To:',
                                style: TextstyleConstant().navBarDefault,
                              ),
                              SizedBox(
                                width: 80.w,
                              ),
                              Expanded(
                                flex: 2,
                                child: Text(
                                  senderAddress,
                                  style: TextstyleConstant().commonTextBlue,
                                ),
                              )
                            ],
                          ),
                          SizedBox(
                            height: 20.h,
                          ),
                          Divider(
                            thickness: 0.2,
                          ),
                          Row(
                            children: [
                              Text(
                                'Date:',
                                style: TextstyleConstant().navBarDefault,
                              ),
                              SizedBox(
                                width: 70.w,
                              ),
                              Text(
                                date,
                                style: TextstyleConstant().commonText,
                              )
                            ],
                          ),
                          SizedBox(
                            height: 20.h,
                          ),
                          Divider(
                            thickness: 0.2,
                          ),
                          Row(
                            children: [
                              Text(
                                'Send Value',
                                style: TextstyleConstant().navBarDefault,
                              ),
                              SizedBox(
                                width: 70.w,
                              ),
                              Text(
                                sendValue,
                                style: TextstyleConstant().commonText,
                              )
                            ],
                          ),
                          SizedBox(
                            height: 20.h,
                          ),
                          Divider(
                            thickness: 0.2,
                          ),
                          Row(
                            children: [
                              Text(
                                'Recieve Value',
                                style: TextstyleConstant().navBarDefault,
                              ),
                              SizedBox(
                                width: 60.w,
                              ),
                              Text(
                                recievedValue,
                                style: TextstyleConstant().commonText,
                              )
                            ],
                          ),
                          SizedBox(
                            height: 20.h,
                          ),
                          Divider(
                            thickness: 0.2,
                          ),
                          Row(
                            children: [
                              Text(
                                'Status',
                                style: TextstyleConstant().navBarDefault,
                              ),
                              SizedBox(
                                width: 85.w,
                              ),
                              Text(
                                status,
                                style: TextStyle(
                                  fontWeight: FontWeight.bold,
                                  fontSize: 7.sp,
                                  fontFamily: 'Sora',
                                  color: status == "Completed"
                                      ? Colors.green
                                      : status == "Confirming"
                                          ? Colors.white
                                          : AppColors.dangerColor,
                                ),
                              )
                            ],
                          ),
                          SizedBox(
                            height: 20.h,
                          ),
                          Divider(
                            thickness: 0.2,
                          )
                        ]),
                  ),
                  SizedBox(height: 20),
                ],
              ),
            ),
          ),
        );
      },
    );
  }
}
