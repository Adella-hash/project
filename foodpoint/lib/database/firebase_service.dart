import 'package:cloud_firestore/cloud_firestore.dart';

class FirebaseService {
  final FirebaseFirestore _firestore = FirebaseFirestore.instance;

  // Добавление данных в коллекцию
  Future<void> addData(String collection, Map<String, dynamic> data) async {
    try {
      await _firestore.collection(collection).add(data);
      print("Data added to $collection");
    } catch (e) {
      print("Error adding data: $e");
    }
  }

  // Получение всех документов из коллекции
  Stream<List<Map<String, dynamic>>> getData(String collection) {
    return _firestore.collection(collection).snapshots().map((snapshot) {
      return snapshot.docs.map((doc) => doc.data()).toList();
    });
  }

  // Обновление данных в документе
  Future<void> updateData(String collection, String docId, Map<String, dynamic> data) async {
    try {
      await _firestore.collection(collection).doc(docId).update(data);
      print("Data updated in $collection/$docId");
    } catch (e) {
      print("Error updating data: $e");
    }
  }

  // Удаление документа из коллекции
  Future<void> deleteData(String collection, String docId) async {
    try {
      await _firestore.collection(collection).doc(docId).delete();
      print("Data deleted from $collection/$docId");
    } catch (e) {
      print("Error deleting data: $e");
    }
  }
}
