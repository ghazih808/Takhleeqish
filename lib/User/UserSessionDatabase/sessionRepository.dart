import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:get/get_state_manager/get_state_manager.dart';
import 'package:takhleekish/User/UserSessionDatabase/sessionModel.dart';

class Session_UserRepo extends GetxController
{
  static Session_UserRepo get instance=> Get.find();
  final session_db= FirebaseFirestore.instance;


  createSession(Session_User_Model session_Model)
  async {
    await session_db.collection("user_Session")
        .add(session_Model.toJson())
        .whenComplete(() =>
        Get.snackbar("Congratulations", "Session request has been added.",
            snackPosition: SnackPosition.BOTTOM,
            backgroundColor: Colors.green.withOpacity(0.1),
            colorText: Colors.white),
    ).catchError((error, stackTrace) {
      Get.snackbar("Error", "Something went wrong. Try again",
          snackPosition: SnackPosition.BOTTOM,
          backgroundColor: Colors.redAccent.withOpacity(0.1),
          colorText: Colors.red);
      print(error.toString());
    });
  }

  Future<List<Session_User_Model>>getPesronsalAuctionStatus(String artName) async
  {
    final snapshot=await session_db.collection("user_Session").where("Title",isEqualTo: artName).get();
    final auctionStatus=snapshot.docs.map((e) => Session_User_Model.fromSnapshot(e)).toList();
    return auctionStatus;
  }
  Future<Session_User_Model>getPesronsalAuction(String artName) async
  {
    final snapshot=await session_db.collection("user_Session").where("Name",isEqualTo: artName).get();
    final auctionStatus=snapshot.docs.map((e) => Session_User_Model.fromSnapshot(e)).single;
    return auctionStatus;
  }
  Future<List<Session_User_Model>> getAllAuctionDetail() async
  {
    final snapshot=await session_db.collection("user_Session").get();
    final artifactData=snapshot.docs.map((e) => Session_User_Model.fromSnapshot(e)).toList();
    return artifactData;
  }


}