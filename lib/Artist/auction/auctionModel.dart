
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';

class Auction_model{
  final String? id;
  final String ArtistId;
  final String artName;
  final String bid;
  final String startingTime;
  final String startingDate;
  final String endingTime;
  final String endingDate;
  final String url;
  final bool flag;
  const Auction_model(
      {
        this.id,
        required this.artName,
        required this.ArtistId,
        required this.bid,
        required this.startingTime,
        required this.endingTime,
        required this.startingDate,
        required this.endingDate,
        required this.url,
        required this.flag,
      });
  toJson(){
    return{
      'Name':artName,
      'Starting_Time':startingTime,
      'Starting_Date':startingDate,
      'Bid':bid,
      'Ending_Time':endingTime,
      'Ending_Date':endingDate,
      'Artist_ID':ArtistId,
      'Url':url,
      'Flag':flag
    };}

  factory Auction_model.fromSnapshot(DocumentSnapshot<Map<String,dynamic>> documentSnapshot)
  {
    final data=documentSnapshot.data()!;
    return Auction_model(
      id: documentSnapshot.id,
      artName: data["Name"], startingTime: data["Starting_Time"], bid: data["Bid"], endingTime: data["Ending_Time"], ArtistId: data["Artist_ID"], url: data['Url'], startingDate: data["Starting_Date"], endingDate: data["Ending_Date"], flag: data["Flag"],);
  }


}