import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:takhleekish/Artist/artistPersonal/art_signup.dart';
import 'package:takhleekish/Artist/throughDashboard/artistDashboard.dart';
import 'package:takhleekish/Artist/forgot_Password/forgotPage.dart';
import 'package:takhleekish/main.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:shared_preferences/shared_preferences.dart';
import '../controllers/artist_controller.dart';
import '../controllers/artist_login_controller.dart';
class Artist_login extends StatefulWidget{
  const Artist_login({Key? key}) : super(key: key);
  @override
  State<Artist_login> createState() => _Artist_loginState();
}

class _Artist_loginState extends State<Artist_login> {
  @override
  Widget build(BuildContext context) {
    bool rememberMe = false;
    var flag=false;
    final formkey=GlobalKey<FormState>();
    final ArtitstLoginController loginController=ArtitstLoginController();
    final errorText = Obx(() => Text(
      loginController.errorMessage.value,
      style: TextStyle(color: Colors.red),
    ));
    // void _loadSavedData() async {
    //   SharedPreferences prefs = await SharedPreferences.getInstance();
    //   setState(() {
    //     loginController.Aremail.text = prefs.getString('email') ?? '';
    //     loginController.Arpass.text = prefs.getString('password') ?? '';
    //     rememberMe = loginController.Aremail.text.isNotEmpty && loginController.Arpass.text.isNotEmpty;
    //   });
    // }

    return(
        Scaffold(
          body:  Center(
            child: Container(
              width: 320,
              height: 500,

              decoration: BoxDecoration(
                  gradient: LinearGradient(
                      colors: [
                        Color(0xfff794a4),
                        Color(0xfffdd6bd)
                      ],
                      begin: FractionalOffset(1.0,0.0),
                      end: FractionalOffset(0.0,1.0)

                  ),
                  borderRadius: BorderRadius.circular(15.0)
              ),
              child: SingleChildScrollView(
                child: Form(
                  key: formkey,
                  child: Column(
                    children: [
                      Padding(
                        padding: const EdgeInsets.only(top: 45.0,bottom: 74.0),
                        child: Text("Takhleeqish",style: TextStyle(fontSize: 45,fontFamily:'main',fontWeight: FontWeight.w600),),
                      ),
                      Container(
                        width: 280,
                        height: 45,
                        child: TextFormField(
                          controller: loginController.Aremail,
                          validator:(value){
                            if(value!.isEmpty || !RegExp(r'^[\w-\.]+@([\w-]+\.)+[\w-]{2,4}').hasMatch(value!))
                            {
                              return 'Enter correct Email';
                            }
                            else{
                              loginController.Aremail.text=value;
                            }
                          },
                          decoration: InputDecoration(
                            focusedBorder: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(15.0),
                                borderSide: BorderSide(
                                  width: 2,
                                  color: Color(0xfff77062),
                                )

                            ),
                            enabledBorder: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(15.0),
                                borderSide: BorderSide(
                                  color: Colors.blue,
                                )
                            ),
                            prefixIcon: Icon(Icons.mail,color: Colors.black,),
                            labelText: "Enter Email",
                          ),

                        ),
                      ),
                      Container(
                        height: 20,
                      ),
                      Container(
                        width: 250,
                        height: 45,
                        child: TextFormField(
                          controller: loginController.Arpass,
                          obscureText:true,
                          decoration: InputDecoration(
                            focusedBorder: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(15.0),
                              borderSide: BorderSide(
                                width: 2,
                                color: Color(0xfff77062),
                              ),

                            ),
                            enabledBorder: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(15.0),
                                borderSide: BorderSide(
                                  color: Colors.blue,
                                )
                            ),
                            prefixIcon: Icon(Icons.lock,color: Colors.black,),
                            labelText: "Enter Password",
                          ),
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.only(bottom: 0.0),
                        child: Container(
                            child: TextButton(onPressed: () {
                              Navigator.push(context, MaterialPageRoute(builder: (context)=>Forgot_Page()));
                            },
                                child:Text("Forgot Password?",style: TextStyle(color: Colors.blue),))),
                      ),
                      Padding(
                          padding: const EdgeInsets.only(bottom: 4.0),
                          child: Container(
                            width: 200,
                            child: ElevatedButton(onPressed: (){
                              if(formkey.currentState!.validate()) {
                                loginController.setOnLoginSuccess(() {

                                    Get.offAll(() => ArtistDashboard());

                                });
                                loginController.login();
                                if (rememberMe) {
                                  // Store the email and password
                                  // You can use a secure storage solution like flutter_secure_storage or shared_preferences
                                  // For simplicity, I'll use shared_preferences for demonstration purposes
                                  SharedPreferences.getInstance().then((prefs) {
                                    prefs.setString('email', loginController.Aremail.text);
                                    prefs.setString('password', loginController.Arpass.text);
                                  });
                                }
                                loginController.Aremail.clear();
                                loginController.Arpass.clear();
                              }
                            }, child: Text("Login",style: TextStyle(color: Colors.black,fontWeight: FontWeight.w500,fontSize: 20),),
                              style: ElevatedButton.styleFrom(
                                backgroundColor: Colors.white,
                                shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(15)
                                ),
                              ),
                            ),
                          )),
                      errorText,
                      Row(
                        children: [
                          Padding(
                            padding: const EdgeInsets.only(left: 30.0),
                            child: Text("Don't have an account?",style: TextStyle(fontWeight: FontWeight.w400),),
                          ),
                          TextButton(onPressed: (){
                            Get.offAll(()=>Art_Signup());
                          }, child: Text("Sign Up",style: TextStyle(color: Colors.blue),))
                        ],
                      )
                    ],
                  ),
                ),
              ),
            ),
          )
        )
    );
  }
}