import 'package:fashion/components/custom_text.dart';

import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:gap/gap.dart';


class CartWidget extends StatefulWidget {
  const CartWidget({super.key, required this.image, required this.name, required this.price, required this.description, required this.onChanged,});
final String image;
final String name;
final double price;
final String description;
final Function(int) onChanged;


  static var number;

  @override
  State<CartWidget> createState() => _CartWidgetState();
}

class _CartWidgetState extends State<CartWidget> {
  int number = 1;
  double total = 0;

  
  
  @override
  Widget build(BuildContext context) {
    final Size size = MediaQuery.of(context).size;
    return  SingleChildScrollView(
      child: Column(
        children: [
          Row(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    
                    children: [
                      Image.asset(widget.image,width: 120,),
                      Gap(20),
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Gap(10),
                          CustomText(text:widget.name.toUpperCase(),letterSpacing: 5,),
                          Gap(10),
                          SizedBox(
                            width: size.width*0.6,
                            child: CustomText(text: widget.description.toUpperCase(),
                            letterSpacing: 2,
                            fontSize: 11,),
                          ),
                          Gap(30),
                          Row(
                            children: [
                              quantity(() {setState(() {
                                if (number == 1) {
                                  
                                }
                                else {
                                  number--;
                                }
                                widget.onChanged(number);
                              });
                               }, "assets/svgs/min.svg"),
                              Gap(20),
                              CustomText(text: number.toString(),letterSpacing: 4,fontWeight: FontWeight.bold,),
                              Gap(20),
                              quantity(() { 
                                setState(() {
                                  number++;
                                  widget.onChanged(number);
                                });
                                }, "assets/svgs/plus.svg"),
                              
          
                              
                              
                              
                              ],
                          ),
                        Gap(23),
                        CustomText(text: "\$ ${widget.price}",color: Colors.red.shade200,fontSize: 25,),
                        
                       
                        
                        
                        ],
          
                      ),
                    ],
                  ),
         SizedBox(height: 400,),
         Row(
          
                      mainAxisAlignment: MainAxisAlignment.start,
                      
                      children: [
                        
                        CustomText(text: "Total:  ",fontSize: 20,),
                        Spacer(),
                        CustomText(text: " \$ ${(total=widget.price * number).toString()}", fontSize: 20,),
                      ],
                      
                    
                    ),
        ],
      ),
    );
  }
}

Widget quantity(onTap,Svg){
return GestureDetector(
  onTap: onTap,
  child: Container(
    padding: const EdgeInsets.all(3),
    decoration: BoxDecoration(
      shape: BoxShape.circle,
      border: Border.all(color:Colors.grey, width: 1),
    ),
    child: SvgPicture.asset(
      Svg),
  ),
);


}