import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:sportm4te/API%20Manager/login_api_manager.dart';
import 'package:sportm4te/Components/k_compnents.dart';
import 'package:sportm4te/Data%20Manager/provider.dart';
import 'package:sportm4te/UI/login_screen.dart';
import 'package:sportm4te/Widgets/reusable_material_button.dart';
import 'package:top_snackbar_flutter/custom_snack_bar.dart';
import 'package:top_snackbar_flutter/top_snack_bar.dart';
import 'package:shared_preferences/shared_preferences.dart';

class Register extends StatelessWidget {
  Register({Key? key}) : super(key: key);

  String userEmail = '';
  String userPassword = '';
  String userConfirmPassword = '';
  String birthdate='';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        fit: StackFit.expand,
        children: [
          Image.asset(
            'assets/tennis.jpg',
            fit: BoxFit.fill,
            color: Colors.black54.withOpacity(0.7),
            colorBlendMode: BlendMode.darken,
          ),
          Padding(
            padding: const EdgeInsets.all(12.0),
            child: Form(
              child: SafeArea(
                child: SingleChildScrollView(
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Image.asset(
                        'assets/sportm4te_logo.png',
                        scale: MediaQuery.of(context).size.aspectRatio * 12.0,
                      ),
                      const SizedBox(
                        height: 20.0,
                      ),
                      const Text(
                        'Let\'s Get Started',
                        style: TextStyle(
                          color: Colors.green,
                          fontWeight: FontWeight.w700,
                          fontSize: 12.0,
                        ),
                      ),
                      const Text(
                        'Sign Up',
                        style: TextStyle(
                          fontSize: 25.0,
                          color: Colors.white,
                          fontWeight: FontWeight.w900,
                        ),
                      ),
                      const SizedBox(
                        height: 20.0,
                      ),
                      TextFormField(
                        cursorColor: Colors.green,
                        keyboardType: TextInputType.datetime,
                        style: const TextStyle(color: Colors.white),
                        decoration: kTextFieldInputDecoration.copyWith(
                          hintText: 'Username',
                            prefixIcon: const Icon(
                            Icons.person,
                            color: Colors.white,
                          )
                        ),
                        onChanged: (value) {
                          userEmail = value;
                        },
                      ),
                      const SizedBox(
                        height: 15.0,
                      ),
                      TextFormField(
                        cursorColor: Colors.green,
                        keyboardType: TextInputType.datetime,
                        style: const TextStyle(color: Colors.white),
                        decoration: kTextFieldInputDecoration.copyWith(
                            hintText: 'E-mail Address',
                            prefixIcon: const Icon(
                              Icons.alternate_email,
                              color: Colors.white,
                            )
                        ),
                        onChanged: (value) {
                          userEmail = value;
                        },
                      ),
                      const SizedBox(
                        height: 15.0,
                      ),
                      TextFormField(
                        cursorColor: Colors.green,
                        keyboardType: TextInputType.datetime,
                        style: const TextStyle(color: Colors.white),
                        decoration: kTextFieldInputDecoration.copyWith(
                            hintText: 'Birthdate',
                            prefixIcon: const Icon(
                              Icons.calendar_today_rounded,
                              color: Colors.white,
                            )
                        ),
                        onChanged: (value) {
                          userEmail = value;
                        },
                      ),
                      const SizedBox(
                        height: 15.0,
                      ),
                      TextFormField(
                        cursorColor: Colors.green,
                        keyboardType: TextInputType.datetime,
                        style: const TextStyle(color: Colors.white),
                        decoration: kTextFieldInputDecoration.copyWith(
                            hintText: 'Gender',
                            prefixIcon: const Icon(
                              Icons.person,
                              color: Colors.white,
                            )
                        ),
                        onChanged: (value) {
                          userEmail = value;
                        },
                      ),
                      const SizedBox(
                        height: 15.0,
                      ),
                      TextFormField(
                        cursorColor: Colors.green,
                        keyboardType: TextInputType.datetime,
                        style: const TextStyle(color: Colors.white),
                        decoration: kTextFieldInputDecoration.copyWith(
                            hintText: 'Password',
                            prefixIcon: const Icon(
                              Icons.lock,
                              color: Colors.white,
                            )
                        ),
                        onChanged: (value) {
                          userEmail = value;
                        },
                      ),
                      const SizedBox(
                        height: 15.0,
                      ),
                      TextFormField(
                        cursorColor: Colors.green,
                        keyboardType: TextInputType.datetime,
                        style: const TextStyle(color: Colors.white),
                        decoration: kTextFieldInputDecoration.copyWith(
                            hintText: 'Password Confirmation',
                            prefixIcon: const Icon(
                              Icons.lock,
                              color: Colors.white,
                            )
                        ),
                        onChanged: (value) {
                          userEmail = value;
                        },
                      ),

                      CheckboxListTile(
                        title: const Text("I Agree To The ",style: TextStyle(
                          color: Colors.grey,
                          fontSize: 10.0,
                        ),),
                        activeColor: Colors.grey,
                        checkColor: Colors.green,
                        value: false,
                        onChanged: (newValue) {

                        },
                        controlAffinity: ListTileControlAffinity.leading,  //  <-- leading Checkbox
                      ),
                      const SizedBox(
                        height: 30.0,
                      ),
                      ReusableMaterialButton(
                        title: 'Sign Up',
                        onPressed: () async {
                          SharedPreferences loginPreferences =
                          await SharedPreferences.getInstance();
                          await UserLoginApiManager()
                              .login(userEmail, userPassword, context)
                              .whenComplete(() {
                            final loginCheck =
                                Provider.of<DataManager>(context, listen: false)
                                    .isLoginDone;
                            if (loginCheck == 'Bad Password') {
                              showTopSnackBar(
                                context,
                                const CustomSnackBar.error(
                                  message:
                                  "Something went wrong. Please check your credentials and try again",
                                ),
                              );
                            } else {
                              showTopSnackBar(
                                context,
                                const CustomSnackBar.success(
                                  message: "You have loged in, Have a nice day",
                                ),
                              );

                            }
                          });
                        },
                      ),
                      Row(
                        children: [
                          InkWell(
                            onTap: () {
                              Navigator.push(
                                  context,
                                  CupertinoPageRoute(
                                    builder: (context) => Login(),
                                  ));
                            },
                            child: const Text(
                              'Already have an Account?',
                              style: TextStyle(color: Colors.grey),
                            ),
                          ),
                        ],
                      )
                    ],
                  ),
                ),
              ),
            ),
          )
        ],
      ),
    );
  }
}
