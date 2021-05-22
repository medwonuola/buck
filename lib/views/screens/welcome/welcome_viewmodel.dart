import 'package:stacked/stacked.dart';
import 'package:flutter/material.dart';
import '../../../app/router.dart';

class WelcomeViewModel extends BaseViewModel {
  signInWithGoogle(BuildContext context) {
    Navigator.pushReplacementNamed(context, HomeRoute);
  }
}
