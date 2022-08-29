import 'package:balochistan_app/inspection_reports.dart';
import 'package:balochistan_app/reset_password.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter/material.dart';
import 'package:modal_progress_hud/modal_progress_hud.dart';
import 'login_screen.dart';
import 'forgot_password.dart';
import 'package:flutter/services.dart';
import 'show_image.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:fluttertoast/fluttertoast.dart';

class LoginScreen extends StatefulWidget {
  static const String id = 'login_screen';

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  final _auth = FirebaseAuth.instance;

  bool showSpinner = false;
  // LoginScreen({required Key key}) : super(key: key);
  // void LoginScreen() {
  //   Navigator.pushReplacement(
  //       context, MaterialPageRoute(builder: (BuildContext context) => InspectionScreen()));
  // }

  bool _isObscure = true;
  final loginFormKey = GlobalKey<FormState>();

  final TextEditingController emailController = TextEditingController();

  final TextEditingController passwordController = TextEditingController();

// late String email;
// late String password;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ModalProgressHUD(
        inAsyncCall: showSpinner,
        child: Form(
            key: loginFormKey,
            child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 20),
                child: SingleChildScrollView(
                    child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Padding(
                      padding: const EdgeInsets.only(top: 60.0),
                      child: (Container(
                          width: 200,
                          height: 150,
                          decoration: BoxDecoration(),
                          child: Image.asset('assets/images/balochistan.png'))),
                    ),
                    SizedBox(
                      height: 35.h,
                    ),
                    const Align(
                        alignment: Alignment.topLeft,
                        child: Text(
                          'C&W Baluchistan Login to Continue',
                          style: TextStyle(
                            fontSize: 25,
                            color: Color(0xFF289488),
                            fontWeight: FontWeight.bold,
                          ),
                        )),
                    SizedBox(
                      height: 43.h,
                    ),
                    Container(
                        height: 340,
                        decoration: BoxDecoration(
                            border: Border.all(
                              color: Color(0xFF289488),
                              width: 1.5,
                            ),
                            borderRadius:
                                BorderRadius.all(Radius.circular(20))),
                        child: SingleChildScrollView(
                            child: Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 8.0),
                          child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Padding(
                                  padding: const EdgeInsets.only(top: 25.0),
                                  child: Text('Email',
                                      style: TextStyle(
                                          fontSize: 15,
                                          color: Color(0xFF000000),
                                          fontWeight: FontWeight.bold)),
                                ),
                                SizedBox(
                                  height: 10.h,
                                ),
                                Container(
                                  child: TextFormField(
                                    keyboardType: TextInputType.emailAddress,
                                    controller: emailController,
                                    style: TextStyle(
                                      fontSize: 11,
                                      color: Color(0xFF000000),
                                      fontWeight: FontWeight.w600,
                                    ),
                                    decoration: InputDecoration(
                                      filled: true,
                                      fillColor: Colors.white.withOpacity(0.1),
                                      hintText: 'Enter Email',
                                      hintStyle: TextStyle(
                                          fontSize: 13, color: Colors.grey),
                                      border: OutlineInputBorder(
                                        borderRadius: BorderRadius.all(
                                            Radius.circular(20)),
                                        borderSide: BorderSide(
                                            width: 3, color: Colors.teal),
                                      ),
                                    ),
                                    validator: (value) {
                                      RegExp regex = RegExp(
                                          r'^.+@[a-zA-Z]+\.{1}[a-zA-Z]+(\.{0,1}[a-zA-Z]+)$');
                                      if (value == null || value.isEmpty) {
                                        return 'Please Enter Some Text ';
                                      } else if (value.length > 20) {
                                        return 'Enter less than 20 numbers';
                                      } else if (!regex.hasMatch(value)) {
                                        return 'Enter according to format';
                                      }
                                      return null;
                                    },
                                  ),
                                ),
                                Padding(
                                  padding: const EdgeInsets.all(8.0),
                                ),
                                const Text('Password',
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
                                    obscureText: _isObscure,
                                    decoration: InputDecoration(
                                      filled: true,
                                      fillColor: Colors.white.withOpacity(0.1),
                                      border: OutlineInputBorder(
                                        borderRadius: BorderRadius.all(
                                          Radius.circular(20),
                                        ),
                                      ),
                                      hintText: ' Enter Password',
                                      hintStyle: TextStyle(
                                          fontSize: 13, color: Colors.grey),
                                      suffixIcon: IconButton(
                                        icon: Icon(
                                          _isObscure
                                              ? Icons.visibility
                                              : Icons.visibility_off,
                                        ),
                                        onPressed: () {
                                          setState(() {
                                            _isObscure = !_isObscure;
                                          });
                                        },
                                      ),
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
                                Align(
                                  alignment: Alignment.centerRight,
                                  child: TextButton(
                                      child: Text(
                                        'Forgot Password?',
                                        style: TextStyle(
                                            fontWeight: FontWeight.bold),
                                      ),
                                      style: TextButton.styleFrom(
                                        primary: Color(0xFFF44336),
                                      ),
                                      onPressed: () {
                                        Navigator.of(context).push(
                                            MaterialPageRoute(
                                                builder: (context) =>
                                                    ForgotPasswordScreen()));
                                      }),
                                ),
                                Align(
                                  alignment: Alignment.center,
                                  child: Padding(
                                    padding: const EdgeInsets.only(top: 5),
                                    child: ElevatedButton(
                                      style: ElevatedButton.styleFrom(
                                        primary: Color(0xFF289488),
                                        onPrimary: Colors.white,
                                        elevation: 3,
                                        minimumSize: const Size(200, 50),
                                        maximumSize: const Size(200, 50),
                                        shape: StadiumBorder(),
                                      ),
                                      child: Text('Login',
                                          style: TextStyle(
                                              fontWeight: FontWeight.bold,
                                              fontSize: 18)),
                                      onPressed: () async {
                                        setState(() {
                                          showSpinner = true;
                                        });

                                        // print(emailController.text);
                                        // print(passwordController.text);
                                        try {
                                          final user =
                                              _auth.signInWithEmailAndPassword(
                                                  email: emailController.text,
                                                  password:
                                                      passwordController.text);
                                          final newUser = await _auth
                                              .createUserWithEmailAndPassword(
                                                  email: emailController.text,
                                                  password:
                                                      passwordController.text);

                                          Fluttertoast.showToast(
                                              msg: "Logged In Successfully",
                                              toastLength: Toast.LENGTH_SHORT,
                                              gravity: ToastGravity.BOTTOM,
                                              timeInSecForIosWeb: 4,
                                              backgroundColor: Colors.teal,
                                              textColor: Colors.white,
                                              fontSize: 10.0);

                                          if (newUser != null) {
                                            Navigator.pushNamed(
                                                context, InspectionScreen.id);
                                          }

                                          setState(() {
                                            showSpinner = false;
                                          });
                                        } catch (e) {
                                          print(e);
                                        }

                                        if (loginFormKey.currentState!
                                            .validate())
                                          Navigator.pushReplacement(
                                              context,
                                              MaterialPageRoute(
                                                  builder:
                                                      (BuildContext context) =>
                                                          InspectionScreen()));
                                      },
                                    ),
                                  ),
                                )
                              ]),
                        )))
                  ],
                )))),
      ),
    );
  }
}
