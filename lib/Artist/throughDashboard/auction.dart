import 'dart:io';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';

class AuctionPage extends StatefulWidget {
  @override
  _AuctionPageState createState() => _AuctionPageState();
}

class _AuctionPageState extends State<AuctionPage> {
  File? _image;
  final TextEditingController startingPriceController = TextEditingController();
  DateTime? selectedEndDate;
  TimeOfDay? selectedEndTime;

  Future<void> _selectEndDate(BuildContext context) async {
    final DateTime? picked = await showDatePicker(
      context: context,
      initialDate: DateTime.now(),
      firstDate: DateTime.now(),
      lastDate: DateTime(2101),
    );

    if (picked != null && picked != selectedEndDate) {
      setState(() {
        selectedEndDate = picked;
      });
    }
  }

  Future<void> _selectEndTime(BuildContext context) async {
    final TimeOfDay? picked = await showTimePicker(
      context: context,
      initialTime: TimeOfDay.now(),
    );

    if (picked != null && picked != selectedEndTime) {
      setState(() {
        selectedEndTime = picked;
      });
    }
  }

  Future<void> _getImage() async {
    final pickedFile = await ImagePicker().pickImage(source: ImageSource.gallery);

    setState(() {
      _image = File(pickedFile!.path);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Art Auction'),
        centerTitle: true,
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            ElevatedButton(
              onPressed: _getImage,
              child: Text('Upload Painting Image'),
            ),
            SizedBox(height: 10),
            _image != null
                ? Image.file(
              _image!,
              height: 150,
              width: 150,
              fit: BoxFit.cover,
            )
                : Container(),
            SizedBox(height: 10),
            TextField(
              controller: startingPriceController,
              keyboardType: TextInputType.number,
              decoration: InputDecoration(labelText: 'Starting Price'),
            ),
            SizedBox(height: 10),
            InkWell(
              onTap: () => _selectEndDate(context),
              child: InputDecorator(
                decoration: InputDecoration(
                  labelText: 'End Date',
                ),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: <Widget>[
                    Text(
                      selectedEndDate != null
                          ? '${selectedEndDate!.toLocal()}'.split(' ')[0]
                          : 'Select End Date',
                    ),
                    Icon(Icons.calendar_today),
                  ],
                ),
              ),
            ),
            SizedBox(height: 10),
            InkWell(
              onTap: () => _selectEndTime(context),
              child: InputDecorator(
                decoration: InputDecoration(
                  labelText: 'End Time',
                ),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: <Widget>[
                    Text(
                      selectedEndTime != null
                          ? selectedEndTime!.format(context)
                          : 'Select End Time',
                    ),
                    Icon(Icons.access_time),
                  ],
                ),
              ),
            ),
            SizedBox(height: 20),
            ElevatedButton(
              onPressed: () {
                // Add logic to submit auction data
                if (_image != null && startingPriceController.text.isNotEmpty) {
                  // Perform actions with the auction data
                  print('Auction submitted:');
                  print('Image: ${_image!.path}');
                  print('Starting Price: ${startingPriceController.text}');
                  print('End Date: $selectedEndDate');
                  print('End Time: $selectedEndTime');
                } else {
                  // Handle validation errors or inform the user
                  print('Please fill in all fields.');
                }
              },
              child: Text('Submit Auction'),
            ),
          ],
        ),
      ),
    );
  }
}

void main() {
  runApp(MaterialApp(
    home: AuctionPage(),
  ));
}
