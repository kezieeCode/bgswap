// ignore_for_file: file_names

import 'dart:convert';
import 'package:flutter/services.dart' show rootBundle;

class HttpService {
  static Future<List<Map<String, dynamic>>> fetchTransactions() async {
    final String response =
        await rootBundle.loadString('assets/transactions.json');
    final List<dynamic> data = json.decode(response);
    return data.cast<Map<String, dynamic>>();
  }

  static Future<List<Map<String, dynamic>>> fetchValidators() async {
    final String response = await rootBundle.loadString('assets/network.json');
    final List<dynamic> data = json.decode(response);
    return data.cast<Map<String, dynamic>>();
  }
    static Future<List<Map<String, dynamic>>> fetchBridges() async {
    final String response = await rootBundle.loadString('assets/crypto_data.json');
    final List<dynamic> data = json.decode(response);
    return data.cast<Map<String, dynamic>>();
  }
}
