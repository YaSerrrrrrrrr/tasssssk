import 'package:fashion/components/cart_widget.dart';
import 'package:fashion/components/custom_appbar.dart';
import 'package:fashion/components/custom_button.dart';
import 'package:fashion/components/header.dart';
import 'package:fashion/Color/colors.dart';
import 'package:fashion/screens/place_order.dart';
import 'package:flutter/material.dart';
import 'package:gap/gap.dart';


class Checkout extends StatefulWidget {
  

   Checkout({
    super.key,
    required this.image,
    required this.name,
    required this.price,
    required this.description,
  });
  
  
  
  final String image;
  final String name;
  final double price;
  final String description;

  @override
  State<Checkout> createState() => _CheckoutState();
}

class _CheckoutState extends State<Checkout> {
  int setquantity = 1;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor:AppColors.primary,
      appBar: CustomAppbar(),
      body: Padding(
        padding: const EdgeInsets.all(15.0),
        child: Column(
          children: [
            Header(name: "checkout"),
           CartWidget(
             image: widget.image.toString() ,
             description: widget.description.toString() ,
             name: widget.name.toString(),
             price: widget.price,
             onChanged: (v){
                setState(() {
                  CartWidget.number = v;
                });
             },
           ),
            Gap(10),
          CustomButton(
            text: "CHECKOUT",
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context){
                  return PlaceOrder(
                    image: widget.image.toString(),
                    name: widget.name.toString(),
                    price:widget.price*setquantity,
                    description: widget.description.toString(),
                    quantity: "",
                  );
                }
),
              );
            },
          ),
          Gap(10),
          ],
        ),
      ),
    );
  }
}
