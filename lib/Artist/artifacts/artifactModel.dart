import 'package:cloud_firestore/cloud_firestore.dart';

class Artifact_model{
  final String? id;
  final String ArtistId;
  final String name;
  final String price;
  final String category;
  final String description;
  final String url;
  const Artifact_model(
      {
        this.id,
        required this.name,
        required this.ArtistId,
        required this.price,
        required this.category,
        required this.description,
        required this.url
      });
  toJson(){
    return{
      'Name':name,
      'Category':category,
      'Price':price,
      'Detail':description,
      'Artist_ID':ArtistId,
      'Url':url,
    };}

  factory Artifact_model.fromSnapshot(DocumentSnapshot<Map<String,dynamic>> documentSnapshot)
  {
    final data=documentSnapshot.data()!;
    return Artifact_model(
        id: documentSnapshot.id,
        name: data["Name"], price: data["Price"], category: data["Category"], description: data["Detail"], ArtistId: data["Artist_ID"], url: data['Url'],);
  }


}