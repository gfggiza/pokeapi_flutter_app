import 'package:flutter/foundation.dart' show kIsWeb;
import 'package:internet_connection_checker/internet_connection_checker.dart';

abstract class NetworkInfo {
  Future<bool> get isConnected;
  
  factory NetworkInfo() {
    if (kIsWeb) {
      return WebNetworkInfoImpl();
    }
    return NetworkInfoImpl(InternetConnectionChecker());
  }
}

class NetworkInfoImpl implements NetworkInfo {
  NetworkInfoImpl(InternetConnectionChecker internetConnectionChecker);

  @override
  Future<bool> get isConnected async {
    if (kIsWeb) {
      return true;
    }
    return InternetConnectionChecker().hasConnection;
  }
}

class WebNetworkInfoImpl implements NetworkInfo {
  @override
  Future<bool> get isConnected async => true;
}