import 'package:flutter/material.dart';
import 'package:flutter_form_builder/flutter_form_builder.dart';
import 'package:flutter_slidable/flutter_slidable.dart';

class ExhibitionAnnouncementPage extends StatefulWidget {
  @override
  _ExhibitionAnnouncementPageState createState() =>
      _ExhibitionAnnouncementPageState();
}

class _ExhibitionAnnouncementPageState
    extends State<ExhibitionAnnouncementPage> {
  final GlobalKey<FormBuilderState> _formKey =
  GlobalKey<FormBuilderState>();

  List<String> venues = ['Venue A', 'Venue B', 'Venue C'];
  List<int> capacityOptions = [100, 200, 300];
  List<String> paintingCategories = [
    'Abstract',
    'Landscape',
    'Portrait',
    'Still Life',
    'Modern Art',
    'Contemporary',
  ];

  DateTime? selectedDate;
  TimeOfDay? selectedTime;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Announce Exhibition'),
        centerTitle: true,
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            Expanded(
              child: ListView.builder(
                itemCount: 5, // Number of exhibitions (fetch from the database)
                itemBuilder: (context, index) {
                  return Slidable(
                    actionPane: SlidableDrawerActionPane(),
                    actionExtentRatio: 0.25,
                    child: ListTile(
                      title: Text('Exhibition ${index + 1}'),
                      subtitle: Text('Venue, Date, Time, etc.'),
                      onTap: () {
                        // Handle tapping on an exhibition
                        // You can navigate to a detailed page or show more info
                      },
                    ),
                    secondaryActions: [
                      IconSlideAction(
                        caption: 'Delete',
                        color: Colors.red,
                        icon: Icons.delete,
                        onTap: () {
                          // Handle deleting the exhibition
                          // You may prompt the user for confirmation
                        },
                      ),
                    ],
                  );
                },
              ),
            ),
            ElevatedButton(
              onPressed: () {
                _showAddExhibitionDialog(context);
              },
              child: Text('Add Exhibition'),
            ),
          ],
        ),
      ),
    );
  }

  Future<void> _selectDate(BuildContext context) async {
    final DateTime? picked = await showDatePicker(
      context: context,
      initialDate: DateTime.now(),
      firstDate: DateTime.now(),
      lastDate: DateTime(2101),
    );

    if (picked != null && picked != selectedDate) {
      setState(() {
        selectedDate = picked;
      });
    }
  }

  Future<void> _selectTime(BuildContext context) async {
    final TimeOfDay? picked = await showTimePicker(
      context: context,
      initialTime: TimeOfDay.now(),
    );

    if (picked != null && picked != selectedTime) {
      setState(() {
        selectedTime = picked;
      });
    }
  }

  void _showAddExhibitionDialog(BuildContext context) {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          content: FormBuilder(
            key: _formKey,
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                DropdownButtonFormField(
                  decoration: InputDecoration(labelText: 'Select Venue'),
                  value: venues.first, // Initial value, you can change it accordingly
                  items: venues
                      .map((venue) => DropdownMenuItem(
                    value: venue,
                    child: Text(venue),
                  ))
                      .toList(),
                  onChanged: (value) {
                    // Handle the venue change
                  },
                ),
                SizedBox(height: 10),
                InkWell(
                  onTap: () => _selectDate(context),
                  child: InputDecorator(
                    decoration: InputDecoration(
                      labelText: 'Date',
                      errorText:
                      _formKey.currentState?.fields['date']?.errorText,
                    ),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: <Widget>[
                        Text(
                          selectedDate != null
                              ? '${selectedDate!.toLocal()}'.split(' ')[0]
                              : 'Select Date',
                        ),
                        Icon(Icons.calendar_today),
                      ],
                    ),
                  ),
                ),
                SizedBox(height: 10),
                InkWell(
                  onTap: () => _selectTime(context),
                  child: InputDecorator(
                    decoration: InputDecoration(
                      labelText: 'Time',
                      errorText:
                      _formKey.currentState?.fields['time']?.errorText,
                    ),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: <Widget>[
                        Text(
                          selectedTime != null
                              ? selectedTime!.format(context)
                              : 'Select Time',
                        ),
                        Icon(Icons.access_time),
                      ],
                    ),
                  ),
                ),
                SizedBox(height: 10),
                DropdownButtonFormField(
                  decoration: InputDecoration(labelText: 'People\'s Capacity'),
                  value: capacityOptions.first, // Initial value, you can change it accordingly
                  items: capacityOptions
                      .map((option) => DropdownMenuItem(
                    value: option,
                    child: Text('$option people'),
                  ))
                      .toList(),
                  onChanged: (value) {
                    // Handle the capacity change
                  },
                ),
                SizedBox(height: 10),
                DropdownButtonFormField(
                  decoration: InputDecoration(labelText: 'Painting Category'),
                  value: paintingCategories.first, // Initial value, you can change it accordingly
                  items: paintingCategories
                      .map((category) => DropdownMenuItem(
                    value: category,
                    child: Text(category),
                  ))
                      .toList(),
                  onChanged: (value) {
                    // Handle the painting category change
                  },
                ),
                SizedBox(height: 10),
                ElevatedButton(
                  onPressed: () {
                    if (_formKey.currentState?.saveAndValidate() ?? false) {
                      // Save and validate successful, perform necessary actions
                      Map<String, dynamic> formData =
                          _formKey.currentState!.value;
                      // Add the exhibition to the database or handle as needed
                      print('Exhibition added: $formData');
                      Navigator.of(context).pop(); // Close the dialog
                    }
                  },
                  child: Text('Add Exhibition'),
                ),
              ],
            ),
          ),
        );
      },
    );
  }
}

void main() {
  runApp(MaterialApp(
    home: ExhibitionAnnouncementPage(),
  ));
}
