import 'package:flutter/foundation.dart';
import 'package:url_launcher/url_launcher.dart';

import 'wallet_launcher_base.dart';
import 'wallet_launcher_stub.dart'
    if (dart.library.html) 'wallet_launcher_web.dart' as launcher_impl;

final WalletLauncher walletLauncher = launcher_impl.createWalletLauncher();

Future<bool> launchMetaMaskDeepLink() async {
  if (!kIsWeb) {
    const deepLink = 'https://metamask.app.link/dapp/bgswap.vercel.app/';
    try {
      final uri = Uri.parse(deepLink);
      final handled = await launchUrl(
        uri,
        mode: LaunchMode.externalApplication,
      );
      return handled;
    } catch (error) {
      debugPrint('Failed to launch MetaMask deep link: $error');
      return false;
    }
  }

  return false;
}

