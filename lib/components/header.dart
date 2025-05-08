import 'package:fashion/components/custom_text.dart';
import 'package:flutter/material.dart';
import 'package:gap/gap.dart';

class Header extends StatelessWidget {
  
  final String name;
  final double?width;
   final fontSize ;

  
  Header({
    required this.name,
    this.width=180 ,
    this.fontSize = 25,
  });

  @override
    Widget build(BuildContext context) {
      return Column(
      children: [
        Gap(20),
        Center(child: CustomText(
          text: '$name'.toUpperCase(),
          fontSize: 25,
          letterSpacing: 10,)),
        Gap(20),
        Image.asset("assets/svgs/line.png",width: width,),
        Gap(20),
      ],
    );
  }
}

