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
              mainAxisAlignment: MainAxisAlignment.center,
              children: [

                SizedBox(height: 15),
                //Wits logo
                Image(image: AssetImage('images/witsimage.png')),

                SizedBox(height: 15),

                Text('Welcome To The Wits Tennis Club!',
                  style: TextStyle(
                      fontWeight: FontWeight.normal,
                      fontSize: 18,
                      color: Colors.blue,
                  ),
                ),

                SizedBox(height: 40),

                //email textfield below
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 28.0),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      Text('Email',
                        style: TextStyle(
                            color: Colors.blue,
                            fontSize: 17
                        ),
                      ),
                    ],
                  ),
                ),

                SizedBox(height: 7),

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
                  padding: const EdgeInsets.symmetric(horizontal: 28.0),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      Text('Password',
                        style: TextStyle(
                            color: Colors.blue,
                            fontSize: 17
                        ),
                      ),
                    ],
                  ),
                ),

                SizedBox(height: 7),

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
                        ),
                      ),
                    ),
                  ),
                ),

                SizedBox(height: 10),

                //Forgot password option
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 25.0),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: [
                      Text('Forgot Password?',
                        style: TextStyle(
                          color: Colors.blue,
                          fontWeight: FontWeight.bold
                        ),
                      ),
                    ],
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
