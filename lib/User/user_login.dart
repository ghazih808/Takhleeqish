import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:takhleekish/User/User_Dashboard.dart';
import 'package:takhleekish/User/controllers/login_controller.dart';
import 'package:takhleekish/User/controllers/user_controller.dart';
import 'package:takhleekish/User/forgot_Password/forgotPage.dart';
import 'package:takhleekish/User/user_signup.dart';
import 'package:takhleekish/main.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
class User_login extends StatefulWidget{
  const User_login({Key? key}) : super(key: key);
  @override
  State<User_login> createState() => _User_loginState();
}

class _User_loginState extends State<User_login> {
  @override
  Widget build(BuildContext context) {

    var flag=false;
    final formkey=GlobalKey<FormState>();
    final controller=Get.put(User_Controller());
    final LoginController loginController=LoginController();
    final errorText = Obx(() => Text(
      loginController.errorMessage.value,
      style: TextStyle(color: Colors.red),
    ));
   return(
   Scaffold(
     body: Center(
       child: Card(
         elevation: 7,
         shape: RoundedRectangleBorder(
             borderRadius: BorderRadius.circular(15.0)
         ),
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
                       controller: loginController.Usemail,
                       validator:(value){
                         if(value!.isEmpty || !RegExp(r'^[\w-\.]+@([\w-]+\.)+[\w-]{2,4}').hasMatch(value!))
                         {
                           return 'Enter correct Email';
                         }
                         else{
                           loginController.Usemail.text=value;
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
                       controller: loginController.Uspass,
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
                               Get.offAll(()=>User_dashboard());
                             });
                             loginController.login();

                             loginController.Usemail.clear();
                             loginController.Uspass.clear();
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
                         Navigator.push(context, MaterialPageRoute(builder: (context)=> User_Signup()),);
                       }, child: Text("Sign Up",style: TextStyle(color: Colors.blue),))
                     ],
                   )
                 ],
               ),
             ),
           ),
         ),
       ),
     ),
   )
   );
  }
}