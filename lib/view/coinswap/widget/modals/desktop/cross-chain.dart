// ignore_for_file: file_names

import 'package:easy_stepper/easy_stepper.dart';
import 'package:flutter/material.dart';
import 'package:smart_web/utils/utils.dart';
import 'package:smart_web/view/coinswap/widget/modals/mobile/exchange_mobile.dart';

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
  int _currentStep = 0;

  void _continue() {
    if (_currentStep < 3) {
      setState(() => _currentStep += 1);
    }
  }

  void _cancel() {
    if (_currentStep > 0) {
      setState(() => _currentStep -= 1);
    }
  }

  void _onStepTapped(int step) {
    setState(() => _currentStep = step);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.backgroundColor,
      body: MediaQuery.of(context).size.width < 600
          ? SingleChildScrollView(
              child: Column(
                children: [
                  ExchangeMobile(),
                  Stepper(
                    type: StepperType.vertical,
                    currentStep: _currentStep,
                    onStepContinue: _continue,
                    onStepCancel: _cancel,
                    onStepTapped: _onStepTapped,
                    steps: [
                      Step(
                        title: Text(
                          'Starting Swap',
                          style: TextstyleConstant().commonText.copyWith(
                              fontSize: 23.sp, fontWeight: FontWeight.bold),
                        ),
                        content: Text(
                          'Input the amount of tokens to swap',
                          style: TextstyleConstant()
                              .commonText
                              .copyWith(fontSize: 25.sp),
                        ),
                        isActive: _currentStep >= 0,
                        state: _currentStep > 0
                            ? StepState.complete
                            : StepState.indexed,
                      ),
                      Step(
                        title: Text('Crossing Bridge',
                            style: TextstyleConstant().commonText.copyWith(
                                fontSize: 23.sp, fontWeight: FontWeight.bold)),
                        content: Text(
                            "Select the token network you'd love to convert to",
                            style: TextstyleConstant()
                                .commonText
                                .copyWith(fontSize: 25.sp)),
                        isActive: _currentStep >= 1,
                        state: _currentStep > 1
                            ? StepState.complete
                            : StepState.indexed,
                      ),
                      Step(
                        title: Text(
                          'Approving Transfer',
                          style: TextstyleConstant().commonText.copyWith(
                              fontSize: 23.sp, fontWeight: FontWeight.bold),
                        ),
                        content: Text(
                          'After token has been swapped you can now tap on the transfer button to approve a transfer to be swapped',
                          style: TextstyleConstant()
                              .commonText
                              .copyWith(fontSize: 25.sp),
                        ),
                        isActive: _currentStep >= 2,
                        state: _currentStep == 2
                            ? StepState.editing
                            : StepState.indexed,
                      ),
                      Step(
                        title: Text(
                          'Complete',
                          style: TextstyleConstant().commonText.copyWith(
                              fontSize: 23.sp, fontWeight: FontWeight.bold),
                        ),
                        content: Text(
                          'Now your transfer has been successfully completed',
                          style: TextstyleConstant()
                              .commonText
                              .copyWith(fontSize: 25.sp),
                        ),
                        isActive: _currentStep >= 3,
                        state: _currentStep == 3
                            ? StepState.editing
                            : StepState.indexed,
                      ),
                    ],
                  ),
                ],
              ),
            )
          : Row(
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
                              '',
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
                          backgroundColor: currentStep >= 1
                              ? AppColors.buttonColor
                              : Colors.white,
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
                          backgroundColor: currentStep >= 2
                              ? AppColors.buttonColor
                              : Colors.white,
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
                          backgroundColor: currentStep >= 3
                              ? AppColors.buttonColor
                              : Colors.white,
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
