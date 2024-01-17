import 'package:amazon/providerclass.dart';
import 'package:amazon/selectpayament.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';

import 'Amazonlens.dart';
import 'Shippingaddress.dart';
import 'delivaryadress.dart';

class Dress extends StatelessWidget {


  String photo;
  String name;
  String color;
  String prize;
  String discount;
  String productid;
  bool show;
  Dress({super.key,required this.photo,required this.name,required this.color,
    required this.prize,required this.discount,required this.productid,required this.show});

  int Activeindex = 0;
  int productlength = 0;

  @override
  Widget build(BuildContext context) {
    providerclass amazonprovider = Provider.of<providerclass>(context);
    amazonprovider.getproductdata();
    var width = MediaQuery.of(context).size.width;
    var height = MediaQuery.of(context).size.height;
    return Scaffold(

      appBar: AppBar(
        leading: InkWell(
            onTap: () {
              Navigator.pop(context);
            },
            child: const Icon(Icons.arrow_back)),
        backgroundColor: Colors.teal.shade200,
        title: Container(
          width: width,
          height: 40,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(5),
            color: Colors.white,
          ),
          child: TextField(
            decoration: InputDecoration(
                prefixIcon: const Icon(Icons.search),
                border: const OutlineInputBorder(),
                contentPadding: const EdgeInsets.only(top: 4),
                hintText: 'Search Amazon.in',
                hintStyle: const TextStyle(fontSize: 17),
                suffixIcon: InkWell(
                    onTap: () {
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => const AmazonLens(),
                          ));
                    },
                    child: const Icon(Icons.document_scanner_outlined))),
          ),
        ),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            const Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  "Visit the Istyle Can Store",
                  style: TextStyle(color: Colors.teal),
                ),
                Row(
                  children: [
                    Icon(
                      Icons.star,
                      color: Colors.deepOrange,
                      size: 18,
                    ),
                    Icon(
                      Icons.star,
                      color: Colors.deepOrange,
                      size: 18,
                    ),
                    Icon(
                      Icons.star,
                      color: Colors.deepOrange,
                      size: 18,
                    ),
                    Icon(
                      Icons.star,
                      color: Colors.deepOrange,
                      size: 18,
                    ),
                    Icon(
                      Icons.star,
                      color: Colors.black12,
                      size: 18,
                    ),
                    Text("95")
                  ],
                ),
              ],
            ),
            show==true? Text(
              "Istyle can dress for women soild belted wrap dress bishop sleeves surplice neck high waist",
            ):SizedBox(),
            Container(
              margin: const EdgeInsets.only(top: 10, bottom: 10),
              height: 480,
              color: Colors.black12,
              child:Container(
                margin: const EdgeInsets.symmetric(horizontal: 10),
                // height: 500,
                // color: Colors.amber,
                width: MediaQuery.of(context).size.width,
                child: ClipRRect(
                  child: Image.network(
                   photo,
                    fit: BoxFit.fill,
                  ),
                ),
              ),

              // CarouselSlider.builder(
              //   itemCount: productlength,
              //   itemBuilder: (context, index, realIndex) {
              //     // List<String> modelImage = [
              //     //   // amazonprovider.productdetails[index].photo,
              //     // ];
              //     productlength = amazonprovider.productdetails[index].photo.length;
              //
              //     // final image = modelImage[index];
              //     return Container(
              //       margin: const EdgeInsets.symmetric(horizontal: 10),
              //       // height: 500,
              //       // color: Colors.amber,
              //       width: MediaQuery.of(context).size.width,
              //       child: ClipRRect(
              //         child: Image.network(
              //           amazonprovider.productdetails[2].photo,
              //           fit: BoxFit.fill,
              //         ),
              //       ),
              //     );
              //   },
              //   options: CarouselOptions(
              //       clipBehavior: Clip.antiAliasWithSaveLayer,
              //       height: 400,
              //       viewportFraction: 1,
              //       autoPlay: false,
              //       pageSnapping: true,
              //       enlargeStrategy: CenterPageEnlargeStrategy.height,
              //       enlargeCenterPage: true,
              //       autoPlayInterval: const Duration(seconds: 4),
              //       onPageChanged: (index, reason) {
              //         Activeindex = index;
              //         amazonprovider.notifyListeners();
              //       }),
              // ),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 10),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  buildIndiCator(amazonprovider.dressimg.length, context),
                  const Row(
                    children: [
                      Icon(Icons.favorite_border),
                      SizedBox(
                        width: 10,
                      ),
                      Icon(Icons.bookmark_border)
                    ],
                  )
                ],
              ),
            ),
            Container(
              margin: const EdgeInsets.only(top: 10, bottom: 15),
              width: width,
              height: 4,
              color: Colors.black12,
            ),
             Padding(
              padding: EdgeInsets.only(left: 10),
              child: Row(
                children: [
                  const Text("Color: ",
                      style: TextStyle(
                          fontWeight: FontWeight.normal, fontSize: 18)),
                  Text(color,
                      style:
                          TextStyle(fontWeight: FontWeight.bold, fontSize: 18)),
                ],
              ),
            ),
           show==true? SizedBox(
              height: 110,
              child: ListView.builder(
                itemCount: amazonprovider.dressimg2.length,
                scrollDirection: Axis.horizontal,
                itemBuilder: (context, index) {
                  return Padding(
                    padding: const EdgeInsets.only(
                        left: 10, right: 10, top: 10, bottom: 10),
                    child: Column(
                      children: [
                        Stack(
                          children: [
                            const CircleAvatar(
                              radius: 31,
                              backgroundColor: Colors.black12,
                            ),
                            Positioned(
                              top: 1,
                              left: 1,
                              child: CircleAvatar(
                                radius: 30,
                                backgroundImage:
                                    AssetImage(amazonprovider.dressimg2[index]),
                              ),
                            ),
                          ],
                        ),
                        Text(amazonprovider.dresstxt2[index]),
                      ],
                    ),
                  );
                },
              ),
            ):SizedBox(),
             show==true?Padding(
              padding: EdgeInsets.only(left: 10, bottom: 10),
              child:Consumer<providerclass>(
                  builder: (context,value2,child) {
                  return Row(
                    children: [
                      Text("Size: ",
                          style: TextStyle(
                              fontWeight: FontWeight.normal, fontSize: 18)),
                      Text(value2.dressz,
                          style:
                              TextStyle(fontWeight: FontWeight.bold, fontSize: 18)),
                    ],
                  );

                }
              ),
            ):SizedBox(),
           show==true? Consumer<providerclass>(
                builder: (context,value2,child) {
                return Row(
                  children: [
                    const SizedBox(
                      width: 10,
                    ),
                    InkWell(onTap: () {
                             value2.dressSize("S");
                    },
                      child: Container(
                        height: 50,
                        width: 50,
                        decoration: BoxDecoration(
                            border: Border.all(
                              width: 1,
                              color: Colors.black12,
                            ),
                            borderRadius: BorderRadius.circular(3)),
                        child: const Center(
                            child: Text("S",
                                style: TextStyle(
                                    fontWeight: FontWeight.normal, fontSize: 18))),
                      ),
                    ),
                    const SizedBox(
                      width: 10,
                    ),
                    InkWell(onTap: () {
                      value2.dressSize("M");

                    },
                      child: Container(
                        height: 50,
                        width: 50,
                        decoration: BoxDecoration(
                            border: Border.all(
                              width: 1,
                              color: Colors.black12,
                            ),
                            borderRadius: BorderRadius.circular(3)),
                        child: const Center(
                            child: Text("M",
                                style: TextStyle(
                                    fontWeight: FontWeight.normal, fontSize: 18))),
                      ),
                    ),
                    const SizedBox(
                      width: 10,
                    ),
                    InkWell(onTap: () {
                      value2.dressSize("L");


                    },
                      child: Container(
                        height: 50,
                        width: 50,
                        decoration: BoxDecoration(
                            border: Border.all(
                              width: 1,
                              color: Colors.black12,
                            ),
                            borderRadius: BorderRadius.circular(3)),
                        child: const Center(
                            child: Text("L",
                                style: TextStyle(
                                    fontWeight: FontWeight.normal, fontSize: 18))),
                      ),
                    ),
                    const SizedBox(
                      width: 10,
                    ),
                    InkWell(onTap: () {
                      value2.dressSize("XL");

                    },
                      child: Container(
                        height: 50,
                        width: 50,
                        decoration: BoxDecoration(
                            border: Border.all(
                              width: 1,
                              color: Colors.black12,
                            ),
                            borderRadius: BorderRadius.circular(3)),
                        child: const Center(
                            child: Text("XL",
                                style: TextStyle(
                                    fontWeight: FontWeight.normal, fontSize: 18))),
                      ),
                    ),
                  ],
                );
              }
            ):SizedBox(),
            Container(
              margin: const EdgeInsets.only(top: 10),
              width: width,
              height: 3,
              color: Colors.black12,
            ),
            Container(
              height: 30,
              width: width,
              color: Colors.grey.shade200,
              child: const Padding(
                padding: EdgeInsets.symmetric(horizontal: 10),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text("✨Find Your Size",
                        style: TextStyle(
                            fontWeight: FontWeight.bold, fontSize: 13)),
                    Icon(
                      Icons.arrow_forward_ios,
                      size: 15,
                    )
                  ],
                ),
              ),
            ),
            Container(
              height: 40,
              width: width,
              child: const Padding(
                padding: EdgeInsets.only(left: 10, bottom: 10, top: 10),
                child: Text("Size guide",
                    style: TextStyle(color: Colors.teal, fontSize: 15)),
              ),
            ),
            Container(
              margin: const EdgeInsets.only(bottom: 10),
              width: width,
              height: 2,
              color: Colors.black12,
            ),
             Padding(
              padding: EdgeInsets.only(left: 10, top: 8),
              child: Row(
                children: [
                  Text(discount,
                      style: TextStyle(color: Colors.red, fontSize: 30)),
                  SizedBox(
                    width: 10,
                  ),
                  const Text("₹"),
                  Text(prize,
                      style: TextStyle(
                          color: Colors.black,
                          fontSize: 26,
                          fontWeight: FontWeight.bold)),
                ],
              ),
            ),
            const Padding(
              padding: EdgeInsets.only(right: 200, bottom: 15),
              child: Text("Inclusive of all taxes",
                  style: TextStyle(
                      fontSize: 15,
                      fontWeight: FontWeight.bold,
                      color: Colors.black)),
            ),
            Container(
              margin: const EdgeInsets.only(bottom: 10),
              width: width,
              height: 2,
              color: Colors.black26,
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 10),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Image.asset("assets/deals4.png", scale: 9),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const Text("Save Extra with Offers",
                          style: TextStyle(
                              fontSize: 15,
                              fontWeight: FontWeight.bold,
                              color: Colors.black)),
                      Text("No Cost EMI Offers,Bank Offers ",
                          style: TextStyle(
                              fontSize: 15,
                              fontWeight: FontWeight.normal,
                              color: Colors.grey.shade800)),
                    ],
                  ),
                  const Icon(Icons.keyboard_arrow_down_outlined)
                ],
              ),
            ),
            Container(
              margin: const EdgeInsets.only(bottom: 20, top: 10),
              width: width,
              height: 2,
              color: Colors.black26,
            ),
            const Padding(
              padding: EdgeInsets.symmetric(horizontal: 10),
              child: Row(
                children: [
                  Text(
                    "FREE delivary",
                    style: TextStyle(color: Colors.teal, fontSize: 15),
                  ),
                  Text(
                    " Thursday, 27 july.",
                    style: TextStyle(
                        color: Colors.black,
                        fontWeight: FontWeight.bold,
                        fontSize: 15),
                  ),
                  Text(
                    "Order within 5 ",
                    style: TextStyle(
                        color: Colors.black,
                        fontWeight: FontWeight.normal,
                        fontSize: 15),
                  ),
                ],
              ),
            ),
            const Padding(
              padding: EdgeInsets.symmetric(
                horizontal: 10,
              ),
              child: Row(
                children: [
                  Text(
                    "hrs 11 min.",
                    style: TextStyle(
                        color: Colors.green,
                        fontWeight: FontWeight.normal,
                        fontSize: 15),
                  ),
                  Text(
                    "Details",
                    style: TextStyle(color: Colors.teal, fontSize: 15),
                  ),
                ],
              ),
            ),
            const Padding(
              padding: EdgeInsets.only(left: 10, top: 10, bottom: 15),
              child: Row(
                children: [
                  Icon(Icons.location_on_outlined),
                  Text("  Select delivary location",
                      style: TextStyle(color: Colors.teal, fontSize: 15))
                ],
              ),
            ),
            const Padding(
              padding: EdgeInsets.only(right: 290, bottom: 10),
              child: Text(
                "In stock",
                style:
                    TextStyle(fontWeight: FontWeight.bold, color: Colors.green),
              ),
            ),

            Consumer<providerclass>(
                builder: (context,value4,child)  {
                  return InkWell(
                    onTap: () {
                      showDialog(
                          context: context,
                          builder: (ctx) => AlertDialog(
                            titlePadding:  EdgeInsets.only(left: 240,top: 10),
                            title:  InkWell(onTap: () {
                              Navigator.pop(context);
                            },
                                child: Icon(Icons.close)),
                            content:  SingleChildScrollView(
                              child:  Column(
                                children: [
                                  Divider(
                                    color: Colors.black12,
                                    thickness: 1,
                                  ),

                                  InkWell(
                                      onTap: () {
                                        Navigator.pop(context);
                                        value4.qtyno("1");
                                      },
                                      child: Text("1")),
                                  Divider(
                                    color: Colors.black12,
                                    thickness: 1,
                                  ),
                                  InkWell(
                                      onTap: () {
                                        Navigator.pop(context);
                                        value4.qtyno("2");
                                      },
                                      child: Text("2")),
                                  Divider(
                                    color: Colors.black12,
                                    thickness: 1,
                                  ),
                                  InkWell(
                                      onTap: () {
                                        Navigator.pop(context);
                                        value4.qtyno("3");
                                      },
                                      child: Text("3")),

                                  Divider(
                                    color: Colors.black12,
                                    thickness: 1,
                                  ),  InkWell(
                                      onTap: () {
                                        Navigator.pop(context);
                                        value4.qtyno("4");
                                      },
                                      child: Text("4")),
                                  Divider(
                                    color: Colors.black12,
                                    thickness: 1,
                                  ),
                                  InkWell(
                                      onTap: () {
                                        Navigator.pop(context);
                                        value4.qtyno("5");
                                      },
                                      child: Text("5")),
                                  Divider(
                                    color: Colors.black12,
                                    thickness: 1,
                                  ),
                                  InkWell(
                                      onTap: () {
                                        Navigator.pop(context);
                                        value4.qtyno("6");
                                      },
                                      child: Text("6")),
                                  Divider(
                                    color: Colors.black12,
                                    thickness: 1,
                                  ),
                                  InkWell(
                                      onTap: () {
                                        Navigator.pop(context);
                                        value4.qtyno("7");
                                      },
                                      child: Text("7")),
                                  Divider(
                                    color: Colors.black12,
                                    thickness: 1,
                                  ),
                                  InkWell(
                                      onTap: () {
                                        Navigator.pop(context);
                                        value4.qtyno("8");
                                      },
                                      child: Text("8")),
                                  Divider(
                                    color: Colors.black12,
                                    thickness: 1,
                                  ),


                                ],),
                            ),

                          )
                      );
                    },
                    child:Consumer<providerclass>(
                        builder: (context,value,child)  {
                          return Container(
                              margin: EdgeInsets.only(
                                 right: 230,
                                bottom: 5
                              ),
                              height: 40,
                              width:100,
                              decoration: BoxDecoration(color: Colors.grey.shade300,
                                  borderRadius: BorderRadius.circular(10),
                                  border: Border.all(width: 1,color: Colors.black12)),
                              child: Row(mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                children: [
                                  Text(amazonprovider.qty),
                                  Icon( Icons.keyboard_arrow_down_outlined)
                                ],

                              )
                          );
                        }
                    ),
                  );
                }
            ),

            InkWell(onTap: () {
            amazonprovider.Addcart(
              name,color,prize,discount,photo,productid,context
            );
            },


              child: Container(
                margin:  EdgeInsets.symmetric(horizontal: 15),
                height: 40,
                width: width,
                decoration: BoxDecoration(
                    color: Colors.amber, borderRadius: BorderRadius.circular(20)),
                child: const Center(
                    child: Text("Add to Cart",
                        style: TextStyle(
                            fontSize: 15, fontWeight: FontWeight.bold
                        ))),
              ),
            ),
            const SizedBox(
              height: 10,
            ),
            InkWell(onTap: () {
              Navigator.push(context,MaterialPageRoute(builder:(context) => Delivaryaddress(
                photo: photo,
                productid: productid,
                color: color,
                discount: discount,
                prize: prize,
                name: name,
                qty: amazonprovider.qty,
              ),));
            },
              child: Container(
                margin: const EdgeInsets.symmetric(horizontal: 15),
                height: 40,
                width: width,
                decoration: BoxDecoration(
                    color: Colors.orange.shade700,
                    borderRadius: BorderRadius.circular(20)),
                child: const Center(
                    child: Text("Buy Now",
                        style: TextStyle(
                            fontSize: 15, fontWeight: FontWeight.bold))),
              ),
            ),
            const SizedBox(
              height: 20,
            ),

          ],
        ),
      ),
    );
  }

  buildIndiCator(
    int count,
    BuildContext context,
  ) {
    int imgCount = count;
    return Center(
      child: Padding(
        padding: const EdgeInsets.only(top: 6),
        child: AnimatedSmoothIndicator(
          activeIndex: Activeindex,
          count: imgCount,
          effect: const JumpingDotEffect(
              dotWidth: 7,
              dotHeight: 7,
              activeDotColor: Colors.teal,
              dotColor: Color(0xffaba17c)),
        ),
      ),
    );
  }
}
