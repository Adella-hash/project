import 'package:cloud_firestore/cloud_firestore.dart';

class DBService {
  final FirebaseFirestore _firestore = FirebaseFirestore.instance;

  Future<void> addUser(String uid, Map<String, dynamic> data) async {
    try {
      await _firestore.collection('users').doc(uid).set(data);
    } catch (e) {
      throw Exception('Ошибка добавления пользователя: $e');
    }
  }

  Future<DocumentSnapshot> getUser(String uid) async {
    try {
      return await _firestore.collection('users').doc(uid).get();
    } catch (e) {
      throw Exception('Ошибка получения данных пользователя: $e');
    }
  }

  Stream<QuerySnapshot> getCafes() {
    return _firestore.collection('cafes').snapshots();
  }
}
