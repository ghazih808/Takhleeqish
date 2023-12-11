import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:takhleekish/Artist/throughDashboard/exhibition.dart';
import 'package:takhleekish/Artist/throughDashboard/postArtifacts.dart';
import 'package:takhleekish/Artist/throughDashboard/session.dart';
import '../navbar.dart';
import 'auction.dart';
import 'checkUser/verifyGmail.dart';

class ArtistDashboard extends StatelessWidget{

  @override
  Widget build(BuildContext context) {

    return Scaffold(
    drawer: Navbar(),
          appBar:AppBar(
            title: const Text("Dashboard",style: TextStyle(color: Colors.white,fontWeight: FontWeight.w500),),
            centerTitle: true,
            backgroundColor: Colors.black,

          ),
          body: SingleChildScrollView(
            child: Center(
                child: Stack(
                  children: [
                    Container(
                      width: double.infinity,
                      height: 880,
                      child: Image.asset("assests/images/bglol.jpeg"
                          ,fit: BoxFit.fitHeight,),
                      //add background image here
                    ),
                    Column(
                      children: [
                        SizedBox(
                          height: 20,
                        ),
                         Center(
                           child: Container(
                             width: 230,
                             height: 200,
                             decoration: BoxDecoration(
                                 borderRadius: BorderRadius.circular(15.0)
                             ),
                             child: Card(
                                color: Colors.black,
                                elevation: 7,
                                shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(15.0)
                                ),
                               child: Column(
                                 children: [

                                   Container(
                                     width: 230,
                                     height: 140,
                                     child: Image.asset("assests/images/Home.jpg",fit: BoxFit.fitWidth),
                                     decoration: BoxDecoration(
                                         color: Colors.white,
                                         borderRadius: BorderRadius.circular(15.0)
                                     ),

                                   ),
                                   Container(
                                     width: 200,
                                     child: ElevatedButton(onPressed: (){
                                      Navigator.push(context, MaterialPageRoute(builder: (context)=>PostArtifact()));
                                     }, child: Text("Post",style: TextStyle(color:Colors.white),),
                                         style: ElevatedButton.styleFrom(
                                           backgroundColor: Colors.white.withOpacity(0.5),
                                           shape: RoundedRectangleBorder(
                                               borderRadius: BorderRadius.circular(15)
                                           ),)),
                                   )
                                 ],
                               ),

                              ),
                           ),
                         ),
                        SizedBox(
                          height: 20,
                        ),
                        Center(
                          child: Container(
                            width: 230,
                            height: 200,
                            child: Card(
                              color: Colors.black,
                              elevation: 7,
                              shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(15.0)
                              ),
                              child: Column(
                                children: [

                                  Container(
                                    width: 230,
                                    height: 140,
                                    child: Image.asset("assests/images/gallery.jpg",fit: BoxFit.fitWidth),

                                  ),
                                  Container(
                                    width: 200,
                                    child: ElevatedButton(onPressed: (){
                                      Navigator.push(context, MaterialPageRoute(builder: (context)=>ExhibitionAnnouncementPage()));
                                    }, child: Text("Exhibition",style: TextStyle(color:Colors.white),),
                                        style: ElevatedButton.styleFrom(
                                          backgroundColor: Colors.white.withOpacity(0.5),
                                          shape: RoundedRectangleBorder(
                                              borderRadius: BorderRadius.circular(15)
                                          ),)),
                                  )
                                ],
                              ),

                            ),
                          ),
                        ),
                        SizedBox(
                          height: 20,
                        ),
                        Center(
                          child: Container(
                            width: 230,
                            height: 200,
                            child: Card(
                              color: Colors.black,
                              elevation: 7,
                              shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(15.0)
                              ),
                              child: Column(
                                children: [

                                  Container(
                                    width: 230,
                                    height: 140,
                                    child: Image.asset("assests/images/auction.jpg",fit: BoxFit.fitWidth),

                                  ),
                                  Container(
                                    width: 200,
                                    child: ElevatedButton(onPressed: (){
                                      Navigator.push(context, MaterialPageRoute(builder: (context)=>AuctionPage()));
                                    }, child: Text("Auction",style: TextStyle(color:Colors.white),),
                                        style: ElevatedButton.styleFrom(
                                          backgroundColor: Colors.white.withOpacity(0.5),
                                          shape: RoundedRectangleBorder(
                                              borderRadius: BorderRadius.circular(15)
                                          ),)),
                                  )
                                ],
                              ),

                            ),
                          ),
                        ),
                        SizedBox(
                          height: 20,
                        ),
                        Center(
                          child: Container(
                            width: 230,
                            height: 200,
                            child: Card(
                              color: Colors.black,
                              elevation: 7,
                              shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(15.0)
                              ),
                              child: Column(
                                children: [

                                  Container(
                                    width: 230,
                                    height: 140,
                                    child: Image.asset("assests/images/sessions.jpg",fit: BoxFit.fitWidth),

                                  ),
                                  Container(
                                    width: 200,
                                    child: ElevatedButton(onPressed: (){
                                      Navigator.push(context, MaterialPageRoute(builder: (context)=>PaintingSessionPage()));

                                    }, child: Text("Sessions",style: TextStyle(color:Colors.white),),
                                        style: ElevatedButton.styleFrom(
                                          backgroundColor: Colors.white.withOpacity(0.5),
                                          shape: RoundedRectangleBorder(
                                              borderRadius: BorderRadius.circular(15)
                                          ),)),
                                  )
                                ],
                              ),

                            ),
                          ),
                        ),

                      ],
                    )
                  ],

                ),

            ),
          ),);
  }



}