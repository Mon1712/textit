import 'dart:async';

import 'package:chateo/utils/loaders/loaders.dart';
import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';

class NetworkManager extends GetxController{
  static NetworkManager get instance => Get.find();

  final Connectivity _connectivity = Connectivity();
  late StreamSubscription<List<ConnectivityResult>> _connectivitySubscription;
  final RxList<ConnectivityResult> _connectionStatus = [ConnectivityResult.none].obs;

  /// Initialize the network manager and setup a stream to continually check the connection status
  @override
  void onInit() {
    super.onInit();
    _connectivitySubscription = _connectivity.onConnectivityChanged.listen(_updateConnectionStatus);
  }

  // update the connection status based on change in connectivity and show a relevant popup for no internet connection
Future<void> _updateConnectionStatus(List<ConnectivityResult> result) async{
_connectionStatus.value= result;
if(_connectionStatus[0]==ConnectivityResult.none){
  Loaders.warningSnackBar(title: "No Internet Connection");
}
}

/// check internet connection status
/// return true if connected else false
  Future<bool> isConnected() async{
    try{
     final result = await _connectivity.checkConnectivity();
      if (result == [ConnectivityResult.none]) {
        return false;
      }else{
        return true;
      }
    }on PlatformException catch (_){
      return false;
    }
  }

  /// Cleanup method to dispose of the connectivity stream when the controller is closed
  @override
  void onClose() {
    _connectivitySubscription.cancel();
    super.onClose();
  }

}

