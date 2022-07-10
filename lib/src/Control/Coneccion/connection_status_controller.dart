import 'dart:async';
import 'package:get/get.dart';

import '../../../main.dart';
import 'check_internet_connection.dart';

class ConnectionStatusController extends GetxController {
  late StreamSubscription _connectionSubscription;

  final status = Rx<ConnectionStatus>(ConnectionStatus.online);

  ConnectionStatusController() {
    _connectionSubscription = internetChecker
        .internetStatus()
        .listen((newStatus) => status.value = newStatus);
  }

  @override
  void dispose() {
    _connectionSubscription.cancel();
    super.dispose();
  }
}
