import 'package:flutter/material.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({Key? key}) : super(key: key);

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body:SafeArea(
          child: Center(
            child: SingleChildScrollView(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Divider(color: Colors.blue[900],),
                  const SizedBox(height: 50),
                  //Wits logo
                  const Image(image: AssetImage('images/witsimage.png')),

                  const SizedBox(height: 25),

                  Text('TENNIS CLUB',
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 27,
                      color: Colors.blue.shade900,
                      decoration: TextDecoration.underline,
                    ),
                  ),

                  const SizedBox(height: 250),
                  //Sign in button
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 35.0),
                    child: GestureDetector(
                      onTap: () {
                        Navigator.pushNamed(context, '/sign_in');
                      },

                      child: Container(

                        padding: const EdgeInsets.all(16),
                        decoration: BoxDecoration(color: Colors.blue[900],
                            borderRadius: BorderRadius.circular(25)
                        ),
                        child: const Center(
                            child: Text(
                              'Continue as Player',
                              style: TextStyle(color: Colors.white,
                                  fontWeight: FontWeight.bold,
                                  fontSize: 15
                              ),
                            )),
                      ),
                    ),
                  ),
                  const SizedBox(height: 15),

                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 35.0),
                    child: GestureDetector(
                      onTap: () {
                        Navigator.pushNamed(context, '/adminsign_in');

                      },
                      child: Container(
                        padding: const EdgeInsets.all(16),
                        decoration: BoxDecoration(color: Colors.blue[900],
                            borderRadius: BorderRadius.circular(25)
                        ),
                        child: const Center(
                            child: Text(
                              'Continue as Staff',
                              style: TextStyle(color: Colors.white,
                                  fontWeight: FontWeight.bold,
                                  fontSize: 15
                              ),
                            )),
                      ),
                    ),
                  ),
                  const SizedBox(height: 15),
                  Divider(
                    color: Colors.blue[900],
                  ),
                ],
              ),
            ),
          )
      ) ,
    );
  }
}
