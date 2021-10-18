import 'package:face_net_authentication/pages/db/database.dart';
import 'package:face_net_authentication/pages/sign-in.dart';
import 'package:face_net_authentication/pages/sign-up.dart';
import 'package:face_net_authentication/services/facenet.service.dart';
import 'package:face_net_authentication/services/ml_kit_service.dart';
import 'package:camera/camera.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:url_launcher/url_launcher.dart';

class MyHomePage extends StatefulWidget {
  MyHomePage({Key key}) : super(key: key);
  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  // Services injection
  FaceNetService _faceNetService = FaceNetService();
  MLKitService _mlKitService = MLKitService();
  DataBaseService _dataBaseService = DataBaseService();

  CameraDescription cameraDescription;
  bool loading = false;

  String githubURL =
      "https://github.com/MCarlomagno/FaceRecognitionAuth/tree/master";

  @override
  void initState() {
    super.initState();
    _startUp();
  }

  /// 1 Obtain a list of the available cameras on the device.
  /// 2 loads the face net model
  _startUp() async {
    _setLoading(true);

    List<CameraDescription> cameras = await availableCameras();

    /// takes the front camera
    cameraDescription = cameras.firstWhere(
      (CameraDescription camera) =>
          camera.lensDirection == CameraLensDirection.front,
    );

    // start the services
    await _faceNetService.loadModel();
    await _dataBaseService.loadDB();
    _mlKitService.initialize();

    _setLoading(false);
  }

  // shows or hides the circular progress indicator
  _setLoading(bool value) {
    setState(() {
      loading = value;
    });
  }

  void _launchURL() async => await canLaunch(githubURL)
      ? await launch(githubURL)
      : throw 'Could not launch $githubURL';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      
      appBar: AppBar(
        leading: Container(
          
        ),
        flexibleSpace: Container(
          decoration: BoxDecoration(
                  gradient: LinearGradient(
                    begin: Alignment.topCenter,
                    end: Alignment.bottomCenter,
                    colors: [
                      Color(0xFF686edc),Color(0xFF686edc),Color(0xFF686edc),Color(0xFF686edc)
                    ],
                    stops: [0.1, 0.4, 0.7, 0.9],
                  ),
                ),
        ),
        elevation: 0,
        backgroundColor: Colors.transparent,
        actions: <Widget>[
          Padding(
            padding: EdgeInsets.only(right: 20, top: 20),
            child: PopupMenuButton<String>(
              child: Icon(
                Icons.more_vert,
                color: Colors.black,
              ),
              onSelected: (value) {
                switch (value) {
                  case 'Clear DB':
                    _dataBaseService.cleanDB();
                    break;
                }
              },
              itemBuilder: (BuildContext context) {
                return {'Clear DB'}.map((String choice) {
                  return PopupMenuItem<String>(
                    value: choice,
                    child: Text(choice,style: TextStyle(fontFamily: "Montserrat",),),
                  );
                }).toList();
              },
            ),
          ),
        ],
      ),
      body: !loading
          ? Column(
            children: [
              Container(
               
                
            width: double.infinity,
          height: 480,
            decoration: BoxDecoration(
              image: DecorationImage(
                
                  image: AssetImage ("assets/images/background.png"),
                  
                   
                  fit: BoxFit.fill

              ),
            ),
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: Column(
                children: [
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Text(
                                    "School System",
                                    style: TextStyle(
                                      color: Colors.white,fontFamily: "Montserrat",
                                        fontSize: 30, fontWeight: FontWeight.bold),
                                    textAlign: TextAlign.center,
                                    
                                  ),
                  ),
                                SizedBox(
                                  height: 20,
                                ),
                                Padding(
                                  padding: const EdgeInsets.all(8.0),
                                  child: Text(
                                    "Tplus Demo application ",
                                    style: TextStyle(
                                      fontFamily: "Montserrat",
                                      fontSize: 16,
                                      color: Colors.white
                                    ),
                                    textAlign: TextAlign.center,
                                  ),
                                ),
                   Container(
                            
                            child: Column(
                            children: [
                              Image(image: AssetImage('assets/logo.png')),
                            ],
                          )),
                ],
              ),
            ),
              )
              ,
              Container(
              
                child: Container(
                  
                  child: Center(
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: <Widget>[
                        
                        
                       
                        Column(
                          children: [
                            InkWell(
                              onTap: () {
                                Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                    builder: (BuildContext context) => SignIn(
                                      cameraDescription: cameraDescription,
                                    ),
                                  ),
                                );
                              },
                              child: Container(
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(40),
                                  color: Colors.white,
                                  boxShadow: <BoxShadow>[
                                    BoxShadow(
                                      color: Colors.black.withOpacity(0.1),
                                      blurRadius: 1,
                                      offset: Offset(4, 4,),
                                    ),
                                  ],
                                ),
                                alignment: Alignment.center,
                                padding: EdgeInsets.symmetric(
                                    vertical: 14, horizontal: 16),
                                width: MediaQuery.of(context).size.width * 0.8,
                                child: Row(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    Text(
                                      'LOGIN',
                                      style: TextStyle(
                                        fontFamily: "Montserrat",color: Color(0xFF0F0BDB)),
                                    ),
                                    SizedBox(
                                      width: 10,
                                    ),
                                    Icon(Icons.login, color: Color(0xFF0F0BDB))
                                  ],
                                ),
                              ),
                            ),
                            SizedBox(
                              height: 10,
                            ),
                            InkWell(
                              onTap: () {
                                Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                    builder: (BuildContext context) => SignUp(
                                      cameraDescription: cameraDescription,
                                    ),
                                  ),
                                );
                              },
                              child: Container(
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(40),
                                  color: Color(0xFF686edc),
                                  boxShadow: <BoxShadow>[
                                    BoxShadow(
                                      color: Colors.black.withOpacity(0.1),
                                      blurRadius: 1,
                                      offset: Offset(4, 4),
                                    ),
                                  ],
                                ),
                                
                                alignment: Alignment.center,
                                padding: EdgeInsets.symmetric(
                                    vertical: 14, horizontal: 16),
                                width: MediaQuery.of(context).size.width * 0.8,
                                child: Row(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    Text(
                                      'SIGN UP',
                                      style: TextStyle(
                                        fontFamily: "Montserrat",color: Colors.white),
                                    ),
                                    SizedBox(
                                      width: 10,
                                    ),
                                    Icon(Icons.person_add, color: Colors.white)
                                  ],
                                ),
                              ),
                            ),
                            SizedBox(
                              height: 20,
                              width: MediaQuery.of(context).size.width * 0.8,
                              child: Divider(
                                thickness: 2,
                              ),
                            ),
                          
                          ],
                        )
                      ],
                    ),
                  ),
                ),
              ),
            ],
          )
          : Center(
              child: CircularProgressIndicator(),
            ),
    );
  }
}
