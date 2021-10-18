import 'dart:io';

import 'package:face_net_authentication/pages/profile.dart';
import 'package:face_net_authentication/pages/widgets/app_button.dart';
import 'package:face_net_authentication/pages/widgets/app_text_field.dart';
import 'package:face_net_authentication/pages/widgets/drawer.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:url_launcher/url_launcher.dart';
import 'home.dart';
import 'dart:math' as math;

class Params extends StatelessWidget {
  const Params(this.username,  {Key key, this.imagePath}) : super(key: key);
  final String username;
  final String imagePath;

  @override
  Widget build(BuildContext context) {
    final double mirror = math.pi;
    return Scaffold(
       appBar: AppBar(title: Text("Paramétres"),
        backgroundColor: Colors.blueAccent,
      ),
      drawer: MenuDrawer(username,imagePath:imagePath),

      backgroundColor: Colors.white,
      body: SingleChildScrollView(
        child: Container(
          margin: EdgeInsets.all(20),
          padding: EdgeInsets.all(20),
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(20),
            boxShadow: [
              BoxShadow(
                color: Colors.grey[200],
                blurRadius: 2.0, // has the effect of softening the shadow
                spreadRadius: 2.0, // has the effect of extending the shadow
                offset: Offset(
                  5.0, // horizontal, move right 10
                  5.0, // vertical, move down 10
                ),
              )
            ],
          ),
          child: Column(
            children: [
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Text("Bienvenue à E-school Demo Project",
                    style: TextStyle(
                      fontFamily: "Montserrat",
                      fontStyle: FontStyle.italic,
                      fontWeight: FontWeight.w600,
                      fontSize: 16,
                    )),
              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: AppTextField(controller: null, labelText: "Nom"),
              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: AppTextField(controller: null, labelText: "Prénom"),
              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: AppTextField(controller: null, labelText: "Ecole"),
              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: AppTextField(controller: null, labelText: "Classe"),
              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: AppTextField(
                    controller: null, labelText: "N^ d'inscription"),
              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: ElevatedButton.icon(
                    onPressed: () {},
                    icon: Padding(
                      padding: const EdgeInsets.symmetric(
                          vertical: 0, horizontal: 35),
                      child: Text("Enregistrer"),
                    ),
                    label: Icon(Icons.save)),
              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: ElevatedButton.icon(
                    onPressed: () {
                      Navigator.of(context).pop(true);
                    },
                    icon: Padding(
                      padding: const EdgeInsets.symmetric(
                          vertical: 0, horizontal: 35),
                      child: Text("Retour"),
                    ),
                    label: Icon(Icons.backspace)),
              ),
              Divider(
                height: 30,
              ),
              Text("All copyrights all reserved to TPLUS")
            ],
          ),
        ),
      ),
    );
  }
}
