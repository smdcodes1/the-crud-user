import 'dart:convert';
import 'dart:developer';
import 'package:http/http.dart' as http;
import 'package:flutter/material.dart';

class UpdateUserPage extends StatelessWidget {
 UpdateUserPage({super.key});
  bool _isProcessing= false;
  TextEditingController _usernameController= TextEditingController();
  TextEditingController _emailController= TextEditingController();
  TextEditingController _controllerAddress= TextEditingController();
  GlobalKey<FormState> _updateItemKey= GlobalKey();

//   Future<void> updateUser(String name, String email, String address) async {
//   try {
//     final response= await http.post(
//       Uri.parse('https://crud-f621.onrender.com/api/user/update/:id'),
//       body: {
//         "name": name,
//         "email": email,
//         "address": address,
//       }
//       // headers: {
//       //  'Content-Type': 'application/json',
//       //   'Accept': 'application/json',
//       // },
//     );
//     // print(response.statusCode.toString());
//     // print(response.body.toString());
//     if (response.statusCode == 200) {
//       var resposne= json.decode(response.body).cast<Map<String, dynamic>>();
//       if (resposne["msg"] == "Success") {
//         log('user updated');
//       } else {
//         log('user not updated');
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
      appBar: AppBar(
        title: Text("CRUD User", style: TextStyle(color: Colors.white, fontWeight: FontWeight.normal),),
        elevation: 10,
        backgroundColor: Colors.cyan,
      ),
      body: SingleChildScrollView(
        child: Column(children: [
         SizedBox(height: 10,),
         editItemForm(
          updateItemKey: _updateItemKey,
          usernameController: _usernameController,
          emailController: _emailController,
          controllerAddress: _controllerAddress,
         ),
         SizedBox(height: 40,),
         _isProcessing ? Padding(
           padding: const EdgeInsets.all(8.0),
           child: Center(child: CircularProgressIndicator()),
         )
         : Container(
          height: 50,
          width: MediaQuery.of(context).size.width / 2,
          decoration: BoxDecoration(
                      color: Colors.lightBlue,
                      borderRadius: BorderRadius.circular(25)),
          child: TextButton(
            onPressed: () {}, 
            child: Text('Update Item', style: TextStyle(color: Colors.white),)),
         )
        ],),
      ),
    );
  }
}

class editItemForm extends StatelessWidget {
  editItemForm(
      {super.key,
      required this.usernameController,
      required this.emailController,
      required this.controllerAddress,
      required this.updateItemKey,
      });
  

  TextEditingController usernameController= TextEditingController();

  TextEditingController emailController= TextEditingController();

  TextEditingController controllerAddress= TextEditingController();

   GlobalKey<FormState> updateItemKey= GlobalKey();

  
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Padding(
          padding: const EdgeInsets.all(8.0),
          child: TextFormField(
            validator: (value) {
              if (value!.isEmpty) {
                return 'please enter ur username';
              }
              return null;
            },
            controller: usernameController,
            cursorColor: Colors.black,
            decoration: InputDecoration(
              hintText: 'Enter the username',
              labelText: 'Username',
              disabledBorder: InputBorder.none,
              focusedBorder: OutlineInputBorder(
                borderRadius: BorderRadius.all(Radius.circular(10)),
              ),
            ),
            maxLines: 1,
            autofocus: true,
          ),
        ),
        SizedBox(
          height: 20,
        ),
          Padding(
          padding: const EdgeInsets.all(8.0),
          child: TextFormField(
            validator: (value) {
              if (value!.isEmpty) {
                return 'please enter ur email';
              }
              return null;
            },
            controller: emailController,
            cursorColor: Colors.black,
            decoration: InputDecoration(
              hintText: 'Enter the email',
              labelText: 'Email',
              disabledBorder: InputBorder.none,
              focusedBorder: OutlineInputBorder(
                borderRadius: BorderRadius.all(Radius.circular(10)),
              ),
            ),
            maxLines: 1,
    
          ),
        ),
        Padding(
          padding: const EdgeInsets.all(8.0),
          child: TextFormField(
            validator: (value) {
              if (value!.isEmpty) {
                return 'please enter ur address';
              }
              return null;
            },
            controller: controllerAddress,
            cursorColor: Colors.black,
            decoration: InputDecoration(
              hintText: 'Enter the address',
              labelText: 'Address',
              disabledBorder: InputBorder.none,
              focusedBorder: OutlineInputBorder(
                borderRadius: BorderRadius.all(Radius.circular(10)),
              ),
            ),
            maxLines: 4,
          ),
        ),

      
      ],
    );
  }
}