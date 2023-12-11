import 'package:flutter/material.dart';

class ComplaintsPage extends StatefulWidget {
  @override
  _ComplaintsPageState createState() => _ComplaintsPageState();
}

class _ComplaintsPageState extends State<ComplaintsPage> {
  TextEditingController _complaintController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Submit a Complaint'),
        centerTitle: true,
      ),
      body: Center(
        child: Container(
          padding: EdgeInsets.all(16.0),
          constraints: BoxConstraints(maxWidth: 400),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                'We apologize for any inconvenience!',
                style: TextStyle(
                  fontSize: 16,
                  fontWeight: FontWeight.bold,
                ),
                textAlign: TextAlign.center,
              ),
              SizedBox(height: 20),
              Container(
                decoration: BoxDecoration(
                  border: Border.all(
                    color: Colors.blue, // Change border color to red for complaints
                    width: 1.0,
                  ),
                  borderRadius: BorderRadius.circular(8.0),
                ),
                child: TextField(
                  controller: _complaintController,
                  maxLines: 5,
                  decoration: InputDecoration(
                    border: InputBorder.none,
                    contentPadding: EdgeInsets.all(8.0),
                    hintText: 'Enter your complaint here',
                  ),
                ),
              ),
              SizedBox(height: 20),
              ElevatedButton(
                onPressed: () {
                  // Access the complaint data
                  String complaint = _complaintController.text;

                  // Perform any actions with the complaint data (e.g., send to server)
                  // For now, just print it
                  print('Complaint: $complaint');

                  // You can also navigate to another page or show a success message
                  // Navigator.of(context).pop(); // Example of navigating back
                },
                style: ElevatedButton.styleFrom(
                  primary: Colors.blue, // Change button color to red for complaints
                  onPrimary: Colors.white, // Change text color to white
                  padding: EdgeInsets.symmetric(horizontal: 20, vertical: 15),
                  textStyle: TextStyle(fontSize: 18),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(8.0),
                  ),
                ),
                child: Text('Submit Complaint'),
              ),
            ],
          ),
        ),
      ),
    );
  }

  @override
  void dispose() {
    _complaintController.dispose();
    super.dispose();
  }
}
