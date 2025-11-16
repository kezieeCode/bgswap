abstract class WalletLauncher {
  const WalletLauncher();

  /// Returns true if the URI was handled (e.g. browser extension opened).
  bool openWallet(String uri);
}







