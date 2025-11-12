// ignore_for_file: file_names, constant_identifier_names

import '../config/app_config.dart';

class TextConst {
  static const String coinSwap = "Cross Swap";
  static const String explore = "Explore";
  static const String bridges = "Bridges";
  static const String network = "Network";

  static const String firstHeader = "Starting Swap";
  static const String subHeaderA = "Minimum Crosschain Amount is 0.08 BNB";
  static const String subHeaderB = "Maximum Crosschain Amount is 12,000 BNB";
  static const String subHeaderC =
      "Estimated Time of Crosschain Arrival is 10-30 min";
  static const String subHeaderD =
      "Crosschain amount larger than 2,100 BNB could take up to 12 hours";
  static const String secondHeader = "Crossing Bridge";
  static const String thirdHeader = "Approving Transfer";
  static const String lastHeader = "Complete";
  static const String reownProjectID = "544cf533990827946732f99a9beabb74";
  
  // Get API key from environment variables with fallback
  static String get apiKey => AppConfig.infuraApiKey;
  
  static const List<String> networks = [
    'BSC Mainnet',
    'Cronos Mainnet',
    'Ethereum Mainnet',
    'Fantom Mainnet',
    'Polygon Mainnet'
  ];

  static const List<String> networkIcons = [
    'assets/images/bnb.png',
    'assets/images/cronos.png',
    'assets/images/eth.png',
    'assets/images/fantom.png',
    'assets/images/polygon.png'
  ];

  static const List<String> wallets = [
    'Metamask',
    'Coin98',
    'WalletConnect',
    'Coinbase Wallet',
    'BiKeep'
  ];

  static const List<String> walletIcons = [
    'assets/images/metamask.png',
    'assets/images/c98.png',
    'assets/images/walletconnect.png',
    'assets/images/coinbase.png',
    'assets/images/bitkeep.png'
  ];
  static String tickerForNetwork(String networkLabel) {
    final normalized = networkLabel.toLowerCase().trim();

    if (normalized.contains('bsc') || normalized.contains('bnb')) {
      return 'BNB';
    }

    if (normalized.contains('cronos')) {
      return 'CRO';
    }

    if (normalized.contains('fantom')) {
      return 'FTM';
    }

    if (normalized.contains('polygon') || normalized.contains('matic')) {
      return 'MATIC';
    }

    return 'ETH';
  }
}
