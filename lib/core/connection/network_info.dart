import 'package:data_connection_checker_tv/data_connection_checker.dart';

abstract class INetworkInfo {
  Future<bool>? get isConnected;
}

class NetworkInfoImpl implements INetworkInfo {
  final DataConnectionChecker connectionChecker;

  NetworkInfoImpl(this.connectionChecker);

  @override
  Future<bool> get isConnected => connectionChecker.hasConnection;
}
