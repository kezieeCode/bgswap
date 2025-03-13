// ignore_for_file: file_names, constant_identifier_names

class TextConst {
  static const String coinSwap = "Coin Swap";
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
  static const String APIKEY = '7516478a82324c0d8ced96fb2894cb07';
  static const List<String> networks = [
    'BSC Mainnet',
    'Cronos Mainnet',
    'Ethereum Mainnet',
    'Fantom Mainnet',
    'Polygon Mainnet'
  ];

  static const List<String> networkIcons = [
    'images/bnb.png',
    'images/cronos.png',
    'images/eth.png',
    'images/fantom.png',
    'images/polygon.png'
  ];

  static const List<String> wallets = [
    'Metamask',
    'Coin98',
    'WalletConnect',
    'Coinbase Wallet',
    'BiKeep'
  ];

  static const List<String> walletIcons = [
    'images/metamask.png',
    'images/c98.png',
    'images/walletconnect.png',
    'images/coinbase.png',
    'images/bitkeep.png'
  ];
  final Map<String, String> networkEndpoints = {
    'BNB Smart Chain': 'https://opbnb-mainnet.infura.io/v3/$APIKEY',
    'Ethereum': 'https://mainnet.infura.io/v3/$APIKEY',
    'Polygon': 'https://polygon-mainnet.infura.io/v3/$APIKEY',
    'Cronos': 'https://evm.cronos.org',
    'Fantom': 'https://rpc.ftm.tools/',
  };
}
