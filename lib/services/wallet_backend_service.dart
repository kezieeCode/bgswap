import 'dart:convert';

import 'package:http/http.dart' as http;

class WalletBackendService {
  WalletBackendService({http.Client? client})
      : _client = client ?? http.Client();

  static const String _baseUrl =
      'https://bridgeswap-backend.onrender.com'; // Provided by backend

  final http.Client _client;

  Future<WalletSession> createSession({
    String relayProtocol = 'irn',
    List<String> chains = const ['eip155:1'],
    List<String> methods = const ['eth_sendTransaction', 'personal_sign'],
  }) async {
    final uri = Uri.parse('$_baseUrl/api/wallet/session');
    final response = await _client.post(
      uri,
      headers: {'Content-Type': 'application/json'},
      body: jsonEncode({
        'relayProtocol': relayProtocol,
        'chains': chains,
        'methods': methods,
      }),
    );

    if (response.statusCode >= 200 && response.statusCode < 300) {
      final data = jsonDecode(response.body) as Map<String, dynamic>;
      return WalletSession.fromJson(data);
    }

    throw WalletBackendException(
      message: 'Failed to create wallet session',
      statusCode: response.statusCode,
      body: response.body,
    );
  }

  Future<WalletSessionStatus> fetchSessionStatus(String sessionId) async {
    final uri = Uri.parse('$_baseUrl/api/wallet/session/$sessionId');
    final response = await _client.get(
      uri,
      headers: {'Content-Type': 'application/json'},
    );

    if (response.statusCode >= 200 && response.statusCode < 300) {
      final data = jsonDecode(response.body) as Map<String, dynamic>;
      return WalletSessionStatus.fromJson(data);
    }

    throw WalletBackendException(
      message: 'Failed to fetch wallet session status',
      statusCode: response.statusCode,
      body: response.body,
    );
  }

  Future<WalletRequestResult> forwardRequest({
    required String sessionId,
    required String method,
    required String chainId,
    required List<dynamic> params,
  }) async {
    final uri =
        Uri.parse('$_baseUrl/wallet/session/$sessionId/request');
    final response = await _client.post(
      uri,
      headers: {'Content-Type': 'application/json'},
      body: jsonEncode({
        'method': method,
        'chainId': chainId,
        'params': params,
      }),
    );

    if (response.statusCode >= 200 && response.statusCode < 300) {
      final data = jsonDecode(response.body) as Map<String, dynamic>;
      return WalletRequestResult.fromJson(data);
    }

    throw WalletBackendException(
      message: 'Failed to forward wallet request',
      statusCode: response.statusCode,
      body: response.body,
    );
  }
}

class WalletSession {
  const WalletSession({
    required this.sessionId,
    required this.uri,
    required this.relayProtocol,
    this.raw,
  });

  factory WalletSession.fromJson(Map<String, dynamic> json) {
    return WalletSession(
      sessionId: json['sessionId'] as String,
      uri: json['uri'] as String,
      relayProtocol: json['relayProtocol'] as String? ?? 'irn',
      raw: json,
    );
  }

  final String sessionId;
  final String uri;
  final String relayProtocol;
  final Map<String, dynamic>? raw;
}

class WalletSessionStatus {
  const WalletSessionStatus({
    required this.id,
    required this.status,
    required this.relayProtocol,
    required this.wallet,
    this.createdAt,
    this.updatedAt,
    this.raw,
  });

  factory WalletSessionStatus.fromJson(Map<String, dynamic> json) {
    return WalletSessionStatus(
      id: json['id'] as String,
      status: json['status'] as String? ?? 'pending',
      relayProtocol: json['relayProtocol'] as String? ?? 'irn',
      wallet: (json['wallet'] as Map<String, dynamic>? ?? const {}),
      createdAt: json['createdAt'] as String?,
      updatedAt: json['updatedAt'] as String?,
      raw: json,
    );
  }

  final String id;
  final String status;
  final String relayProtocol;
  final Map<String, dynamic> wallet;
  final String? createdAt;
  final String? updatedAt;
  final Map<String, dynamic>? raw;

  bool get isPending =>
      status.toLowerCase().contains('pending') && wallet.isEmpty;
}

class WalletRequestResult {
  const WalletRequestResult({
    this.result,
    this.error,
    this.raw,
  });

  factory WalletRequestResult.fromJson(Map<String, dynamic> json) {
    return WalletRequestResult(
      result: json['result'],
      error: json['error'],
      raw: json,
    );
  }

  final dynamic result;
  final dynamic error;
  final Map<String, dynamic>? raw;
}

class WalletBackendException implements Exception {
  const WalletBackendException({
    required this.message,
    this.statusCode,
    this.body,
  });

  final String message;
  final int? statusCode;
  final String? body;

  @override
  String toString() =>
      'WalletBackendException($message, statusCode: $statusCode, body: $body)';
}

