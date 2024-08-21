import 'package:cumin360/constants/constants.dart';
import 'package:flutter/material.dart';

class savedbutton extends StatefulWidget {
  final int index;
  const savedbutton({
    required this.index,
    super.key,
  });

  @override
  State<savedbutton> createState() => _savedbuttonState();
}

class _savedbuttonState extends State<savedbutton> {
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        setState(() {
          feeditem[widget.index].saved=!feeditem[widget.index].saved;
        });
      },
      child: InkWell(child:feeditem[widget.index].saved?Icon(Icons.star,color: Colors.blue,):
       Icon(Icons.star_border_outlined)));
  }
}