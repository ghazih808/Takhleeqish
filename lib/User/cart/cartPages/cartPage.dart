import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_slidable/flutter_slidable.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:takhleekish/User/cart/cartDatabase/cartModel.dart';
import 'package:takhleekish/User/cart/cartDatabase/cartRepository.dart';

import '../../../Artist/artistPersonal/artist_authentication.dart';
import '../../../Artist/auction/auctionModel.dart';
import '../../../Artist/controllers/artist_controller.dart';

class CartPage extends StatefulWidget
{

  @override
  State<CartPage> createState() => _CartPageState();
}

class _CartPageState extends State<CartPage> {
  var email;

  num bill=0;

  final cartRepo=Get.put(CartRepo());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xffF0A2C9),
      appBar: AppBar(
        title: Row(
            children:[
              Center(
                child: const Text(
                  "Cart",
                  style: TextStyle(
                    color: Colors.white,
                    fontWeight: FontWeight.w600,
                    fontSize: 30,
                  ),
                ),
              ),
              SizedBox(
                width: 5,
              ),
              Icon(Icons.shopping_cart,color: Colors.white,)

            ]

        ),
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
      ),
      body: FutureBuilder(
        future: getAllData(),
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.done) {
            if (snapshot.hasData) {
              return Scaffold(
                body: Container(
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
                  child: Padding(
                    padding: const EdgeInsets.all(16.0),
                    child: Column(
                      children: [
                        Expanded(
                          child: ListView.separated(
                            itemCount: snapshot.data!.length, // Number of auction (fetch from the database)
                            itemBuilder: (context, index) {
                              num price = num.parse(snapshot.data![index].price);
                              print(price);
                              bill+=price;
                              print(bill);
                              return Slidable(
                                actionPane: SlidableDrawerActionPane(),
                                actionExtentRatio: 0.25,
                                child: Container(
                                  decoration: BoxDecoration(
                                    color: Colors.white,
                                    borderRadius: BorderRadius.circular(15.0),
                                  ),
                                  child: ListTile(
                                    leading: ClipOval(child: Image.network(snapshot.data![index].url)),
                                    title: Text('Cost:  ${snapshot.data![index].price}'),
                                    subtitle: Text('Name:  ${snapshot.data![index].name}'),
                                    trailing: IconButton(
                                      onPressed: () {},
                                      icon: Icon(Icons.delete),
                                    ),
                                  ),
                                ),
                              );
                            },
                            separatorBuilder: (BuildContext context, int index) => const Divider(),
                          ),
                        ),
                      ],
                    ),
                  ),
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
      bottomNavigationBar: Container(
        width: double.infinity, // Match the width of the screen
        height: 150,
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.only(
            topLeft: Radius.circular(40.0),
            topRight: Radius.circular(40.0),
          ),
        ),

        child: Column(
          children: [

            Padding(
              padding: const EdgeInsets.only(top: 12.0,left: 29),
              child: Row(children:[
                Text("Subtotal                                     ",style: TextStyle(fontWeight: FontWeight.bold,fontSize: 18),),
                Text("RS ${bill}",style: TextStyle(fontWeight: FontWeight.bold,fontSize: 18),),
          ])),
            Padding(
                padding: const EdgeInsets.only(top: 5.0,left: 29),
                child: Row(children:[
                  Text("Discount                                    ",style: TextStyle(fontWeight: FontWeight.bold,fontSize: 18),),
                  Text("RS 0",style: TextStyle(fontWeight: FontWeight.w500,fontSize: 18),),
                ])),
            Padding(
                padding: const EdgeInsets.only(top: 5.0,left: 29),
                child: Row(children:[
                  Text("Total                                           ",style: TextStyle(fontWeight: FontWeight.bold,fontSize: 18),),
                  Text("RS ${bill}",style: TextStyle(fontWeight: FontWeight.bold,fontSize: 18),),
                ])),

            ElevatedButton(
              onPressed: () {


              },
              child: Text('Checkout',style: TextStyle(color: Colors.white,fontSize: 20)),
              style: ElevatedButton.styleFrom(
                backgroundColor: Color(0xffF0A2C9),
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(15)
                ),),
            ),
          ],
        ),
      ),
    );

  }

  Future<List<Cart_model>> getAllData() async {
    return await cartRepo.getAllCartDetail();
  }
  void _updateBill(num price) {
    setState(() {
      bill += price;
    });
  }

  @override
  void initState() {
    super.initState();
    _calculateBill();
  }

  void _calculateBill() async {
    List<Cart_model> data = await getAllData();
    num totalPrice = 0;
    for (var item in data) {
      totalPrice += num.parse(item.price);
    }
    _updateBill(totalPrice);
  }
}