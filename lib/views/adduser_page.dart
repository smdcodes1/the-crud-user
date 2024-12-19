import 'dart:convert';
import 'dart:developer';

import 'package:crud_user/model/user.dart';
import 'package:crud_user/model/usermodel.dart';
import 'package:crud_user/webservice/webservice.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:http/http.dart' as http;

class AddUserPage extends StatelessWidget {
 AddUserPage({super.key});
  TextEditingController _usernameController= TextEditingController();
  TextEditingController _emailController= TextEditingController();
  TextEditingController _controllerAddress= TextEditingController();
  GlobalKey<FormState> _formKey= GlobalKey();
  bool _isProcessing= false;

  
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xffe8e8e8),
      appBar: AppBar(
        title: Text('Add User', style: TextStyle(color: Colors.white),),
        elevation: 10,
        backgroundColor: Colors.cyan,
      ),
    body: SingleChildScrollView(
      child: Form(
        key: _formKey,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            SizedBox(height: 10,),
            Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: TextFormField(
                    validator: (value) {
                      if (value!.isEmpty) {
                        return 'please enter your username';
                      }
                      return null;
                    },
                    controller: _usernameController,
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
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: TextFormField(
                    validator: (value) {
                      if (value!.isEmpty) {
                        return 'please enter your email';
                      }
                      return null;
                    },
                    controller: _emailController,
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
                  controller: _controllerAddress,
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
              SizedBox(height: 10,),
              _isProcessing ? Padding(
                padding: const EdgeInsets.all(8.0),
                child: Center(child: CircularProgressIndicator()),
              )
              : Container(
                height: 50,
                width: MediaQuery.of(context).size.width / 2,
                decoration: BoxDecoration(
                    color: Colors.cyan,
                    borderRadius: BorderRadius.circular(25)),
                child: TextButton(
                  onPressed: () {
                    if (_formKey.currentState!.validate()) {
                    Webservice.addUser(context, _usernameController.text, _emailController.text, _controllerAddress.text);
                    }
                  }, 
                  child: Text('Add User', style: TextStyle(color: Colors.white),)),
              )
          ],
        ),
      ),),
    );
  }
}