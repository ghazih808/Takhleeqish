

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:takhleekish/User/userNavbar.dart';

class DetailProductPage extends StatelessWidget{
  late String url;
  late String description;
  late String price;
  late String name;
  DetailProductPage(this.url,this.price,this.description,this.name);


  @override
  Widget build(BuildContext context) {
    double pageWidth=MediaQuery.of(context).size.width;
   return Scaffold(
     drawer: UserNavbar(),
     appBar: AppBar(
       title: const Text("Detail Page", style: TextStyle(color: Colors.white, fontWeight: FontWeight.w600, fontSize: 30)),
       centerTitle: true,
       backgroundColor: Colors.black,
       actions: <Widget>[
         IconButton(onPressed: (){}, icon: FaIcon(FontAwesomeIcons.cartShopping,color: Colors.white,))
       ],

   ),
     body: SingleChildScrollView(
       child: Stack(
         children: [
           Container(
             width: double.infinity,
             height: 880,
             child: Image.asset("assests/images/productDetail.jpeg"
               ,fit: BoxFit.fitHeight,),
             //add background image here
           ),
           Padding(
             padding: const EdgeInsets.all(20.0),
             child: Hero(
               tag: "Detail",
               child: Column(children: [
                 Container(child: Image.network(url)),
                 SizedBox(height: 3,),
                 Text("Rs: $price",style: TextStyle(fontSize: 25,fontWeight: FontWeight.w500),),
                 SizedBox(height: 3,),
                 Row(
                   children: [
                     Text("Name:  ",style: TextStyle(fontSize:20 ,fontWeight: FontWeight.w600),),
                     Text("$name",style: TextStyle(fontSize: 18,fontWeight: FontWeight.w500),),

                   ],
                 ),

                 SizedBox(height: 5,),

                 Align(
                     alignment: Alignment.centerLeft,
                     child: Text("About:",style: TextStyle(fontSize: 20,fontWeight: FontWeight.w600),)),

                 SizedBox(height: 5,),
                 Align(
                     alignment: Alignment.centerLeft,
                     child: Text("$description",style: TextStyle(fontSize: 15,fontWeight: FontWeight.w400),)),
                 SizedBox(height: 60,),
                 Container(
                   width: pageWidth*1.3,
                   child: Row(
                     children: [
                       Padding(
                         padding: const EdgeInsets.all(2.0),
                         child: Container(
                           width: 150,
                           height: 50,
                           child: ElevatedButton(onPressed:(){
                           }, child:Text("Buy",style: TextStyle(color: Colors.white,fontWeight: FontWeight.w800,fontSize: 18),),

                             style: ElevatedButton.styleFrom(
                                 backgroundColor: Colors.green,
                                 shape: RoundedRectangleBorder(
                                     borderRadius: BorderRadius.circular(15.0)
                                 )
                             ),
                           ),
                         ),
                       ),
                       Padding(
                         padding: const EdgeInsets.all(8.0),
                         child: Container(
                           width: 150,
                           height: 50,
                           child: ElevatedButton(onPressed:(){
                           }, child:Text("Add to cart",style: TextStyle(color: Colors.white,fontWeight: FontWeight.w800,fontSize: 18),),

                             style: ElevatedButton.styleFrom(
                                 backgroundColor: Colors.yellow,
                                 shape: RoundedRectangleBorder(
                                     borderRadius: BorderRadius.circular(15.0)
                                 )
                             ),
                           ),
                         ),
                       ),
                     ],
                   ),
                 ),
               ],),


             ),
           )
         ],
       ),
     ),
   );
  }

}