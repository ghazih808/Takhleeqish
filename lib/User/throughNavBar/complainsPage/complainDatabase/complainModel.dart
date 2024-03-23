import 'package:cloud_firestore/cloud_firestore.dart';

class ComplainModel
{
  final String? id;
  final String complain;
  final String userEmail;

  ComplainModel({ this.id, required this.complain,required this.userEmail});
  toJson(){
    return{
      'User_Email':userEmail,
      'Complain':complain,
    };}
  factory ComplainModel.fromSnapshot(DocumentSnapshot<Map<String,dynamic>> documentSnapshot)
  {
    final data=documentSnapshot.data()!;
    return ComplainModel(
        id: documentSnapshot.id,complain: data["Complain"], userEmail: data["User_Email"],

    );
  }

  }
