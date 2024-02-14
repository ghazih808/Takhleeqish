import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_slidable/flutter_slidable.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:get/get_navigation/src/snackbar/snackbar.dart';

import '../../../../Admin/throughDashboard/adminAuction/approveOrRejectAuction.dart';
import '../../../../Artist/artistPersonal/artist_authentication.dart';
import '../../../../Artist/artistPersonal/artist_repository.dart';
import '../../../../Artist/auction/auctionController.dart';
import '../../../../Artist/auction/auctionModel.dart';
import '../../../../Artist/auction/auctionRepository.dart';

class ApprovedBidPage extends StatefulWidget{
  final String url;
  final String baseBid;
  final String name;
  final TimeOfDay enTime;
  final String email;
  final DateTime date;
  final TimeOfDay stTime;



  ApprovedBidPage(
      this.url, this.baseBid,this.enTime,this.stTime,this.date, this.email, this.name);
  @override
  State<ApprovedBidPage> createState() => _ApprovedBidPageState();
}

class _ApprovedBidPageState extends State<ApprovedBidPage> {
  TextEditingController bid=TextEditingController();

  final auctionRepo=Get.put(Auction_Repo());

  final FirebaseAuth _auth=FirebaseAuth.instance;
  final formkey=GlobalKey<FormState>();
  final controller=Get.put(Auction_Controller());

  @override
  Widget build(BuildContext context) {
    double screenHeight=MediaQuery.of(context).size.height;

    return Scaffold(
      body: FutureBuilder(
        future: getData(),
        builder: (context, snapshot) {

          if (snapshot.connectionState == ConnectionState.done) {
            if (snapshot.hasData) {
              String bidAmount=snapshot.data!.bid;
              return SingleChildScrollView(
                child: Stack(
                  children: [
                    Container(
                      width: double.infinity,
                      height: 880,
                      child: Image.asset("assests/images/dbpic2.jpeg"
                        ,fit: BoxFit.fitHeight,),
                      //add background image here
                    ),
                    Container(
                      child: Column(
                        children: [
                          SizedBox(height: screenHeight*0.1,),
                          Center(
                            child: Container(
                              width: 300,
                              height: 300,
                              child: Image.network(widget.url),
                            ),
                          ),
                          SizedBox(
                            height:screenHeight*0.04,
                          ),
                          Text("Base Bid",style: TextStyle(fontSize: 20,fontWeight: FontWeight.bold),),
                          Text("RS ${widget.baseBid}",style: TextStyle(fontSize: 20,fontWeight: FontWeight.w400),),
                          SizedBox(
                            height:screenHeight*0.02,
                          ),
                          Text("Art Name",style: TextStyle(fontSize: 20,fontWeight: FontWeight.bold),),
                          Text(" ${widget.name}",style: TextStyle(fontSize: 20,fontWeight: FontWeight.w400),),

                          SizedBox(
                            height:screenHeight*0.02,
                          ),
                          Text("Date",style: TextStyle(fontSize: 20,fontWeight: FontWeight.bold),),
                          Text("${widget.date.month}/${widget.date.day}/${widget.date.year}",style: TextStyle(fontSize: 20,fontWeight: FontWeight.w400),),

                          SizedBox(
                            height:screenHeight*0.02,
                          ),
                          Text("Starting time",style: TextStyle(fontSize: 20,fontWeight: FontWeight.bold),),
                          Text("${_formatTime(widget.stTime)}", style: TextStyle(fontSize: 20, fontWeight: FontWeight.w400),),                    SizedBox(
                            height:screenHeight*0.02,
                          ),
                          Text("Ending Time",style: TextStyle(fontSize: 20,fontWeight: FontWeight.bold),),
                          Text("${_formatTime(widget.enTime)}", style: TextStyle(fontSize: 20, fontWeight: FontWeight.w400),),

                          SizedBox(
                      height:screenHeight*0.02,
                    ),
                          Container(
                            width: 300,
                            height: 50,
                            child: TextFormField(
                              controller: controller.Art_bid,
                              keyboardType: TextInputType.number,
                              validator: (value) {
                                if(value!.isEmpty)
                                {
                                  return 'Enter correct Email';
                                }
                                else {
                                  int result=value!.compareTo(bidAmount);
                                  if( result<0)
                                    {
                                      controller.Art_bid.text = value;
                                    }
                                  else{
                                    Get.snackbar("Attention", "Bid amount amount should be higher then the current amount.",
                                        snackPosition:SnackPosition.BOTTOM,
                                        backgroundColor: Colors.red.withOpacity(0.1),
                                        colorText: Colors.black);
                                  }

                                }
                              },
                              decoration: InputDecoration(
                                focusedBorder: OutlineInputBorder(
                                    borderRadius: BorderRadius.circular(15.0),
                                    borderSide: BorderSide(
                                      width: 2,
                                      color: Color(0xfff77062),
                                    )

                                ),
                                enabledBorder: OutlineInputBorder(
                                    borderRadius: BorderRadius.circular(15.0),
                                    borderSide: BorderSide(
                                      color: Colors.blue,
                                    )
                                ),
                                prefixIcon: Padding(
                                  padding: const EdgeInsets.only(left: 12.0,top: 10.0),
                                  child: Container(child: FaIcon(FontAwesomeIcons.idBadge,color: Colors.black,)),
                                ),
                                label:Text("Enter Artist Email") ,
                              ),

                            ),
                          ),
                          SizedBox(
                            height:screenHeight*0.02,
                          ),
                          Container(
                            width: 200,
                            height: 50,
                            child: ElevatedButton(onPressed:()  {
                              //add Maps here
                            }, child:Row(
                              children: [
                                FaIcon(FontAwesomeIcons.check,color: Colors.white,),
                                SizedBox(width: 35,),
                                Text("Enter",style: TextStyle(color: Colors.white,fontWeight: FontWeight.w800,fontSize: 20),),
                              ],
                            ),

                              style: ElevatedButton.styleFrom(
                                  backgroundColor: Colors.green,
                                  shape: RoundedRectangleBorder(
                                      borderRadius: BorderRadius.circular(15.0)
                                  )
                              ),
                            ),
                          )
                        ],
                      ),
                    )
                  ],
                ),
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
  Future<Auction_model> getData() async {
    return await auctionRepo.getPesronsalAuctionStatus(widget.name);
  }
  String _formatTime(TimeOfDay timeOfDay) {
    // Convert 24-hour format to 12-hour format
    int hour = timeOfDay.hourOfPeriod;
    int minute = timeOfDay.minute;
    String period = timeOfDay.period == DayPeriod.am ? 'AM' : 'PM';

    // Format the time as HH:MM AM/PM
    return '${_formatHour(hour)}:${_formatMinute(minute)} $period';
  }

  String _formatHour(int hour) {
    // Ensure hour is in 12-hour format
    if (hour == 0) {
      return '12'; // 0 is 12 AM in 12-hour format
    } else if (hour > 12) {
      return '${hour - 12}';
    } else {
      return '$hour';
    }
  }

  String _formatMinute(int minute) {
    // Add leading zero if minute is less than 10
    return minute < 10 ? '0$minute' : '$minute';
  }
}