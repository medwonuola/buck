import 'package:flutter/material.dart';

import '../../constants.dart';

class SideBar extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: kSecondaryColor,
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 72),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              children: [
                IconButton(
                  icon: Icon(Icons.highlight_remove, color: Colors.white),
                  onPressed: () {
                    Navigator.pop(context);
                  },
                )
              ],
            ),
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
                  style: TextStyle(fontSize: 16, color: Colors.white),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
