import 'package:flutter/material.dart';

import '../../constants/constants.dart';

class SideBar extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: kSecondaryColor,
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 28, vertical: 64),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SizedBox(),
            Row(
              children: [
                Text("TASK APP",
                    style: TextStyle(fontSize: 15, color: Colors.white)),
                Spacer(),
                IconButton(
                  icon: Icon(Icons.close, color: Colors.white),
                  onPressed: () {
                    Navigator.pop(context);
                  },
                )
              ],
            ),
            SizedBox(height: 32),
            ...[
              "Dashboard",
              "Calender",
              "Categorize Tasks",
              "Setting",
            ].map((e) => Padding(
                  padding: const EdgeInsets.symmetric(vertical: 16.0),
                  child: Text(
                    e,
                    style: TextStyle(fontSize: 32, color: Colors.white),
                  ),
                )),
            ...[
              "About",
              "Privacy",
              "License",
            ].map(
              (e) => Padding(
                padding: const EdgeInsets.symmetric(vertical: 16.0),
                child: Text(
                  e,
                  style: TextStyle(fontSize: 17, color: Colors.white),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
