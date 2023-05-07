import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

class Forgot_Password extends StatefulWidget {
  const Forgot_Password({Key? key}) : super(key: key);

  @override
  State<Forgot_Password> createState() => _Forgot_PasswordState();
}

class _Forgot_PasswordState extends State<Forgot_Password> {

  final _emailController = TextEditingController();

  @override
  void dispose() {
    _emailController.dispose();
    super.dispose();
  }

  Future passwordReset() async {
    try{
      await FirebaseAuth.instance.sendPasswordResetEmail(email: _emailController.text.trim());
      showDialog(
          context: context,
          builder: (context){
            return const AlertDialog(
              content: Text('Password Reset Link Sent! Check Your Email'),
            );
          });
    } on FirebaseAuthException catch (e) {
      print('e');
      showDialog(
          context: context,
          builder: (context) {
            return AlertDialog(
              content: Text(e.message.toString()),
            );
          });
    }
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
                  const SizedBox(height: 30),

                  const SizedBox(height: 50),

                  Text('TENNIS CLUB',
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 27,
                      color: Colors.blue.shade900,
                      decoration: TextDecoration.underline,
                    ),
                  ),

                  const SizedBox(height: 40),

                  Text('Reset Password',
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 20,
                      color: Colors.blue.shade900,
                      decoration: TextDecoration.underline,
                    ),
                  ),

                  const SizedBox(height: 20),

                  const Text('Enter Your Email And We Will Send You A Password Reset Link',
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 13,
                      color: Colors.grey,
                      decoration: TextDecoration.underline,
                    ),
                  ),

                  const SizedBox(height: 10),

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
                            hintText: 'Enter Your Email Here',
                            prefixIcon: Icon(Icons.email),
                          ),
                        ),
                      ),
                    ),
                  ),

                  const SizedBox(height: 15),

                  //Reset button
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 110.0),
                    child: GestureDetector(
                      onTap: () {

                      },
                      child: Container(
                        padding: const EdgeInsets.all(8),
                        decoration: BoxDecoration(color: Colors.blue[900],
                            borderRadius: BorderRadius.circular(15)
                        ),
                        child: Center(
                            child: MaterialButton(
                              onPressed: () {
                                passwordReset();
                              },
                              child: const Text(
                                'Reset',
                                style: TextStyle(color: Colors.white,
                                    fontWeight: FontWeight.bold,
                                    fontSize: 15
                                ),
                              ),
                            )),
                      ),
                    ),
                  ),
                  const SizedBox(height: 30),

                  GestureDetector(
                    onTap: () {
                      Navigator.pop(context);
                    },
                    child: Text('Go Back',
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 15,
                        color: Colors.blue.shade900,
                        decoration: TextDecoration.underline,
                      ),
                    ),
                  ),

                  const SizedBox(height: 20),
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
