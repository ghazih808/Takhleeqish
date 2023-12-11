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
  final TextEditingController endingPriceController = TextEditingController();
  DateTime? selectedStartDate;
  DateTime? selectedEndDate;
  TimeOfDay? selectedStartTime;
  TimeOfDay? selectedEndTime;

  Future<void> _selectDateTime(
      BuildContext context,
      bool isStartDate,
      bool isStartTime,
      ) async {
    DateTime? pickedDate;
    TimeOfDay? pickedTime;

    if (isStartDate || isStartDate) {
      pickedDate = await showDatePicker(
        context: context,
        initialDate: DateTime.now(),
        firstDate: DateTime.now(),
        lastDate: DateTime(2101),
      );
    }

    if (!isStartDate || !isStartTime) {
      pickedTime = await showTimePicker(
        context: context,
        initialTime: isStartDate && pickedDate == DateTime.now()
            ? TimeOfDay.now()
            : selectedStartTime ?? TimeOfDay.now(),
      );
    }

    setState(() {
      if (isStartDate) {
        selectedStartDate = pickedDate;
        selectedStartTime = pickedTime;
      } else {
        selectedEndDate = pickedDate;
        selectedEndTime = pickedTime;
      }
    });
  }

  Future<void> _getImage() async {
    final pickedFile =
    await ImagePicker().pickImage(source: ImageSource.gallery);

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
            Card(
              elevation: 5,
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: Column(
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
                  ],
                ),
              ),
            ),
            SizedBox(height: 20),
            Card(
              elevation: 5,
              child: Padding(
                padding: const EdgeInsets.all(16.0),
                child: Column(
                  children: [
                    TextField(
                      controller: startingPriceController,
                      keyboardType: TextInputType.number,
                      decoration: InputDecoration(
                        labelText: 'Starting Price',
                      ),
                    ),
                    SizedBox(height: 10),
                    TextField(
                      controller: endingPriceController,
                      keyboardType: TextInputType.number,
                      decoration: InputDecoration(
                        labelText: 'Ending Price',
                      ),
                    ),
                    SizedBox(height: 10),
                    InkWell(
                      onTap: () => _selectDateTime(context, true, true),
                      child: InputDecorator(
                        decoration: InputDecoration(
                          labelText: 'Start Date & Time',
                        ),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: <Widget>[
                            Text(
                              selectedStartDate != null
                                  ? '${selectedStartDate!.toLocal()} ${selectedStartTime!.format(context)}'
                                  : 'Select Start Date & Time',
                            ),
                            Icon(Icons.calendar_today),
                          ],
                        ),
                      ),
                    ),
                    SizedBox(height: 10),
                    InkWell(
                      onTap: () => _selectDateTime(context, false, false),
                      child: InputDecorator(
                        decoration: InputDecoration(
                          labelText: 'End Date & Time',
                        ),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: <Widget>[
                            Text(
                              selectedEndDate != null
                                  ? '${selectedEndDate!.toLocal()} ${selectedEndTime!.format(context)}'
                                  : 'Select End Date & Time',
                            ),
                            Icon(Icons.calendar_today),
                          ],
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
            SizedBox(height: 20),
            ElevatedButton(
              onPressed: () {
                // Add logic to submit auction data
                if (_image != null &&
                    startingPriceController.text.isNotEmpty &&
                    endingPriceController.text.isNotEmpty &&
                    selectedStartDate != null &&
                    selectedEndDate != null &&
                    selectedStartTime != null &&
                    selectedEndTime != null) {
                  // Perform actions with the auction data
                  print('Auction submitted:');
                  print('Image: ${_image!.path}');
                  print('Starting Price: ${startingPriceController.text}');
                  print('Ending Price: ${endingPriceController.text}');
                  print(
                      'Start Date & Time: ${selectedStartDate!.toLocal()} ${selectedStartTime!.format(context)}');
                  print(
                      'End Date & Time: ${selectedEndDate!.toLocal()} ${selectedEndTime!.format(context)}');
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
