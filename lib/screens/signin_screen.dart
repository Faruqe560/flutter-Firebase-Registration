import 'package:blog_app/components/custom_text_form_fild.dart';
import 'package:blog_app/components/round_button.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:modal_progress_hud_nsn/modal_progress_hud_nsn.dart';

class SignInScreen extends StatefulWidget {
  SignInScreen({Key? key}) : super(key: key);

  @override
  State<SignInScreen> createState() => _SignInScreenState();
}

class _SignInScreenState extends State<SignInScreen> {
  String  email = "", password = "";
  TextEditingController nameeditingController = TextEditingController();
  TextEditingController emaileditingController = TextEditingController();
  TextEditingController passwordeditingController = TextEditingController();
  TextEditingController repiatpasswordeditingController =
      TextEditingController();
  final _formKey = GlobalKey<FormState>();
  bool showSpinner = false;
  FirebaseAuth _auth = FirebaseAuth.instance;
  @override
  Widget build(BuildContext context) {
    return ModalProgressHUD(
      inAsyncCall: showSpinner,
      child: Scaffold(
          appBar: AppBar(
            backgroundColor: Colors.deepOrange,
            centerTitle: true,
            title: Text(
              "Create Account",
              style: TextStyle(fontSize: 22, fontWeight: FontWeight.bold),
            ),
          ),
          body: ListView(
            children: [
              Padding(
                padding: const EdgeInsets.symmetric(
                  horizontal: 20,
                ),
                child: Column(
                  children: [
                    SizedBox(
                      height: 0,
                    ),
                    Image.asset(
                      "assets/images/rg.png",
                      height: 150,
                      // width: double.infinity,
                    ),
                    Form(
                      key: _formKey,
                      child: Column(
                        children: [
                          // MyTextFormFild(
                          //   labelText: "Enter Your Name",
                          //   obScureText: false,
                          //   TextEditingController: nameeditingController,
                          //   TextInpurType: TextInputType.name,
                          //   validation: (nameeditingController) {
                          //     return nameeditingController.isEmpty
                          //         ? 'enter Email'
                          //         : null;
                          //   },
                          // ),
                          // MyTextFormFild(
                          //   labelText: "Enter Your Email",
                          //   obScureText: false,
                          //   TextEditingController: emaileditingController,
                          //   TextInpurType: TextInputType.emailAddress,
                          //   validation: (emaileditingController) {
                          //     return emaileditingController.isEmpty
                          //         ? 'enter Email'
                          //         : null;
                          //   },
                          // ),
                          // MyTextFormFild(
                          //   labelText: "Password",
                          //   obScureText: true,
                          //   TextEditingController: passwordeditingController,
                          //   TextInpurType: TextInputType.text,
                          //   validation: (passwordeditingController) {
                          //     return passwordeditingController.isEmpty
                          //         ? 'enter Password'
                          //         : null;
                          //   },
                          // ),
                          // MyTextFormFild(
                          //   labelText: "Repeat Password",
                          //   obScureText: true,
                          //   TextEditingController:
                          //       repiatpasswordeditingController,
                          //   TextInpurType: TextInputType.text,
                          //   validation: (repiatpasswordeditingController) {
                          //     return repiatpasswordeditingController.isEmpty
                          //         ? 'enter Repeat-Password'
                          //         : null;
                          //   },
                          // ),
                          TextFormField(
                          keyboardType: TextInputType.emailAddress,
                          controller: emaileditingController,
                          decoration: InputDecoration(

                              // prefix: Lottie.asset("emaillottie.json",
                              //   height: 20, width: 20,),
                              labelText: "email",
                              border: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(15),
                              )),
                          onChanged: (String value) {
                            email = value;
                          },
                          validator: (value) {
                            return value!.isEmpty ? "Enter Your Email" : null;
                          },
                        ),
                        SizedBox(
                          height: 10,
                        ),
                        TextFormField(
                          obscureText: true,
                          keyboardType: TextInputType.emailAddress,
                          controller: passwordeditingController,
                          decoration: InputDecoration(
                              labelText: "password",
                              border: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(15),
                              )),
                          onChanged: (String value) {
                            password = value;
                          },
                          validator: (value) {
                            return value!.isEmpty
                                ? "Enter Your Password"
                                : null;
                          },
                        ),
                          SizedBox(
                            height: 30,
                          ),
                          RoundButton(
                              title: "Register",
                              color: Colors.deepOrange,
                              onPress: () async {
                                if (_formKey.currentState!.validate()) {
                                  setState(() {
                                    showSpinner = true;
                                  });
                                  try {
                                    final user = await _auth
                                        .createUserWithEmailAndPassword(
                                            email: email
                                                .toString(),
                                            password:
                                                password
                                                    .toString());
                                    if (user != null) {
                                      print("Your Registration Succefully");
                                      toastMessage(
                                          "Yor Registration Successfully");
                                      setState(() {
                                        showSpinner = false;
                                      });
                                    }
                                  } catch (e) {
                                    print(e.toString());
                                    toastMessage(e.toString());
                                    setState(() {
                                      showSpinner = false;
                                    });
                                  }
                                }
                              })
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ],
          )),
    );
  }
}

void toastMessage(String message) {
  Fluttertoast.showToast(
      msg: message.toString(),
      toastLength: Toast.LENGTH_SHORT,
      gravity: ToastGravity.SNACKBAR,
      timeInSecForIosWeb: 1,
      backgroundColor: Colors.red,
      textColor: Colors.white,
      fontSize: 16.0);
}
