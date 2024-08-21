import 'package:cumin360/constants/constants.dart';
import 'package:flutter/material.dart';

class likebutton extends StatefulWidget {
  final int index;
  const likebutton({
    required this.index,
    super.key,
  });

  @override
  State<likebutton> createState() => _likebuttonState();
}

class _likebuttonState extends State<likebutton> {
  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        setState(() {
           feeditem[widget.index].liked=!feeditem[widget.index].liked;
        });
       
      },
      child:feeditem[widget.index].liked?const Icon(Icons.favorite,color:Colors.red,)
    : const Icon(Icons.favorite_border));
  }
}