import 'package:fashion/components/custom_text.dart';
import 'package:fashion/core/colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:gap/gap.dart';

class CustomButton extends StatelessWidget {
  const CustomButton({super.key, required this.text,required this.onTap});
final String text;
final VoidCallback onTap;
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.only(left: 30),
      child: Row(
        children: [
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 6),
            child: Container(
              width: 30,
              height: 50,
              child: SvgPicture.asset("assets/svgs/shopping bag.svg")),
          ),
          Gap(5),
          GestureDetector(
            onTap: onTap,
            child: Container(
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(10),
                color: Colors.white,
              ),
              padding: const EdgeInsets.all(5),
              width: 300,
              height: 40,
              child: Center(child: CustomText
              (text: text,
              fontSize: 20,
              fontWeight: FontWeight.bold,
              letterSpacing: 5,
              color: AppColors.primary,)),
              
            
            ),
          ),
        ],
      ),
    );
  }
}