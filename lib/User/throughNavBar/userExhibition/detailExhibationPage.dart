import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class DetailExhibitionPage extends StatelessWidget {
  final DocumentSnapshot exhibition;

  DetailExhibitionPage({required this.exhibition});

  @override
  Widget build(BuildContext context) {
    double screenHeight = MediaQuery.of(context).size.height;
    String venue = exhibition['venue'];
    String date = exhibition['date'];
    String time = exhibition['time'];

    return Scaffold(
      body: Stack(
        children: [
          Container(
            width: double.infinity,
            height: 880,
            child: Image.asset(
              "assests/images/dbpic2.jpeg",
              fit: BoxFit.fitHeight,
            ),
          ),
          Container(
            child: Column(
              children: [
                SizedBox(height: screenHeight * 0.1),
                Center(
                  child: Container(
                    width: 300,
                    height: 300,
                    child: Image.asset("assests/images/userExhibitionDemo.jpg"),
                  ),
                ),
                SizedBox(height: screenHeight * 0.04),
                Text(
                  "Venue:",
                  style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                ),
                Text(
                  venue,
                  style: TextStyle(fontSize: 20, fontWeight: FontWeight.w400),
                ),
                SizedBox(height: screenHeight * 0.02),
                Text(
                  "Date:",
                  style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                ),
                Text(
                  date,
                  style: TextStyle(fontSize: 20, fontWeight: FontWeight.w400),
                ),
                SizedBox(height: screenHeight * 0.02),
                Text(
                  "Time:",
                  style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                ),
                Text(
                  time,
                  style: TextStyle(fontSize: 20, fontWeight: FontWeight.w400),
                ),
                SizedBox(height: screenHeight * 0.04),
                Container(
                  width: 200,
                  height: 50,
                  child: ElevatedButton(
                    onPressed: () {
                      // Add Maps here
                    },
                    child: Row(
                      children: [
                        FaIcon(FontAwesomeIcons.mapLocationDot, color: Colors.black),
                        SizedBox(width: 25),
                        Text(
                          "Location",
                          style: TextStyle(color: Colors.white, fontWeight: FontWeight.w800, fontSize: 20),
                        ),
                      ],
                    ),
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Colors.green,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(15.0),
                      ),
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
