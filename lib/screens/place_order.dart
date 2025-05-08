import 'package:fashion/components/custom_appbar.dart';
import 'package:fashion/components/custom_text.dart';
import 'package:fashion/components/header.dart';
import 'package:fashion/core/colors.dart';
import 'package:flutter/material.dart';
import 'package:gap/gap.dart';

class PlaceOrder extends StatelessWidget {
  const PlaceOrder({super.key, 
  required this.image, 
  required this.name, 
  required this.price, 
  required this.description, 
  required this.quantity});


  final String image;
  final String name;
  final double price;
  final String description;
  final String quantity;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.primary,
      appBar: CustomAppbar(),
      
      body: 
      
       Padding(
         padding: const EdgeInsets.all(16.0),
         child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Header(name: 'checkout'),
            CustomText(text: 'shipping address'.toUpperCase(), fontSize: 16,color: Colors.white60,),
            Gap(19),
            CustomText(text: 'iris watson'.toUpperCase(), fontSize: 20,),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Column(
                  children: [
                    Gap(10),
            CustomText(text: 'shipping address'.toUpperCase(), fontSize: 20,color: Colors.white60,),
            Gap(10),
            CustomText(text: 'shipping address'.toUpperCase(), fontSize: 20,color: Colors.white60,),
            Gap(10),
            CustomText(text: 'shipping address'.toUpperCase(), fontSize: 20,color: Colors.white60,),
            Gap(10),
            CustomText(text: 'shipping address'.toUpperCase(), fontSize: 20,color: Colors.white60,),
                  ],
                
                ),
              Icon(Icons.arrow_forward_ios,color: Colors.white,),
              ],
            ),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Gap(60),
            GestureDetector(
              onTap: () {
                
              },
              child: customcontainer('add shipping address'.toUpperCase(),  Icons.add)),
            Gap(80),
            CustomText(text: 'payment method'.toUpperCase(), fontSize: 16,color: Colors.white60,),
            Gap(19),
            customcontainer('credit card'.toUpperCase(), Icons.credit_card),

              ],
            ),
            
          ],
               ),
       ),
      

    );
  }
}

Widget customcontainer(text,icon ) {
  
  return Container(
    padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 14),
    decoration: BoxDecoration(
      color: Colors.grey,
      borderRadius: BorderRadius.circular(20),
    ),
    child: Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        CustomText(text: text, fontSize: 20, color: Colors.white),
        Gap(30),
        Icon(icon),
        
      ],
      
    ),
  );
}