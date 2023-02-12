import 'package:flutter/material.dart';
import 'package:crud/services/firebase_service.dart';

class AddNamePage extends StatefulWidget {
  const AddNamePage({super.key});
  @override
  State<AddNamePage> createState() => _AddNamePageState();
}

class _AddNamePageState extends State<AddNamePage> {
  TextEditingController nameController = TextEditingController(text: "" );
  TextEditingController edadController = TextEditingController(text: "" );
  TextEditingController campo3Controller = TextEditingController(text: "" );
  TextEditingController campo4Controller = TextEditingController(text: "" );


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Crear nuevo producto'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(15.0),
        child: Column(
          children: [
            TextField(
              controller: nameController,
              decoration: const InputDecoration(
                hintText: 'Ingrese el nombre del producto',

              ),
            ),
            TextField(
              controller: edadController,
              decoration: const InputDecoration(
                hintText: 'Ingrese el precio del producto',

              ),
            ),
            ElevatedButton(
                onPressed: () async {
                  await addPeople(nameController.text, edadController.text, campo3Controller.text, campo4Controller.text).then((_) {
                    Navigator.pop(context);
                  });
                },
                child: const Text("Agregar producto"))
          ],
        ),
      ),
    );
  }
}
