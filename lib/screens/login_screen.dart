import 'package:flutter/material.dart';

import 'package:google_fonts/google_fonts.dart';

import '../widgets/login/login_dialog.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({Key? key}) : super(key: key);

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  late TextEditingController _loginFieldController;
  late FocusNode _loginFocusNode;
  late TextEditingController _passwordFieldController;
  late FocusNode _passwordFocusNode;

  String login = "";
  String password = "";

  List<Color> colors = <Color>[Colors.purple, Colors.blue];

  @override
  void initState() {
    super.initState();
    _loginFieldController = TextEditingController();
    _loginFocusNode = FocusNode();
    _passwordFieldController = TextEditingController();
    _passwordFocusNode = FocusNode();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        width: double.infinity,
        height: double.infinity,
        decoration: BoxDecoration(
          gradient: LinearGradient(
            colors: colors,
            begin: Alignment.topLeft,
            end: Alignment.bottomRight,
          ),
        ),
        padding: const EdgeInsets.all(20),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              "Welcome!",
              style: GoogleFonts.lato(
                fontSize: 35,
                fontWeight: FontWeight.bold,
                color: Colors.white,
              ),
            ),
            const SizedBox(height: 35),
            Container(
              width: double.infinity,
              height: MediaQuery.of(context).size.height * 0.4,
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(15),
              ),
              padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 35),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        "This is my presentation about my knowledge in Flutter framework.",
                        style: GoogleFonts.lato(
                          fontSize: 16,
                          color: Colors.black,
                        ),
                      ),
                      const SizedBox(height: 20),
                      Text(
                        "First, you need to enter your username and password or register to start the app.",
                        style: GoogleFonts.lato(
                          fontSize: 16,
                          color: Colors.black,
                        ),
                      ),
                    ],
                  ),
                  Row(
                    children: [
                      Expanded(
                        child: Container(
                          height: 45,
                          decoration: BoxDecoration(
                            gradient: const LinearGradient(
                              colors: [Colors.cyan, Colors.indigo],
                              begin: Alignment.topLeft,
                              end: Alignment.bottomRight,
                            ),
                            borderRadius: BorderRadius.circular(15),
                          ),
                          child: ElevatedButton.icon(
                            onPressed: () {
                              showModalBottomSheet(
                                backgroundColor: Colors.white,
                                context: context,
                                builder: (context) {
                                  return LoginDialog(
                                    loginController: _loginFieldController,
                                    loginFocusNode: _loginFocusNode,
                                    loginOnChanged: (loginValue) {
                                      setState(() {
                                        login = loginValue;
                                      });
                                    },
                                    passwordController:
                                        _passwordFieldController,
                                    passwordFocusNode: _passwordFocusNode,
                                    passwordOnChanged: (passwordValue) {
                                      setState(() {
                                        password = passwordValue;
                                      });
                                    },
                                  );
                                },
                              );
                            },
                            style: ElevatedButton.styleFrom(
                              backgroundColor: Colors.transparent,
                              shadowColor: Colors.transparent,
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(15),
                              ),
                            ),
                            icon: const Icon(
                              Icons.person,
                              color: Colors.white,
                            ),
                            label: Text(
                              "Sign In",
                              style: GoogleFonts.lato(
                                fontSize: 16,
                                color: Colors.white,
                              ),
                            ),
                          ),
                        ),
                      ),
                      const SizedBox(width: 10),
                      Expanded(
                        child: Container(
                          height: 45,
                          decoration: BoxDecoration(
                            gradient: const LinearGradient(
                              colors: [Colors.indigo, Colors.cyan],
                              begin: Alignment.topLeft,
                              end: Alignment.bottomRight,
                            ),
                            borderRadius: BorderRadius.circular(15),
                          ),
                          child: ElevatedButton.icon(
                            onPressed: () {},
                            style: ElevatedButton.styleFrom(
                              backgroundColor: Colors.transparent,
                              shadowColor: Colors.transparent,
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(15),
                              ),
                            ),
                            icon: const Icon(
                              Icons.app_registration,
                              color: Colors.white,
                            ),
                            label: Text(
                              "Register",
                              style: GoogleFonts.lato(
                                fontSize: 16,
                                color: Colors.white,
                              ),
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  @override
  void dispose() {
    _loginFieldController.dispose();
    _passwordFieldController.dispose();
    super.dispose();
  }
}
