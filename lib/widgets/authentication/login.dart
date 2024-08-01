import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:ndula/widgets/globals.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  @override
  Widget build(BuildContext context) {
    // i made this
    double screenWidth = MediaQuery.of(context).size.width;
// and also this
    TextTheme textTheme = Globals.textTheme(screenWidth);
    return Container(
      padding: EdgeInsets.all(10),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          SizedBox(
            height: 10,
          ),
          Image.asset("assets/images/login.webp"),
          SizedBox(
            height: 10,
          ),
          Text("Sign up", style: textTheme.bodyLarge)
        ],
      ),
    );
  }
}
