import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';
import 'package:pomodoro_app/auth/auth_service.dart';
import 'package:pomodoro_app/screens/home_screen.dart';
// import 'package:pomodoro_app/provider/auth_provider.dart';
// import 'package:provider/provider.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;
    // var loadAuth = Provider.of<AuthProvider>(context);

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
          // Container(),
          child: Padding(
            padding: EdgeInsets.symmetric(horizontal: width * 0.05),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                const Text('LOGIN',
                    style: TextStyle(
                      fontFamily: 'Monsterrat',
                      color: Colors.black,
                      fontSize: 32,
                      fontWeight: FontWeight.w600,
                    )),
                const SizedBox(height: 50),
                const Text('Please Login to get Started',
                    textAlign: TextAlign.center,
                    maxLines: 2,
                    style: TextStyle(
                      fontFamily: 'Monsterrat',
                      color: Colors.black,
                      fontSize: 14,
                      fontWeight: FontWeight.w500,
                    )),
                const SizedBox(height: 20),
                // TextFormField(
                //   decoration: InputDecoration(
                //     labelText: 'Email',
                //     border: OutlineInputBorder(),
                //     contentPadding: EdgeInsets.symmetric(
                //       vertical: 16,
                //       horizontal: 10,
                //     ),
                //   ),
                // ),
                TextFormField(
                  controller: _emailController,
                  // keyboardType: TextInputType.emailAddress,
                  decoration: InputDecoration(
                    // hintText: 'Email',
                    // fillColor: Colors.white,
                    // filled: true,
                    // focusedBorder: OutlineInputBorder(
                    //   borderRadius: BorderRadius.circular(8),
                    //   borderSide: BorderSide(
                    //     color: Colors.white,
                    //   ),
                    // ),
                    // enabledBorder: OutlineInputBorder(
                    // borderRadius: BorderRadius.circular(8),
                    // borderSide: BorderSide(
                    // color: Colors.white,
                    // ),
                    labelText: 'Email',
                    border: OutlineInputBorder(),
                    contentPadding: EdgeInsets.symmetric(
                      vertical: 16,
                      horizontal: 10,
                      // ),
                    ),
                  ),
                ),
                const SizedBox(height: 20),
                TextFormField(
                  obscureText: true,
                  controller: _passwordController,
                  decoration: InputDecoration(
                    labelText: 'Password',
                    border: OutlineInputBorder(),
                    contentPadding: EdgeInsets.symmetric(
                      vertical: 16,
                      horizontal: 10,
                    ),
                  ),
                ),
                // const SizedBox(height: 20),
                // const Row(
                //   mainAxisAlignment: MainAxisAlignment.end,
                //   children: [
                //     Text(
                //       'Forgot Password',
                //       style: TextStyle(
                //         fontSize: 14,
                //         color: Colors.blue,
                //       ),
                //     )
                //   ],
                // ),
                SizedBox(height: 20),
                SizedBox(
                  height: 45,
                  width: double.infinity,
                  child: ElevatedButton(
                    // onPressed: () {
                    // loadAuth.submit();
                    // print(
                    // 'Email: ${_emailController.text}, Password: ${_passwordController.text}');
                    // },
                    onPressed: () async {
                      final message = await AuthService().login(
                        email: _emailController.text,
                        password: _passwordController.text,
                      );
                      if (message!.contains('Success')) {
                        Navigator.of(context).pushReplacement(
                          MaterialPageRoute(
                            builder: (context) => Home(),
                          ),
                        );
                      }
                      ScaffoldMessenger.of(context).showSnackBar(
                        SnackBar(
                          content: Text(message),
                        ),
                      );
                    },
                    // child: Text(loadAuth.isLogin ? "Login" : "Register"),
                    child: Text('Login'),
                  ),
                ),
                Align(
                  alignment: Alignment.bottomCenter,
                  child: FractionallySizedBox(
                    widthFactor: 1.8,
                    child: Padding(
                      padding: const EdgeInsets.only(bottom: 20, top: 15),
                      child: Row(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text(
                            'Don\'t have an account yet? ',
                            style: TextStyle(
                              fontSize: 16,
                            ),
                          ),
                          // SizedBox(width: 8),
                          TextButton(
                            onPressed: () {
                              Navigator.pushReplacementNamed(
                                  context, '/registerscreen');
                            },
                            child: Text(
                              'Register',
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
