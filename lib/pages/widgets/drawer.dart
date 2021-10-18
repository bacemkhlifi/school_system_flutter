import 'package:face_net_authentication/pages/aide.dart';
import 'package:face_net_authentication/pages/home.dart';
import 'package:face_net_authentication/pages/parametres.dart';
import 'package:face_net_authentication/pages/profile.dart';
import 'package:flutter/material.dart';
import 'dart:io';


class MenuDrawer extends StatelessWidget {
  const MenuDrawer(this.username, {Key key, this.imagePath}) : super(key: key);
 
  final String username;
  final String imagePath;
  @override
  Widget build(BuildContext context) {
    return Drawer(
        child: ListView(
          // Important: Remove any padding from the ListView.
          padding: EdgeInsets.zero,
          children: [
            DrawerHeader(
              decoration: BoxDecoration(
                color: Colors.blueAccent,
              ),
              child: Row(
                children: [
                  Container(
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(10),
                      color: Colors.black,
                      image: DecorationImage(
                        fit: BoxFit.cover,
                        image: FileImage(File(imagePath)),
                      ),
                    ),
                    margin: EdgeInsets.all(5),
                    width: 50,
                    height: 50,
                    // child: Transform(
                    //     alignment: Alignment.center,
                    //     child: FittedBox(
                    //       fit: BoxFit.cover,
                    //       child: Image.file(File(imagePath)),
                    //     ),
                    //     transform: Matrix4.rotationY(mirror)),
                  ),
                  Text(
                    'Hi ' + username + '!',
                    style: TextStyle(
                        fontFamily: "Montserrat",
                        color: Colors.white,
                        fontSize: 22,
                        fontWeight: FontWeight.w800),
                  ),
                ],
              ),
            ),
            ListTile(
              title: const Text('Acceuil'),
              leading: Icon(Icons.home_sharp),
              onTap: () {
                Navigator.push(
                        context,
                        MaterialPageRoute(builder: (context) => Profile(username,imagePath:imagePath)),
                      );
              },
            ),
            ListTile(
              title: const Text(' Profile'),
              leading: Icon(Icons.account_box),
              onTap: () {
                Navigator.of(context).pop();
              },
            ),
            ListTile(
              title: const Text(' Messages'),
              leading: Icon(Icons.message),
              onTap: () {
                // Update the state of the app.
                // ...
              },
            ),
            Divider(),
            ListTile(
              title: const Text(' Aide'),
              leading: Icon(Icons.help_center),
              onTap: () {
                 Navigator.push(
                        context,
                        MaterialPageRoute(builder: (context) => Aide()),
                      );
              },
            ),
            ListTile(
              title: const Text(' Paramétres'),
              leading: Icon(Icons.settings),
              onTap: () { Navigator.push(
                        context,
                        MaterialPageRoute(builder: (context) => Params(username,imagePath:imagePath)),
                      );
              },
            ),
          ],
        ),
      );
  }
}