import 'dart:async';

import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:http/http.dart';
import 'package:loading_animation_widget/loading_animation_widget.dart';
import 'package:ndula/widgets/AppBloc.dart';
import 'package:ndula/widgets/globals.dart';
import 'package:ndula/widgets/ServerRequests.dart';
import 'package:provider/provider.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  final _formKey = GlobalKey<FormState>();
  final _usernameController = TextEditingController();
  final _passwordController = TextEditingController();
  bool isSecure = true;
  late StreamSubscription<List<ConnectivityResult>> subscription;

  @override
  void initState() {
    try {
      bool connection = false;
      subscription = Connectivity()
          .onConnectivityChanged
          .listen((List<ConnectivityResult> result) {
        if (result.contains(ConnectivityResult.wifi)) {
          print(result);
          connection = true;
          context.read<Appbloc>().changeConnection(connection);
        } else if (result.contains(ConnectivityResult.mobile)) {
          print(result);
          connection = true;
          context.read<Appbloc>().changeConnection(connection);
        } else if (result.contains(ConnectivityResult.none)) {
          print(result);
          connection = false;

          Globals(context: context).nointernet();
          context.read<Appbloc>().changeConnection(connection);
        }
      });
    } catch (e) {
      print("got this error in  the init method splashscreen $e");
      throw Exception(e);
    }

    super.initState();
  }

  @override
  void dispose() {
    _usernameController.dispose();
    _passwordController.dispose();
    super.dispose();
  }

  String? _validateUsername(String? value) {
    if (value == null || value.isEmpty) {
      return 'Please enter a username';
    }
    if (value.length < 4) {
      return 'Username must be at least 4 characters';
    }
    return null;
  }

  String? _validatePassword(String? value) {
    if (value == null || value.isEmpty) {
      return 'Please enter a password';
    }
    if (value.length < 6) {
      return 'Password must be at least 6 characters';
    }
    return null;
  }

 void _login() async {
  if (_formKey.currentState?.validate() ?? false) {
    try {
      // Check internet connection
      bool isConnected = await Globals(context: context).checkinternet();

      if (!isConnected) {
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(content: Text('No internet connection')),
        );
        return;
      }

      // Check if another upload is in progress
      bool isUploading = Provider.of<Appbloc>(context, listen: false).isUploading;

      if (isUploading) {
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(content: Text('Please be patient')),
        );
        return;
      }

      // Perform login request
      await loginRequest().login(
        username: _usernameController.text.trim(),
        password: _passwordController.text.trim(),
        context: context,
      );

    } catch (e) {
      // Handle exceptions
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text('An error occurred: ${e.toString()}')),
      );
    }
  }
}


  @override
  Widget build(BuildContext context) {
    double screenWidth = MediaQuery.of(context).size.width;
    TextTheme textTheme = Globals.textTheme(screenWidth);

    return Scaffold(
      resizeToAvoidBottomInset: true,
      body: SingleChildScrollView(
        child: Container(
          height: MediaQuery.of(context).size.height,
          child: Stack(
            children: [
              Positioned(
                top: 0,
                left: 0,
                right: 0,
                child: Container(
                  height: MediaQuery.of(context).size.height * 0.4,
                  child: Image.asset(
                    "assets/images/login.gif",
                    fit: BoxFit.cover,
                  ),
                ),
              ),
              Positioned(
                top: MediaQuery.of(context).size.height * 0.35,
                left: 16,
                right: 16,
                child: Container(
                  padding: EdgeInsets.all(16.0),
                  child: Form(
                    key: _formKey,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text("Login", style: textTheme.bodyLarge),
                        SizedBox(height: 16.0),
                        TextFormField(
                          controller: _usernameController,
                          decoration: InputDecoration(
                            prefixIcon: Icon(Icons.alternate_email),
                            labelText: 'Username',
                          ),
                          validator: _validateUsername,
                        ),
                        SizedBox(height: 16.0),
                        TextFormField(
                          controller: _passwordController,
                          decoration: InputDecoration(
                            suffixIcon: IconButton(
                                onPressed: () {
                                  setState(() {
                                    isSecure = !isSecure;
                                  });
                                },
                                icon: isSecure
                                    ? Icon(Icons.visibility)
                                    : Icon(Icons.visibility_off)),
                            prefixIcon: Icon(Icons.lock),
                            labelText: 'Password',
                          ),
                          obscureText: isSecure,
                          validator: _validatePassword,
                        ),
                        SizedBox(height: 30.0),
                        GestureDetector(
                          onTap: _login,
                          child: Center(
                            child: SizedBox(
                              width: screenWidth * 0.7,
                              height: 50,
                              child: Container(
                                alignment: Alignment.center,
                                decoration: BoxDecoration(
                                    color: Colors.blue,
                                    borderRadius:
                                        BorderRadiusDirectional.circular(20)),
                                child: context.watch<Appbloc>().isLoading
                                    ? LoadingAnimationWidget.twistingDots(
                                        leftDotColor: Colors.white,
                                        rightDotColor: Colors.white,
                                        size: 20,
                                      )
                                    : Text(
                                        "Login",
                                        style: textTheme.titleMedium,
                                      ),
                                // onPressed: _login,
                                // style: ElevatedButton.styleFrom(
                                //   // primary: Colors.blue.shade300,
                                //   shape: RoundedRectangleBorder(
                                //     borderRadius: BorderRadius.circular(20.0),
                                //   ),
                                // ),
                                // child: Text(
                                //   "Login",
                                //   style: textTheme.titleMedium,
                                // ),
                              ),
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
      ),
    );
  }
}
