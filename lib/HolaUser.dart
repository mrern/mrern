import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';

import 'const.dart';

class HolaUser extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      alignment: AlignmentDirectional.topStart,
      padding: EdgeInsets.only(left: 5.0),
      child: Text(
        "Hola Daniel.",
        style: TextStyle(color: blanco, fontSize: 15),
      ),
    );
  }
}
