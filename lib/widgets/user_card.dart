
import 'package:crud_user/views/updateuser_page.dart';
import 'package:crud_user/widgets/custom_dialog.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

class UserCard extends StatelessWidget {
  UserCard(
      {super.key,
      required this.name,
      required this.email,
      required this.address});
  String name;
  String email;
  String address;

  
  @override
  Widget build(BuildContext context) {
    return Card(
      shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(20), side: BorderSide.none),
      color: Colors.white,
      shadowColor: Colors.grey,
      elevation: 6,
      child: ListTile(
        // leading: CircleAvatar(
        //   radius: 30,
        //   backgroundColor: Colors.blueGrey.shade400,
        //   backgroundImage: NetworkImage(url),
        // ),
        trailing: Row(
          mainAxisSize: MainAxisSize.min,
          children: [
            IconButton(
                onPressed: () {
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => UpdateUserPage(),
                      ));
                },
                icon: Icon(
                  Icons.edit_sharp,
                  color: Colors.black,
                )),
                // SizedBox(width: 10,),
                
                IconButton(
                  onPressed: () async {
            
                  ShowDialog(context);
                  }, 
                  icon: Icon(Icons.delete, color: Colors.redAccent,))
          ],
        ),
        textColor: Colors.black,
        title: Wrap(
          children: [
            Text(
              "Name: ",
              style: TextStyle(
                  color: Colors.black, fontWeight: FontWeight.w500, fontSize: 15),
              maxLines: 1,
              overflow: TextOverflow.ellipsis,
            ),
            Text(name.toString())
          ],
        ),
        subtitle: Wrap(
          children: [
            Wrap(
              children: [
                Text(
                  "Email: ",
                  style: TextStyle(color: Colors.black, fontWeight: FontWeight.w500, fontSize: 15),
                  maxLines: 1,
                  overflow: TextOverflow.ellipsis,
                ),
                Text(email.toString())
              ],
            ),
            Wrap(
              children: [
                Text(
                  "Address: ",
                  style: TextStyle(color: Colors.black, fontWeight: FontWeight.w500, fontSize: 15),
                  maxLines: 2,
                  overflow: TextOverflow.ellipsis,
                ),
                Text(
                  address.toString(),
                  maxLines: 2,
                  overflow: TextOverflow.ellipsis,
                )
              ],
            ),
          ],
        ),
        tileColor: Colors.white,
        selectedTileColor: Colors.blueGrey,
        shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(10),
            side: BorderSide.none),
        // onTap: () {
        //   Navigator.push(
        //       context,
        //       MaterialPageRoute(
        //         builder: (context) => addImage(docid: docId),
        //       ));
        // },
      )
       
    );
  }
}
