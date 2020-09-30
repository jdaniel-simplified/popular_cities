import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:popular_cities/models/cities_model.dart';

///
//
/// @About:     
// @File:       cities_repository.dart 
// @Date:       09-29-20
// @Version:    popular_cities 1.0
// @Developer:  José Daniel Quijano (jose.quijano55@gmail.com)
//
///

class CitiesRepository
{
  Future<List<City>> getCities(bool desc) async
  {
    List<City> cities = [];

    await FirebaseFirestore.instance
        .collection('cities')
        .orderBy('likes', descending: desc)
        .get()
        .then((QuerySnapshot querySnapshot) => {
          querySnapshot.docs.forEach((doc) {
            //print(doc.data()['name']);
            cities.add(City.fromJson(doc.data()));
          })
    });

    return cities;
  }

  Future addLike(City c) async
  {
    FirebaseFirestore.instance
        .collection('cities')
        .doc(c.id)
        .update({'likes': c.likes})
        .then((value) => print('City updated'))
        .catchError((error) => print('Failed to update city: $error'));
  }
}