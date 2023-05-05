import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';

class Sign_In extends StatefulWidget {
  const Sign_In({Key? key}) : super(key: key);

  @override
  State<Sign_In> createState() => _Sign_InState();
}

class _Sign_InState extends State<Sign_In> {

  // text controllers
  final _emailController = TextEditingController();
  final _passwordController = TextEditingController();

  Future signIn() async{
    await FirebaseAuth.instance.signInWithEmailAndPassword(
        email: _emailController.text.trim(),
        password: _passwordController.text.trim()
    );
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

                  const SizedBox(height: 15),
                  //Wits logo
                  const Image(image: AssetImage('images/witsimage.png')),

                  const SizedBox(height: 15),

                  const Text('Welcome To The Wits Tennis Club!',
                    style: TextStyle(
                      fontWeight: FontWeight.normal,
                      fontSize: 18,
                      color: Colors.blue,
                    ),
                  ),

                  const SizedBox(height: 40),
                  //Email text above it's textfield
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 28.0),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: const [
                        Text('Email',
                          style: TextStyle(
                              color: Colors.blue,
                              fontSize: 17
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
                        border: Border.all(color: Colors.blue),
                        borderRadius: BorderRadius.circular(12),
                      ),
                      child: Padding(
                        padding: EdgeInsets.only(left: 20.0),
                        child: TextField(
                          controller: _emailController,
                          decoration: const InputDecoration(
                              border: InputBorder.none,
                              hintText: 'example@domain.com'
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
                      children: const [
                        Text('Password',
                          style: TextStyle(
                              color: Colors.blue,
                              fontSize: 17
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
                        border: Border.all(color: Colors.blue),
                        borderRadius: BorderRadius.circular(12),
                      ),
                      child: Padding(
                        padding: const EdgeInsets.only(left: 20.0),
                        child: TextField(
                          controller: _passwordController,
                          obscureText: true,
                          decoration: const InputDecoration(
                            border: InputBorder.none,
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
                      children: const [
                        Text('Forgot Password?',
                          style: TextStyle(
                              color: Colors.blue,
                              fontWeight: FontWeight.bold
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
                      onTap: signIn,
                      child: Container(
                        padding: const EdgeInsets.all(16),
                        decoration: BoxDecoration(color: Colors.blue,
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
                  )
                ],
              ),
            ),
          )
      ) ,
    );
  }
}

