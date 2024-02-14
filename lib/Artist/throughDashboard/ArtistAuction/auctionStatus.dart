import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_slidable/flutter_slidable.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:takhleekish/Artist/auction/auctionModel.dart';
import 'package:takhleekish/Artist/auction/auctionRepository.dart';

import '../../Navbar/navbar.dart';
import '../../artistPersonal/artist_authentication.dart';
import '../../artistPersonal/artist_model.dart';
import '../../artistPersonal/artist_repository.dart';
import '../../controllers/artist_controller.dart';

class AuctionStatus extends StatelessWidget{
  final controller = Get.put(Artist_Controller());

  final authrepo = Get.put(Artist_Auth());

  final artistRepo = Get.put(Artist_repo());
  final auctionRepo=Get.put(Auction_Repo());
  final FirebaseAuth _auth=FirebaseAuth.instance;
  var email;
  @override
  Widget build(BuildContext context) {

    return Scaffold(
        drawer: Navbar(),
        appBar: AppBar(
          title: const Text("Auction Status", style: TextStyle(color: Colors.white, fontWeight: FontWeight.w600, fontSize: 30)),
          centerTitle: true,
          backgroundColor: Colors.black,
        ),
        body: FutureBuilder(
        future: getData(),
    builder: (context, snapshot) {
    if (snapshot.connectionState == ConnectionState.done) {
    if (snapshot.hasData) {
    Artist_model artistModel = snapshot.data!;
    email=snapshot.data!.email;
    return FutureBuilder(
      future: getAllData(),
      builder: (context, snapshot) {
        if (snapshot.connectionState == ConnectionState.done) {
          if (snapshot.hasData) {
            return Scaffold(
                body:Stack(
                  children: [
                    Container(
                      width: double.infinity,
                      height: 880,
                      child: Image.asset("assests/images/dbpic2.jpeg"
                        ,fit: BoxFit.fitHeight,),
                      //add background image here
                    ),
                    Padding(
                      padding: const EdgeInsets.all(16.0),
                      child: Column(
                        children: [
                          Expanded(
                            child: ListView.separated(
                              itemCount: snapshot.data!.length, // Number of auction (fetch from the database)
                              itemBuilder: (context, index) {
                                return Slidable(
                                  actionPane: SlidableDrawerActionPane(),
                                  actionExtentRatio: 0.25,
                                  child: Container(
                                    decoration: BoxDecoration(
                                        color: Colors.white,
                                        borderRadius: BorderRadius.circular(15.0)
                                    ),
                                    child: ListTile(
                                      leading: ClipOval(child:Image.network(snapshot.data![index].url)),
                                      title: Text('Auction ${index + 1}'),
                                      subtitle: Text("Painting Name:  ${snapshot.data![index].artName}"),
                                        trailing: Text(
                                          snapshot.data![index].status == 'none'
                                              ? 'Pending'
                                              : snapshot.data![index].status == 'approved'
                                              ? 'Approved'
                                              : snapshot.data![index].status == 'rejected'
                                              ? 'Rejected'
                                              : 'Unknown', // Handle any other status here
                                        ),
                                      onTap: () {
                                      },
                                    ),
                                  ),
                                );
                              }, separatorBuilder: (BuildContext context, int index) { return const Divider(); },
                            ),
                          ),

                        ],
                      ),
                    ) ,
                  ],
                )
            );
          } else if (snapshot.hasError) {
            return Text('User not found');
          } else {
            return Text('Something went wrong');
          }
        }
        else {
          // Return Center widget to display CircularProgressIndicator in the center
          return Center(
            child: CircularProgressIndicator(),
          );
        }
      },
    );
    } else if (snapshot.hasError) {
    return Text('User not found');
    } else {
    return Text('Something went wrong');
    }
    }
    else {
    // Return Center widget to display CircularProgressIndicator in the center
    return Center(
    child: CircularProgressIndicator(),
    );
    }
    },
    ),
    );
  }
  Future<Artist_model?> getData() async {
    final email = authrepo.firebaseUser.value?.email;
    if (email != null) {
      
      return await artistRepo.getArtistDetail(email);
    }
    return null; // Handle the case where email is null
  }
  Future<List<Auction_model>> getAllData() async {
    return await auctionRepo.getAllAuctionDetail();
  }
  }

