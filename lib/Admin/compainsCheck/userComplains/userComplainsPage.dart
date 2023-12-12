import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_slidable/flutter_slidable.dart';
import 'package:takhleekish/Admin/compainsCheck/userComplains/detailUserComplainPage.dart';

class UserComplainPagetoAdmin extends StatelessWidget{
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body:Stack(
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
                    itemCount: 5, // Number of exhibitions (fetch from the database)
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
                            leading: ClipOval(child: Image.asset("assests/images/userExhibitionDemo.jpg")),
                            title: Text('Complain ${index + 1}'),
                            subtitle: Text('Reason'),
                            onTap: () {
                              Navigator.push(context, MaterialPageRoute(builder: (context)=>DetailUserComplain()));
                            },
                          ),
                        ),
                      );
                    }, separatorBuilder: (BuildContext context, int index) { return const Divider(); },
                  ),
                ),

              ],
            ),
          ) ,
        ],
      ) ,
    );

  }

}