// ignore_for_file: file_names, avoid_web_libraries_in_flutter, deprecated_member_use

import 'dart:js_util' as js_util;

import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';

Future<String?> connectMetaMaskImpl() async {
  if (isMetaMaskAvailableImpl()) {
    return _connectWithInjectedProvider();
  }

  debugPrint('[MetaMask] Injected provider unavailable, checking for mobile UA');
  if (_isMobileUserAgent()) {
    final launched = await _launchMetaMaskDeepLink();
    if (launched) {
      debugPrint('[MetaMask] Deep link launched, awaiting return to DApp.');
    } else {
      debugPrint('[MetaMask] Deep link launch failed.');
    }
  } else {
    debugPrint('[MetaMask] Desktop environment without provider.');
  }

  return null;
}

Future<String?> _connectWithInjectedProvider() async {
  final ethereum = js_util.getProperty(js_util.globalThis, 'ethereum');

  try {
    final accounts = await js_util.promiseToFuture<List<dynamic>>(
      js_util.callMethod(
        ethereum,
        'request',
        [
          js_util.jsify(<String, dynamic>{
            'method': 'eth_requestAccounts',
          }),
        ],
      ),
    );

    if (accounts.isEmpty) {
      debugPrint('[MetaMask] No accounts returned from provider.');
      return null;
    }

    final primaryAccount = accounts.first;
    if (primaryAccount is String && primaryAccount.isNotEmpty) {
      debugPrint('[MetaMask] Connected account $primaryAccount');
      return primaryAccount;
    }

    debugPrint('[MetaMask] Primary account is not a valid string.');
    return null;
  } catch (error, stackTrace) {
    debugPrint('[MetaMask] Error requesting accounts: $error');
    debugPrint('$stackTrace');
    return null;
  }
}

bool isMetaMaskAvailableImpl() {
  if (!js_util.hasProperty(js_util.globalThis, 'ethereum')) {
    return false;
  }

  final ethereum = js_util.getProperty(js_util.globalThis, 'ethereum');

  if (ethereum == null) {
    return false;
  }

  final isMetaMaskFlag = js_util.getProperty(ethereum, 'isMetaMask');
  if (isMetaMaskFlag is bool) {
    return isMetaMaskFlag;
  }

  // Some providers expose `providers` list when multiple wallets are installed.
  if (js_util.hasProperty(ethereum, 'providers')) {
    final providers = js_util.getProperty(ethereum, 'providers');
    if (providers is List) {
      for (final provider in providers) {
        final flag = js_util.getProperty(provider, 'isMetaMask');
        if (flag is bool && flag) {
          return true;
        }
      }
    }
  }

  return false;
}

bool _isMobileUserAgent() {
  if (!js_util.hasProperty(js_util.globalThis, 'navigator')) {
    return false;
  }

  final navigator = js_util.getProperty(js_util.globalThis, 'navigator');
  final userAgent = js_util.hasProperty(navigator, 'userAgent')
      ? js_util.getProperty(navigator, 'userAgent') as String?
      : null;

  if (userAgent == null) {
    return false;
  }

  final lower = userAgent.toLowerCase();
  return lower.contains('iphone') ||
      lower.contains('ipad') ||
      lower.contains('android');
}

Future<bool> _launchMetaMaskDeepLink() async {
  const deepLink = 'https://metamask.app.link/dapp/bgswap.vercel.app/';
  try {
    final uri = Uri.parse(deepLink);
    final handled = await launchUrl(
      uri,
      mode: LaunchMode.externalApplication,
    );
    if (!handled) {
      debugPrint('[MetaMask] launchUrl returned false for deep link.');
    }
    return handled;
  } catch (error, stackTrace) {
    debugPrint('[MetaMask] Error launching deep link: $error\n$stackTrace');
    return false;
  }
}

