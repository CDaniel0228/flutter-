import 'package:flutter/material.dart';

import 'package:get/get.dart';

import 'check_internet_connection.dart';
import 'connection_status_controller.dart';

class WarningWidgetGetX {
  Widget conexion() {
    final controller = Get.put(ConnectionStatusController());
    return Obx(() {
      return Visibility(
        visible: controller.status.value != ConnectionStatus.online,
        child: Container(
          padding: const EdgeInsets.all(16),
          height: 50,
          color: Color(0xFF11253c), //0xFF454d5a //0xFFffc797
          child: Row(
            children: [
              const Icon(
                Icons.wifi_off,
                color: Colors.white,
              ),
              const SizedBox(width: 15),
              const Text(
                'Sin conexion a internet.',
                style: TextStyle(color: Colors.white),
              ),
            ],
          ),
        ),
      );
    });
  }
}
