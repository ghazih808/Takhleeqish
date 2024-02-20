import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter_slidable/flutter_slidable.dart';

class ExhibitionAnnouncementPage extends StatefulWidget {
  @override
  _ExhibitionAnnouncementPageState createState() =>
      _ExhibitionAnnouncementPageState();
}

class _ExhibitionAnnouncementPageState
    extends State<ExhibitionAnnouncementPage> {
  final venueController = TextEditingController();

  @override
  Widget build(BuildContext context) {
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
            //add background image here
          ),
          Padding(
            padding: const EdgeInsets.all(16.0),
            child: Column(
              children: [
                Expanded(
                  child: StreamBuilder<QuerySnapshot>(
                    stream: FirebaseFirestore.instance
                        .collection('exhibition')
                        .snapshots(),
                    builder: (context, snapshot) {
                      if (snapshot.hasData) {
                        final exhibitions =
                        snapshot.data!.docs.reversed.toList();
                        return ListView.separated(
                          itemCount: exhibitions.length,
                          itemBuilder: (context, index) {
                            DocumentSnapshot exhibition =
                            exhibitions[index];
                            final venue = exhibition['venue'];
                            return Slidable(
                              actionPane: SlidableDrawerActionPane(),
                              actionExtentRatio: 0.25,
                              child: Container(
                                decoration: BoxDecoration(
                                  color: Colors.white,
                                  borderRadius: BorderRadius.circular(15.0),
                                ),
                                child: ListTile(
                                  title: Text('Exhibition ${index + 1}'),
                                  subtitle: Text('$venue'),
                                  onTap: () {
                                    // Handle tapping on an exhibition
                                  },
                                ),
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
                          separatorBuilder:
                              (BuildContext context, int index) {
                            return const Divider();
                          },
                        );
                      } else if (snapshot.hasError) {
                        return Center(
                          child: Text('Error: ${snapshot.error}'),
                        );
                      } else {
                        return Center(
                          child: CircularProgressIndicator(),
                        );
                      }
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
        ],
      ),
    );
  }

  void _showAddExhibitionDialog(BuildContext context) {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          content: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              TextField(
                controller: venueController,
                decoration: InputDecoration(
                  hintText: 'Venue',
                ),
              ),
              SizedBox(height: 10),
              ElevatedButton(
                onPressed: () {
                  CollectionReference collRef = FirebaseFirestore.instance.collection('exhibition');
                  collRef.add({
                    'venue': venueController.text,
                  });
                  venueController.clear();
                  Navigator.of(context).pop();
                },
                child: Text('Add Exhibition'),
              ),
            ],
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
