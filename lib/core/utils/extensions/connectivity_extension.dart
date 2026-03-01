import 'package:connectivity_plus/connectivity_plus.dart';

extension ConnectivityExtension on Connectivity{
  Future<bool> isConnected() async {
    var results = await checkConnectivity();
    return results.contains(ConnectivityResult.mobile)
        || results.contains(ConnectivityResult.wifi);
  }
}