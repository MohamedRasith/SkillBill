import 'package:email_password_login/screens/home_screen.dart';
import 'package:email_password_login/screens/registration_screen.dart';
import 'package:email_password_login/screens/sign_in.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';

import '../common_widgets/custom_spacer_widget.dart';
import '../core/utils/constants.dart';
import '../core/utils/fonts.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({Key? key}) : super(key: key);

  @override
  _LoginScreenState createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  // form key
  final _formKey = GlobalKey<FormState>();

  // editing controller
  final TextEditingController emailController = new TextEditingController();
  final TextEditingController passwordController = new TextEditingController();
  bool isObscure = true;
  bool isHidden = true;

  // firebase
  final _auth = FirebaseAuth.instance;
  
  // string for displaying the error Message
  String? errorMessage;

  @override
  Widget build(BuildContext context) {
    //email field

    return Scaffold(
        backgroundColor: AppColors.backgroundWhite,
        body: Container(
            width: MediaQuery.of(context).size.width,
            padding: const EdgeInsets.symmetric(horizontal: 10),
            color: AppColors.white,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const CustomSpacerWidget(height: 100,),
                Text("Hello.",style: AppFonts.extraBoldStyle(fontSize: 30)),
                const CustomSpacerWidget(height: 10,),
                Text("Welcome back",style: AppFonts.mediumStyle(fontSize: 20,fontColor: AppColors.borderColor)),
                const CustomSpacerWidget(height: 30,),
                _email(),
                const CustomSpacerWidget(height: 30,),
                _password(),
                const CustomSpacerWidget(height: 40,),
                _button(),
                const CustomSpacerWidget(height: 40,),
                _socialLogin(),
                const CustomSpacerWidget(height: 30,),
                _signUp()
              ],
            )
        )
    );
  }
  _email(){
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text("Email",style: AppFonts.extraBoldStyle(fontSize: 20)),
        Container(
            margin: const EdgeInsets.only(top: 8, right: 20),
            height: 30,
            padding: const EdgeInsets.only(left: 10,bottom: 5),
            width: double.infinity,
            decoration: const BoxDecoration(
              color: AppColors.borderLight,
              borderRadius: BorderRadius.all(Radius.circular(3.0) //
              ),
            ),
            child: TextField(
              controller: emailController,
              decoration: InputDecoration(
                hintText: "Enter email",
                hintStyle: AppFonts.mediumStyle(fontColor: AppColors.greyColor,fontSize: 15),
                icon: const Icon(Icons.email,color: AppColors.black,size: 20,),
                border: InputBorder.none,
                enabledBorder: InputBorder.none,
                focusedBorder: InputBorder.none,
              ),
            )),
      ],
    );
  }
  _password(){
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text("Password",style: AppFonts.extraBoldStyle(fontSize: 20)),
        Container(
            margin: const EdgeInsets.only(top: 8, right: 20),
            height: 30,
            padding: const EdgeInsets.only(left: 10,bottom: 5),
            width: double.infinity,
            decoration: const BoxDecoration(
              color: AppColors.borderLight,
              borderRadius: BorderRadius.all(Radius.circular(3.0) //
              ),
            ),
            child: TextField(
              obscureText: isHidden,
              controller: passwordController,
              decoration: InputDecoration(
                hintText: "Enter password",
                hintStyle: AppFonts.mediumStyle(fontColor: AppColors.greyColor,fontSize: 15),
                icon: const Icon(Icons.lock,color: AppColors.black,size: 20,),
                suffixIcon: GestureDetector(
                  onTap: () => setState(() => isHidden = !isHidden),
                  child: Icon(
                    !isHidden ? Icons.visibility : Icons.visibility_off,
                    size: 16,
                    color: AppColors.black,
                  ),
                ),
                border: InputBorder.none,
                enabledBorder: InputBorder.none,
                focusedBorder: InputBorder.none,
              ),
            )),
      ],
    );
  }
  _button(){
    return GestureDetector(
        onTap: (){
          signIn(emailController.text, passwordController.text);
        },
        child: Container(
            margin: const EdgeInsets.only(top: 8, right: 20),
            height: 40,
            padding: const EdgeInsets.only(left: 10,bottom: 5),
            width: double.infinity,
            decoration: const BoxDecoration(
              color: Colors.lightBlueAccent,
              borderRadius: BorderRadius.all(Radius.circular(3.0) //
              ),
            ),
            child: Center(
                child: Text("Sign in",style: AppFonts.regularStyle(fontSize: 20,fontColor: AppColors.white),)
            ))
    );
  }
  _socialLogin(){
    return Column(
      children: [
        Center(
          child: Text("OR CONTINUE WITH",style: AppFonts.mediumStyle(fontColor: AppColors.greyColor,fontSize: 15),),
        ),
        const CustomSpacerWidget(height: 10,),
        GestureDetector(
          onTap: (){
            signInWithGoogle().then((result) {
              if (result != null) {
                Navigator.of(context).push(
                  MaterialPageRoute(
                    builder: (context) {
                      return const HomeScreen();
                    },
                  ),
                );
              }
            }
            );
          },
          child: Image.asset(ImageConstants.google,width: 25,height: 25,),
        )
      ],
    );
  }
  _signUp(){
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Text("Dont have an account?",style: AppFonts.boldStyle(fontSize: 13),),
        const CustomSpacerWidget(width: 5),
        GestureDetector(
            onTap: (){
              Navigator.pushReplacement(context, MaterialPageRoute(builder: (context) => RegistrationScreen()));
            },
            child: Text("Sign up",style: AppFonts.regularStyle(fontColor: Colors.lightBlueAccent,fontSize: 13),))
      ],
    );
  }
  // login function
  void signIn(String email, String password) async {
    if (emailController.text.isNotEmpty && passwordController.text.isNotEmpty) {
      try {
        await _auth
            .signInWithEmailAndPassword(email: email, password: password)
            .then((uid) => {
                  Fluttertoast.showToast(msg: "Login Successful"),
                  Navigator.of(context).pushReplacement(
                      MaterialPageRoute(builder: (context) => HomeScreen())),
                });
      } on FirebaseAuthException catch (error) {
        switch (error.code) {
          case "invalid-email":
            errorMessage = "Your email address appears to be malformed.";

            break;
          case "wrong-password":
            errorMessage = "Your password is wrong.";
            break;
          case "user-not-found":
            errorMessage = "User with this email doesn't exist.";
            break;
          case "user-disabled":
            errorMessage = "User with this email has been disabled.";
            break;
          case "too-many-requests":
            errorMessage = "Too many requests";
            break;
          case "operation-not-allowed":
            errorMessage = "Signing in with Email and Password is not enabled.";
            break;
          default:
            errorMessage = "An undefined Error happened.";
        }
        Fluttertoast.showToast(msg: errorMessage!);
        print(error.code);
      }
    }
  }
}
