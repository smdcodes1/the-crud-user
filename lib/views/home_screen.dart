import 'dart:convert';
import 'dart:developer';
import 'package:crud_user/model/usermodel.dart';
import 'package:crud_user/views/adduser_page.dart';
import 'package:crud_user/webservice/webservice.dart';
import 'package:crud_user/widgets/user_card.dart';
import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

class HomeScreen extends StatelessWidget {
 HomeScreen({super.key});
  bool _isDeleting= false;
  
  
//  Future<void> deleteUser(String id) async {
//   try {
//     final response= await http.post(
//       Uri.parse('https://crud-f621.onrender.com/api/user/delete'),
//       body: {
//         "_id": id
//       }
//       // headers: {
//       //  'Content-Type': 'application/json',
//       //   'Accept': 'application/json',
//       // },
//     );
//     // print(response.statusCode.toString());
//     // print(response.body.toString());
//     if (response.statusCode == 200) {
//       // var resposne= json.decode(response.body);
//       if (response.body.contains("Success")) {
//         log('user deleted');
//       } else {
//         log('user not deleted');
//       }
//     } else {
//       throw Exception('failed to load users');
//     }
//   } catch (e) {
//     log(e.toString());
//   }
//  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xffe8e8e8),
      appBar: AppBar(
        title: Text("CRUD User", style: TextStyle(color: Colors.white),),
        elevation: 10,
        backgroundColor: Colors.cyan,
      ),
    body: FutureBuilder(
      future: Webservice.fetchUsers(), 
      builder: (context, snapshot) {
      if (snapshot.hasData) {
        return ListView.separated(
      shrinkWrap: true,
      scrollDirection: Axis.vertical,
      physics: BouncingScrollPhysics(),
      itemBuilder: (context, index) {
        return Padding(
          padding: const EdgeInsets.all(9),
          child: UserCard(
            name: snapshot.data![index].name, 
            email: snapshot.data![index].email, 
            address: snapshot.data![index].address)
        );
      }, 
      separatorBuilder: (context, index) {
        return SizedBox(height: 6,);
      }, 
      itemCount: snapshot.data!.length);
        } else {
          return const Center(child: CircularProgressIndicator());
        }
      },),
    floatingActionButton: FloatingActionButton(
     onPressed: () {
      Navigator.pushReplacement(context, MaterialPageRoute(builder: (context) => AddUserPage(),));
     }, 
     shape: CircleBorder(side: BorderSide.none),
     backgroundColor: Colors.cyan,
     child: Center(
      child: Icon(Icons.add, color: Colors.white,)),),
    );
  }
}