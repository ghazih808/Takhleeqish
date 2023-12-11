import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class ApproveOrRejectAuction extends StatelessWidget{
  @override
  Widget build(BuildContext context) {
    double screenHeight=MediaQuery.of(context).size.height;

    return Scaffold(
      body: SingleChildScrollView(
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
                      child: Image.asset("assests/images/userExhibitionDemo.jpg"),
                    ),
                  ),
                  SizedBox(
                    height:screenHeight*0.04,
                  ),
                  Text("Base Bid",style: TextStyle(fontSize: 20,fontWeight: FontWeight.bold),),
                  Text("RS 1000",style: TextStyle(fontSize: 20,fontWeight: FontWeight.w400),),
        
                  SizedBox(
                    height:screenHeight*0.02,
                  ),
                  Text("Artist",style: TextStyle(fontSize: 20,fontWeight: FontWeight.bold),),
                  Text("Hassan",style: TextStyle(fontSize: 20,fontWeight: FontWeight.w400),),
        
                  SizedBox(
                    height:screenHeight*0.02,
                  ),
                  Text("Starting time",style: TextStyle(fontSize: 20,fontWeight: FontWeight.bold),),
                  Text("10:15 AM",style: TextStyle(fontSize: 20,fontWeight: FontWeight.w400),),
                  SizedBox(
                    height:screenHeight*0.02,
                  ),
                  Text("Ending Time",style: TextStyle(fontSize: 20,fontWeight: FontWeight.bold),),
                  Text("11:15 AM",style: TextStyle(fontSize: 20,fontWeight: FontWeight.w400),),
                  SizedBox(
                    height:screenHeight*0.04,
                  ),
                  Container(
                    width: 200,
                    height: 50,
                    child: ElevatedButton(onPressed:()  {
                      //add Maps here
                    }, child:Row(
                      children: [
                        FaIcon(FontAwesomeIcons.check,color: Colors.white,),
                        SizedBox(width: 25,),
                        Text("Approved",style: TextStyle(color: Colors.white,fontWeight: FontWeight.w800,fontSize: 20),),
                      ],
                    ),
        
                      style: ElevatedButton.styleFrom(
                          backgroundColor: Colors.green,
                          shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(15.0)
                          )
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
                        FaIcon(FontAwesomeIcons.x,color: Colors.white,),
                        SizedBox(width: 25,),
                        Text("Reject",style: TextStyle(color: Colors.white,fontWeight: FontWeight.w800,fontSize: 20),),
                      ],
                    ),
        
                      style: ElevatedButton.styleFrom(
                          backgroundColor: Colors.red,
                          shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(15.0)
                          )
                      ),
                    ),
                  )
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

}