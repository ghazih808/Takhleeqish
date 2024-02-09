import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:takhleekish/Artist/auction/auctionModel.dart';

class Auction_Repo extends GetxController{
  static Auction_Repo get instance=> Get.find();
  final auction_db= FirebaseFirestore.instance;

  createAuction(Auction_model auction_model)
  async {
    await auction_db.collection("Auction").add(auction_model.toJson()).whenComplete(() => Get.snackbar("Congratulations", "Auction request has been added.",
        snackPosition:SnackPosition.BOTTOM,
        backgroundColor: Colors.green.withOpacity(0.1),
        colorText: Colors.white),
    ).catchError((error,stackTrace){
      Get.snackbar("Error", "Something went wrong. Try again",
          snackPosition:SnackPosition.BOTTOM,
          backgroundColor: Colors.redAccent.withOpacity(0.1),
          colorText: Colors.red);
      print(error.toString());
    });
  }
  Future<void> updateAuctionStatus(String auctionName, String newStatus) async {
    try {
      // Reference the specific document in the Firestore collection
      DocumentReference auctionRef = auction_db.collection("Auction").doc(auctionName);

      // Update only the status field of the document
      await auctionRef.update({'Status': newStatus});

    } catch (error) {
      // Handle errors

      print("Error updating auction status: $error");
    }
  }

  Future<List<Auction_model>>getPesronsalAuctionStatus(String ArtistId) async
  {
    final snapshot=await auction_db.collection("Auction").where("Artist_ID",isEqualTo: ArtistId).get();
    final auctionStatus=snapshot.docs.map((e) => Auction_model.fromSnapshot(e)).toList();
    return auctionStatus;
  }

  Future<List<Auction_model>> getAllAuctionDetail() async
  {
    final snapshot=await auction_db.collection("Auction").get();
    final artifactData=snapshot.docs.map((e) => Auction_model.fromSnapshot(e)).toList();
    return artifactData;
  }
}