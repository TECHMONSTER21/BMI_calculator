import 'package:flutter/material.dart';


class iconcontent extends StatelessWidget {
  final IconData whichicon;
  final label;
  iconcontent({ required this.whichicon, this.label});
  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Icon(whichicon,
          size: 80.0,),
        SizedBox(height: 15.0),
        Text(label,style: TextStyle(
            fontSize: 20.0
        ),)
      ],
    );
  }
}

