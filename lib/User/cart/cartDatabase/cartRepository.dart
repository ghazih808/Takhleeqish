import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'cartModel.dart';

class CartRepo extends GetxController
{
  static CartRepo get instance=> Get.find();
  final artifact_db= FirebaseFirestore.instance;

  createCart(Cart_model cartModel)
  async {
    await artifact_db.collection("Cart").add(cartModel.toJson()).whenComplete(() => Get.snackbar("Congratulations", "Artifact has been added in Cart.",
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

  Future<Cart_model> getcartDetail(String ArtistId) async
  {
    final snapshot=await artifact_db.collection("Cart").where("Artist_ID",isEqualTo: ArtistId).get();
    final cartData=snapshot.docs.map((e) => Cart_model.fromSnapshot(e)).single;
    return cartData;
  }

  Future<List<Cart_model>> getAllCartDetail() async
  {
    final snapshot=await artifact_db.collection("Cart").get();
    final cartData=snapshot.docs.map((e) => Cart_model.fromSnapshot(e)).toList();
    return cartData;
  }

}