import 'package:bag_bliss/colors/colors.dart';
import 'package:bag_bliss/screen/signup/signup.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class LoginPage extends StatelessWidget {
  const LoginPage({super.key});

  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.sizeOf(context);
    var height = size.height;
    var width = size.width;
    return Scaffold(
      // resizeToAvoidBottomInset: false,
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
                'WELCOME',
                style: TextStyle(
                    fontSize: 25, fontWeight: FontWeight.bold, color: white),
              )),
          Positioned(
            top: height * 0.2,
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
                        child: TextField(
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
                        child: TextField(
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
                            hintText: 'Enter a password',
                            hintStyle: const TextStyle(color: boxcolorstock),
                            prefixIcon: const Icon(
                                Icons.lock_outline,
                              color: boxcolorstock,
                            ),
                            suffixIcon: GestureDetector(
                              onTap: () {},
                              child: const Icon(
                                Icons.visibility_off_outlined,
                                color: boxcolorstock,
                              ),
                            ),
                            contentPadding: const EdgeInsets.symmetric(
                                vertical: 8), 
                          ),
                        ),
                      ),

                      SizedBox(
                        height: height * 0.02,
                      ),
                      Padding(
                        padding: EdgeInsets.only(left: width * 0.4),
                        child: const Text('Forgot Password?'),
                      ),
                      SizedBox(height: height * 0.02),
                      TextButton(
                        onPressed: () {
                          // Get.to( const SignupPage());
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
                      //  SizedBox(height: height*0.01,),
                      TextButton(
                          style: ButtonStyle(
                              shadowColor:
                                  const MaterialStatePropertyAll(Colors.black),
                              overlayColor:
                                  const MaterialStatePropertyAll(white),
                              fixedSize: MaterialStateProperty.all(
                                  Size(width * 0.5, height * 0.05))),
                          onPressed: () {},
                          child: const Text('Continue With Google')),
                   Positioned(
                        top: height * 0.09,
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            const Text('Dont have an account?'),
                            TextButton(
                                onPressed: () {
                                  Get.to(const SignupPage());
                                },
                                child: const Text('Sign Up'))
                          ],
                        ),
                      ),
                    ],
                  ),
                )),
          ),
        ],
      ),
    );
  }
}
