import 'package:cloud_firestore/cloud_firestore.dart';

FirebaseFirestore db = FirebaseFirestore.instance;

Future<List> getPeople() async {
  List people = [];
  QuerySnapshot querySnapshot = await db.collection('agenda').get();
  for (var doc in querySnapshot.docs) {
    Map<String, dynamic> data = doc.data()! as Map<String, dynamic>;
    Map person = {
      "name": data["name"],
      "edad": data["edad"],
      "parentesco": data["parentesco"],
      "telefono": data["telefono"],
      "uid": doc.id,
    };

    people.add(person);
  }
  return people;
}

// Guardar un name en base de datos
Future<void> addPeople(String name, String edad, String parentesco, String telefono) async {
  // Future<void> addPeople(String name, String edad,) async {
    // await db.collection("agenda").add({"name": name, "edad": edad});
  await db.collection("agenda").add({"name": name, "edad": edad, "parentesco": parentesco, "telefono": telefono });
}

// Actualizar un name en base de datos
Future<void> updatePeople(String uid, String name, String edad) async {
  await db.collection("agenda").doc(uid).set({"name": name, "edad":edad});
}

// Borrar datos de Firebase
Future<void> deletePeople(String uid) async {
  await db.collection("agenda").doc(uid).delete();
}
