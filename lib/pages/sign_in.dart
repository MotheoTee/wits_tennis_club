import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:wits_tennis_club/pages/player_home.dart';

class Sign_In extends StatefulWidget {
  const Sign_In({Key? key}) : super(key: key);

  @override
  State<Sign_In> createState() => _Sign_InState();
}

class _Sign_InState extends State<Sign_In> {

  // text controllers
  final _emailController = TextEditingController();
  final _passwordController = TextEditingController();
  bool _obscureText = true;

  //This is the sign in function so that the user can enter into our app
  Future signIn() async{
    try {
      await FirebaseAuth.instance.signInWithEmailAndPassword(
        email: _emailController.text.trim(),
        password: _passwordController.text.trim(),
      ).then((value) =>
      //Navigator.canPop(context) ? Navigator.pop(context) : null);
          print("Signed In Successfully"));
          Navigator.pushNamed(context, '/playerHome');
    } catch(error){
      print("Error ${error.toString()}");
    }
  }

  @override
  void dispose() {
    _emailController.dispose();
    _passwordController.dispose();
    super.dispose();
  }

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
                  const SizedBox(height: 10),
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

                  const SizedBox(height: 40),
                  //Email text above it's textfield
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 28.0),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        Text('Email',
                          style: TextStyle(
                              color: Colors.blue[900],
                              fontSize: 17,
                              decoration: TextDecoration.underline
                          ),
                        ),
                      ],
                    ),
                  ),

                  const SizedBox(height: 7),

                  //email text-field below
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 25.0),
                    child: Container(
                      decoration: BoxDecoration(
                        color: Colors.white,
                        border: Border.all(color: Colors.blue.shade900),
                        borderRadius: BorderRadius.circular(12),
                      ),
                      child: Padding(
                        padding: EdgeInsets.only(left: 20.0),
                        child: TextField(
                          controller: _emailController,
                          decoration: const InputDecoration(
                              border: InputBorder.none,
                              hintText: 'example@domain.com',
                            prefixIcon: Icon(Icons.email),
                          ),
                        ),
                      ),
                    ),
                  ),

                  const SizedBox(height: 15),

                  //password text above it's textfield
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 28.0),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        Text('Password',
                          style: TextStyle(
                              color: Colors.blue[900],
                              fontSize: 17,
                              decoration: TextDecoration.underline
                          ),
                        ),
                      ],
                    ),
                  ),

                  const SizedBox(height: 7),
                  //password text-field
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 25.0),
                    child: Container(
                      decoration: BoxDecoration(
                        color: Colors.white,
                        border: Border.all(color: Colors.blue.shade900),
                        borderRadius: BorderRadius.circular(12),
                      ),
                      child: Padding(
                        padding: const EdgeInsets.only(left: 20.0),
                        child: TextField(
                          controller: _passwordController,
                          obscureText: _obscureText,
                          decoration: InputDecoration(
                            border: InputBorder.none,
                            prefixIcon: Icon(Icons.lock),
                            suffixIcon: GestureDetector(
                              onTap: () {setState(() {
                                _obscureText=! _obscureText;
                              });
                              },
                              child: Icon(_obscureText ?Icons.visibility : Icons.visibility_off),
                            ),
                          ),
                        ),
                      ),
                    ),
                  ),

                  const SizedBox(height: 10),

                  //Forgot password option
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 25.0),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.end,
                      children: [
                        GestureDetector(
                          onTap: () {
                            Navigator.pushNamed(context, '/forgotpassword');
                          } ,
                          child: Text('Forgot Password?',
                            style: TextStyle(
                                color: Colors.blue[900],
                                fontWeight: FontWeight.bold,
                                decoration: TextDecoration.underline
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),

                  const SizedBox(height: 15),
                  
                  //Sign in button
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 110.0),
                    child: GestureDetector(
                      onTap: () {
                        signIn();
                      },
                      child: Container(
                        padding: const EdgeInsets.all(16),
                        decoration: BoxDecoration(color: Colors.blue[900],
                            borderRadius: BorderRadius.circular(12)
                        ),
                        child: const Center(
                            child: Text(
                              'Sign In',
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

