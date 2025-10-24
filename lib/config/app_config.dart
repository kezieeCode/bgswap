// ignore_for_file: file_names

import 'package:flutter_dotenv/flutter_dotenv.dart';

class AppConfig {
  // Fallback configuration when .env is not available
  static const String fallbackInfuraApiKey = '7516478a82324c0d8ced96fb2894cb07';
  static const String fallbackReownProjectId = '544cf533990827946732f99a9beabb74';
  
  // Get API key with fallback
  static String get infuraApiKey {
    try {
      return dotenv.env['INFURA_API_KEY'] ?? fallbackInfuraApiKey;
    } catch (e) {
      return fallbackInfuraApiKey;
    }
  }
  
  // Get Reown Project ID with fallback
  static String get reownProjectId {
    try {
      return dotenv.env['REOWN_PROJECT_ID'] ?? fallbackReownProjectId;
    } catch (e) {
      return fallbackReownProjectId;
    }
  }
}
