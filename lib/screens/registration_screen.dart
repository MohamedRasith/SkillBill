import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:email_password_login/model/user_model.dart';
import 'package:email_password_login/screens/home_screen.dart';
import 'package:email_password_login/screens/login_screen.dart';
import 'package:email_password_login/screens/sign_in.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';

import '../common_widgets/custom_spacer_widget.dart';
import '../core/config/navigation.dart';
import '../core/utils/constants.dart';
import '../core/utils/fonts.dart';
import '../core/utils/routes.dart';

class RegistrationScreen extends StatefulWidget {
  const RegistrationScreen({Key? key}) : super(key: key);

  @override
  _RegistrationScreenState createState() => _RegistrationScreenState();
}

class _RegistrationScreenState extends State<RegistrationScreen> {
  final _auth = FirebaseAuth.instance;
  
  // string for displaying the error Message
  String? errorMessage;


  // our form key
  final _formKey = GlobalKey<FormState>();
  // editing Controller
  final emailEditingController = new TextEditingController();
  final phoneEditingController = new TextEditingController();
  final passwordEditingController = new TextEditingController();
  final confirmPasswordEditingController = new TextEditingController();
  bool isObscure = true;
  bool isHidden = true;

  @override
  Widget build(BuildContext context) {

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
                Text("Welcome.",style: AppFonts.extraBoldStyle(fontSize: 30)),
                const CustomSpacerWidget(height: 10,),
                Text("Create an account",style: AppFonts.mediumStyle(fontSize: 20,fontColor: AppColors.borderColor)),
                const CustomSpacerWidget(height: 30,),
                _email(),
                const CustomSpacerWidget(height: 30,),
                _phone(),
                const CustomSpacerWidget(height: 30,),
                _password(),
                const CustomSpacerWidget(height: 30,),
                _retypePassword(),
                const CustomSpacerWidget(height: 20,),
                _button(),
                const CustomSpacerWidget(height: 40,),
                _socialSignUp(),
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
              controller: emailEditingController,
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
  _phone(){
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text("Phone",style: AppFonts.extraBoldStyle(fontSize: 20)),
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
              controller: phoneEditingController,
              decoration: InputDecoration(
                hintText: "Enter Mobile Number",
                hintStyle: AppFonts.mediumStyle(fontColor: AppColors.greyColor,fontSize: 15),
                icon: const Icon(Icons.phone,color: AppColors.black,size: 20,),
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
              controller: passwordEditingController,
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
  _retypePassword(){
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text("Re-type Password",style: AppFonts.extraBoldStyle(fontSize: 20)),
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
              controller: confirmPasswordEditingController,
              decoration: InputDecoration(
                hintText: "Re-type password",
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
        signUp(emailEditingController.text, passwordEditingController.text);
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
              child: Text("Sign Up",style: AppFonts.regularStyle(fontSize: 20,fontColor: AppColors.white),)
          ))
    );
  }
  _socialSignUp(){
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
        Text("Already have an account?",style: AppFonts.boldStyle(fontSize: 13),),
        const CustomSpacerWidget(width: 5),
        GestureDetector(
            onTap: (){
              Navigator.pushReplacement(context, MaterialPageRoute(builder: (context) => LoginScreen(),));
            },
            child: Text("Sign in",style: AppFonts.regularStyle(fontColor: Colors.lightBlueAccent,fontSize: 13),))
      ],
    );
  }
  void signUp(String email, String password) async {
    if (emailEditingController.text.isNotEmpty && passwordEditingController.text.isNotEmpty) {
      try {
        await _auth
            .createUserWithEmailAndPassword(email: email, password: password)
            .then((value) => {postDetailsToFirestore()})
            .catchError((e) {
          Fluttertoast.showToast(msg: e!.message);
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
  postDetailsToFirestore() async {
    // calling our firestore
    // calling our user model
    // sedning these values

    FirebaseFirestore firebaseFirestore = FirebaseFirestore.instance;
    User? user = _auth.currentUser;

    UserModel userModel = UserModel();

    // writing all the values
    userModel.email = user!.email;
    userModel.uid = user.uid;


    await firebaseFirestore
        .collection("users")
        .doc(user.uid)
        .set(userModel.toMap());
    Fluttertoast.showToast(msg: "Account created successfully :) ");

    Navigator.pushAndRemoveUntil(
        (context),
        MaterialPageRoute(builder: (context) => HomeScreen()),
        (route) => false);
  }
}
