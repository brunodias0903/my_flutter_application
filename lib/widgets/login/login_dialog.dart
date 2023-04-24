import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import 'custom_input.dart';

class LoginDialog extends StatefulWidget {
  final TextEditingController loginController;
  final FocusNode loginFocusNode;
  final Function(String) loginOnChanged;

  final TextEditingController passwordController;
  final FocusNode passwordFocusNode;
  final Function(String) passwordOnChanged;

  const LoginDialog({
    Key? key,
    required this.loginController,
    required this.loginFocusNode,
    required this.loginOnChanged,
    required this.passwordController,
    required this.passwordFocusNode,
    required this.passwordOnChanged,
  }) : super(key: key);

  @override
  State<LoginDialog> createState() => _LoginDialogState();
}

class _LoginDialogState extends State<LoginDialog> {
  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      height: double.infinity,
      padding: const EdgeInsets.all(16),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          CustomInput(
            controller: widget.loginController,
            focusNode: widget.loginFocusNode,
            hintMessage: "Username or e-mail",
            onChanged: widget.loginOnChanged,
            obscure: false,
          ),
          const SizedBox(height: 15),
          CustomInput(
            controller: widget.passwordController,
            focusNode: widget.passwordFocusNode,
            hintMessage: "Password",
            onChanged: widget.passwordOnChanged,
            obscure: true,
          ),
          const SizedBox(height: 55),
          Container(
            width: double.infinity,
            height: 60,
            decoration: BoxDecoration(
              gradient: const LinearGradient(
                colors: [Colors.cyan, Colors.indigo],
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
                Icons.arrow_forward,
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
        ],
      ),
    );
  }
}
