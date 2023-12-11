import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class ApprovedBidPage extends StatelessWidget{
  @override
  Widget build(BuildContext context) {
    double screenHeight=MediaQuery.of(context).size.height;
    TextEditingController bid=TextEditingController();
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
                    height:screenHeight*0.01,
                  ),
                  Text("Current Bid",style: TextStyle(fontSize: 20,fontWeight: FontWeight.bold),),
                  Text("RS 1000",style: TextStyle(fontSize: 20,fontWeight: FontWeight.w400),),
        
                  SizedBox(
                    height:screenHeight*0.01,
                  ),
                  Text("Artist",style: TextStyle(fontSize: 20,fontWeight: FontWeight.bold),),
                  Text("Hassan",style: TextStyle(fontSize: 20,fontWeight: FontWeight.w400),),
        
                  SizedBox(
                    height:screenHeight*0.01,
                  ),
                  Text("Starting time",style: TextStyle(fontSize: 20,fontWeight: FontWeight.bold),),
                  Text("10:15 AM",style: TextStyle(fontSize: 20,fontWeight: FontWeight.w400),),
                  SizedBox(
                    height:screenHeight*0.01,
                  ),
                  Text("Ending Time",style: TextStyle(fontSize: 20,fontWeight: FontWeight.bold),),
                  Text("11:15 AM",style: TextStyle(fontSize: 20,fontWeight: FontWeight.w400),),
                  SizedBox(
                    height:screenHeight*0.01,
                  ),
                  Container(
                    width: 200,
                    child: TextFormField(
                      controller: bid,
                      keyboardType: TextInputType.text,
                      validator: (value) {
                        if (value!.isEmpty) {
                          return 'Title is Required';
                        } else {
                          bid.text = value;
                        }
                      },
                      decoration: InputDecoration(
                        label: Text("Bid"),
                        hintText:"Enter Amount",
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
                        SizedBox(width: 25,),
                        Text("Place bid",style: TextStyle(color: Colors.white,fontWeight: FontWeight.w800,fontSize: 20),),
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
      ),
    );
  }

}