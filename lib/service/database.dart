import 'package:cloud_firestore/cloud_firestore.dart';

class DatabaseMethods {
  Future AddStudent(Map<String, dynamic> StudentInfomap, String id) async {
    return await FirebaseFirestore.instance
        .collection('Students')
        .doc(id)
        .set(StudentInfomap);
  }

  Future<Stream<QuerySnapshot>> getStudents() async {
    return await FirebaseFirestore.instance.collection('Students').snapshots();
  }

  updateAttendance(String attendancecase, String id) async {
    return await FirebaseFirestore.instance
        .collection('Students')
        .doc(id)
        .update({attendancecase: true});
  }

  deleteStudent(String id) async {
    return await FirebaseFirestore.instance
        .collection('Students')
        .doc(id)
        .delete();
  }
}
