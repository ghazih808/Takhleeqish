
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:takhleekish/User/user_model.dart';
import 'package:takhleekish/User/user_repository.dart';

import '../../User_authentication.dart';


class UserUpdatePage extends StatelessWidget{
  final authrepo = Get.put(User_Auth());
  final auth=FirebaseAuth.instance;
  final UserRepo = Get.put(User_repo());
  String name='';
  String email='';
  String cnic='';

  @override
  Widget build(BuildContext context) {
    double screenHeight=MediaQuery.of(context).size.height;

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
        FutureBuilder(
          future: getData(),
          builder: (context, snapshot) {
            if (snapshot.connectionState == ConnectionState.done) {
              if (snapshot.hasData) {
                name=snapshot.data!.name;
                email=snapshot.data!.email;
                cnic=snapshot.data!.cnic;
                return Container(
                  child: Column(
                    children: [
                      SizedBox(
                        height:screenHeight*0.15,
                      ),
                      Center(
                        child: Container(
                          width: 200,
                          height: 200,
                          child: CircleAvatar(
                            child: ClipOval(
                              child: Image.network(snapshot.data!.url,fit: BoxFit.cover,),
                            ),
                          ),
                        ),
                      ),
                      SizedBox(
                        height:screenHeight*0.04,
                      ),
                      Text("Name:",style: TextStyle(fontSize: 20,fontWeight: FontWeight.bold),),
                      Text("$name",style: TextStyle(fontSize: 20,fontWeight: FontWeight.w400),),

                      SizedBox(
                        height:screenHeight*0.02,
                      ),
                      Text("Email:",style: TextStyle(fontSize: 20,fontWeight: FontWeight.bold),),
                      Text("$email",style: TextStyle(fontSize: 20,fontWeight: FontWeight.w400),),
                      SizedBox(
                        height:screenHeight*0.02,
                      ),
                      Text("Cnic:",style: TextStyle(fontSize: 20,fontWeight: FontWeight.bold),),
                      Text("$cnic",style: TextStyle(fontSize: 20,fontWeight: FontWeight.w400),),
                      SizedBox(
                        height:screenHeight*0.04,
                      ),
                      Container(
                        width: 200,
                        height: 50,
                        child: ElevatedButton(onPressed:() async {
                          await auth.sendPasswordResetEmail(email: email).then((value){
                            Get.snackbar("Congratulations", "Email to Update password has been sent to your gmail account",
                                snackPosition:SnackPosition.BOTTOM,
                                backgroundColor: Colors.green.withOpacity(0.6),
                                colorText: Colors.black);
                          });

                        }, child:Text("Update Password",style: TextStyle(color: Colors.white,fontWeight: FontWeight.w800,fontSize: 18),),

                          style: ElevatedButton.styleFrom(
                              backgroundColor: Colors.green,
                              shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(15.0)
                              )
                          ),
                        ),
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
        )
      ],
    )

      ,);
  }
  Future<User_model?> getData() async {
    final email = authrepo.firebaseUser.value?.email;
    if (email != null) {
      return await UserRepo.getUserDetail(email);
    }
    return null; // Handle the case where email is null
  }
}

