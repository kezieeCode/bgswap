import 'wallet_launcher_base.dart';

class _StubWalletLauncher extends WalletLauncher {
  const _StubWalletLauncher();

  @override
  bool openWallet(String uri) => false;
}

WalletLauncher createWalletLauncher() => const _StubWalletLauncher();

