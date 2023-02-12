import 'package:flutter/material.dart';

import '../services/firebase_service.dart';
// import 'package:crud/services/firebase_service.dart';

class EditNamePage extends StatefulWidget {
  const EditNamePage({super.key});
  @override
  State<EditNamePage> createState() => _EditNamePageState();
}

class _EditNamePageState extends State<EditNamePage> {
  TextEditingController nameController = TextEditingController(text: "");
  TextEditingController edadController = TextEditingController(text: "");


  @override
  Widget build(BuildContext context) {
    Map arguments = ModalRoute.of(context)?.settings.arguments as Map;
    nameController.text = arguments['name'];
    edadController.text = arguments['edad'];


    return Scaffold(
      appBar: AppBar(
        title: const Text('Editar producto'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(15.0),
        child: Column(
          children: [
            TextField(
              controller: nameController,
              decoration: const InputDecoration(
                hintText: 'Actualice el nombre del producto',
              ),
            ),
            TextField(
              controller: edadController,
              decoration: const InputDecoration(
                hintText: 'Actualice el precio del producto',
              ),
            ),
            
            ElevatedButton(
                onPressed: () async {
                  await updatePeople(arguments['uid'], nameController.text, edadController.text)
                      .then((_) {
                    Navigator.pop(context);
                  });
                },
                child: const Text("Actualizar Producto"))
          ],
        ),
      ),
    );
  }
}
