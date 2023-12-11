import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../../userNavbar.dart';
import 'ApprovedBids/approvedAuctionPage.dart';
import 'availableBids/userAuctionPage.dart';
// import 'availableBids/userAuctionPage.dart';

class UserRequestAuctionPage extends StatelessWidget{
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: UserNavbar(),
      appBar: AppBar(
        title: const Text("Select Auction", style: TextStyle(color: Colors.white, fontWeight: FontWeight.w600, fontSize: 30)),
        centerTitle: true,
        backgroundColor: Colors.black,
      ),
      body: Stack(
        children: [
          Container(
            width: double.infinity,
            height: 880,
            child: Image.asset("assests/images/bglol.jpeg"
              ,fit: BoxFit.fitHeight,),
            //add background image here
          ),
          Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [

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
                          child: Image.asset("assests/images/auction.jpg",fit: BoxFit.fitWidth),
                          decoration: BoxDecoration(
                              color: Colors.white,
                              borderRadius: BorderRadius.circular(15.0)
                          ),

                        ),
                        Container(
                          width: 200,
                          child: ElevatedButton(onPressed: (){
                            Navigator.push(context, MaterialPageRoute(builder: (context)=>UserAuctionPage()));
                          }, child: Text("Avialable Bids",style: TextStyle(color:Colors.white,fontSize: 16),),
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
                          child: Image.asset("assests/images/approvedBids.jpg",fit: BoxFit.fitWidth),

                        ),
                        Container(
                          width: 200,
                          child: ElevatedButton(onPressed: (){
                            Navigator.push(context, MaterialPageRoute(builder: (context)=>ApprovedAuctionPage()));
                          }, child: Text("Approved Bids",style: TextStyle(color:Colors.white,fontSize: 16),),
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
    );
  }

}