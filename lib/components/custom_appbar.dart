import 'package:fashion/Color/colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:gap/gap.dart';

class CustomAppbar extends StatelessWidget implements PreferredSizeWidget {
  @override
  Size get preferredSize => const Size.fromHeight(80);
 
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8),
      child: AppBar(
        centerTitle: true,
        backgroundColor: AppColors.primary,
        leadingWidth: 25,
        leading: SvgPicture.asset("assets/svgs/Menu.svg"),
        title: SvgPicture.asset("assets/logo/logo-bg.svg",),
        actions: [
          SvgPicture.asset("assets/svgs/Search.svg"),
          Gap(20),
          SvgPicture.asset("assets/svgs/shopping bag.svg"),
        ],
      ),
    );
  }
}