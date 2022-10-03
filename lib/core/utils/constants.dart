import 'package:flutter/material.dart';

/// Class containing constants used throughout the app
bool _isCandidateUser = true; // Todo : Mayank Need to Remove with Auth
bool isAppLogin = false; // Todo : Mayank Need to Remove with Auth

bool isCandidateUser() {
  return _isCandidateUser;
}

setRole(bool flag) {
  _isCandidateUser = flag;
}

class AppColors {
  static const Color textColor = Color(0xff080849);
  static const Color textColor2 = Color(0xff1B5299);
  static const Color appDark = Color(0xff1A4B92);
  static const Color appLight = Color(0xff207FC3);
  static const Color white = Color(0xffffffff);
  static const Color whiteText = Color(0xffffffff);
  static const Color textHintColor = Color(0xffB3B3B3);
  static const Color backgroundWhite = Color(0xffFFFFFF);
  static const Color backgroundScreenColor = Color(0xffF5F5F5);
  static const Color borderColor = Color(0xffD9D9D9);
  static const Color borderLight = Color(0xffE2EFF4);
  static const Color borderDark = Color(0xffE8E8E8);
  static const Color completeBg = Color(0xff59DF38);
  static const Color greenLight = Color(0xff35F36B);
  static const Color greenDark = Color(0xff03D648);
  static const Color btnLight = Color(0xffF8B91C);
  static const Color btnDark = Color(0xffF8971A);
  static const Color orangeLight = Color(0xffF89B1B);
  static const Color stopBg = Color(0xffFF0909);
  static const Color transparent = Colors.transparent;
  static const Color greyColor = Color(0xFF455A64);
  static const Color black = Color(0xff000000);
}

class DBConstants {
  static const String tableUser = "user_table";
}

class Constants {
  static const String dbName = "app.db";
  static const String appName = "JobWala";
  static const String authorization = "Authorization";
  static const String errorUnknown = "Unknown error occurred";

  static var candidate = "CLIENT";
  static var employer = "VENDOR";

  static const String defaultCountryCode = "+91";
  static const double horizontalScreenPadding = 35;
  static const String errorNoInternet = "No Internet Available";
  static const String errorNoDataFound = "No Data Found";

  static const String baseUserUrl =
      "http://jw-backend-dev.ap-south-1.elasticbeanstalk.com/";

  static const String endPointCategoryList = "api/v1/admin/category/list";

  static const String endPointJobsTypeList = "api/v1/shared/job-type";

  static const String endPointUploadApi = "/api/v1/shared/upload";
  static const String endPointSignUp = "/api/v1/user/register";
  static const String endPointVerifyOtp = "/api/v1/user/verify-mobile-otp";
  static const String endPointChangePassword = "/api/v1/user/change-password";
  static const String endPointForgetPassword = "/api/v1/user/forgot-password";
  static const String endPointCreatePassword = "/api/v1/user/create-password";
  static const String endPointResetPassword = "/api/v1/user/reset-password";
  static const String endPointSendEmailOTP = "/api/v1/user/send-email-otp";
  static const String endPointVerifyEmailOTP = "/api/v1/user/verify-email-otp";
  static const String endPointQualification = "/api/v1/shared/qualification";
  static const String endPointLangugageProficiency =
      "/api/v1/shared/english-proficiency";
  static const String endPointLoginwithOTP = "/api/v1/user/login";
  static const String endPointLoginwithPassword =
      "/api/v1/user/login-with-password";
  static const String endPointLoginwithEmail = "/api/v1/user/login-with-email";
  static const String endPointUserProfile = "/api/v1/user-profile";
  static const String endPointUpdate = "/api/v1/job/update";

  static const String endPointCreateJob = "api/v1/job/create";

  static const String endPointFavouriteJob = "api/v1/job/favorite";
  static const String endPointProfileFeeback = "api/v1/feedback";
  static const String endPointFaqList = "api/v1/shared/faq";
  static const String endPointContactDetails = "/api/v1/shared/contact-us";
  static const String endPointUpdateProfileDetails = "api/v1/user-profile";

  static const String endPointCreateCategory = "/v1/admin/category/create";
  static const String endPointCreateJobType = "api/v1/admin/job-type/create";

  static const String endPointjobSkills = "api/v1/shared/job-skills";

  static const String endPointappliedJobs = "api/v1/job-application";

  static const String endPointJobListing = "/api/v1/job/list";

  static const String errorTypeTimeout = "Time Out";

  static const String plus = '+';

  static const List<String> nonSupportedUploadFile = ['pdf'];
}

class ImageConstants {
  static const String logo = "assets/images/logo.jpg";
  static const String google = "assets/images/google.png";
}
