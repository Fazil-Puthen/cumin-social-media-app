import 'package:cumin360/constants/constants.dart';
import 'package:cumin360/presentation/homescreen/widgets/likebutton.dart';
import 'package:cumin360/presentation/homescreen/widgets/savebutton.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class Feedscreen extends StatelessWidget {
  const Feedscreen({super.key});

  @override
  Widget build(BuildContext context) {
    final screenheight =MediaQuery.of(context).size.height;
    final screewidth=MediaQuery.of(context).size.width;
    return Container(
      width: screewidth,
      height: screenheight*0.8,
          margin: const EdgeInsets.all(10),
          child: ListView.separated(itemBuilder:(context, index) {
    
            //feed main container
            return Container(
              decoration:BoxDecoration(
                border: Border.all(width: 1),
                borderRadius: BorderRadius.circular(5)
              ) ,
            height: 400,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                //image section
                Container(
                height: 250,
                child: Image.asset(feeditem[index].image,
                fit: BoxFit.cover,),
              ),
              sbox,
              //icon row
              Padding(
               padding:const EdgeInsets.only(left: 5,right: 10),
               child:Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    likebutton(index:index,),
                     savedbutton(index: index,)],),
             ),
                   box,
               //heading
                Padding(
                  padding: const EdgeInsets.only(left: 5),
                  child: Text(feeditem[index].heading,style: subfont,),
                ),
                sbox,
                //description
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 5 ),
                  child: Text(description,style:feeddescp,
                  maxLines: 4,
                  overflow: TextOverflow.ellipsis,),
                )
    
              
              ],
            ),
            );
          },
           separatorBuilder:(context, index) =>const Divider(height: 10,) ,
            itemCount: feeditem.length),
         );
  }
}



