import 'package:balochistan_app/reset_password.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter/material.dart';
import 'Expenditure Requests.dart';
import 'Release_Screen.dart';
import 'Request_Status.dart';
import 'login_screen.dart';
import 'forgot_password.dart';
import 'package:flutter/services.dart';
import 'show_image.dart';
import 'package:image_picker/image_picker.dart';
import 'package:dropdown_formfield/dropdown_formfield.dart';
import 'package:simple_gesture_detector/simple_gesture_detector.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:image_picker/image_picker.dart';
import 'dart:io';
import 'dart:async';
import 'package:image_picker/image_picker.dart';
import 'package:firebase_auth/firebase_auth.dart';

class InspectionScreen extends StatefulWidget {

  static const String id= 'inspection_reports';
  @override
  State<InspectionScreen> createState() => _InspectionScreenState();
}

class _InspectionScreenState extends State<InspectionScreen> {
  final _auth = FirebaseAuth.instance;


  User? loggedInUser;

  // void initState() {
  //   super.initState();
  //   getCurrentUser();
  // }


  void getCurrentUser() async {
    try {
      final firebaseUser = await _auth.currentUser;
      if (firebaseUser != null) {
        loggedInUser = firebaseUser;
        print(loggedInUser!.email);
      }
    } catch (e) {
      print(e);
    }
  }

  XFile? image;

  // LoginScreen({required Key key}) : super(key: key);
  String _myActivity = '';
  String _myActivityResult = '';
  String _myList = '';
  String _myFinalList = '';

  final loginFormKey = GlobalKey<FormState>();

  final TextEditingController emailController = TextEditingController();

  final TextEditingController passwordController = TextEditingController();

  @override
  void initState() {
    super.initState();
    getCurrentUser();
    _myActivity = '';
    _myActivityResult = '';
    _myList = '';
    _myFinalList = '';
  }

  Future<bool> _onWillPop() async {
    return false;
  }

  @override
  Widget build(BuildContext context) {

    return WillPopScope(
      onWillPop: _onWillPop,
      child: Scaffold(
        appBar: AppBar(
          leading: null,
          centerTitle: true,
          backgroundColor: Colors.transparent,
          elevation: 0,
          title: const Text('Inspection Reports',
              style: TextStyle(
                color: Color(0xFF289488),
                fontWeight: FontWeight.bold,
              )),
          actions:<Widget> [
            // IconButton(
            //   icon: Image.asset('assets/images/balochistan.png'),
            //   onPressed: () => null,
            // ),
              IconButton(
                  icon: Icon(Icons.close),
                  onPressed:() {
                    _auth.signOut();
                    Navigator.pop(context);
                  }),
          ],
          iconTheme: IconThemeData(color: Colors.black),
        ),
        drawer: Drawer(
          child: ListView(padding: EdgeInsets.zero, children: [
            SizedBox(
              height: 110.h,
            ),

            Container(
              height: 130.0,
              child: DrawerHeader(
                child: Text(''),
                decoration: BoxDecoration(
                    color: Colors.transparent,
                    image: DecorationImage(
                      image: AssetImage("assets/images/balochistan.png"),
                    )),
              ),
            ),
            SizedBox(
              height: 45.h,
            ),
            ListTile(
              leading: SizedBox(
                  height: 25.0,
                  width: 25.0, // fixed width and height
                  child:
                      new SvgPicture.asset('assets/images/ic_dashboard.svg')),
              title: const Text('Dashboard',
                  style: TextStyle(fontWeight: FontWeight.bold)),
              onTap: () {
                // Update the state of the app.
                // ...
              },
            ),
            ListTile(
              leading: SizedBox(
                  height: 25.0,
                  width: 25.0, // fixed width and height
                  child: new SvgPicture.asset(
                      'assets/images/ic_inspection_reports.svg')),
              title: const Text('Inspection Reports',
                  style: TextStyle(fontWeight: FontWeight.bold)),
              onTap: () {
                Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => InspectionScreen(),
                    ));
              },
            ),
            ListTile(
                leading: SizedBox(
                    height: 25.0,
                    width: 25.0, // fixed width and height
                    child: new SvgPicture.asset(
                        'assets/images/ic_releaseReq.svg')),
                title: const Text('Release Requests',
                    style: TextStyle(fontWeight: FontWeight.bold)),
                onTap: () {
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => ReleaseScreen(),
                      ));
                }),

            ListTile(
              leading: SizedBox(
                  height: 25.0,
                  width: 25.0, // fixed width and height
                  child:
                      new SvgPicture.asset('assets/images/ic_expenditure.svg')),
              title: const Text('Expenditure Requests',
                  style: TextStyle(fontWeight: FontWeight.bold)),
              onTap: () {
                Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => ExpenditureScreen(),
                    ));
              },
            ),

            ListTile(
              leading: SizedBox(
                  height: 25.0,
                  width: 25.0, // fixed width and height
                  child: new SvgPicture.asset(
                      'assets/images/ic_requestStatus.svg')),
              title: const Text('Request Status',
                  style: TextStyle(fontWeight: FontWeight.bold)),
              onTap: () {
                Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => RequestStatusScreen(),
                    ));
              },
            ),

            // Populate the Drawer in the next step.
          ]),
        ),
        body: Form(
            key: loginFormKey,
            child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 20),
                child: SingleChildScrollView(
                    child: Column(
                  crossAxisAlignment: CrossAxisAlignment.end,
                  children: [
                    SingleChildScrollView(
                      child: Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 8.0),
                        child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Padding(
                                padding: const EdgeInsets.only(top: 60.0),
                                child: Text('Sector',
                                    style: TextStyle(
                                        fontSize: 15,
                                        color: Color(0xFF000000),
                                        fontWeight: FontWeight.bold)),
                              ),
                              SizedBox(
                                height: 10.h,
                              ),
                              DropDownFormField(
                                titleText: '',
                                hintText: 'Select Sector',
                                value: _myActivity,
                                onSaved: (value) {
                                  setState(() {
                                    _myActivity = value;
                                  });
                                },
                                onChanged: (value) {
                                  setState(() {
                                    _myActivity = value;
                                  });
                                },
                                dataSource: [
                                  {
                                    "display": "Agriculture",
                                    "value": "Agriculture",
                                  },
                                  {
                                    "display": "Minerals",
                                    "value": "Minerals",
                                  },
                                  {
                                    "display": "Livestock",
                                    "value": "Livestock",
                                  },
                                  {
                                    "display": "Tourism",
                                    "value": "Tourism",
                                  },
                                  {
                                    "display": "Oil and Gas",
                                    "value": "Oil and Gas",
                                  },
                                  {
                                    "display": "Horticulture",
                                    "value": "Horticulture",
                                  },
                                ],
                                textField: 'display',
                                valueField: 'value',
                              ),
                              Padding(
                                padding: const EdgeInsets.only(top: 10),
                                child: Text('Project/Scheme',
                                    style: TextStyle(
                                      fontSize: 15,
                                      color: Color(0xFF000000),
                                      fontWeight: FontWeight.bold,
                                    )),
                              ),
                              SizedBox(
                                height: 10.h,
                              ),
                              Padding(
                                padding: const EdgeInsets.only(top: 0),
                              ),
                              DropDownFormField(
                                titleText: '',
                                hintText: 'Select ',
                                value: _myList,
                                onSaved: (value) {
                                  setState(() {
                                    _myList = value;
                                  });
                                },
                                onChanged: (value) {
                                  setState(() {
                                    _myList = value;
                                  });
                                },
                                dataSource: [
                                  {
                                    "display": "Gwadar-Khuzdar Highway ",
                                    "value": "Gwadar-Khuzdar Highway e",
                                  },
                                  {
                                    "display": "Mirani Dam ",
                                    "value": "Mirani Dam ",
                                  },
                                  {
                                    "display": "Coastal Highway",
                                    "value": "Coastal Highway",
                                  },
                                  {
                                    "display": "Kachhi Canal",
                                    "value": "Kachhi Canal",
                                  },
                                  {
                                    "display": "Gwadar Deep Sea Water",
                                    "value": "Gwadar Deep Sea Water",
                                  },
                                  {
                                    "display": "Sabakzai Dam",
                                    "value": "Sabakzai Dam",
                                  },
                                ],
                                textField: 'display',
                                valueField: 'value',
                              ),
                              Padding(
                                padding: const EdgeInsets.only(top: 10.0),
                                child: Text('Inspection Report',
                                    style: TextStyle(
                                        fontSize: 15,
                                        color: Color(0xFF000000),
                                        fontWeight: FontWeight.bold)),
                              ),
                              SizedBox(
                                height: 10.h,
                              ),
                              TextFormField(
                                controller: emailController,
                                style: TextStyle(
                                  fontSize: 11,
                                  color: Color(0xFF000000),
                                  fontWeight: FontWeight.w600,
                                ),
                                decoration: InputDecoration(
                                  filled: true,
                                  fillColor: Colors.white.withOpacity(0.1),
                                  hintText: 'Enter Details',
                                  hintStyle: TextStyle(
                                      fontSize: 13, color: Colors.grey),
                                  border: OutlineInputBorder(
                                    borderRadius:
                                        BorderRadius.all(Radius.circular(20)),
                                    borderSide: BorderSide(
                                        width: 3, color: Colors.teal),
                                  ),
                                  // contentPadding:
                                  //     EdgeInsets.fromLTRB(5.0, 10.0, 5.0, 10.0),
                                ),
                                validator: (value) {
                                  if (value == null || value.isEmpty) {
                                    return 'Please Enter Some Text ';
                                  }
                                  return null;
                                },
                              ),
                              Padding(
                                padding: const EdgeInsets.all(8.0),
                              ),
                              Text('GPS Coordinates',
                                  style: TextStyle(
                                    fontSize: 15,
                                    color: Color(0xFF000000),
                                    fontWeight: FontWeight.bold,
                                  )),
                              SizedBox(
                                height: 10.h,
                              ),
                              Padding(
                                padding: const EdgeInsets.only(top: 0),
                                child: TextFormField(
                                  controller: passwordController,
                                  decoration: InputDecoration(
                                    filled: true,
                                    fillColor: Colors.white.withOpacity(0.1),
                                    border: OutlineInputBorder(
                                      borderRadius: BorderRadius.all(
                                        Radius.circular(20),
                                      ),
                                    ),
                                    hintText: ' Enter Coordinates',
                                    hintStyle: TextStyle(
                                        fontSize: 13, color: Colors.grey),
                                  ),
                                  style: TextStyle(
                                      fontSize: 13,
                                      color: Color(0xFF000000),
                                      fontWeight: FontWeight.w600),
                                  validator: (value) {
                                    if (value == null || value.isEmpty) {
                                      return 'Please Enter Some Text ';
                                    }
                                    return null;
                                  },
                                ),
                              ),
                              Padding(
                                padding: const EdgeInsets.all(8.0),
                              ),
                              Text(
                                'Pictures',
                                style: TextStyle(fontWeight: FontWeight.bold),
                              ),
                              SizedBox(
                                height: 10.h,
                              ),
                              Row(
                                children: [
                                  GestureDetector(
                                    onTap: () async {
                                      showDialog(
                                          context: context,
                                          builder: (BuildContext context) {
                                            return SimpleDialog(
                                                title: Text("Camera/Gallery"),
                                                children: <Widget>[
                                                  SimpleDialogOption(
                                                    onPressed: () async {
                                                      final ImagePicker _picker =
                                                          ImagePicker();
                                                      final img =
                                                          await _picker.pickImage(
                                                              source: ImageSource
                                                                  .gallery);
                                                      setState(() {
                                                        image = img;
                                                      });

                                                      Navigator.pop(context);
                                                    },
                                                    child: const Text(
                                                        'Pick From Gallery'),
                                                  ),
                                                  SizedBox(
                                                    height: 10.h,
                                                  ),
                                                  SimpleDialogOption(
                                                    onPressed: () async {
                                                      final ImagePicker _picker =
                                                          ImagePicker();
                                                      final img =
                                                          await _picker.pickImage(
                                                              source: ImageSource
                                                                  .camera);
                                                      setState(() {
                                                        image = img;
                                                      });

                                                      if (image != null)
                                                        Expanded(
                                                            child: Column(
                                                                children: [
                                                                  Expanded(child: Image.file(File(image!.path))),


                                                                ]));

                                                      Navigator.pop(context);



                                                    },
                                                    child: const Text(
                                                        'Take A New Picture'),
                                                  ),

//
//     FutureBuilder  (
//  future: File,
// builder: (context, data) {
//
//   if (data.hasData) {
//     return Container(
//       height: 200.0,
//       child: Image.file(
//         data.data as File, fit: BoxFit.contain, height: 200.0,),);
//   }
// return SizedBox.shrink();
// }
//
//
//
//
//
//
//     )

                                                ]);


                                          });
                                    },
                                    child: Container(
                                      child: Padding(
                                        padding: EdgeInsets.symmetric(
                                            vertical: 0.0, horizontal: 10),
                                        child: Row(
                                          mainAxisAlignment: MainAxisAlignment.end,
                                          children: [
                                            Icon(
                                              Icons.image,
                                              color: Colors.teal,
                                            ),
                                          ],
                                        ),
                                      ),
                                      height: 55,
                                      width: 300,
                                      decoration: BoxDecoration(
                                          border: Border.all(
                                            color: Color(0xFF289488),
                                            width: 1,
                                          ),
                                          borderRadius: BorderRadius.all(
                                              Radius.circular(20))),
                                    ),
                                  ),
                                ],
                              ),
                              image != null
                                  ? Image.asset(image.toString())
                                  : Container(),
                              Align(
                                alignment: Alignment.center,
                                child: Padding(
                                  padding: const EdgeInsets.only(top: 20),
                                  child: ElevatedButton(
                                    style: ElevatedButton.styleFrom(
                                      primary: Color(0xFF289488),
                                      onPrimary: Colors.white,
                                      elevation: 3,
                                      minimumSize: const Size(200, 50),
                                      maximumSize: const Size(200, 50),
                                      shape: StadiumBorder(),
                                    ),
                                    child: Text('Submit',
                                        style: TextStyle(
                                            fontWeight: FontWeight.bold,
                                            fontSize: 16)),
                                    onPressed: () {
                                      if (loginFormKey.currentState!.validate())
                                        Navigator.pushReplacement(
                                            context,
                                            MaterialPageRoute(
                                                builder:
                                                    (BuildContext context) =>
                                                        ReleaseScreen()));
                                    },
                                  ),
                                ),
                              )
                            ]),
                      ),
                    )
                  ],
                )))),
      ),
    );
  }
}
