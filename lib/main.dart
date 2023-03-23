// ignore_for_file: avoid_print

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:getx_intro/value_controller.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: HomePage(key),
    );
  }
}

class HomePage extends StatelessWidget {
  HomePage(Key? key) : super(key: key);

  final textController = TextEditingController();
  final valueController = ValueController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            //Valor
            GetBuilder<ValueController>(
              init: valueController,
              builder: (ctrl) {
                return Text('Valor definido ${ctrl.definedValue}');
              },
            ),

            //Campo
            TextField(
              controller: textController,
            ),
            //Botão
            GetBuilder<ValueController>(
                init: valueController,
                builder: (ctrl) {
                  return ctrl.isLoading
                      ? const CircularProgressIndicator()
                      : ElevatedButton(
                          onPressed: () {
                            String value = textController.text;
                            valueController.setValue(value);
                          },
                          child: const Text('Confirmar'),
                        );
                })
          ],
        ),
      ),
    );
  }
}
