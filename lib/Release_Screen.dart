import 'package:balochistan_app/reset_password.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter/material.dart';
import 'Expenditure Requests.dart';
import 'Request_Status.dart';
import 'inspection_reports.dart';
import 'login_screen.dart';
import 'forgot_password.dart';
import 'package:flutter/services.dart';
import 'show_image.dart';
import 'package:dropdown_formfield/dropdown_formfield.dart';
import 'package:simple_gesture_detector/simple_gesture_detector.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:intl/intl.dart';
import 'package:flutter/services.dart';
import 'package:firebase_auth/firebase_auth.dart';

class ReleaseScreen extends StatefulWidget {
  @override
  State<ReleaseScreen> createState() => _ReleaseScreenState();
}

class _ReleaseScreenState extends State<ReleaseScreen> {

  final auth= FirebaseAuth.instance;
  String _text = 'Swipe me!';
  // LoginScreen({required Key key}) : super(key: key);
  String _myActivity = '';
  String _myActivityResult = '';
  String _myList = '';
  String _myFinalList = '';

  final loginFormKey = GlobalKey<FormState>();
  TextEditingController dateinput = TextEditingController();
  final TextEditingController emailController = TextEditingController();

  final TextEditingController passwordController = TextEditingController();

  @override
  void initState() {
    dateinput.text = ""; //set the initial value of text field
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

          title: const Text('Release Requests',
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



        drawer:Drawer(

          child: ListView(
              padding: EdgeInsets.zero,
              children: [
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


                        )
                    ),
                  ),
                ),
                SizedBox(
                  height: 45.h,
                ),
                ListTile(
                  leading: SizedBox(
                      height: 25.0,
                      width: 25.0, // fixed width and height
                      child: new SvgPicture.asset('assets/images/ic_dashboard.svg')

                  ),

                  title: const Text('Dashboard',style:TextStyle( fontWeight: FontWeight.bold)),
                  onTap: () {
                    // Update the state of the app.
                    // ...
                  },
                ),
                ListTile(
                    leading: SizedBox(
                        height: 25.0,
                        width: 25.0, // fixed width and height
                        child: new SvgPicture.asset('assets/images/ic_inspection_reports.svg')
                    ),


                    title: const Text('Inspection Reports',style:TextStyle( fontWeight: FontWeight.bold)),
                    onTap: () {
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => InspectionScreen(),
                          ));
                    } ),
                ListTile(

                  leading: SizedBox(
                      height: 25.0,
                      width: 25.0, // fixed width and height
                      child: new SvgPicture.asset('assets/images/ic_releaseReq.svg')
                  ),

                  title: const Text('Release Requests',style:TextStyle( fontWeight: FontWeight.bold)),
                  onTap: () {
                    // Update the state of the app.
                    // ...
                  },
                ),

                ListTile(
                  leading: SizedBox(
                      height: 25.0,
                      width: 25.0, // fixed width and height
                      child: new SvgPicture.asset('assets/images/ic_expenditure.svg')
                  ),


                  title: const Text('Expenditure Requests',style:TextStyle( fontWeight: FontWeight.bold)),
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
                      child: new SvgPicture.asset('assets/images/ic_requestStatus.svg')
                  ),


                  title: const Text('Request Status',style:TextStyle( fontWeight: FontWeight.bold)),
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
                                    padding: const EdgeInsets.only(top: 40.0),
                                    child: Text('Secot/email',
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
                                      emailController.text=value;
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
                                    child: Text('Project/Scheme/password',
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
                                      passwordController.text=value;
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
                                    child: Text('Remarks',
                                        style: TextStyle(
                                            fontSize: 15,
                                            color: Color(0xFF000000),
                                            fontWeight: FontWeight.bold)),
                                  ),
                                  SizedBox(
                                    height: 10.h,
                                  ),
                                  TextFormField(
                                    maxLines: 7,

                                    controller: emailController,
                                    style: TextStyle(
                                      fontSize: 11,
                                      color: Color(0xFF000000),
                                      fontWeight: FontWeight.w600,

                                    ),
                                    decoration: InputDecoration(

                                      filled: true,
                                      fillColor: Colors.white.withOpacity(0.1),
                                      hintText: 'Enter Remarks',
                                      hintStyle:
                                      TextStyle(fontSize: 13, color: Colors.grey),
                                      border: OutlineInputBorder(
                                        borderRadius:
                                        BorderRadius.all(Radius.circular(20)),
                                        borderSide:
                                        BorderSide(width: 3, color: Colors.teal),
                                      ),

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

                                  Text(' Release Date',
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
                                      controller: dateinput,
                                      decoration: InputDecoration(
                                          icon: Icon(Icons.calendar_today), //icon of text field
                                          labelText: "",
                                        border: OutlineInputBorder(
                                          borderRadius: BorderRadius.all(
                                            Radius.circular(20),
                                          ),
                                        ),
                                        hintText: ' ',
                                      ),
                                      readOnly: true,

                                      onTap: () async {
                                        DateTime? pickedDate = await showDatePicker(
                                            context: context,
                                            initialDate: DateTime.now(),
                                            firstDate: DateTime(1950),
                                            //DateTime.now() - not to allow to choose before today.
                                            lastDate: DateTime(2100));

                                        if (pickedDate != null) {
                                          print(
                                              pickedDate); //pickedDate output format => 2021-03-10 00:00:00.000
                                          String formattedDate =
                                          DateFormat('dd-MM-yyyy').format(pickedDate);
                                          print(
                                              formattedDate); //formatted date output using intl package =>  2021-03-16
                                          setState(() {
                                            dateinput.text =
                                                formattedDate; //set output date to TextField value.
                                          });
                                        } else {}
                                      },





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

                                  Text(' Amount',
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
                                        border: OutlineInputBorder(
                                          borderRadius: BorderRadius.all(
                                            Radius.circular(20),
                                          ),
                                        ),
                                        hintText: ' ',),
                                        keyboardType: TextInputType.number,
                                        inputFormatters: <TextInputFormatter>[
                                          FilteringTextInputFormatter.digitsOnly
                                        ], // Only numbers can be entered

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
                                        onPressed: () async {

                                          final user = await auth
                                              .signInWithEmailAndPassword(
                                              email: emailController.text,
                                              password: passwordController
                                                  .text);

                                          if (user != null) {
                                            Navigator.pushNamed(
                                                context, InspectionScreen.id);


                                          }

                                          }   ),
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
