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
    return Padding(
      padding: EdgeInsets.only(left: 80.w),
      child: Row(
        spacing: 10.w,
        //  mainAxisAlignment: MainAxisAlignment.spaceAround,
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
          )
        ],
      ),
    );
  }
}
