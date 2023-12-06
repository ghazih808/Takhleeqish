
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:get/get.dart';
import 'package:takhleekish/Artist/throughDashboard/artistDashboard.dart';
import 'package:takhleekish/Artist/artistDatabase.dart';
import 'package:takhleekish/Artist/artistPersonal/artist_model.dart';
import 'package:takhleekish/Artist/controllers/artist_controller.dart';
import 'package:takhleekish/User/User_authentication.dart';
import 'package:takhleekish/User/user_model.dart';
import 'package:takhleekish/User/user_repository.dart';

import '../main.dart';
class UserNavbar extends StatelessWidget {
  final FirebaseAuth _auth=FirebaseAuth.instance;

  final controller = Get.put(Artist_Controller());

  final authrepo = Get.put(User_Auth());

  final UserRepo = Get.put(User_repo());

  var email;

  var name;

  @override
  Widget build(BuildContext context) {
    return Drawer(

      child: FutureBuilder(
        future: getData(),
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.done) {
            if (snapshot.hasData) {
              User_model artistModel = snapshot.data!;
              name=snapshot.data!.name;
              email=snapshot.data!.email;
              print(artistModel.url);
              print('aslkjad');
              //     Text("$email"),
              // Text("$name"),

              return Container(
                color: Colors.white,
                child: ListView(
                  padding: EdgeInsets.zero,
                  children: [
                    UserAccountsDrawerHeader(accountName: Text("  $name",style: TextStyle(fontWeight: FontWeight.w500),),
                      accountEmail: Text("   $email",style: TextStyle(fontWeight: FontWeight.w500),),
                      currentAccountPicture: CircleAvatar(
                        child: ClipOval(
                          child: Image.network(snapshot.data!.url,fit: BoxFit.fitWidth,),

                        ),
                      ),
                      decoration: BoxDecoration(
                          color: Colors.white,
                          image: DecorationImage(
                            image: NetworkImage(
                                'https://media.istockphoto.com/id/887755698/photo/watercolor-textured-background.webp?b=1&s=170667a&w=0&k=20&c=aiUOD1FgS1Q0CHn6kwFy_COsCaTCWtZ3ZaZYU251Io8=' ),
                            fit: BoxFit.cover,
                          )
                      ),),
                    ListTile(
                      leading: FaIcon(FontAwesomeIcons.userTie),
                      title: Text("Profile",style: TextStyle(fontSize: 17,fontWeight: FontWeight.w500),),
                      onTap: (){

                      }, ),
                    ListTile(
                      leading: Icon(Icons.update),
                      title: Text("Update Credentials",style: TextStyle(fontSize: 17,fontWeight: FontWeight.w500)),
                      onTap: (){

                      },



                    ),
                    ListTile(
                      leading: FaIcon(FontAwesomeIcons.calendar),
                      title: Text("Sessions",style: TextStyle(fontSize: 17,fontWeight: FontWeight.w500)),
                      onTap: (){

                      },



                    ),
                    ListTile(
                      leading: Icon(Icons.point_of_sale),
                      title: Text("Auctions",style: TextStyle(fontSize: 17,fontWeight: FontWeight.w500)),
                      onTap: (){

                      },
                    ),
                    ListTile(
                      leading: Icon(Icons.art_track),
                      title: Text("Exhibitions",style: TextStyle(fontSize: 17,fontWeight: FontWeight.w500)),
                      onTap: (){

                      },



                    ),

                    ListTile(
                      leading: Icon(Icons.support_agent),
                      title: Text("Help and Support",style: TextStyle(fontSize: 17,fontWeight: FontWeight.w500)),
                      onTap: (){

                      },
                    ),
                    ListTile(
                      leading: Icon(Icons.exit_to_app),
                      title: Text("Exit",style: TextStyle(fontSize: 17,fontWeight: FontWeight.w500)),
                      onTap: (){
                              _auth.signOut();
                              Navigator.push(context, MaterialPageRoute(builder: (context)=>MyHomePage()));

                      },
                    )

                  ],
                ),
              );
            } else if (snapshot.hasError) {
              return Text('User not found');
            } else {
              return Text('Something went wrong');
            }
          } else {
            // Return Center widget to display CircularProgressIndicator in the center
            return Center(
              child: CircularProgressIndicator(),
            );
          }
        },
      ),
    );
  }

  Future<User_model?> getData() async {
    final email = authrepo.firebaseUser.value?.email;
    if (email != null) {
      return await UserRepo.getUserDetail(email);
    }
    return null; // Handle the case where email is null
  }
}
