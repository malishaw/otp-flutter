import 'package:flutter/material.dart';

import 'login.dart';
//import 'package:splash_login_sign_in_pages/screens/sign_up.dart';


class WelcomeScreen extends StatelessWidget {
  const WelcomeScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(
        child: Column(
          children: [
            Image.asset(
              "assets/logo.jpg",
              fit: BoxFit.cover,
            ),
            const SizedBox(height: 25),
            //User login button
            Padding(
              padding: const EdgeInsets.symmetric(
                horizontal: 40,
                vertical: 5,
              ),
              child: Row(
                children: [
                  Expanded(
                    child: MaterialButton(
                      color:Colors.blue,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(8),
                      ),
                      onPressed: () {
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => const Login()));
                      },
                      child: const Padding(
                        padding: EdgeInsets.all(15.0),
                        child: Text(
                          "User",
                          style: TextStyle(
                            color: Colors.white,
                            fontSize: 16,
                          ),
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
            //Shop Owner login button
            Padding(
              padding: const EdgeInsets.symmetric(
                horizontal: 40,
                vertical: 5,
              ),
              child: Row(
                children: [
                  Expanded(
                    child: MaterialButton(
                      shape: RoundedRectangleBorder(
                        side: const BorderSide(
                          color: Color(0xFF1E232C),
                        ),
                        borderRadius: BorderRadius.circular(8),
                      ),
                      onPressed: () {
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => const Login()));
                      },
                      child: const Padding(
                        padding: EdgeInsets.all(15.0),
                        child: Text(
                          "Shop Owner",
                          style: TextStyle(
                            color: Color(0xFF1E232C),
                            fontSize: 16,
                          ),
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
            const Spacer(),
          ],
        ),
      ),
    );
  }
}
