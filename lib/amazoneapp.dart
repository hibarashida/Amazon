import 'package:amazon/Amazonlens.dart';
import 'package:amazon/providerclass.dart';
import 'package:carousel_indicator/carousel_indicator.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';

import 'Dress.dart';
import 'amazoneapp.dart';
import 'amazoneapp.dart';
import 'amazoneapp.dart';
import 'amazoneapp.dart';
import 'amazonsigninpage.dart';
import 'bottomnavigationbar.dart';
import 'fashion.dart';

class Amazonapp extends StatelessWidget {
   Amazonapp({super.key});
   int Activeindex = 0;


   List <String> productList =[
     "assets/mobileaccer.jpg",
     "assets/beautyandmakeupacce.jpg",
     "assets/footwear.jpg",
     "assets/kitchen2.jpg",
     "assets/homeacc.jpg",
     "assets/food.jpg",
     "assets/tg.jpg",
     "assets/allcategory.jpg"
   ];
   List <String> text2 =[
     "Mobile accessories | \n Starting ₹99",
     "Beauty & makeup |\n Starting  ₹99",
     "Footwear | under ₹499",
     "Kitchen budget bazaar | \n Starting ₹99",
     "Best finds for home | \n Starting ₹99",
     "Food beverage | \n Starting ₹149",
     "Toys & games | \n Starting ₹99",
     "see all categories",

   ];

   @override
  Widget build(BuildContext context) {

     providerclass amazonprovider = Provider.of<providerclass>(context);
     amazonprovider.getcategorydata();
     amazonprovider.getcarouseldata();
     amazonprovider.getlistimgdata();
    var width = MediaQuery.of(context).size.width;
    var height = MediaQuery.of(context).size.height;
    return Scaffold(
      appBar: AppBar(leading: InkWell(onTap: () {
        Navigator.push(context, MaterialPageRoute(builder: (context) => Amazon(),));
      },
          child: Icon(Icons.arrow_back)),
        backgroundColor: Colors.teal.shade200,
        title: Container(
          width: width,
          height:40 ,
          decoration: BoxDecoration(borderRadius:BorderRadius.circular(5),color: Colors.white,),
           child: TextField(
             decoration: InputDecoration(
               prefixIcon: Icon(Icons.search),
               border: OutlineInputBorder(),
               contentPadding: EdgeInsets.only(top:4 ),
               hintText: 'Search Amazon.in',hintStyle:TextStyle(fontSize: 17) ,
               suffixIcon: InkWell(onTap: () {
                 Navigator.push(context, MaterialPageRoute(builder: (context) => AmazonLens(),));
               },
                   child: Icon(Icons.document_scanner_outlined))
             ),
           ),
        ),
      ),
      body:
      SingleChildScrollView(
        child: Column(
          children: [
            Container(
              width: width,
              height: 40,
              color: Colors.teal.shade100,
              child:  Row(
                children: [
                  Icon(Icons.location_on_outlined),
                  SizedBox(width: 10,),
                  Text("Select a location to see product availbility",style: TextStyle(fontSize: 18,fontWeight: FontWeight.normal),)
                ],
              ),
            ),
            SizedBox(
              height: 100,

              child:
               ListView.builder(

                 itemCount: amazonprovider.categoryimg.length,
                 scrollDirection: Axis.horizontal,
                 itemBuilder:(context, index) {
                return InkWell(
                  onTap: () {
                    amazonprovider.getproductadmindata(amazonprovider.categoryimg[index].id);
                    Navigator.push(context, MaterialPageRoute(builder: (context) => Fashion(
                      show: amazonprovider.categoryimg[index].id=="1690616231973"?true:false,

                    ),));
                  },
                  child: Column(
                    children: [
                   Container(
                     // width: width,
                     height: 70,
                     color: Colors.black,
                      child:  Image.network(amazonprovider.categoryimg[index].image.toString()),
                   ),
                      Text(amazonprovider.categoryimg[index].name),
                    ],
                  ),
                );
              },
               ),
            ),
            Consumer<providerclass>(
              builder: (context,value,child) {
                return Container(
                  height: 372,
                   color: Colors.black12,
                  child: Stack(
                    children: [
                      Container(
                         // color: Colors.red,
                        child: CarouselSlider.builder(
                          itemCount: value.addcarousel.length,
                          itemBuilder: (context, index, realIndex) {
                            final image = value.addcarousel[index].image;
                            return Container(
                              width: MediaQuery.of(context).size.width,
                              child: ClipRRect(
                                child: Image.network(
                                  image,
                                  fit: BoxFit.fill,
                                ),
                              ),
                            );
                          },
                          options: CarouselOptions(
                              clipBehavior: Clip.antiAliasWithSaveLayer,
                              height: 210,
                              viewportFraction: 1,
                              autoPlay: true,
                              pageSnapping: true,
                              enlargeStrategy: CenterPageEnlargeStrategy.height,
                              enlargeCenterPage: true,
                              autoPlayInterval: const Duration(seconds: 4),
                              onPageChanged: (index, reason) {
                               value.activeIndex(index);
                                // print("activvgvg"+Activeindex.toString());

                              }),
                        ),
                      ),
                      Positioned( top: 140,
                        left: 150,
                        child:buildIndiCator(value.addcarousel.length,context,value.Activeindex),
                      ),
                       Positioned(
                         top: 160,
                         child: SizedBox(
                           height:150,
                           width: width,
                           child:ListView.builder(
                               itemCount: value.addlistviewimg.length,
                               scrollDirection: Axis.horizontal,
                               itemBuilder:(context,index){
                                return Container(
                                  margin: EdgeInsets.only(right: 5),
                                   height: 150,
                                   width: 150,
                                  child: ClipRRect(
                                     borderRadius: BorderRadius.circular(5),
                                       child: Image.network(value.addlistviewimg[index].img,fit: BoxFit.fill,)),
                                 );
                               }),
                         ),
                       ),
                      Container(
                        margin: EdgeInsets.only(top: 315),
                        height: 50,
                        width: width,
                        color: Colors.white,
                        child: Row(
                          children: [
                            SizedBox(
                              width: 20,
                            ),
                            CircleAvatar(backgroundColor: Colors.deepOrange ,radius: 15,
                                child: Image.asset("assets/pay.png",scale: 5)),
                            InkWell(onTap: () {

                              Navigator.push(context, MaterialPageRoute(builder: (context) =>BottomNav() ,));
                            },
                                child: Text(" PAY ON \n DELIVARY",style: TextStyle(fontSize: 12,fontWeight: FontWeight.bold,color:Colors.black ))),
                            SizedBox(
                              width: 20,
                            ),
                            CircleAvatar(backgroundColor: Colors.deepOrange ,radius: 15,
                                child: Image.asset("assets/return.png",scale: 5)),
                            InkWell(onTap:() {

                              Navigator.push(context, MaterialPageRoute(builder: (context) => BottomNav(),));
                            },
                                child: Text(" EASY \n RETURN",style: TextStyle(fontSize: 12,fontWeight: FontWeight.bold))),
                            SizedBox(
                                width: 20),
                            CircleAvatar(backgroundColor: Colors.deepOrange ,radius: 15,
                                child: Image.asset("assets/delivary.png",scale: 5)),
                            InkWell(onTap: () {

                              Navigator.push(context, MaterialPageRoute(builder: (context) => BottomNav(),));
                            },
                                child: Text("  FREE DELIVARY \n  ON FIRST ORDER",style: TextStyle(fontSize: 12,fontWeight: FontWeight.bold))),
                          ],
                        ),
                      )
                    ],
                  ),
                );
              }
            ),
           Container(
             height:250,
             width: width,
             decoration: BoxDecoration(image: DecorationImage(image: AssetImage("assets/movie.jpg",),fit: BoxFit.fill),
               border: Border.symmetric(horizontal: BorderSide(color: Colors.black12)),
             ),
             child: Icon( Icons.play_circle_outline_sharp),
           ),

            Container(
              width: width,
              height: 40,
              child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text("Watch for FREE",style: TextStyle(fontSize:20,fontWeight: FontWeight.bold,)),
                    SizedBox(width: 8,),
                    Container(height: 25,color: Colors.black,width: 2,),
                    Image.asset("assets/minitv.jpg")
                  ],
                ),
            ),
            Container(
              width: width,
              height: 2,
              color: Colors.black12,
            ),
            Consumer<providerclass>(
                builder: (context,value2,child) {
                return Container(
                  height: 230,
                  width: width,
                  // color: Colors.red,
                  child: Column(
                    children: [
                      Text("Starting ₹166 | Deals on fashion,beauty,kitchen & more ",style:TextStyle(
                        fontSize: 20,fontWeight: FontWeight.bold
                      ) ),
                      value2.dealsImage !=""? SizedBox(
                        width:160,
                          height: 160,
                          child: Image.asset(value2.dealsImage,fit: BoxFit.fill,)):Image.asset("assets/img4,1.jpg")
                    ],
                  ),);
              }
            ),
            Consumer<providerclass>(
                builder: (context,value2,child) {
                return Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    SizedBox(width: 10),
                   InkWell (onTap: () {
                     value2.dealsSelection("assets/img4,1.jpg");
                   },
                      child: Container(
                        height:90,
                        width: 80,
                        decoration: BoxDecoration(image: DecorationImage(image: AssetImage("assets/img4,1.jpg"),),border: Border.all(color:Colors.black12,width: 2 ),
                             ),
                      ),
                    ),
                    InkWell(   onTap: () {
                      value2.dealsSelection("assets/img4,2.jpg");
                    },
                      child: Container(
                        height: 90,
                        width: 80,
                         decoration: BoxDecoration(image: DecorationImage(image: AssetImage("assets/img4,2.jpg"),),
                           border: Border.all(color:Colors.black12,width: 2)),
                      ),
                    ),
                    InkWell( onTap: () {
                      value2.dealsSelection("assets/img4,3.jpg");
                    },
                      child: Container(
                        height: 90,
                        width: 80,
                         decoration: BoxDecoration(image: DecorationImage(image: AssetImage("assets/img4,3.jpg"),), border: Border.all(color:Colors.black12,width: 2)
                            ),
                      ),
                    ),
                    InkWell(onTap: () {
                     value2.dealsSelection("assets/img4,4.jpg");
                    },
                      child: Container(
                        height: 90,
                        width: 80,
                         decoration: BoxDecoration(image: DecorationImage(image: AssetImage("assets/img4,4.jpg"),),
                             border: Border.all(color:Colors.black12,width: 2)),
                      ),
                    ),
                    SizedBox(width: 10,)
                  ],
                );
              }
            ),
            Padding(
              padding:  EdgeInsets.only(right: 220,top: 10),
              child: Text("see all deals",style: TextStyle(color: Colors.teal,fontSize: 18,fontWeight: FontWeight.normal),),
            ),
            Container(
              width: width,
              height: 2,
              color: Colors.black12,
            ),
            Text("Tops styles for you | western dress",style: TextStyle(fontWeight: FontWeight.bold,fontSize: 20,color: Colors.black),),
            Column(
              children: [
                Container(
                    height: 500,
                  width: width,
                  color: Colors.black12,

                    child: Column(
                      children: [
                        SizedBox(
                          height: 450,
                          width: width,
                            child: Padding(
                              padding:  EdgeInsets.all(15),
                              child: InkWell(onTap: () {
                                 amazonprovider.getproductadmindata("1690616231973");
                                Navigator.push(context, MaterialPageRoute(builder: (context) => Fashion(
                                  show: true,
                                ),));
                              },
                                  child: Image.asset("assets/Dress1.jpeg",
                                      fit: BoxFit.fill
                                  )),
                            )),
                        Row(mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Text("Stylish",style: TextStyle(fontSize: 20,fontWeight: FontWeight.bold)),
                            SizedBox(width: 10,),
                            Container(height: 25,width: 2,color: Colors.black,),
                             SizedBox(width: 10,),
                             Image.asset("assets/amazonlogo.jpg",scale: 6,),
                            Text("specials",style: TextStyle(fontSize: 20,fontWeight: FontWeight.bold)),
                          ],
                        ),
                      ],
                    ),

                ),
              ],
            ),

            Container(
              height: 2,
              width: width,
              color: Colors.black26,
            ),
            Container(margin: EdgeInsets.only(left: 10,top: 10),
              // height:500,
              width: width,
              color: Colors.white,
                child: Column(
                  children: [
                    Text("Deals for yor",style: TextStyle(fontSize: 20,fontWeight: FontWeight.bold),),
                SizedBox(
                  height: 700,
                  child: GridView.builder(
                    physics: NeverScrollableScrollPhysics(),
                    itemCount: amazonprovider.categoryimg.length,
                    gridDelegate:  SliverGridDelegateWithFixedCrossAxisCount(
                        crossAxisCount: 2,
                        childAspectRatio: 1/.75,
                        crossAxisSpacing: 5.0,
                        mainAxisSpacing: 20.0
                    ),
                    itemBuilder: ( context, index){
                      return InkWell(onTap: () {
                        amazonprovider.getproductadmindata(amazonprovider.categoryimg[index].id);
                        Navigator.push(context, MaterialPageRoute(builder: (context) => Fashion(
                          show: amazonprovider.categoryimg[index].id=="1690616231973"?true:false,
                        ),));
                      },
                        child: Container(
                          height: 400,
                          decoration: BoxDecoration(
                              border: Border.all(width: 2, color: Colors.black12)),
                          child: Column(
                            children: [
                              Container(
                                color: Colors.blue,
                                height: 100,
                                width: 140,
                                child: Image.network(amazonprovider.categoryimg[index].image,fit: BoxFit.fill,),
                              ),

                              Text(amazonprovider.categoryimg[index].name),
                            ],
                          ),
                        ),
                      );
                      },
                  ),
                ),
                  ],
                )
            ),
            SizedBox(
              height: 100,
            )

          ],
        ),
      ),
    );

  }

   buildIndiCator(int count, BuildContext context,int activeindex ) {
     // print(activeIndex.toString()+"dpddoopf");
     return Center(
       child: Padding(
         padding:   EdgeInsets.only(top: 6),
         child: AnimatedSmoothIndicator(
           activeIndex: activeindex,
           count: count,
           effect:  JumpingDotEffect(dotWidth: 7, dotHeight: 7,
               activeDotColor: Colors.teal, dotColor: Color(0xffaba17c)),
         ),
       ),
     );
   }


}





