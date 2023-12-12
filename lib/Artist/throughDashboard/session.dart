import 'package:flutter/material.dart';
import 'package:flutter_form_builder/flutter_form_builder.dart';
import 'package:flutter_slidable/flutter_slidable.dart';

class PaintingSessionPage extends StatefulWidget {
  @override
  _PaintingSessionPageState createState() => _PaintingSessionPageState();
}

class _PaintingSessionPageState extends State<PaintingSessionPage> {
  final GlobalKey<FormBuilderState> _formKey = GlobalKey<FormBuilderState>();
TextEditingController title=TextEditingController();
  List<String> sessionTypes = ['Online', 'Physical', 'Hybrid'];
  List<String> onlinePlatforms = ['Google Meet'];
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

  String selectedSessionType = 'Online'; // Default value

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
              children: [
                Expanded(
                  child: ListView.separated(
                    itemCount: 5, // Number of painting sessions (fetch from the database)
                    itemBuilder: (context, index) {
                      return Slidable(
                        actionPane: SlidableDrawerActionPane(),
                        actionExtentRatio: 0.25,
                        child: Container(
                          decoration: BoxDecoration(
                              color: Colors.white,
                              borderRadius: BorderRadius.circular(15.0)
                          ),
                          child: ListTile(
                            title: Text('Session ${index + 1}'),
                            subtitle: Text('Type, Venue, Date, Time, etc.'),
                            onTap: () {
                              // Handle tapping on a painting session
                              // You can navigate to a detailed page or show more info
                            },
                          ),
                        ),
                        secondaryActions: [
                          IconSlideAction(
                            caption: 'Delete',
                            color: Colors.red,
                            icon: Icons.delete,
                            onTap: () {
                              // Handle deleting the painting session
                              // You may prompt the user for confirmation
                            },
                          ),
                        ],
                      );
                    }, separatorBuilder: (BuildContext context, int index) { return const Divider(); },
                  ),
                ),
                ElevatedButton(
                  onPressed: () {
                    _showCreateSessionDialog(context);
                  },
                  child: Text('Create Painting Session'),
                ),
              ],
            ),
          ),
        ],
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

  void _showCreateSessionDialog(BuildContext context) {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          content: FormBuilder(
            key: _formKey,
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                TextFormField(
                  controller: title,
                  keyboardType: TextInputType.text,
                  validator: (value) {
                    if (value!.isEmpty) {
                      return 'Title is Required';
                    } else {
                      title.text = value;
                    }
                  },
                  decoration: InputDecoration(
                    label: Text("Title"),
                    hintText:"Enter title",
                  ),
                ),
                SizedBox(
                  height: 2,
                ),
                FormBuilderDropdown(
                  name: 'sessionType',
                  decoration: InputDecoration(labelText: 'Session Type'),
                  items: sessionTypes
                      .map((type) => DropdownMenuItem(
                    value: type,
                    child: Text(type),
                  ))
                      .toList(),
                  onChanged: (value) {
                    setState(() {
                      selectedSessionType = value.toString();
                    });
                  },
                ),
                SizedBox(height: 10),
                IgnorePointer(
                  ignoring: selectedSessionType != 'Online',
                  child: FormBuilderDropdown(
                    name: 'onlinePlatform',
                    decoration: InputDecoration(
                      labelText: 'Select Online Platform',
                    ),
                    items: onlinePlatforms
                        .map((platform) => DropdownMenuItem(
                      value: platform,
                      child: Text(platform),
                    ))
                        .toList(),
                  ),
                ),
                IgnorePointer(
                  ignoring: selectedSessionType != 'Physical',
                  child: FormBuilderDropdown(
                    name: 'venue',
                    decoration: InputDecoration(labelText: 'Select Venue'),
                    items: venues
                        .map((venue) => DropdownMenuItem(
                      value: venue,
                      child: Text(venue),
                    ))
                        .toList(),
                  ),
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
                if (selectedSessionType == 'Physical')
                  FormBuilderDropdown(
                    name: 'capacity',
                    decoration: InputDecoration(labelText: 'People\'s Capacity'),
                    items: capacityOptions
                        .map((option) => DropdownMenuItem(
                      value: option,
                      child: Text('$option people'),
                    ))
                        .toList(),
                  ),
                SizedBox(height: 10),
                FormBuilderDropdown(
                  name: 'paintingCategory',
                  decoration: InputDecoration(labelText: 'Painting Category'),
                  items: paintingCategories
                      .map((category) => DropdownMenuItem(
                    value: category,
                    child: Text(category),
                  ))
                      .toList(),
                ),
                SizedBox(height: 10),
                ElevatedButton(
                  onPressed: () {
                    if (_formKey.currentState?.saveAndValidate() ?? false) {
                      Map<String, dynamic> formData =
                          _formKey.currentState!.value;
                      print('Painting Session created: $formData');
                      Navigator.of(context).pop();
                    }
                  },
                  child: Text('Create Session'),
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
    home: PaintingSessionPage(),
  ));
}
