// ignore_for_file: file_names

import 'package:easy_stepper/easy_stepper.dart';
import 'package:flutter/material.dart';
import 'package:smart_web/utils/utils.dart';

class CrossChainScreen extends StatefulWidget {
  const CrossChainScreen({super.key});

  @override
  State<CrossChainScreen> createState() => _CrossChainScreenState();
}

class _CrossChainScreenState extends State<CrossChainScreen> {
  int currentStep = 3;
  int totalSteps = 4;
  int currentStep1 = 2;
  int currentStep2 = 1;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.backgroundColor,
      body: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          ExchangeForm(),
          EasyStepper(
            direction: Axis.vertical,
            // textDirection: TextDirection.[],
            activeStep: currentStep,
            lineStyle: LineStyle(
              lineLength: 100.h,
              // lineSpace: 0,
              lineType: LineType.dotted,
              defaultLineColor: Colors.white,
              finishedLineColor: AppColors.buttonColor,
              // unreachedLineType: LineType.dashed
            ),
            activeStepTextColor: Colors.black87,
            finishedStepTextColor: Colors.black87,
            internalPadding: 10.sp,
            padding: EdgeInsets.only(bottom: 50.h),
            showLoadingAnimation: false,
            stepRadius: 20.r,
            // showStepBorder: true,
            steps: [
              EasyStep(
                  customStep: CircleAvatar(
                    backgroundColor: Colors.white,
                    child: CircleAvatar(
                      radius: 100.r,
                      backgroundColor: currentStep >= 0
                          ? AppColors.buttonColor
                          : Colors.white,
                      child: Text(
                        '1',
                        style: TextStyle(color: AppColors.textColor),
                      ),
                    ),
                  ),
                  customTitle: Padding(
                    padding: EdgeInsets.only(left: 50.w),
                    child: SizedBox(
                      width: 500.w,
                      child: Text(
                        'Jesus',
                        style: TextStyle(color: Colors.white),
                      ),
                    ),
                  )),
              EasyStep(
                customStep: CircleAvatar(
                  radius: 100.r,
                  // backgroundColor: Colors.white,
                  child: CircleAvatar(
                    radius: 100.r,
                    backgroundColor:
                        currentStep >= 1 ? AppColors.buttonColor : Colors.white,
                    child: Text(
                      '2',
                      style: TextStyle(
                        color: currentStep >= 1
                            ? AppColors.textColor
                            : AppColors.buttonColor,
                      ),
                    ),
                  ),
                ),
              ),
              EasyStep(
                customStep: CircleAvatar(
                  radius: 100.r,
                  backgroundColor: Colors.white,
                  child: CircleAvatar(
                    radius: 100.r,
                    backgroundColor:
                        currentStep >= 2 ? AppColors.buttonColor : Colors.white,
                    child: Text(
                      '3',
                      style: TextStyle(
                        color: currentStep >= 2
                            ? AppColors.textColor
                            : AppColors.buttonColor,
                      ),
                    ),
                  ),
                ),
              ),
              EasyStep(
                customStep: CircleAvatar(
                  radius: 100.r,
                  backgroundColor: Colors.white,
                  child: CircleAvatar(
                    radius: 100.r,
                    backgroundColor:
                        currentStep >= 3 ? AppColors.buttonColor : Colors.white,
                    child: Text(
                      '4',
                      style: TextStyle(
                        color: currentStep >= 3
                            ? AppColors.textColor
                            : AppColors.buttonColor,
                      ),
                    ),
                  ),
                ),
              ),
            ],
            onStepReached: (index) => setState(() => currentStep = index),
          ),
        ],
      ),
    );
  }
}
