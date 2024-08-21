import 'package:cumin360/models/feedmodel.dart';
import 'package:cumin360/presentation/homescreen/tabbody/feedscreen.dart';
import 'package:cumin360/presentation/homescreen/tabbody/profilescreen.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:google_fonts/google_fonts.dart';

final mainfont=GoogleFonts.aclonica(fontSize: 20,fontWeight: FontWeight.normal,color: Colors.amber);
const box=SizedBox(height: 10,);
const sbox=SizedBox(height: 6,);
final submainfont=GoogleFonts.aclonica(fontSize: 17,fontWeight: FontWeight.normal);
final errorfont=GoogleFonts.aclonica(fontSize: 12,fontWeight: FontWeight.normal,color: Colors.red);
final subfont=GoogleFonts.aclonica(fontSize: 12,fontWeight: FontWeight.normal);
final feeddescp=GoogleFonts.aclonica(fontSize: 10,fontWeight: FontWeight.normal,color: Colors.grey[700]);
final submainlinkfont=GoogleFonts.aclonica(color:Colors.blue, fontSize: 12,fontWeight: FontWeight.normal);
String description='Lorem Ipsum is simply dummy text of the printing and typesetting industry.Lorem Ipsum has been the industrys standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book';
List<Feed> feeditem=[
  Feed(image: 'assets/cuminfeed1.jpeg', heading:'The Technology modified', description: description,
  liked: false,saved: false),
  Feed(image:'assets/cumin2.png', heading: 'All About Flutter', description: description,
  liked: false,saved: false),
  Feed(image: 'assets/cumin3.jpg', heading:'Hornbills in Kerala', description: description,
  liked: false,saved: false),
  Feed(image:'assets/cumin4.jpg', heading: 'Web of webs', description: description,
  liked: false,
  saved: false)
];
List<Widget> body=[const Feedscreen(),const ProfileScreen()];
String userid='';