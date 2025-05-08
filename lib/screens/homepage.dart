import 'package:fashion/components/custom_text.dart';
import 'package:fashion/models/cover_model.dart';
import 'package:fashion/models/product_model.dart';
import 'package:fashion/screens/checkout.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:gap/gap.dart';
import '../components/custom_appbar.dart';
import '../core/colors.dart';

class Home extends StatelessWidget {
  const Home({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.primary,
      appBar: CustomAppbar(
        
      ),
      body: Stack(
        children: [
          /// texts logo 10,october, collection
          Positioned(
              top: 10,
              left: 0,
              right: 0,
              child: SvgPicture.asset("assets/texts/10.svg"),
          ),
          Positioned(
            top: 40,
            left: 0,
            right: 0,
            child: SvgPicture.asset("assets/texts/October.svg"),
          ),
          Positioned(
              top: 85,
              left: 0,
              right: 0,
              child: SvgPicture.asset("assets/texts/Collection.svg"),
          ),
          
          SingleChildScrollView(
            child: Column(
              children: [
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 15.0),
                  child: Column(
                    children: [
                      Gap(145),
                      Image.asset("assets/cover/cover1.png"),
                      Gap(10),
                      Image.asset("assets/svgs/line.png",),
                      Gap(10),
                      GridView.builder(
                         padding: EdgeInsets.zero,
                         shrinkWrap: true,
                         physics: NeverScrollableScrollPhysics(),
                         itemCount: ProductModel.products.length,
                          gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                              crossAxisCount: 2,
                              mainAxisSpacing: 0,
                              crossAxisSpacing: 15,
                              childAspectRatio: 0.52,
                          ),
                          itemBuilder: (context , index) {
                           final item = ProductModel.products[index];
                            return GestureDetector(
                              onTap: () {
                                Navigator.push(context, MaterialPageRoute(
                                  builder: (context) => Checkout(
                                    image: item.image,
                                    name: item.name,
                                    price: item.price,
                                    description: item.description,
                                  ),
                                ));
                              },
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Image.asset(item.image),
                                  Gap(3),
                                  CustomText(text: item.name,color: Colors.white,),
                                  CustomText(text: item.description,color: Colors.grey),
                                  Gap(2),
                                  CustomText(
                                      text: "\$ ${item.price.toString()}",
                                    
                                      fontSize: 20,
                                  ),
                                ],
                              ),
                            );
                          }
                      ),
                      Gap(20),
                      CustomText(text: "You may also like".toUpperCase(),fontSize: 20,),
                      Gap(10),
                      Image.asset("assets/svgs/line.png",width: 190),
                      Gap(40),
                      SizedBox(
                        height: 500,
                        child: ListView.builder(
                            scrollDirection: Axis.horizontal,
                            itemCount: CoverModel.covers.length,
                            itemBuilder: (context , index){
                              final item = CoverModel.covers[index];
                              return Padding(
                                padding: const EdgeInsets.all(8.0),
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Image.asset(item.image,height: 350,fit: BoxFit.cover),
                                    Gap(10),
                                    CustomText(text: item.name.toUpperCase(),),
                                  ],
                                ),
                              );

                            },
                        ),
                      ),
                      
                      Gap(20),
                    ],
                  ),
                ),
                
              ],
            ),
          ),
        ],
      ),
    );
  }
}

