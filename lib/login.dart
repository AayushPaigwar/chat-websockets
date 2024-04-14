import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import 'const.dart';

class LoginPage extends StatelessWidget {
  const LoginPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0,
        centerTitle: true,
        title: Text(
          "ChatLink",
          style: GoogleFonts.poppins(
            fontSize: 20,
            fontWeight: FontWeight.bold,
            color: Colors.black,
          ),
        ),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20.0, vertical: 0),
          child: Column(
            children: [
              buildHeight(20),
              Image.asset('assets/images/onboarding.png',
                  width: 300, height: 300),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  RichText(
                    text: TextSpan(
                      children: [
                        TextSpan(
                          text: "ChatLink\n",
                          style: GoogleFonts.poppins(
                            fontSize: 30,
                            fontWeight: FontWeight.bold,
                            color: Colors.black,
                          ),
                        ),
                        TextSpan(
                          text: "Chat with your friends \nand family",
                          style: GoogleFonts.poppins(
                            fontSize: 30,
                            fontWeight: FontWeight.bold,
                            color: const Color(0xff6046C5),
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
              buildHeight(20),
              Text(
                "Connect with your friends and family",
                style: GoogleFonts.poppins(
                  fontSize: 16,
                  color: Colors.grey,
                ),
              ),
              buildHeight(30),
              TextButton(
                style: ButtonStyle(
                    side: const MaterialStatePropertyAll(
                        BorderSide(color: Colors.black38, width: 0.5)),
                    fixedSize: const MaterialStatePropertyAll(Size(300, 50)),
                    backgroundColor:
                        MaterialStateProperty.all(const Color(0xff6046C5))),
                onPressed: () {
                  //Login button navigation
                  Navigator.pushNamed(
                    context,
                    "/home",
                  );
                },
                child: Text(
                  "LOGIN",
                  style: GoogleFonts.poppins(
                      color: Colors.white,
                      fontSize: 16,
                      fontWeight: FontWeight.w500),
                ),
              ),
              buildHeight(20),
              TextButton(
                style: ButtonStyle(
                  side: const MaterialStatePropertyAll(
                    BorderSide(color: Colors.black38, width: 0.5),
                  ),
                  fixedSize: const MaterialStatePropertyAll(Size(300, 50)),
                  backgroundColor: MaterialStateProperty.all(Colors.white),
                ),
                onPressed: () {
                  //Sign up button navigation
                  ScaffoldMessenger.of(context).showSnackBar(
                    const SnackBar(
                      content: Text("Sign up Clicked"),
                    ),
                  );
                },
                child: Text(
                  "SIGN UP",
                  style: GoogleFonts.poppins(
                      color: Colors.black,
                      fontSize: 16,
                      fontWeight: FontWeight.w500),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
