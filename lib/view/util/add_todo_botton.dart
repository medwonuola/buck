import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import '../../constants.dart';

class AddTodoButton extends StatelessWidget {
  final AsyncCallback onTap;

  const AddTodoButton({Key key, this.onTap}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Align(
      alignment: Alignment.bottomRight,
      child: InkWell(
        focusColor: Colors.white,
        splashColor: Colors.white,
        onTap: onTap,
        child: Container(
          decoration: BoxDecoration(
              color: kPrimaryColor,
              borderRadius: BorderRadius.only(topLeft: Radius.circular(10))),
          width: 100,
          height: 100,
          child: Center(
            child: Icon(
              Icons.add_circle_rounded,
              color: Colors.white,
              size: 50,
            ),
          ),
        ),
      ),
    );
  }
}
