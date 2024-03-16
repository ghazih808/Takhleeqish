import 'package:flutter/material.dart';

class FeedbackPage extends StatefulWidget {
  @override
  _FeedbackPageState createState() => _FeedbackPageState();
}

class _FeedbackPageState extends State<FeedbackPage> {
  TextEditingController _feedbackController = TextEditingController();

  @override
  Widget build(BuildContext context) {
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
            Center(
              child: Container(
                padding: EdgeInsets.all(16.0),
                constraints: BoxConstraints(maxWidth: 400),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [

                    SizedBox(height: 200,),
                    Text(
                      'We appreciate your feedback!',
                      style: TextStyle(
                        fontSize: 20,
                        fontWeight: FontWeight.bold,
                      ),
                      textAlign: TextAlign.center,
                    ),
                    SizedBox(height: 20),
                    Container(
                      decoration: BoxDecoration(
                        border: Border.all(
                          color: Colors.blue, // Change border color to blue
                          width: 1.0,
                        ),
                        borderRadius: BorderRadius.circular(8.0),
                      ),
                      child: TextField(
                        controller: _feedbackController,
                        maxLines: 5,
                        decoration: InputDecoration(
                          border: InputBorder.none,
                          contentPadding: EdgeInsets.all(8.0),
                          hintText: 'Enter your feedback here',
                        ),
                      ),
                    ),
                    SizedBox(height: 20),
                    ElevatedButton(
                      onPressed: () {
                        // Access the feedback data
                        String feedback = _feedbackController.text;

                        // Perform any actions with the feedback data (e.g., send to server)
                        // For now, just print it
                        print('Feedback: $feedback');

                        // You can also navigate to another page or show a success message
                        // Navigator.of(context).pop(); // Example of navigating back
                      },
                      style: ElevatedButton.styleFrom(
                       // Change text color to white
                        padding: EdgeInsets.symmetric(horizontal: 20, vertical: 15),
                        textStyle: TextStyle(fontSize: 18),
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(8.0),
                        ),
                      ),
                      child: Text('Submit Feedback'),
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      )

    );
  }

  @override
  void dispose() {
    _feedbackController.dispose();
    super.dispose();
  }
}
