import 'dart:js' as js;
import 'dart:js_util' as js_util;

import 'package:flutter/foundation.dart';

import 'wallet_launcher_base.dart';

class _WebWalletLauncher extends WalletLauncher {
  const _WebWalletLauncher();

  @override
  bool openWallet(String uri) {
    try {
      debugPrint('[WalletLauncherWeb] Attempting to open wallet with URI $uri');

      if (js_util.hasProperty(js.context, 'walletConnection')) {
        final connection = js_util.getProperty(js.context, 'walletConnection');
        if (connection != null &&
            js_util.hasProperty(connection, 'open') &&
            js_util.getProperty(connection, 'open') != null) {
          js_util.callMethod(connection, 'open', [uri]);
          debugPrint('[WalletLauncherWeb] walletConnection.open invoked');
          return true;
        }

        final evalResult = js.context
            .callMethod('eval', ["window.walletConnection?.open('$uri')"]);
        final handled = evalResult == true;
        debugPrint(
          '[WalletLauncherWeb] walletConnection eval attempt '
          '=> ${handled ? 'handled' : 'not handled'}',
        );
        if (handled) {
          return true;
        }
      } else {
        debugPrint('[WalletLauncherWeb] No walletConnection bridge present');
      }
    } catch (error, stackTrace) {
      debugPrint(
        '[WalletLauncherWeb] Failed to open wallet via JS bridge: $error\n$stackTrace',
      );
    }
    return false;
  }
}

WalletLauncher createWalletLauncher() => const _WebWalletLauncher();

