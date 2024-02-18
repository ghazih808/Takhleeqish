import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_slidable/flutter_slidable.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:takhleekish/Admin/adminDashboard/dashboard.dart';
import 'package:takhleekish/Admin/throughDashboard/adminAuction/approveOrRejectAuction.dart';

import '../../../Artist/artistPersonal/artist_authentication.dart';
import '../../../Artist/artistPersonal/artist_repository.dart';
import '../../../Artist/auction/auctionController.dart';
import '../../../Artist/auction/auctionModel.dart';
import '../../../Artist/auction/auctionRepository.dart';
import '../../../Artist/controllers/artist_controller.dart';

class AdminAuctionPage extends StatelessWidget{
  final controller = Get.put(Artist_Controller());
  final auctionController=Get.put(Auction_Controller());

  final authrepo = Get.put(Artist_Auth());

  final artistRepo = Get.put(Artist_repo());
  final auctionRepo=Get.put(Auction_Repo());
  late final String stime;
  late final String etime;
  final FirebaseAuth _auth=FirebaseAuth.instance;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: FutureBuilder(
        future: getAllData(),
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.done) {
            if (snapshot.hasData) {
              print(snapshot.data!.length);
              return Stack(
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
                            itemCount: snapshot.data!.length, // Number of exhibitions (fetch from the database)
                            itemBuilder: (context, index) {
                              print(snapshot.data![index].checkAuc);
                              print(index);
                              if(snapshot.data![index].checkAuc=="false")
                                {
                                  return Slidable(
                                    actionPane: SlidableDrawerActionPane(),
                                    actionExtentRatio: 0.25,
                                    child: Container(
                                      decoration: BoxDecoration(
                                          color: Colors.white,
                                          borderRadius: BorderRadius.circular(15.0)
                                      ),
                                      child: Material(
                                        child: ListTile(
                                          leading: ClipOval(child: Image.network(snapshot.data![index].url)),
                                          title: Text('Painting: ${snapshot.data![index].artName}'),
                                          subtitle: Column(
                                            children: [
                                              SizedBox(height: 10,),
                                              Row(children: [
                                                Container(
                                                  width: 70,
                                                  height: 25,
                                                  child: Center(
                                                    child: ElevatedButton(onPressed:()  async {
                                                      var docid=snapshot.data![index].id;
                                                      await FirebaseFirestore.instance.collection("Auction").doc(docid)
                                                          .update(
                                                          {
                                                            'Status':"approved",
                                                            'Check':"true"
                                                          }
                                                      ).whenComplete(() {
                                                        Get.snackbar("Congratulations", "Auction request has been approved.",
                                                            snackPosition:SnackPosition.BOTTOM,
                                                            backgroundColor: Colors.green.withOpacity(0.1),
                                                            colorText: Colors.white);
                                                        Navigator.push(context, MaterialPageRoute(builder: (context)=>AdminDashboard()));

                                                      }
                                                      ).catchError((error,stackTrace){
                                                        Get.snackbar("Error", "Something went wrong. Try again",
                                                            snackPosition:SnackPosition.BOTTOM,
                                                            backgroundColor: Colors.redAccent.withOpacity(0.1),
                                                            colorText: Colors.red);
                                                        print(error.toString());});

                                                    }, child:Center(child: Center(child: FaIcon(FontAwesomeIcons.check,color: Colors.white,))),
                                                      style: ElevatedButton.styleFrom(
                                                          backgroundColor: Colors.green,
                                                          shape: RoundedRectangleBorder(
                                                              borderRadius: BorderRadius.circular(15.0)
                                                          )
                                                      ),
                                                    ),
                                                  ),
                                                ),SizedBox(width: 10,),
                                                Container(
                                                  width: 70,
                                                  height: 23,
                                                  child: Center(
                                                    child: ElevatedButton(onPressed:()  async {
                                                      var docid=snapshot.data![index].id;
                                                      await FirebaseFirestore.instance.collection("Auction").doc(docid)
                                                          .update(
                                                          {
                                                            'Status':"rejected",
                                                            'Check':"true"
                                                          }
                                                      ).whenComplete(() {
                                                        Get.snackbar("Congratulations", "Auction request has been rejected.",
                                                            snackPosition:SnackPosition.BOTTOM,
                                                            backgroundColor: Colors.green.withOpacity(0.1),
                                                            colorText: Colors.white);
                                                        Navigator.push(context, MaterialPageRoute(builder: (context)=>AdminDashboard()));

                                                      }

                                                      ).catchError((error,stackTrace){
                                                        Get.snackbar("Error", "Something went wrong. Try again",
                                                            snackPosition:SnackPosition.BOTTOM,
                                                            backgroundColor: Colors.redAccent.withOpacity(0.1),
                                                            colorText: Colors.red);
                                                        print(error.toString());});
                                                    }, child:Center(child: Center(child: FaIcon(FontAwesomeIcons.x,color: Colors.white,))),

                                                      style: ElevatedButton.styleFrom(
                                                          backgroundColor: Colors.red,
                                                          shape: RoundedRectangleBorder(
                                                              borderRadius: BorderRadius.circular(15.0)
                                                          )
                                                      ),
                                                    ),
                                                  ),
                                                ),],),
                                            ],
                                          ),
                                          trailing: Text("Check Details"),
                                          onTap: () {

                                            DateTime date=DateTime.parse(snapshot.data![index].auctionDate);
                                            print(date);

                                            String startingTimeString = snapshot.data![index].startingTime;
                                            String sttimeSubstring = startingTimeString.substring(startingTimeString.indexOf("(") + 1, startingTimeString.indexOf(")"));
                                            List<String> sttimeParts = sttimeSubstring.split(':');

                                            String endingTimeString = snapshot.data![index].endingTime;
                                            // Extract the substring containing the time (e.g., "14:10")
                                            String endtimeSubstring = endingTimeString.substring(endingTimeString.indexOf("(") + 1, endingTimeString.indexOf(")"));

                                            List<String> endtimeParts = endtimeSubstring.split(':');
                                            if (endtimeParts.length == 2 && sttimeParts.length==2 ) {
                                              // Parse the hours and minutes into integers
                                              int endhours = int.tryParse(endtimeParts[0]) ?? 0; // Use 0 as default if parsing fails
                                              int endminutes = int.tryParse(endtimeParts[1]) ?? 0; // Use 0 as default if parsing fails
                                              // Create a TimeOfDay object
                                              TimeOfDay endingTime = TimeOfDay(hour: endhours, minute: endminutes);
                                              // Parse the hours and minutes into integers
                                              int sthours = int.tryParse(sttimeParts[0]) ?? 0; // Use 0 as default if parsing fails
                                              int stminutes = int.tryParse(sttimeParts[1]) ?? 0; // Use 0 as default if parsing fails
                                              TimeOfDay startingTime = TimeOfDay(hour: sthours, minute: stminutes);

                                              print(startingTime);
                                              Navigator.push(context, MaterialPageRoute(builder: (context)=>
                                                  ApproveOrRejectAuction(snapshot.data![index].url,snapshot.data![index].bid,
                                                      endingTime,startingTime,date,
                                                      snapshot.data![index].ArtistId)));

                                            } else {
                                              // Handle the case where the time string is not in the expected format
                                              print('Invalid time format');
                                            }
                                          },
                                        ),
                                      ),
                                    ),
                                  );
                                }
                              else{
                                return Container();
                              }

                            }, separatorBuilder: (BuildContext context, int index) {

                              return const Divider(); },
                          ),
                        ),

                      ],
                    ),
                  ) ,
                ],
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
  Future<List<Auction_model>> getAllData() async {
    return await auctionRepo.getAllAuctionDetail();
  }
}