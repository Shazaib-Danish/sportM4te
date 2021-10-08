import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:sportm4te/API%20Manager/login_api_manager.dart';
import 'package:sportm4te/Data%20Manager/provider.dart';
import 'package:sportm4te/UI/register.dart';
import 'package:sportm4te/Widgets/reusable_material_button.dart';
import 'package:top_snackbar_flutter/custom_snack_bar.dart';
import 'package:top_snackbar_flutter/top_snack_bar.dart';
import 'dashboard.dart';
import 'forgot_password_screen.dart';
import 'package:shared_preferences/shared_preferences.dart';

class Login extends StatelessWidget {
  Login({Key? key}) : super(key: key);

  String userEmail = '';
  String userPassword = '';

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
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Image.asset(
                    'assets/sportm4te_logo.png',
                    scale: MediaQuery.of(context).size.aspectRatio * 8.0,
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
                    'Sign In',
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
                    style: const TextStyle(color: Colors.white),
                    decoration: const InputDecoration(
                        enabledBorder: UnderlineInputBorder(
                          borderSide: BorderSide(color: Colors.white54),
                        ),
                        focusedBorder: UnderlineInputBorder(
                          borderSide: BorderSide(color: Colors.white),
                        ),
                        hintText: 'E-mail address',
                        hintStyle: TextStyle(
                          color: Colors.grey,
                        ),
                        prefixIcon: Icon(
                          Icons.email,
                          color: Colors.white,
                        )),
                    onChanged: (value) {
                      userEmail = value;
                    },
                  ),
                  const SizedBox(
                    height: 15.0,
                  ),
                  TextFormField(
                    style: const TextStyle(color: Colors.white),
                    decoration: const InputDecoration(
                        enabledBorder: UnderlineInputBorder(
                          borderSide: BorderSide(color: Colors.white54),
                        ),
                        focusedBorder: UnderlineInputBorder(
                          borderSide: BorderSide(color: Colors.white),
                        ),
                        hintText: 'Password',
                        hintStyle: TextStyle(
                          color: Colors.grey,
                        ),
                        prefixIcon: Icon(
                          Icons.lock,
                          color: Colors.white,
                        )),
                    onChanged: (value) {
                      userPassword = value;
                    },
                    obscureText: true,
                  ),
                  const SizedBox(
                    height: 30.0,
                  ),
                  ReusableMaterialButton(
                    title: 'Login',
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
                          final loginData =
                              Provider.of<DataManager>(context, listen: false)
                                  .userData;
                          loginPreferences.setString(
                              'userToken', loginData.token);
                          loginPreferences.setString(
                              'userName', loginData.user.username);
                          loginPreferences.setString(
                              'userImage', loginData.user.image);
                          loginPreferences.setInt('userID', loginData.user.id);
                          loginPreferences.setBool('isLogedIn', false);
                          Provider.of<DataManager>(context, listen: false)
                              .setUserToken(loginData.token);
                          Provider.of<DataManager>(context, listen: false)
                              .setUserName(loginData.user.username);
                          Provider.of<DataManager>(context, listen: false)
                              .setUserImage(loginData.user.image);
                          Provider.of<DataManager>(context, listen: false)
                              .setUserID(loginData.user.id);
                          Navigator.push(
                              context,
                              CupertinoPageRoute(
                                builder: (context) => const Dashboard(
                                  isLogedIn: false,
                                ),
                              ));
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
                                builder: (context) => const ForgotPassword(),
                              ));
                        },
                        child: const Text(
                          'Forgot Password?',
                          style: TextStyle(color: Colors.grey),
                        ),
                      ),
                      const Spacer(),
                      InkWell(
                        onTap: () {
                          Navigator.push(context, CupertinoPageRoute(
                            builder: (context)=> Register(),
                          ));
                        },
                        child: const Text(
                          'Create Account',
                          style: TextStyle(color: Colors.grey),
                        ),
                      ),
                    ],
                  )
                ],
              ),
            ),
          )
        ],
      ),
    );
  }
}
