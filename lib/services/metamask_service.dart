// ignore_for_file: file_names

import 'metamask_service_stub.dart'
    if (dart.library.html) 'metamask_service_web.dart';

/// Returns the selected MetaMask account address if the connection succeeds.
Future<String?> connectMetaMask() => connectMetaMaskImpl();

/// Indicates whether the MetaMask provider is available in the environment.
bool isMetaMaskAvailable() => isMetaMaskAvailableImpl();


