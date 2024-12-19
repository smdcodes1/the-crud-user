import 'dart:convert';
import 'dart:developer';

import 'package:crud_user/model/usermodel.dart';
import 'package:crud_user/views/home_screen.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
class Webservice {
  
  static Future<List<UserModel>?> fetchUsers() async {
  try {
    final response= await http.get(
      Uri.parse('https://crud-f621.onrender.com/api/user/viewcreatedusers'),
      headers: {
       'Content-Type': 'application/json',
        'Accept': 'application/json',
      },
    );
    // print(response.statusCode.toString());
    // print(response.body.toString());
    if (response.statusCode == 200) {
      final parsed= json.decode(response.body).cast<Map<String, dynamic>>();
      return parsed
             .map<UserModel>((json) => UserModel.fromJson(json))
             .toList();
    } else {
      throw Exception('failed to load users');
    }
  } catch (e) {
    log(e.toString());
  }
 }

 static Future<void> addUser(BuildContext context, String name, String email, String address) async {

    try {
      final response = await http.post(
        Uri.parse('https://crud-f621.onrender.com/api/user/create'),
        headers: {'Content-Type': 'application/json'},
        body: jsonEncode(
          {
          "name": name,
          "email": email,
          "address": address
        }
        ),
      );
      // log(response.statusCode.toString());
      // log(response.body.toString());
      if (response.statusCode == 200) {
       if (response.body.contains("User alredy exists")) {
        ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
          duration: Duration(seconds: 3),
          behavior: SnackBarBehavior.floating,
          padding: EdgeInsets.all(15),
          content: Text('User not added'),
          // backgroundColor: Color.fromARGB(255, 175, 5, 152),
          ));
        log('user not added');
       }
      } else {
        ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
          duration: Duration(seconds: 3),
          behavior: SnackBarBehavior.floating,
          padding: EdgeInsets.all(15),
          content: Text('User added'),
          // backgroundColor: Color.fromARGB(255, 175, 5, 152),
          ));
        log('user added');
        Navigator.pushReplacement(context, MaterialPageRoute(builder: (context) => HomeScreen(),));
      }
    } catch (e) {
      log("Exception: $e");
    
    }
  }
}