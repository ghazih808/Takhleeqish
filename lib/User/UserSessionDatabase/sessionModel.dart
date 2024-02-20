import 'package:cloud_firestore/cloud_firestore.dart';

class Session_User_Model
{
  final String? id;
  final String Title;
  final String artistEmail;
  final String userEmail;
  final String startingTime;
  final String sessionDate;

  Session_User_Model(
      {this.id, required this.Title,
    required this.artistEmail,
        required this.userEmail, required this.startingTime,
        required this.sessionDate});

  toJson(){
    return{
      'Title':Title,
      'Starting_Time':startingTime,
      'Session_Date':sessionDate,
      'User_Email':userEmail,
      'Artist_Email':artistEmail,

    };}

  factory Session_User_Model.fromSnapshot(DocumentSnapshot<Map<String,dynamic>> documentSnapshot)
  {
    final data=documentSnapshot.data()!;
    return Session_User_Model(
      id: documentSnapshot.id,
      Title: data["Title"], artistEmail:data["artistEmail"],
    userEmail:data["userEmail"], startingTime:data["Starting_Time"],
    sessionDate:data["Session_Date"],);

  }


}

