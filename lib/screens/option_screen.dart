import 'package:blog_app/components/round_button.dart';
import 'package:blog_app/screens/signin_screen.dart';
import 'package:flutter/material.dart';

class OptionScreen extends StatefulWidget {
  OptionScreen({Key? key}) : super(key: key);

  @override
  State<OptionScreen> createState() => _OptionScreenState();
}

class _OptionScreenState extends State<OptionScreen> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
          body: ListView(
        children: [
          Padding(
            padding: const EdgeInsets.all(25.0),
            child: Column(
              children: [
                SizedBox(
                  height: 22,
                ),
                Image.asset("assets/images/w1.png"),
                SizedBox(
                  height: 100,
                ),
                RoundButton(
                  title: "Login",
                  onPress: () {},
                  color: Colors.deepOrange,
                ),
                SizedBox(
                  height: 15,
                ),
                RoundButton(
                  title: "Register",
                  onPress: () {
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => SignInScreen()));
                  },
                  color: Colors.deepOrange,
                )
              ],
            ),
          ),
        ],
      )),
    );
  }
}
