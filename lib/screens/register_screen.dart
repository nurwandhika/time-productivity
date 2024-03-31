import 'package:flutter/material.dart';
import 'package:pomodoro_app/auth/auth_service.dart';
import 'package:pomodoro_app/screens/home_screen.dart';

class RegisterScreen extends StatefulWidget {
  const RegisterScreen({Key? key}) : super(key: key);

  @override
  State<RegisterScreen> createState() => _RegisterScreenState();
}

class _RegisterScreenState extends State<RegisterScreen> {
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;

    return Scaffold(
      body: Builder(builder: (BuildContext context) {
        return Container(
          width: double.infinity,
          decoration: const BoxDecoration(
            gradient: LinearGradient(
              colors: [
                Color(0xFFF4A095),
                Color(0xFFB3C7BE),
                Color(0xFFD0E0E9),
                Color(0xFF82D2CB),
                Color(0xFF66D7BD),
              ],
              begin: Alignment.topRight,
              end: Alignment.bottomCenter,
            ),
          ),
          child: Padding(
            padding: EdgeInsets.symmetric(horizontal: width * 0.05),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                const Text('REGISTER',
                    style: TextStyle(
                      fontFamily: 'Monsterrat',
                      color: Colors.black,
                      fontSize: 32,
                      fontWeight: FontWeight.w600,
                    )),
                const SizedBox(height: 50),
                const Text("Let's register yourself",
                    textAlign: TextAlign.center,
                    maxLines: 2,
                    style: TextStyle(
                      fontFamily: 'Monsterrat',
                      color: Colors.black,
                      fontSize: 14,
                      fontWeight: FontWeight.w500,
                    )),
                const SizedBox(height: 20),
                TextFormField(
                  controller: _emailController,
                  decoration: InputDecoration(
                    labelText: 'Email',
                    border: OutlineInputBorder(),
                    contentPadding: EdgeInsets.symmetric(
                      vertical: 16,
                      horizontal: 10,
                    ),
                  ),
                ),
                const SizedBox(height: 20),
                TextFormField(
                  controller: _passwordController,
                  obscureText: true,
                  decoration: InputDecoration(
                    labelText: 'Password',
                    border: OutlineInputBorder(),
                    contentPadding: EdgeInsets.symmetric(
                      vertical: 16,
                      horizontal: 10,
                    ),
                  ),
                ),
                SizedBox(height: 20),
                SizedBox(
                  height: 45,
                  width: double.infinity,
                  child: ElevatedButton(
                    onPressed: () async {
                      final message = await AuthService().registration(
                        email: _emailController.text,
                        password: _passwordController.text,
                      );
                      if (message!.contains('Success')) {
                        Navigator.of(context).pushReplacement(
                            MaterialPageRoute(builder: (context) => Home()));
                      }
                      ScaffoldMessenger.of(context).showSnackBar(
                        SnackBar(
                          content: Text(message),
                        ),
                      );
                    },
                    child: Text('Create account'),
                  ),
                ),
                Align(
                  alignment: Alignment.bottomCenter,
                  child: FractionallySizedBox(
                    widthFactor: 0.8,
                    child: Padding(
                      padding: const EdgeInsets.only(bottom: 20, top: 10),
                      child: Row(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          TextButton(
                            onPressed: () {
                              Navigator.pushReplacementNamed(
                                  context, '/loginscreen');
                            },
                            child: Text(
                              'i already have an account',
                              style: TextStyle(
                                fontSize: 16,
                                color: Colors.blue,
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
        );
      }),
    );
  }
}
