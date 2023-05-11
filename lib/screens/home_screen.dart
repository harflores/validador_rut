import 'package:flutter/material.dart';
import 'package:validador_rut/controllers/controller.dart';

class HomeScreen extends StatelessWidget {
  HomeScreen({super.key});

  Controller controller = Controller();

  final GlobalKey<FormState> formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        actions: [
          Padding(
            padding: const EdgeInsets.all(10.0),
            child: IconButton(
                onPressed: () {
                  Navigator.pushNamed(context, 'nosotros');
                },
                icon: const Icon(Icons.developer_board)),
          )
        ],
        title: const Text('Validador de Rut'),
        backgroundColor: Colors.indigo,
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(vertical: 50, horizontal: 30),
        child: Form(
          key: formKey,
          child: Center(
            child: Column(
              children: [
                const Icon(
                  Icons.fingerprint_outlined,
                  size: 100,
                ),
                const Divider(),
                const Text(
                  'Número de RUT con dígito verificador \n, con o sin guiónes o separadores ',
                  textAlign: TextAlign.center,
                ),
                const Divider(),
                TextFormField(
                  validator: (value) {
                    if (controller.rutcontroller.text.isEmpty) {
                      return 'Debe ingresar rut';
                    }
                    return null;
                  },
                  decoration: InputDecoration(border: OutlineInputBorder(borderRadius: BorderRadius.circular(50)), labelText: 'Rut'),
                  keyboardType: TextInputType.number,
                  textAlign: TextAlign.center,
                  controller: controller.rutcontroller,
                ),
                const Divider(),
                ElevatedButton(
                    style: const ButtonStyle(backgroundColor: MaterialStatePropertyAll(Colors.indigo), minimumSize: MaterialStatePropertyAll(Size(200, 50))),
                    onPressed: () async {
                      if (formKey.currentState!.validate()) {
                        controller.getResponse();
                        FocusManager.instance.primaryFocus!.unfocus();
                      }
                    },
                    child: const Text("Revisar")),
                const SizedBox(
                  height: 50,
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

class MessageWidget extends StatefulWidget {
  final Color color;
  final String message;
  MessageWidget({
    super.key,
    required this.color,
    required this.message,
  });

  @override
  State<MessageWidget> createState() => _MessageWidgetState();
}

class _MessageWidgetState extends State<MessageWidget> {
  Controller controller = Controller();

  @override
  Widget build(BuildContext context) {
    return Text(
      widget.message,
      style: TextStyle(color: widget.color, fontSize: 30),
    );
  }
}
