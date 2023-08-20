// ignore_for_file: body_might_complete_normally_nullable, unused_local_variable, avoid_print
import 'dart:developer';
import 'package:bag_bliss/authentication/auth.dart';
import 'package:bag_bliss/core/colors.dart';
import 'package:bag_bliss/src/view/login/controller.dart';
import 'package:bag_bliss/src/view/login/forgotpassword/reset_password.dart';
import 'package:bag_bliss/src/view/signup/signup.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../widget/bottamsheet/bottamnavigation.dart';

class LoginPage extends StatelessWidget {
  LoginPage({super.key});
 
  final LoginController _logController=Get.put(LoginController());
  final GlobalKey<FormState> _formkey = GlobalKey<FormState>();

  String? _validateEmail(value) {
    if (value!.isEmpty) {
      return 'Please enter an email';
    }
    String? match = r'\w+@\w+\.\w+';
    RegExp regex = RegExp(match);
    if (!regex.hasMatch(value)) {
      return 'invalid email';
    }
  }

  String? _password(value) {
    if (value == '' || value == null) {
      return 'Enter the password';
    }
  }

  @override
  Widget build(BuildContext context) {
    TextEditingController emaileditcontroller = TextEditingController();
    TextEditingController passwordeditcontroller = TextEditingController();
    var size = MediaQuery.sizeOf(context);
    var height = size.height;
    var width = size.width;
    return Obx(()=>
       Scaffold(
          //  resizeToAvoidBottomInset: false,
          body: Stack(alignment: Alignment.topCenter, children: [
        Container(
          decoration: const BoxDecoration(
            image: DecorationImage(
                image: AssetImage('assets/images/login.jpg'),
                fit: BoxFit.cover,
                colorFilter: ColorFilter.mode(Colors.black45, BlendMode.darken)),
          ),
        ),
        Positioned(
            top: height * 0.1,
            child: const Text(
              'WELCOME',
              style: TextStyle(
                  fontSize: 25, fontWeight: FontWeight.bold, color: white),
            )),
        Positioned(
            top: height * 0.2,
            child: Form(
              key: _formkey,
              child: Container(
                height: height * 0.6,
                width: width * 0.8,
                decoration: const BoxDecoration(
                  borderRadius: BorderRadius.all(Radius.circular(20)),
                  color: Colors.white60,
                  //  color: Colors.black.withOpacity(.5),
                ),
                child: Padding(
                    padding:
                        EdgeInsets.only(left: width * 0.04, right: width * 0.04),
                    child: Column(children: [
                      SizedBox(
                        height: height * 0.06,
                      ),
                      Material(
                        elevation: 8,
                        color: Colors.transparent,
                        borderRadius: BorderRadius.circular(25),
                        child: TextFormField(
                          validator: _validateEmail,
                          controller: emaileditcontroller,
                          minLines: 1,
                          decoration: InputDecoration(
                            enabled: true,
                            enabledBorder: OutlineInputBorder(
                              borderSide: BorderSide.none,
                              borderRadius: BorderRadius.circular(25),
                            ),
                            focusedBorder: OutlineInputBorder(
                              borderSide:
                                  const BorderSide(width: 1, color: appbar),
                              borderRadius: BorderRadius.circular(25),
                            ),
                            filled: true,
                            fillColor: Colors.white70,
                            hintText: 'Username/Email',
                            hintStyle: const TextStyle(color: boxcolorstock),
                            prefixIcon: const Icon(
                              Icons.mail_outline,
                              color: boxcolorstock,
                            ),
                            contentPadding:
                                const EdgeInsets.symmetric(vertical: 8),
                          ),
                        ),
                      ),
                      SizedBox(height: height * 0.03),
                      Material(
                        elevation: 8,
                        color: Colors.transparent,
                        borderRadius: BorderRadius.circular(25),
                        child: TextFormField(
                          validator: _password,
                          controller: passwordeditcontroller,
                          minLines: 1,
                          obscureText: _logController.obscureText.value,
                          decoration: InputDecoration(
                            enabled: true,
                            enabledBorder: OutlineInputBorder(
                              borderSide: BorderSide.none,
                              borderRadius: BorderRadius.circular(25),
                            ),
                            focusedBorder: OutlineInputBorder(
                              borderSide:
                                  const BorderSide(width: 1, color: appbar),
                              borderRadius: BorderRadius.circular(25),
                            ),
                            filled: true,
                            fillColor: Colors.white70,
                            hintText: 'Enter a password',
                            hintStyle: const TextStyle(color: boxcolorstock),
                            prefixIcon: const Icon(
                              Icons.lock_outline,
                              color: boxcolorstock,
                            ),
                            suffixIcon: GestureDetector(
                                onTap: () {
                                  _logController.toggleLoginVisiblisty();
                                },
                                child:  Icon(
                                  _logController.obscureText.value
                                  ? Icons.visibility_off_outlined
                                  : Icons.visibility_outlined,
                                  color: boxcolorstock,
                                )),
                            contentPadding:
                                const EdgeInsets.symmetric(vertical: 8),
                          ),
                        ),
                      ),
                      SizedBox(
                        height: height * 0.02,
                      ),
                      Padding(
                        padding: EdgeInsets.only(left: width * 0.4),
                        child: InkWell(
                          onTap: () {
                            Get.to( const ResetPassword());
                          },
                          child: const Text('Forgot Password?')),
                      ),
                      SizedBox(height: height * 0.02),
                      TextButton(
                        onPressed: () {
                          log('clicked');
                          if (_formkey.currentState!.validate()) {
                            _formkey.currentState!.save();
    
                            FirebaseAuth.instance
                                .signInWithEmailAndPassword(
                                    email: emaileditcontroller.text,
                                    password: passwordeditcontroller.text)
                                .then((value) => Get.to(const BottamSheet()))
                                .onError((error, stackTrace) {
                              print('Error ${error.toString()}');
                            });
                          }
                        },
                        style: ButtonStyle(
                            backgroundColor: MaterialStateProperty.all(appbar),
                            fixedSize: MaterialStateProperty.all(
                                Size(width * 0.5, height * 0.05))),
                        child: const Text(
                          'Login',
                          style: TextStyle(
                            color: white,
                            fontSize: 18,
                          ),
                        ),
                      ),
                      SizedBox(
                        height: height * 0.02,
                      ),
                      const Text(
                        '------ Or ------',
                        style: TextStyle(fontSize: 13),
                      ),
                      TextButton.icon(
                        icon: Image.asset('assets/images/googlelogo.png',height:height*0.08,width: width*0.06,) ,
                          style: ButtonStyle(
                            iconSize: MaterialStateProperty.all(20),
                              shadowColor:
                                  const MaterialStatePropertyAll(Colors.black),
                              overlayColor: const MaterialStatePropertyAll(white),
                              fixedSize: MaterialStateProperty.all(
                                  Size(width * 0.7, height * 0.06))),
                          onPressed: () async{
                            await GoogleFirebase().signinWithGoogle();
                            Get.to( const BottamSheet());
                          },
                          label: const Text('Continue With Google')),
                          // SizedBox(height: height*0.0,),
                      Row(mainAxisAlignment: MainAxisAlignment.center, children: [
                        const Text('Dont have an account?'),
                        TextButton(
                            onPressed: () { 
                              Get.to( SignupPage());
                            },
                            child: const Text('Sign Up'))
                      ]),
                    ])),
              ),
            ))
      ]
      )
      ),
    );
  }
}
