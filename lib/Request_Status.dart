import 'package:balochistan_app/reset_password.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter/material.dart';
import 'Expenditure Requests.dart';
import 'Release_Screen.dart';
import 'inspection_reports.dart';
import 'login_screen.dart';
import 'forgot_password.dart';
import 'package:flutter/services.dart';
import 'show_image.dart';
import 'package:dropdown_formfield/dropdown_formfield.dart';
import 'package:simple_gesture_detector/simple_gesture_detector.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:firebase_auth/firebase_auth.dart';

class RequestStatusScreen extends StatefulWidget {
  @override
  State<RequestStatusScreen> createState() => _RequestStatusScreenState();
}

class _RequestStatusScreenState extends State<RequestStatusScreen> {
  String _text = 'Swipe me!';
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
    _myActivity = '';
    _myActivityResult = '';
    _myList = '';
    _myFinalList = '';
  }

  _saveForm() {
    var form = loginFormKey.currentState;
    if (form != null && !form.validate()) {
      form.save();
      setState(() {
        _myActivityResult = _myActivity;
        _myFinalList = _myList;
      });
    }
  }

  void _onVerticalSwipe(SwipeDirection direction) {
    setState(() {
      if (direction == SwipeDirection.up) {
        _text = 'Swiped up!';
        print('Swiped up!');
      } else {
        _text = 'Swiped down!';
        print('Swiped down!');
      }
    });
  }

  void _onHorizontalSwipe(SwipeDirection direction) {
    setState(() {
      if (direction == SwipeDirection.left) {
        _text = 'Swiped left!';
        print('Swiped left!');
      } else {
        _text = 'Swiped right!';
        print('Swiped right!');
      }
    });
  }

  void _onLongPress() {
    setState(() {
      _text = 'Long pressed!';
      print('Long pressed!');
    });
  }

  void _onTap() {
    setState(() {
      _text = 'Tapped!';
      print('Tapped!');
    });
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
            centerTitle: true,
            backgroundColor: Colors.transparent,
            elevation: 0,
            title: const Text('Request Status',
                style: TextStyle(
                  color: Color(0xFF289488),
                  fontWeight: FontWeight.bold,
                )),
            actions: [
              IconButton(
                icon: Image.asset('assets/images/balochistan.png'),
                onPressed: () => null,
              ),
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
                                padding:
                                    const EdgeInsets.symmetric(horizontal: 8.0),
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    SizedBox(
                                      height: 10.h,
                                    ),


                                    Row(
                                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                                      children: [

                                        ElevatedButton(
                                          style: ElevatedButton.styleFrom(
                                            primary: Colors.teal,
                                            minimumSize: const Size(150, 35),
                                            maximumSize: const Size(150, 35),
                                            shape: StadiumBorder(),



                                          ),
                                          onPressed: () {
                                            null;
                                          },
                                          child: Text('Release Requests',
                                              style: TextStyle(
                                                  color: Colors.white,
                                                  fontWeight: FontWeight.bold,
                                                  fontSize: 14)),
                                        ),

                                        ElevatedButton(
                                          style: ElevatedButton.styleFrom(
                                            primary: Colors.teal,
                                            minimumSize: const Size(150, 35),
                                            maximumSize: const Size(150, 35),
                                            shape: StadiumBorder(),



                                          ),
                                          onPressed: () {
                                            null;
                                          },
                                          child: Text('Expenditure Requests',
                                              style: TextStyle(
                                                  color: Colors.white,
                                                  fontWeight: FontWeight.bold,
                                                  fontSize: 14)),
                                        ),
                                      ],
                                    ),

                                    SizedBox(
                                      height: 25.h,
                                    ),

                                    ListView.builder(
                                      shrinkWrap: true,
                                        itemCount: 7,
                                        itemBuilder: (context, index) {
                                          return Card(
                                            child: ListTile(
                                                shape: RoundedRectangleBorder(
                                                    borderRadius:
                                                        BorderRadius.circular(8.0)),
                                                tileColor: Colors.white,
                                                leading: Column(
                                                  children: [
                                                    SizedBox(
                                                      height: 5.0,
                                                      width: 5.0,
                                                    ),
                                                  ],
                                                ),
                                                title: const Text(
                                                  'Sector 1',
                                                ),
                                                subtitle: const Text('12.02.2022'),
                                                trailing: Row(
                                                  mainAxisSize: MainAxisSize.min,
                                                  children: [
                                                    ElevatedButton(


                                                      style: ElevatedButton.styleFrom(
                                                          primary: Colors.teal,
                                                      minimumSize: const Size(100, 30),
                                                      maximumSize: const Size(100, 30),
                                                      shape: StadiumBorder(),
                                                ),


                                                      onPressed: () {
                                                        null;
                                                      },
                                                      child: Text('Approved',
                                                          style: TextStyle(
                                                              color: Colors.white,
                                                              fontWeight:
                                                                  FontWeight.bold,
                                                              fontSize: 13)


                                                      ),

                                                    )
                                                  ],
                                                )),
                                          );
                                        }),
                                    SizedBox(
                                      height: 10.h,
                                    ),
                                  ],
                                )))
                      ]))))),
    );
  }
}
