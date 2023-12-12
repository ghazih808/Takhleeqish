import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:takhleekish/Admin/compainsCheck/artistsComplain/artistComplainsPage.dart';
import 'package:takhleekish/Admin/compainsCheck/userComplains/userComplainsPage.dart';

import '../../Artist/throughNavbar/ComplainsPage/artistComplainsPage.dart';

class ComplainDashboardPage extends StatelessWidget{
  @override
  Widget build(BuildContext context) {
    return Scaffold(
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
                          child: Image.asset("assests/images/artistComplain.jpg",fit: BoxFit.fitWidth),
                          decoration: BoxDecoration(
                              color: Colors.white,
                              borderRadius: BorderRadius.circular(15.0)
                          ),

                        ),
                        Container(
                          width: 200,
                          child: ElevatedButton(onPressed: (){
                            Navigator.push(context, MaterialPageRoute(builder: (context)=>ArtistComplainsPagetoAdmin()));
                          }, child: Text("Artists Complains",style: TextStyle(color:Colors.white,fontSize: 16),),
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
                          child: Image.asset("assests/images/userComplain.jpg",fit: BoxFit.fitWidth),

                        ),
                        Container(
                          width: 200,
                          child: ElevatedButton(onPressed: (){
                            Navigator.push(context, MaterialPageRoute(builder: (context)=>UserComplainPagetoAdmin()));
                          }, child: Text("Users Complains",style: TextStyle(color:Colors.white,fontSize: 16),),
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