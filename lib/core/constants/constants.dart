import 'package:flutter/material.dart';

const double otpCodeDurationSecond = 30.0;
const int otpCodeLength = 6;

const List<String> favoriteCountiesCodeTexts = ["TR", "AZ", "GB", "US", "DE"];

// String title, subtitles or texts
const String seconds = " Seconds";
const String getOtpTitle = "Phone Verification";
const String initialCountryCode = "+90";
const String getWarningTitle = "Warning";
const String initialCountryCodeText = "TR";
const String phoneNumberHint = "5XXXXXXXXX";
const String splashText = "Safety and comforts is our concerns";
const String loginInstructionText = "Enter your phone number to to receive a verification code";
const String phoneVerificationFailedError = "Please enter valid phone number with minimum 10 characters";

//String images paths
const String imagesPath = "assets/images/";
const String taxiIcon = imagesPath + "taxi_icon.png";
const String routeIcon = imagesPath + "route_icon.svg";
const String googleLoginImage = imagesPath + "google.png";
const String driverImage = imagesPath + "driver_image.png";
const String facebookLoginImage = imagesPath + "facebook.png";

const Color loginBackgroundColor = Color(0xfff8f8f8);

final OutlineInputBorder otpVerificationEnabledBorder = OutlineInputBorder(
    borderSide: BorderSide(width: 2, color: Colors.grey),
    borderRadius: BorderRadius.circular(10)
);
final OutlineInputBorder otpVerificationFocusedBorder = OutlineInputBorder(
    borderSide: BorderSide(width: 2, color: Colors.amber),
    borderRadius: BorderRadius.circular(10)
);