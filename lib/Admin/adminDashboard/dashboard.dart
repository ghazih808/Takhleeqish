import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:takhleekish/Admin/navbar/adminNavbar.dart';

import '../../Artist/Navbar/navbar.dart';
import '../throughDashboard/adminAnalytics/allArtistsAnalytics.dart';
import '../throughDashboard/adminAuction/auctionPage.dart';
import '../throughDashboard/adminExhibition/adminExhibitionPage.dart';

class AdminDashboard extends StatelessWidget{
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: AdminNavbar(),
      appBar:AppBar(
        title: const Text("Admin Dashboard",style: TextStyle(color: Colors.white,fontWeight: FontWeight.w500),),
        centerTitle: true,
        backgroundColor: Colors.black,

      ),
      body: Center(
        child: Stack(
          children: [
            Container(
              width: double.infinity,
              height: 880,
              child: Image.asset("assests/images/bglol.jpeg"
                ,fit: BoxFit.fitHeight,),
              //add background image here
            ),
            SingleChildScrollView(
              child: Column(
                children: [
                  SizedBox(
                    height: 120,
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
                                Navigator.push(context, MaterialPageRoute(builder: (context)=>AdminExhibitionPage()));
                              }, child: Text("Exhibition",style: TextStyle(color:Colors.white,fontSize: 16),),
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
                                Navigator.push(context, MaterialPageRoute(builder: (context)=>AdminAuctionPage()));
                              }, child: Text("Auction",style: TextStyle(color:Colors.white,fontSize: 16),),
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

                ],
              ),
            )
          ],

        ),

      ),);
  }

}