import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_form_builder/flutter_form_builder.dart';

class UserRequestSession extends StatefulWidget{
  @override
  State<UserRequestSession> createState() => _UserRequestSessionState();
}

class _UserRequestSessionState extends State<UserRequestSession> {
  final GlobalKey<FormBuilderState> _formKey =
  GlobalKey<FormBuilderState>();
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
  TextEditingController title=TextEditingController();


  @override
  Widget build(BuildContext context) {
    double screenHeight=MediaQuery.of(context).size.height;

    return Scaffold(
      body:SingleChildScrollView(
        child: Stack(
          children: [
            Container(
              width: double.infinity,
              height: 880,
              child: Image.asset("assests/images/dbpic2.jpeg"
                ,fit: BoxFit.fitHeight,),
              //add background image here
            ),
            Column(
              children: [
                SizedBox(
                  height:screenHeight*0.15,
                ),
                Text("Takhleeqish",style: TextStyle(fontSize: 55,fontFamily:'main',fontWeight: FontWeight.w600),),
                SizedBox(
                  height:screenHeight*0.02,
                ),
                AlertDialog(
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
                          child: Text('Request Session'),
                        ),
                      ],
                    ),
                  ),
                )
              ],
            )
        
          ],
        ),
      )
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

}