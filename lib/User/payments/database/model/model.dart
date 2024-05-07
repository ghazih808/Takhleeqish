import 'package:cloud_firestore/cloud_firestore.dart';

class Payment_model{
  final String? id;
  final String ArtistId;
  final String reciept;
  final String bill;
  final String status;
  const Payment_model(
      {
        this.id,
        required this.ArtistId,
        required this.bill,
        required this.reciept,
        required this.status,
      });
  toJson(){
    return{
      'Bill':bill,
      'Reciept':reciept,
      'status':status,
      'Artist_ID':ArtistId,
    };}

  factory Payment_model.fromSnapshot(DocumentSnapshot<Map<String,dynamic>> documentSnapshot)
  {
    final data=documentSnapshot.data()!;
    return Payment_model(
      id: documentSnapshot.id,
       ArtistId: data["Artist_ID"]
      ,  bill:data["Bill"], reciept: data["Reciept"], status: data["status"],
    );
  }


}