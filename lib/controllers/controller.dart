import 'package:flutter/material.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:get/get.dart';
import 'package:validador_rut/services/dio.dart';

class Controller extends GetxController {
  TextEditingController rutcontroller = TextEditingController();
  String baseUrl = 'https://api.libreapi.cl/rut/validate';

  getResponse() async {
    Map<String, dynamic> queryParemeters = {
      'rut': rutcontroller.text,
    };

    await ApiGlobal().getHttp(baseUrl, queryParemeters).catchError((error) async {
      // print(error);
      if (error.response.statusCode == 400) {
        EasyLoading.showError('El rut entregado no es valido', duration: const Duration(seconds: 1));
      } else if (error.response == null) {
        EasyLoading.showError('No hay conexion a Internet');
      }
    }).then((value) {
      if (value == true) {
        // print('true');
        EasyLoading.showSuccess('RUT VALIDO', duration: const Duration(seconds: 3));
      }
      if (value == false) {
        // print('false');
        EasyLoading.showError('RUT INVALIDO', maskType: EasyLoadingMaskType.black, duration: const Duration(seconds: 3));
      }
    });
  }
}
