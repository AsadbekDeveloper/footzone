import 'dart:convert';
import 'package:flutter/cupertino.dart';
import 'package:http/http.dart' as http;

import 'field_model.dart';

class Fields extends ChangeNotifier {
  List<FieldModel> _fields = [];

  get getFields {
    return _fields;
  }

  FieldModel indexField(index) {
    return _fields[index];
  }

  void addToProvider(String key, Map<String, dynamic> json) async {
    _fields.add(FieldModel.fromJson(key, json));
  }

  Future<void> initialFire() async {
    final url = Uri.https(
        'football-booking-c8d9c-default-rtdb.firebaseio.com', '/fields.json');
    try {
      final response = await http.get(url);
      if (response.statusCode == 200) {
        final fieldJson = Map.from(jsonDecode(response.body));
        if (_fields.isEmpty) {
          fieldJson.forEach((key, value) {
            addToProvider(key, value);
          });
        }
      }
      notifyListeners();
    } catch (e) {
      print(e);
    }
  }

  //* TODO: Registering the new field

  // void addField(Map<String, dynamic> json) async {
  //   final url = Uri.https(
  //       'football-booking-c8d9c-default-rtdb.firebaseio.com', '/fields.json');
  //   try {
  //     await http.post(url, body: jsonEncode(json)).then((value) {
  //       print(value.body);
  //       return _fields.add(
  //         Field.fromJson({
  //           'Id': jsonDecode(value.body)['name'],
  //           'Name': json['Name'],
  //           'Town': json['Town'],
  //           'Capacity': json['Capacity'],
  //           'Price': json['Price'],
  //           'Owner': json['Owner'],
  //           'PhoneNumber': json['PhoneNumber'],
  //           'IsOpen': json['IsOpen'],
  //           'Info': json['Info'],
  //           'Latitude': json['Latitude'],
  //           'Longitude': json['Longitude'],
  //         }),
  //       );
  //     });
  //   } catch (e) {
  //     print('hi');
  //   }
  // }

}
