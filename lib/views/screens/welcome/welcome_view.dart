import 'package:buck/styles/asset_paths.dart';
import 'package:flutter/material.dart';
import 'package:stacked/stacked.dart';

import 'welcome_viewmodel.dart';

class WelcomeView extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    const radius = Radius.circular(10);
    return ViewModelBuilder<WelcomeViewModel>.reactive(
      builder: (context, model, child) => Scaffold(
        body: Stack(
          children: [
            Positioned(
                top: -300,
                left: -420,
                child: Transform.rotate(
                    angle: 0, child: Image.asset(bgImagePath))),
            Positioned(top: size.height * 0.5, left: 41, child: helloText),
            Positioned(
                right: 0,
                top: size.height * 0.65,
                width: size.width - 41,
                child: InkWell(
                  onTap: model.signInWithGoogle,
                  child: Container(
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        googleText,
                        Container(
                            height: 80,
                            width: 100,
                            decoration: BoxDecoration(
                                color: Colors.white,
                                borderRadius: BorderRadius.only(
                                    bottomLeft: radius, topLeft: radius)),
                            child: Center(
                              child: Image.asset(googleLogoPath),
                            ))
                      ],
                    ),
                  ),
                ))
          ],
        ),
      ),
      viewModelBuilder: () => WelcomeViewModel(),
    );
  }

  final helloText = Text(
    "Hello there, \nWelcome",
    style: TextStyle(
        color: Colors.white, fontSize: 32, fontWeight: FontWeight.w500),
  );

  final googleText = Text(
    "Sign In With Google",
    style: TextStyle(
        color: Colors.white,
        fontSize: 15,
        fontWeight: FontWeight.w500,
        letterSpacing: 2),
  );
}
