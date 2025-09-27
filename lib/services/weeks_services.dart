import 'package:box_controller/models/Week.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class WeeksServices {
  final String weekCollection = "weeks";
  final FirebaseFirestore _firestore = FirebaseFirestore.instance;

  Future<String>  saveWeeks(Weeks weeks ) async{
    DocumentReference docfr = await  _firestore.collection(weekCollection).add(weeks.tomap());

    return docfr.id; 
    
  }

}
