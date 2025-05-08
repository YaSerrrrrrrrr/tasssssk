import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

class CustomText extends StatelessWidget {


CustomText({
required this.text,
this.fontSize = 16,
this.fontWeight = FontWeight.normal,
this.color = Colors.white,
this.fontFamily = 'TenorSans',
this.maxLines = 1,
this.letterSpacing,
});

final String text;
final double fontSize;
final FontWeight fontWeight;
final Color color;
final String fontFamily;
final int maxLines ;
final double? letterSpacing;

  @override
  Widget build(BuildContext context) {
    return Text(text,
    maxLines: 1,
                      style: TextStyle(
                        letterSpacing:letterSpacing ,
                        fontSize:fontSize,
                        fontWeight: fontWeight,
                        fontFamily: fontFamily,
                        color: color,
                      ),);
  }
} 
