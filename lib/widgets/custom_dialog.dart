import 'package:flutter/material.dart';

void ShowDialog(BuildContext context) {
    
    showDialog(
      context: context,
      builder: (context) {
        return AlertDialog(
          elevation: 10,
          title: const Text('Alert!'),
          content: const Text('Do you want to delete? Are you sure?'),
        
          actions: [
            TextButton(
                onPressed: () {
                  Navigator.pop(context);
                
                },
                child: Text('Ok')),
            TextButton(
                onPressed: () {
                  Navigator.of(context).pop();
                },
                child: Text('Cancel')),
          ],
        );
      },
    );
  }