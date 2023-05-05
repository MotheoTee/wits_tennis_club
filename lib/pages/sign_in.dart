import 'package:flutter/material.dart';

class Sign_In extends StatelessWidget {
  const Sign_In({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body:SafeArea(
          child: Center(
            child: Column(
              children: [
                //Signing In title below
                Text('Sign In',
                    style: TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 45,
                        color: Colors.blue
                    ),
                ),

                SizedBox(height: 10),

                Text('Welcome To The Wits Tennis Club!',
                  style: TextStyle(
                      fontWeight: FontWeight.normal,
                      fontSize: 20,
                      color: Colors.blue
                  ),
                ),

                SizedBox(height: 20),

                //email textfield below
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 25.0),
                  child: Container(
                    decoration: BoxDecoration(
                      color: Colors.white,
                      border: Border.all(color: Colors.blue),
                      borderRadius: BorderRadius.circular(12),
                    ),
                    child: Padding(
                      padding: const EdgeInsets.only(left: 20.0),
                      child: TextField(
                        decoration: InputDecoration(
                          border: InputBorder.none,
                          hintText: 'example@domain.com'
                        ),
                      ),
                    ),
                  ),
                ),

                SizedBox(height: 15),

                //password textfield below
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 25.0),
                  child: Container(
                    decoration: BoxDecoration(
                      color: Colors.white,
                      border: Border.all(color: Colors.blue),
                      borderRadius: BorderRadius.circular(12),
                    ),
                    child: Padding(
                      padding: const EdgeInsets.only(left: 20.0),
                      child: TextField(
                        obscureText: true,
                        decoration: InputDecoration(
                            border: InputBorder.none,
                            hintText: 'Password'
                        ),
                      ),
                    ),
                  ),
                ),

                SizedBox(height: 15),
                //Sign in button
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 110.0),
                  child: Container(
                    padding: EdgeInsets.all(16),
                    decoration: BoxDecoration(color: Colors.blue,
                      borderRadius: BorderRadius.circular(12)
                    ),
                    child: Center(
                        child: Text(
                            'Sign In',
                            style: TextStyle(color: Colors.white,
                                fontWeight: FontWeight.bold,
                              fontSize: 15
                            ),
                        )),
                  ),
                )
              ],
            ),
          )) ,
    );
  }
}
