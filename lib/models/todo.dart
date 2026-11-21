import 'package:cloud_firestore/cloud_firestore.dart';

class Todo {
  final String id;
  final String task;
  final bool isDone;
  final Timestamp? createAt;

  Todo({
    required this.id,
    required this.task,
    required this.isDone,
    this.createAt,
  });

  //fungsi mengubah dokumen firestore jadi objek todo
  factory Todo.fromFirestore(DocumentSnapshot doc) {
    Map<String, dynamic> data = doc.data() as Map<String, dynamic>;
    return Todo(
      id: doc.id,
      task: data['task'] as String,
      isDone: data['isDone'] as bool,
      createAt: data['createAt'] as Timestamp?,
    );
  }

  //fungsi mengubah objek todo jadi dokumen firestore
  Map<String, dynamic> toMap() {
    return {
      'task': task,
      'isDone': isDone,
      'createAt': createAt ?? FieldValue.serverTimestamp(),
    };
  }
}
