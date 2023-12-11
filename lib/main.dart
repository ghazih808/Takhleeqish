import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:takhleekish/Admin/adminDashboard/dashboard.dart';
import 'package:takhleekish/Artist/artistPersonal/art_signup.dart';
import 'package:takhleekish/Artist/navbar.dart';
import 'package:takhleekish/Artist/throughDashboard/artistDashboard.dart';
import 'package:takhleekish/Artist/throughDashboard/checkUser/verifyGmail.dart';
import 'package:takhleekish/Splash.dart';
import 'package:takhleekish/User/User_Dashboard.dart';
import 'package:takhleekish/User/User_authentication.dart';
import 'package:takhleekish/User/detailProductPage.dart';
import 'package:takhleekish/User/forgot_Password/forgotPage.dart';
import 'package:takhleekish/User/forgot_Password/resetPassword.dart';
import 'package:takhleekish/User/userNavbar.dart';
import 'package:takhleekish/User/user_login.dart';
import 'package:takhleekish/User/user_signup.dart';
import 'package:takhleekish/Artist/artistPersonal/art_login.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:takhleekish/firebase_options.dart';
import 'package:firebase_core/firebase_core.dart';
import 'Admin/manageExhibition.dart';
import 'Artist/throughDashboard/postArtifacts.dart';
import 'User/throughNavBar/auctions/ApprovedBids/approvedBidPage.dart';
import 'User/throughNavBar/auctions/requestAuction.dart';
// import 'User/throughNavBar/auctions/availableBids/userAuctionPage.dart';
import 'User/throughNavBar/feedbackPage/feedback.dart';
import 'User/throughNavBar/userExhibition/detailExhibationPage.dart';
import 'User/throughNavBar/userExhibition/userExhibitionPage.dart';
import 'User/throughNavBar/userSessions/selectPage.dart';



Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  ).then((value) => Get.put(User_Auth()));
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {

  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      theme: ThemeData(
        useMaterial3: true,
      ),
      home: FeedbackPage(),
    );
  }
}

class MyHomePage extends StatefulWidget {





  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {



  @override
  Widget build(BuildContext context) {
    // This method is rerun every time setState is called, for instance as done
    // by the _incrementCounter method above.
    //
    // The Flutter framework has been optimized to make rerunning build methods
    // fast, so that you can just rebuild anything that needs updating rather
    // than having to individually change instances of widgets.
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
          Center(
            child: Card(
              elevation: 7,
              shadowColor:Color(0xfff77062) ,
              shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(15.0)
              ),
              child: Container(
                width: 300,
                height: 500,
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(15.0),
                    gradient: LinearGradient(
                        colors: [
                          Color(0xfff794a4),
                          Color(0xfffdd6bd)
                        ],
                        begin: FractionalOffset(1.0,0.0),
                        end: FractionalOffset(0.0,1.0)

                    )

                ),
                child: Column(
                  children: [
                    Padding(
                      padding: const EdgeInsets.only(top: 60.0,bottom: 100.0),
                      child: Text("Takhleeqish",style: TextStyle(fontSize: 48,fontFamily:'main',fontWeight: FontWeight.w600),),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(bottom: 15.0),
                      child: Container(
                        width: 250,
                        height: 50,
                        child: ElevatedButton(onPressed:(){
                          Navigator.push(context, MaterialPageRoute(builder: (context)=>User_login()),);

                        }, child:Row(
                          children: [
                            Padding(
                              padding: const EdgeInsets.only(right:15.0),
                              child: FaIcon(FontAwesomeIcons.user,color: Colors.black,),
                            ),
                            Text("User",style: TextStyle(color: Colors.black,fontWeight: FontWeight.w800,fontSize: 18),),
                          ],
                        ),
                          style: ElevatedButton.styleFrom(
                              backgroundColor: Colors.white,
                              shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(15.0)
                              )
                          ),
                        ),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.all(15.0),
                      child: Container(
                        width: 250,
                        height: 50,
                        child: ElevatedButton(onPressed:(){
                          Navigator.push(context, MaterialPageRoute(builder: (context)=>Artist_login()),);
                        }, child:Row(
                          children: [
                            Padding(
                              padding: const EdgeInsets.only(right:15.0),
                              child: FaIcon(FontAwesomeIcons.paintbrush,color: Colors.black,),
                            ),
                            Text("Artist",style: TextStyle(color: Colors.black,fontWeight: FontWeight.w800,fontSize: 18),),
                          ],
                        ),
                          style: ElevatedButton.styleFrom(
                              backgroundColor: Colors.white,
                              shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(15.0)
                              )
                          ),
                        ),
                      ),
                    )
                  ],
                ),
              ),
            ),

          ),
        ],
      )



    );
  }
}
//hello trying