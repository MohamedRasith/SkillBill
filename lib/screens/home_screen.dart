import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:email_password_login/core/utils/constants.dart';
import 'package:email_password_login/model/user_model.dart';
import 'package:email_password_login/screens/zoom/meeting_screen.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

import '../common_widgets/custom_spacer_widget.dart';
import '../core/utils/fonts.dart';
import 'login_screen.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  User? user = FirebaseAuth.instance.currentUser;
  UserModel loggedInUser = UserModel();

  @override
  void initState() {
    super.initState();
    FirebaseFirestore.instance
        .collection("users")
        .doc(user!.uid)
        .get()
        .then((value) {
      this.loggedInUser = UserModel.fromMap(value.data());
      setState(() {});
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: AppColors.backgroundWhite,
        body: Container(
            width: MediaQuery.of(context).size.width,
            padding: const EdgeInsets.symmetric(horizontal: 30),
            color: AppColors.white,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const CustomSpacerWidget(height: 100,),
                Text("Upcoming Courses",style: AppFonts.extraBoldStyle(fontSize: 20)),
                const CustomSpacerWidget(height: 20,),
                _courseDetail(),
                const CustomSpacerWidget(height: 40),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text("Categories",style: AppFonts.extraBoldStyle(fontSize: 20)),
                    const CustomSpacerWidget(height: 20,),
                    Text("View all",style: AppFonts.extraBoldStyle(fontSize: 15,fontColor: AppColors.greyColor)),
                  ],
                ),
                const CustomSpacerWidget(height: 20),
                Container(
                  height: 100,
                  child: ListView(
                    scrollDirection: Axis.horizontal,
                    children: <Widget>[
                      Container(
                        width: 200,
                        child: Center(child: Image.asset(ImageConstants.logo)),
                      ),
                      const CustomSpacerWidget(width: 10,),
                      Container(
                        width: 200,
                        child: Center(child: Image.asset(ImageConstants.logo)),
                      ),
                      const CustomSpacerWidget(width: 10,),
                      Container(
                        width: 200,
                        child: Center(child: Image.asset(ImageConstants.logo)),
                      ),
                      const CustomSpacerWidget(width: 10,),
                      Container(
                        width: 200,
                        child: Center(child: Image.asset(ImageConstants.logo)),
                      ),
                      const CustomSpacerWidget(width: 10,),

                    ],
                  ),
                ),
                const CustomSpacerWidget(height: 100,),
                Center(
                  child: ActionChip(
                      label: Text("Logout"),
                      onPressed: () {
                        logout(context);
                      }),
                )
              ],
            )
        )
    );
  }

  _courseDetail(){
    return GestureDetector (
      onTap: () async{
       MeetingWidget();
      },
      child: Container(
          margin: const EdgeInsets.only(top: 8, right: 20),
          padding: const EdgeInsets.only(left: 10),
          height: 80,
          width: double.infinity,
          decoration: BoxDecoration(
            color: AppColors.white,
            borderRadius: const BorderRadius.all(Radius.circular(3.0) //
            ),
            boxShadow: [
              BoxShadow(
                color: Colors.black.withOpacity(.25),
                offset: const Offset(0, 1),
                blurRadius: 5,
              ),
            ],
          ),
          child: Row(
            children: [
              Image.asset(ImageConstants.logo),
              const CustomSpacerWidget(width: 10,),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const CustomSpacerWidget(height: 10,),
                  Text("Self Defence",style: AppFonts.extraBoldStyle(fontSize: 15)),
                  const CustomSpacerWidget(height: 10,),
                  Text("Description about the course",style: AppFonts.mediumStyle(fontSize: 10,fontColor: AppColors.borderColor)),
                  const CustomSpacerWidget(height: 20,),
                  Center(
                      child: Row(
                        children: [
                          Text("Anna Jones",style: AppFonts.extraBoldStyle(fontSize: 15),),
                          const CustomSpacerWidget(width: 25,),
                          Text("Rs.230",style: AppFonts.extraBoldStyle(fontSize: 15,fontColor: Colors.lightBlueAccent),)
                        ],
                      )
                  )
                ],
              )
            ],
          )),
    );
  }
  // the logout function
  Future<void> logout(BuildContext context) async {
    await FirebaseAuth.instance.signOut();
    Navigator.of(context).pushReplacement(
        MaterialPageRoute(builder: (context) => LoginScreen()));
  }

}
