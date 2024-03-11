import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:get/get.dart';
import 'package:takhleekish/User/Navbar/userNavbar.dart';
import 'package:takhleekish/User/cart/cartDatabase/cartModel.dart';

import '../cart/cartDatabase/cartController.dart';

class DetailProductPage extends StatefulWidget {
  final String url;
  final String description;
  final String price;
  final String name;
  final String artistID;
  final String category;



  DetailProductPage(this.url, this.price, this.description, this.name,this.category,this.artistID);

  @override
  _DetailProductPageState createState() => _DetailProductPageState();
}

class _DetailProductPageState extends State<DetailProductPage> {
  bool isFavorited = false;
  final cartController=Get.put(CartController());
  @override
  Widget build(BuildContext context) {
    double pageWidth = MediaQuery.of(context).size.width;
    return Scaffold(
      drawer: UserNavbar(),
      appBar: AppBar(
        title: const Text("Detail Page",
            style: TextStyle(
                color: Colors.white,
                fontWeight: FontWeight.w600,
                fontSize: 30)),
        centerTitle: true,
        backgroundColor: Colors.transparent,
        elevation: 0,
        flexibleSpace: Container(
          decoration: BoxDecoration(
            gradient: LinearGradient(
              begin: Alignment.centerLeft,
              end: Alignment.centerRight,
              colors: [
                Color(0xffF0A2C9),
                Color(0xffD2A5D0),
                Color(0xff6F9BB4),

              ],
            ),
          ),
        ),
        actions: <Widget>[
          IconButton(
            onPressed: () {},
            icon: FaIcon(FontAwesomeIcons.cartShopping, color: Colors.white),
          ),
        ],
      ),
      body: SingleChildScrollView(
        child: Stack(
          children: [
            Container(
              width: double.infinity,
              height: 880,
              child:Image.asset("assests/images/dbpic2.jpeg",
                fit: BoxFit.fitHeight,
              ),
              //add background image here
            ),
            Padding(
              padding: const EdgeInsets.all(20.0),
              child: Hero(
                tag: "Detail",
                child: Column(
                  children: [
                    Container(child: Image.network(widget.url)),
                    SizedBox(height: 3,),
                    Row(
                      children: [
                        IconButton(
                          icon: Icon(
                            isFavorited ? Icons.favorite : Icons.favorite_border,
                            color: isFavorited ? Colors.red : Colors.grey,
                            size: 30,
                          ),
                          onPressed: () {
                            setState(() {
                              isFavorited = !isFavorited;
                            });
                          },
                        ),
                      SizedBox(
                        width: 60,
                      ),
                      Text("Rs: ${widget.price}",
                       style: TextStyle(fontSize: 25, fontWeight: FontWeight.w500),
          )
            ],
                    ),
                    SizedBox(height: 3,),
                    Row(
                      children: [
                        Text("Name:  ", style: TextStyle(fontSize: 20, fontWeight: FontWeight.w600),),
                        Text("${widget.name}",
                          style: TextStyle(fontSize: 18, fontWeight: FontWeight.w500),
                        ),
                      ],
                    ),
                    SizedBox(height: 5,),
                    Align(
                      alignment: Alignment.centerLeft,
                      child: Text("About:", style: TextStyle(fontSize: 20, fontWeight: FontWeight.w600),),
                    ),
                    SizedBox(height: 5,),
                    Align(
                      alignment: Alignment.centerLeft,
                      child: Text("${widget.description}",
                        style: TextStyle(fontSize: 15, fontWeight: FontWeight.w400),
                      ),
                    ),
                    SizedBox(height: 60,),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [

                        Container(
                          height: 50,
                          width: 170,
                          child: ElevatedButton(
                            onPressed: () {},
                            child: Text("Purchase now",
                              style: TextStyle(
                                  color: Colors.white,
                                  fontWeight: FontWeight.w800,
                                  fontSize: 18),
                            ),
                            style: ElevatedButton.styleFrom(
                                backgroundColor: Colors.green,
                                shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(15.0)
                                )
                            ),
                          ),
                        ),
                        Container(
                          height: 50,
                          width: 170,
                          child: ElevatedButton(
                            onPressed: () {
                              final cart=Cart_model(name: widget.name,
                                  ArtistId: widget.artistID,
                                  price: widget.price,
                                  category: widget.category,
                                  description: widget.description,
                                  url: widget.url);
                              cartController.createCart(cart);
                            },
                            child: Text("Add to cart",
                              style: TextStyle(
                                  color: Colors.white,
                                  fontWeight: FontWeight.w800,
                                  fontSize: 18),
                            ),
                            style: ElevatedButton.styleFrom(
                                backgroundColor: Colors.yellow,
                                shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(15.0)
                                )
                            ),
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}