import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class IndiviualAnalyticsPage extends StatelessWidget{
  @override
  Widget build(BuildContext context) {
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
          Padding(
            padding: const EdgeInsets.all(16.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                SizedBox(height: 16),
                Center(

                  child: Container(
                    width: 200,
                    height: 200,
                    child: CircleAvatar(
                      child: ClipOval(
                        child: Image.asset("assests/images/ghazi.jpg"),
                      ),
                    ),
                  ),
                ),
                SizedBox(height: 16),
                ArtistAnalyticsCards(
                  title: 'Total Sales',
                  value: '215',
                ),
                SizedBox(height: 16),
                ArtistAnalyticsCards(
                  title: 'Views on Art',
                  value: '3,500',
                ),
                SizedBox(height: 16),
                ArtistAnalyticsCards(
                  title: 'Total Revenue',
                  value: '\$12,500',
                ),
                SizedBox(height: 16),
                ArtistAnalyticsCards(
                  title: 'Feedback',
                  value: 'Positive: 85%\nNeutral: 10%\nNegative: 5%',
                ),
              ],
            ),
          ),
        ],
      )
    );
  }


}

class ArtistAnalyticsCards extends StatelessWidget {
  final String title;
  final String value;

  const ArtistAnalyticsCards({
    required this.title,
    required this.value,
  });

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 5,
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              title,
              style: TextStyle(
                fontSize: 18,
                fontWeight: FontWeight.bold,
              ),
            ),
            SizedBox(height: 8),
            Text(
              value,
              style: TextStyle(
                fontSize: 14,
                fontWeight: FontWeight.bold,
              ),
            ),
          ],
        ),
      ),
    );
  }

  void main() {
    runApp(MaterialApp(
      home: IndiviualAnalyticsPage(),
    ));
  }
}