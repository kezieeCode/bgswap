import 'package:flutter/material.dart';
import 'package:number_paginator/number_paginator.dart';

import '../../../apis/api-service.dart';
import '../../../utils/utils.dart';

class BridgesList extends StatefulWidget {
  const BridgesList({super.key});

  @override
  State<BridgesList> createState() => _BridgesListState();
}

class _BridgesListState extends State<BridgesList> {
  int _currentPage = 1; // Current page index
  final int _itemsPerPage = 10; // Items per page
  late List<Map<String, dynamic>> validators = [];
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        SizedBox(
          height: 50.h,
        ),
        Padding(
          padding: EdgeInsets.only(left: 30.w),
          child: Container(
            height: 1300.h, // Can be adjusted based on your UI needs
            width: 650.w,
            decoration: BoxDecoration(
              color: const Color.fromARGB(243, 27, 29, 37),
              borderRadius: BorderRadius.circular(10.r),
            ),
            child: Padding(
              padding: EdgeInsets.only(top: 60.h),
              child: Column(
                children: [
                  Padding(
                    padding: EdgeInsets.only(left: 40.w),
                    child: Row(
                      children: [
                        Text(
                          '#',
                          style: TextstyleConstant().navBarDefault,
                        ),
                        SizedBox(
                          width: 70.w,
                        ),
                        Text(
                          'Name',
                          style: TextstyleConstant().navBarDefault,
                        ),
                        SizedBox(width: 60.w),
                        Text(
                          'Token Address',
                          style: TextstyleConstant().navBarDefault,
                        ),
                        SizedBox(width: 60.w),
                        Text(
                          'Underlying',
                          style: TextstyleConstant().navBarDefault,
                        ),
                        SizedBox(width: 60.w),
                        Text(
                          'Chain',
                          style: TextstyleConstant().navBarDefault,
                        ),
                        SizedBox(width: 60.w),
                        Text(
                          'Supply',
                          style: TextstyleConstant().navBarDefault,
                        ),
                        SizedBox(width: 60.w),
                        Text(
                          'TVL(USD)',
                          style: TextstyleConstant().navBarDefault,
                        ),
                        // SizedBox(width: 50.w),
                        // Text(
                        //   'Status',
                        //   style: TextstyleConstant().navBarDefault,
                        // ),
                      ],
                    ),
                  ),
                  Divider(
                    color: AppColors.defaultText,
                    thickness: 0.2,
                    indent: 15.w,
                    endIndent: 30.w,
                  ),
                  FutureBuilder<List<Map<String, dynamic>>>(
                    future: HttpService
                        .fetchBridges(), // Fetch from transactions.json
                    builder: (context, snapshot) {
                      if (snapshot.connectionState == ConnectionState.waiting) {
                        return const Center(child: CircularProgressIndicator());
                      } else if (snapshot.hasError) {
                        return Center(child: Text("Error: ${snapshot.error}"));
                      } else if (!snapshot.hasData || snapshot.data!.isEmpty) {
                        return const Center(
                            child: Text("No transactions available"));
                      }

                      // Filter active validators
                      List<Map<String, dynamic>> bridges = snapshot.data!;

                      return Expanded(
                        child: ListView.builder(
                          shrinkWrap: true, // Allow ListView to shrink
                          itemCount: bridges.length,
                          itemBuilder: (context, index) {
                            final bridge = bridges[index];

                            return Padding(
                              padding: EdgeInsets.symmetric(vertical: 15.h),
                              child: Row(
                                mainAxisAlignment: MainAxisAlignment.start,
                                children: [
                                  Expanded(
                                    flex: 1,
                                    child: Text(
                                      '${'${bridge["id_hash"]}'.substring(0, 4)}...',
                                      style: TextstyleConstant().commonText,
                                      textAlign: TextAlign.center,
                                    ),
                                  ),
                                  Expanded(
                                    flex: 1,
                                    child: Padding(
                                      padding: EdgeInsets.only(right: 20.w),
                                      child: Text(
                                        '${bridge["coin_name"]}',
                                        style: TextstyleConstant().commonText,
                                        textAlign: TextAlign.center,
                                      ),
                                    ),
                                  ),
                                  Expanded(
                                    flex: 1,
                                    child: Padding(
                                      padding: EdgeInsets.only(right: 20.w),
                                      child: Text(
                                        bridge["token_address"] != null
                                            ? '${bridge["token_address"].substring(0, 7)}...${bridge["token_address"].substring(bridge["token_address"].length - 4)}'
                                            : "N/A",
                                        style:
                                            TextstyleConstant().commonTextBlue,
                                        textAlign: TextAlign.center,
                                      ),
                                    ),
                                  ),
                                  Expanded(
                                    flex: 1,
                                    child: Padding(
                                      padding: EdgeInsets.only(left: 20.w),
                                      child: Text(
                                        bridge["underlying"] != null
                                            ? '${bridge["underlying"].substring(0, 7)}...${bridge["underlying"].substring(bridge["underlying"].length - 4)}'
                                            : "N/A",
                                        style:
                                            TextstyleConstant().commonTextBlue,
                                        textAlign: TextAlign.center,
                                      ),
                                    ),
                                  ),
                                  Expanded(
                                    flex: 1,
                                    child: Padding(
                                      padding: EdgeInsets.only(left: 20.w),
                                      child: Text(
                                        '${bridge["chain"]}',
                                        style: TextstyleConstant().commonText,
                                        textAlign: TextAlign.center,
                                      ),
                                    ),
                                  ),
                                  Expanded(
                                    flex: 1,
                                    child: Text(
                                      '${bridge["supply"]}',
                                      style: TextstyleConstant().commonText,
                                      textAlign: TextAlign.center,
                                    ),
                                  ),
                                  Expanded(
                                    flex: 1,
                                    child: Padding(
                                      padding: EdgeInsets.only(right: 20.w),
                                      child: Text(
                                        '${bridge["tvl(usd)"]}',
                                        style: TextstyleConstant().commonText,
                                        textAlign: TextAlign.center,
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                            );
                          },
                        ),
                      );
                    },
                  ),
                  NumberPaginator(
                    // prevButtonContent: Icon(Icons.arrow_back_ios),
                    showNextButton: true,
                    showPrevButton: true,
                    numberPages: (validators.length / _itemsPerPage).ceil() > 0
                        ? (validators.length / _itemsPerPage).ceil()
                        : 1, // Ensure numberPages is at least 1
                    onPageChange: (page) {
                      setState(() {
                        _currentPage = page + 1;
                      });
                    },
                    initialPage: (_currentPage - 1) < 0
                        ? 0
                        : (_currentPage -
                            1), // Ensure initialPage is not negative
                  ),
                ],
              ),
            ),
          ),
        ),
      ],
    );
  }
}
