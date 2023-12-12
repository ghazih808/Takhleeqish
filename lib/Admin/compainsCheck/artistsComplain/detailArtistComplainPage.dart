import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class DetailArtistComplains extends StatelessWidget{
  @override
  Widget build(BuildContext context) {
    double screenHeight=MediaQuery.of(context).size.height;

    return Scaffold(
      body: Stack(
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
                Text("Reported User:",style: TextStyle(fontSize: 20,fontWeight: FontWeight.bold),),
                Text("hassan123@gmail.coms",style: TextStyle(fontSize: 20,fontWeight: FontWeight.w400),),

                SizedBox(
                  height:screenHeight*0.02,
                ),
                Text("Explanation:",style: TextStyle(fontSize: 20,fontWeight: FontWeight.bold),),
                Text("dummy data",style: TextStyle(fontSize: 20,fontWeight: FontWeight.w400),),
                SizedBox(
                  height:screenHeight*0.02,
                ),

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
                      FaIcon(FontAwesomeIcons.warning,color: Colors.black,),
                      SizedBox(width: 25,),
                      Text("Report",style: TextStyle(color: Colors.white,fontWeight: FontWeight.w800,fontSize: 20),),
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
          ),
        ],
      ),
    );
  }

}