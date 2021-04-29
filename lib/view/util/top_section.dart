import 'package:flutter/material.dart';

import '../../constants.dart';

class TopSection extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 16)
          .add(EdgeInsets.only(bottom: 30)),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(
            "Tasks",
            style: headlineStyle,
          ),
          Icon(
            Icons.notifications_none,
            size: 23,
          )
        ],
      ),
    );
  }
}
