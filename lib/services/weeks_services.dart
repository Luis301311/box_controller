import 'package:box_controller/models/Day.dart';
import 'package:box_controller/models/Week.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class WeeksServices {
  final String weekCollection = "weeks";
  final FirebaseFirestore _firestore = FirebaseFirestore.instance;


  Future<List<Weeks>> getAllWeeks() async{
    QuerySnapshot  snapshot = await _firestore.collection(weekCollection).get(); 
    return snapshot.docs.map((doc) => Weeks.fromMap(doc.data() as Map<String, dynamic> )).toList(); 
  }

  Future<String> saveWeeks(Weeks weeks) async {
    final docRef = _firestore
        .collection(weekCollection)
        .doc(weeks.startDate.toIso8601String());

    await docRef.set(weeks.tomap());
    return docRef.id;
  }


  Future<void> updateDay(String weekId, Day day) async {
    final doc = _firestore.collection(weekCollection).doc(weekId).collection("days").doc(day.date.toIso8601String());

    await doc.set(day.tomap(), SetOptions(merge: true));
  }

/*   Future<void> updateWeek(Weeks week) async {
  await FirebaseFirestore.instance
      .collection(weekCollection)
      .doc(week.startDate.toIso8601String())
      .set(week.tomap(), SetOptions(merge: true));
  } */

}
