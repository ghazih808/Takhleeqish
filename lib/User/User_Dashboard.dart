import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:get/get.dart';
import 'package:takhleekish/Artist/artifacts/artifactModel.dart';
import 'package:takhleekish/Artist/artifacts/artifactRepository.dart';
import 'package:takhleekish/Artist/navbar.dart';
import 'package:takhleekish/User/detailProductPage.dart';
import 'package:takhleekish/User/userNavbar.dart';

class User_dashboard extends StatelessWidget {
  final artifactRepo = Get.put(Artifact_repo());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: UserNavbar(),
      appBar: AppBar(
        title: const Text("Dashboard", style: TextStyle(color: Colors.white, fontWeight: FontWeight.w600, fontSize: 30)),
        centerTitle: true,
        backgroundColor: Colors.black,
      ),
      body: FutureBuilder<List<Artifact_model>>(
        future: getAllData(),
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.done) {
            if (snapshot.hasData) {
              return SingleChildScrollView(
                child: ListView.builder(
                  scrollDirection: Axis.vertical,
                  physics: NeverScrollableScrollPhysics(),
                  shrinkWrap: true,
                  itemCount: (snapshot.data!.length / 2).ceil(), // Calculate the number of rows
                  itemBuilder: (context, rowIndex) {
                    return Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 8.0),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          for (int i = rowIndex * 2; i < (rowIndex * 2) + 2; i++)
                            if (i < snapshot.data!.length)
                              Container(
                                child: Padding(
                                  padding: const EdgeInsets.only(top: 12.0,left: 12,right: 12),
                                  child: Container(
                                    width: 145,
                                    child: InkWell(
                                      child: Hero(
                                        tag: "Detail",
                                        child: Card(
                                          color: Colors.white,
                                          elevation: 7,
                                          shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(15.0)),
                                          child: Column(
                                            children: [
                                              Container(
                                                height: 120,
                                                child: Padding(
                                                  padding: const EdgeInsets.only(top: 8.0),
                                                  child: Image.network(snapshot.data![i].url),
                                                ),
                                              ),
                                              SizedBox(height: 2),
                                              Text("${snapshot.data![i].name}", style: TextStyle(fontSize: 20, fontWeight: FontWeight.w600)),
                                              SizedBox(height: 2),
                                              Text("Rs: ${snapshot.data![i].price}", style: TextStyle(fontSize: 15, fontWeight: FontWeight.w600)),
                                              Text("", style: TextStyle(fontSize: 10, fontWeight: FontWeight.w600)),
                                            ],
                                          ),
                                        ),
                                      ),
                                      onTap: (){
                                        Navigator.push(context, MaterialPageRoute(builder: (context)=>DetailProductPage(snapshot.data![i].url, snapshot.data![i].price, snapshot.data![i].description, snapshot.data![i].name)));
                                      },
                                    ),
                                  ),
                                ),
                              ),
                        ],
                      ),
                    );
                
                
                  },
                ),
              );
            } else if (snapshot.hasError) {
              print({snapshot.hasError});
              return Text('Data not found');
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

  Future<List<Artifact_model>> getAllData() async {
    return await artifactRepo.getAllArtifacttDetail();
  }
}
