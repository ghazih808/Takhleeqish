import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:takhleekish/Artist/throughNavbar/AnalyticsPage/barGraph/BarGraph.dart';

import '../../artifacts/artifactModel.dart';
import '../../artifacts/artifactRepository.dart';
import '../../artistPersonal/artist_authentication.dart';
import '../../artistPersonal/artist_model.dart';
import '../../artistPersonal/artist_repository.dart';





class ArtistAnalyticsPage extends StatefulWidget {
  @override
  State<ArtistAnalyticsPage> createState() => _ArtistAnalyticsPageState();
}

class _ArtistAnalyticsPageState extends State<ArtistAnalyticsPage> {
  @override
  double abstractCount=5;

  double landscapeCount=0;

  double portraitCount=2;

  double StillLifeCount=8;

  double ModernArtCount=0;

  double ContemporaryCount=4;
  void initState() {
    super.initState();
  }
  final authrepo = Get.put(Artist_Auth());

  final artistRepo = Get.put(Artist_repo());

  final artifactRepo = Get.put(Artifact_repo());

  var dp;

  var email;



  @override
  Widget build(BuildContext context) {
    return Scaffold(

        body: FutureBuilder(
          future: getData(),
          builder: (context, snapshot) {
            if (snapshot.connectionState == ConnectionState.done) {
              if (snapshot.hasData) {
                Artist_model artistModel = snapshot.data!;
                dp = snapshot.data!.url;
                email=snapshot.data!.email;
                return FutureBuilder(
                  future: getAllData(email),
                  builder: (context, snapshot) {
                    if (snapshot.connectionState == ConnectionState.done) {
                      if (snapshot.hasData) {

                        for(int i=0;i< snapshot.data!.length;i++)
                          {
                            if(snapshot.data![i].category=="Abstract" && snapshot.data![i].saleCheck=="true" )
                              abstractCount++;
                            if(snapshot.data![i].category=="Landscape"&& snapshot.data![i].saleCheck=="true")
                              landscapeCount++;
                            if(snapshot.data![i].category=="Portrait"&& snapshot.data![i].saleCheck=="true")
                              portraitCount++;
                            if(snapshot.data![i].category=="Still Life"&& snapshot.data![i].saleCheck=="true")
                              StillLifeCount++;
                            if(snapshot.data![i].category=="Modern Art"&& snapshot.data![i].saleCheck=="true")
                              ModernArtCount++;
                            if(snapshot.data![i].category=="Contemporary"&& snapshot.data![i].saleCheck=="true")
                              ContemporaryCount++;
                          }

                        print(ModernArtCount);
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
                            child:Padding(
                          padding: const EdgeInsets.all(16.0),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.stretch,
                            children: [
                              SizedBox(height: 16),
                              Center(

                                child: Container(
                                  width: 200,
                                  height: 200,
                                  child: CircleAvatar(
                                    child: ClipOval(
                                      child: Image.network(dp),
                                    ),
                                  ),

                                ),
                              ),
                              SizedBox(height: 30),
                              Text("Sales per Category:",style: TextStyle(fontSize: 18,fontWeight: FontWeight.w500),),
                              SizedBox(height: 30),
                              Container(
                                height: 250,
                                child: BarGraph(AbstractAmount: abstractCount, landscapeAmount: landscapeCount,
                                  portraitAmount: portraitCount, StillLifeAmount: StillLifeCount,
                                  ModernArtAmount: ModernArtCount, ContemporaryAmount: ContemporaryCount,
                                ),

                              )

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
                    }
                    else {
                      // Return Center widget to display CircularProgressIndicator in the center
                      return Center(
                        child: CircularProgressIndicator(),
                      );
                    }
                  },
                );

              } else if (snapshot.hasError) {
                return Text('User not found');
              } else {
                return Text('Something went wrong');
              }
            }
            else {
              // Return Center widget to display CircularProgressIndicator in the center
              return Center(
                child: CircularProgressIndicator(),
              );
            }
          },
        )

    );
  }

  Future<Artist_model?> getData() async {
    final email = authrepo.firebaseUser.value?.email;
    if (email != null) {
      return await artistRepo.getArtistDetail(email);
    }
    return null; // Handle the case where email is null
  }

  Future<List<Artifact_model>> getAllData(String email) async {
    return await artifactRepo.getSpecificArtistArtifacttDetail(email);
  }
}


