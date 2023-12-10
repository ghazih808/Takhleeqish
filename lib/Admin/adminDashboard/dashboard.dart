import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:takhleekish/Admin/navbar/adminNavbar.dart';

import '../../Artist/navbar.dart';

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
            Column(
              children: [
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
                            child: ElevatedButton(onPressed: (){}, child: Text("Exhibition",style: TextStyle(color:Colors.white),),
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
                            child: ElevatedButton(onPressed: (){}, child: Text("Auction",style: TextStyle(color:Colors.white),),
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
                            child: ElevatedButton(onPressed: (){}, child: Text("Sessions",style: TextStyle(color:Colors.white),),
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

      ),);
  }

}