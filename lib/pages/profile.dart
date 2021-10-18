import 'dart:io';
import 'package:face_net_authentication/api/api.dart';
import 'package:face_net_authentication/pages/widgets/drawer.dart';
import 'package:intl/intl.dart';
import 'package:face_net_authentication/pages/widgets/app_button.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:url_launcher/url_launcher.dart';
import 'parametres.dart';
import 'home.dart';
import 'dart:math' as math;

class Profile extends StatelessWidget {
  const Profile(this.username, {Key key, this.imagePath}) : super(key: key);
  final String username;
  final String imagePath;

  @override
  Widget build(BuildContext context) {
    var outputFormat = DateFormat('MM/dd/yyyy hh:mm a');
    var outputDate = outputFormat.format(DateTime.now());

    final double mirror = math.pi;
    return Scaffold(
      appBar: AppBar(title:Text("Acceuil"),
        backgroundColor: Colors.blueAccent,
      ),
      drawer: MenuDrawer(username,imagePath:imagePath),
      body: Container(
        child: SafeArea(
          child: Container(
            child: Column(
              children: <Widget>[
                Column(
                  children: [
                    Padding(
                      padding: const EdgeInsets.only(
                          top: 40, right: 8, left: 8, bottom: 10),
                      child: Text("Répartition horaire pour aujourd'hui: ",
                          textAlign: TextAlign.center,
                          style: TextStyle(
                            fontFamily: "Montserrat",
                            fontStyle: FontStyle.normal,
                            fontWeight: FontWeight.w800,
                            fontSize: 20,
                          )),
                    ),
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Text(outputDate,
                          style: TextStyle(
                              fontFamily: "Montserrat",
                              fontStyle: FontStyle.normal,
                              fontWeight: FontWeight.w800,
                              fontSize: 20)),
                    ),
                  ],
                ),
                Container(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Row(
                          children: [
                            Text("1er séance (Matin): ",
                                style: TextStyle(
                                  fontFamily: "Montserrat",
                                  fontStyle: FontStyle.normal,
                                  fontWeight: FontWeight.w800,
                                )),
                            Column(
                              children: [
                                ElevatedButton.icon(
                                    onPressed: () {
                                      Api().fetchAlbum();
                                    },
                                    icon: Padding(
                                      padding: const EdgeInsets.symmetric(
                                          vertical: 0, horizontal: 35),
                                      child: Text("Terminé"),
                                    ),
                                    label: Icon(Icons.verified)),
                                ElevatedButton.icon(
                                  onPressed: () {},
                                  icon: Text("Pointez pour Sortir"),
                                  label: Icon(Icons
                                      .system_security_update_warning_outlined),
                                )
                              ],
                            )
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
                Container(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Row(
                          children: [
                            Text("2éme séance (Soir): ",
                                style: TextStyle(
                                  fontFamily: "Montserrat",
                                  fontStyle: FontStyle.normal,
                                  fontWeight: FontWeight.w800,
                                )),
                            Column(
                              children: [
                                ElevatedButton.icon(
                                  onPressed: () {},
                                  icon: Text("Pointez pour Entrer"),
                                  label: Icon(Icons
                                      .system_security_update_warning_outlined),
                                ),
                                ElevatedButton.icon(
                                  onPressed: () {},
                                  icon: Text("Pointez pour Sortir"),
                                  label: Icon(Icons
                                      .system_security_update_warning_outlined),
                                )
                              ],
                            )
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
                Spacer(),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: InkWell(
                    onTap: () {
                      Navigator.pushReplacement(
                        context,
                        PageRouteBuilder(
                          pageBuilder: (context, animation1, animation2) =>
                              Params(username,imagePath:imagePath),
                          transitionDuration: Duration.zero,
                        ),
                      );
                    },
                    child: Container(
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(10),
                        color: Colors.blueAccent,
                        boxShadow: <BoxShadow>[
                          BoxShadow(
                            color: Colors.black.withOpacity(0.1),
                            blurRadius: 1,
                            offset: Offset(4, 4),
                          ),
                        ],
                      ),
                      alignment: Alignment.center,
                      padding:
                          EdgeInsets.symmetric(vertical: 14, horizontal: 16),
                      width: MediaQuery.of(context).size.width * 0.8,
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text(
                            'Mettez à jour mes données ',
                            style: TextStyle(color: Colors.white),
                          ),
                          SizedBox(
                            width: 10,
                          ),
                          FaIcon(
                            FontAwesomeIcons.calendar,
                            color: Colors.white,
                          )
                        ],
                      ),
                    ),
                  ),
                ),
                AppButton(
                  text: "LOG OUT",
                  onPressed: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => MyHomePage()),
                    );
                  },
                  icon: Icon(
                    Icons.logout,
                    color: Colors.white,
                  ),
                  color: Colors.pinkAccent,
                ),
                SizedBox(
                  height: 20,
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
