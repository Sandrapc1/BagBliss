
// ignore_for_file: unused_local_variable, unused_element, must_be_immutable
import 'package:bag_bliss/core/colors.dart';
import 'package:bag_bliss/src/view/widget/bottamsheet/bottamnavigation.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';


class SignupPage extends StatelessWidget {
   SignupPage({super.key});

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
    return null;
  }

  String? _password(value) {
    if (value == '' || value == null) {
      return 'Enter the password';
    }
    return null;
  }

  String? _conformpass(value){
    if (value=='' || value!=passwordeditcontroller.text) {
      return '''password doesn't match''';
    }
    return null;

  }
    TextEditingController emaileditcontroller=TextEditingController();
    TextEditingController  passwordeditcontroller=TextEditingController();
    TextEditingController  confrmpasswordcontroller=TextEditingController();


  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.sizeOf(context);
    var height = size.height;
    var width = size.width;
    return Scaffold(
        body: Stack(
          alignment: Alignment.topCenter, 
          children: [
          Container(
            decoration: const BoxDecoration(
              image: DecorationImage(
                  image: AssetImage('assets/images/login.jpg'),
                  fit: BoxFit.cover,
                  colorFilter:
                      ColorFilter.mode(Colors.black45, BlendMode.darken)),
            ),
          ),
          Positioned(
            top: height * 0.1,
            child: const Text(
              "SIGN UP",
              style: TextStyle(
                  fontSize: 30, fontWeight: FontWeight.bold, color: white),
            ),
          ),
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
                    child: Column(
                      children: [
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
                              hintText: 'Email',
                              hintStyle: const TextStyle(color: boxcolorstock),
                              prefixIcon: const Icon(
                                Icons.mail_outline,
                                color: boxcolorstock,
                              ),
                              contentPadding: const EdgeInsets.symmetric(
                                  vertical: 8
                                  ), 
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
                            controller: passwordeditcontroller ,
                            minLines: 1,
                            obscureText: true,
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
                              hintText: 'Pasword',
                              hintStyle: const TextStyle(color: boxcolorstock),
                              prefixIcon: const Icon(
                                Icons.lock_outline,
                                color: boxcolorstock,
                              ),
                              contentPadding: const EdgeInsets.symmetric(
                                  vertical: 8
                                  ),
                            ),
                          ),
                        ),
                
                        SizedBox(height: height * 0.03),
                        Material(
                          elevation: 8,
                          color: Colors.transparent,
                          borderRadius: BorderRadius.circular(25),
                          child: TextFormField(
                            validator: _conformpass,
                            controller:confrmpasswordcontroller ,
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
                              hintText: 'Confirm Pasword',
                              hintStyle: const TextStyle(color: boxcolorstock),
                              prefixIcon: const Icon(
                                Icons.lock_outline,
                                color: boxcolorstock,
                              ),
                              contentPadding: const EdgeInsets.symmetric(
                                  vertical: 8
                                  ),
                            ),
                          ),
                        ),
                       SizedBox(height: height * 0.05),
                        TextButton(
                          onPressed: () { 
                            if (_formkey.currentState!.validate()) {
                              _formkey.currentState!.save();
                            FirebaseAuth.instance.createUserWithEmailAndPassword(
                              email: emaileditcontroller.text, 
                              password: passwordeditcontroller.text,
                              
                              ).then((value) => 
                            Get.to(  const BottamSheet()) 
            
                              ).onError((error, stackTrace){
                                 return null;
                              });
                            }
                          },
                          style: ButtonStyle(
                              backgroundColor: MaterialStateProperty.all(appbar),
                              fixedSize: MaterialStateProperty.all(
                                  Size(width * 0.5, height * 0.05))),  
                          child: const Text(
                            'Sign Up',
                            style: TextStyle(
                              color: white,
                              fontSize: 18,
                            ),
                          ),
                        ),
                        SizedBox(
                          height: height * 0.03,
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            const Text('Already have an account?'),
                            TextButton(
                                onPressed: () {
                                  Get.back();
                                },
                                child: const Text('Login'))
                          ],
                        ),
                      ],
                    ),
                  )),
            ),
          )
        ]));
  }
}

