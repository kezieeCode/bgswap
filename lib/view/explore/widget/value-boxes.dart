import 'package:flutter/material.dart';
import 'package:smart_web/utils/utils.dart';
import 'package:smart_web/view/explore/helpers/boxes.dart';

class ValueBoxes extends StatefulWidget {
  const ValueBoxes({super.key});

  @override
  State<ValueBoxes> createState() => _ValueBoxesState();
}

class _ValueBoxesState extends State<ValueBoxes> {
  @override
  Widget build(BuildContext context) {
    final isMobile = MediaQuery.of(context).size.width < 600;
    
    return Padding(
      padding: EdgeInsets.symmetric(
        horizontal: isMobile ? 24.w : 80.w,
      ),
      child: isMobile
          ? Column(
              children: [
                // First row - 2 boxes
                Row(
                  children: [
                    Expanded(
                      child: Boxes(
                        mainText: '10,581',
                        header: '24h Txns',
                      ),
                    ),
                    SizedBox(width: 16.w),
                    Expanded(
                      child: Boxes(
                        header: '24h Users',
                        mainText: '6,392',
                      ),
                    ),
                  ],
                ),
                SizedBox(height: 16.h),
                // Second row - 2 boxes
                Row(
                  children: [
                    Expanded(
                      child: Boxes(
                        header: '24h Fees',
                        mainText: '\$80.88k',
                      ),
                    ),
                    SizedBox(width: 16.w),
                    Expanded(
                      child: Boxes(
                        header: '24h Volume',
                        mainText: '\$256.63M',
                      ),
                    ),
                  ],
                ),
              ],
            )
          : Row(
              spacing: 10.w,
              children: [
                Boxes(
                  mainText: '10,581',
                  header: '24h Txns',
                ),
                Boxes(
                  header: '24h Users',
                  mainText: '6,392',
                ),
                Boxes(
                  header: '24h Fees',
                  mainText: '\$80.88k',
                ),
                Boxes(
                  header: '24h Volume',
                  mainText: '\$256.63M',
                ),
              ],
            ),
    );
  }
}
