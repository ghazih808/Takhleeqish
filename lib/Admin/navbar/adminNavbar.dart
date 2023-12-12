import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:takhleekish/Admin/compainsCheck/complainDashboard.dart';

import '../../main.dart';

class AdminNavbar extends StatelessWidget{
  final FirebaseAuth _auth=FirebaseAuth.instance;
  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: Container(
        color: Colors.white,
        child: ListView(
          padding: EdgeInsets.zero,
          children: [
            UserAccountsDrawerHeader(accountName: Text("Ghazi Hussain"),
              accountEmail: Text("ghazih808@gmail.com"),
              currentAccountPicture: CircleAvatar(
                child: ClipOval(
                  child:Image.asset("assests/images/admin.png",fit: BoxFit.fill,)
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
              leading: FaIcon(FontAwesomeIcons.triangleExclamation),
              title: Text("Complaints",style: TextStyle(fontSize: 17,fontWeight: FontWeight.w500)),
              onTap: (){
              Navigator.push(context, MaterialPageRoute(builder: (context)=>ComplainDashboardPage()));
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

      ),
    );
  }

}