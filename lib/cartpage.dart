import 'package:amazon/Amazonlens.dart';
import 'package:amazon/providerclass.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'bottomnavigationbar.dart';
import 'cartmodelcls.dart';
import 'cartmodelcls.dart';
import 'cartmodelcls.dart';
import 'cartmodelcls.dart';
import 'cartmodelcls.dart';

class CartPage extends StatelessWidget {
   CartPage({super.key});
  int productlength=0;



  @override
  Widget build(BuildContext context) {
    providerclass amazonprovider = Provider.of<providerclass>(context);
    amazonprovider.getproductdata();


    var width = MediaQuery.of(context).size.width;
    return Scaffold(backgroundColor: Colors.black12,
      appBar: AppBar(
        automaticallyImplyLeading: false,

        backgroundColor: Colors.teal.shade200,
        title: Container(
          width: width,
          height:40 ,
          decoration: BoxDecoration(borderRadius:BorderRadius.circular(5),
            color: Colors.white,),
          child: TextField(
            decoration: InputDecoration(
                prefixIcon: Icon(Icons.search),
                border: OutlineInputBorder(),
                contentPadding: EdgeInsets.only(top:4 ),
                hintText: 'Search Amazon.in',hintStyle:TextStyle(fontSize: 17) ,
                suffixIcon: InkWell(
                    onTap: () {
                  Navigator.push(context, MaterialPageRoute(builder: (context) => AmazonLens(),));
                },
                    child: Icon(Icons.document_scanner_outlined))
            ),
          ),
        ),
      ),
      body: Consumer<providerclass>(
        builder: (context,value ,child) {
          return SingleChildScrollView(
            child: Column(
              children: [
                Container(
                  width: width,
                  height: 30,
                  color: Colors.teal.shade200,
                  child: Text("Cart",style: TextStyle(fontWeight: FontWeight.bold,fontSize: 20)),
                ),
                Container(
                  width: width,
                  height: 2,
                  color: Colors.teal.shade100,
                  child: Container(margin: EdgeInsets.only(right: 380),
                    width: 30,
                    height: 2,
                    color: Colors.black,
                  ),
                ),
                Container(
                  width: width,
                  height: 40,
                  color: Colors.teal.shade100,
                  child:  Row(
                    children: [
                      Icon(Icons.location_on_outlined),
                      SizedBox(width: 10,),
                      Text("Select a location to see product availbility",
                        style: TextStyle(fontSize: 18,fontWeight: FontWeight.normal),)
                    ],
                  ),
                ),
                //      SizedBox(
                //        height: 40,
                //      ),
                //
                // CircleAvatar(radius: 90,
                //     child: Image.asset("assets/ST2.jpg",scale: 1,)),
                //    SizedBox(
                //      height: 10,
                //    ),
                //     Text("Your Amazon cart is empty ",style: TextStyle(fontSize: 25,fontWeight: FontWeight.bold),),
                //  Text("Shop today's deals",style: TextStyle(color: Colors.teal,fontSize: 15),),
                //    SizedBox(
                //      height: 20,
                //    ),
                //
                //     Container(margin: EdgeInsets.symmetric(horizontal: 10),
                //       height: 40,
                //       width:width,
                //       decoration: BoxDecoration( color: Colors.yellowAccent,borderRadius: BorderRadius.circular(5)),
                //       child: Center(child: Text("Sign in to your account")),
                //     ),
                //     SizedBox(
                //       height: 10,
                //     ),
                //     Container(margin: EdgeInsets.symmetric(horizontal: 10),
                //       height: 40,
                //       width:width,
                //       decoration: BoxDecoration( color: Colors.black12,borderRadius: BorderRadius.circular(5),
                //           border: Border.all(color: Colors.black26,width: 1)),
                //       child: Center(child: Text("Sign up now")),
                //     ),
                SizedBox(
                  height: 10,
                ),
                Container(
                  width: width,
                  height: 1,
                  color: Colors.black12,
                ),
                SizedBox(
                  height: 350,
                  child: ListView.builder(
                    scrollDirection: Axis.vertical,
                    // physics: const NeverScrollableScrollPhysics(),
                    itemCount: amazonprovider.addcart.length,
                    itemBuilder: (context, index) {
                      return Container(
                        margin: EdgeInsets.only(bottom: 10,top: 10,
                            left: 10,right: 10),
                        height: 300,
                        width: width,
                        decoration: BoxDecoration(color: Colors.yellow,borderRadius: BorderRadius.circular(10),
                         ),
                        child: Column(
                          children: [
                            Row(
                              children: [
                                // ClipRRect(borderRadius: BorderRadius.circular(10),
                                Container(
                                    margin: EdgeInsets.only(right: 10,),
                                    height: 200,
                                    width: 150,
                                    // color: Colors.black12,
                                    child: Image.network(amazonprovider.addcart[index].photo),),

                                Column(
                                  mainAxisAlignment: MainAxisAlignment.start,
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    SizedBox(
                                      width: 50,
                                      child: Text(amazonprovider.addcart[index].name,style: TextStyle(
                                          color: Colors.black,fontWeight: FontWeight.bold
                                      )),
                                    ),
                                    Text(amazonprovider.addcart[index].color,style: TextStyle(color: Colors.black54)),
                                    Text(amazonprovider.addcart[index].price,style: TextStyle(fontWeight: FontWeight.bold)),
                                    Text(amazonprovider.addcart[index].discount,style: TextStyle(color: Colors.teal)),
                                    Row(
                                      children: [
                                        Icon(Icons.star,color: Colors.deepOrange,size:18,),
                                        Icon(Icons.star,color: Colors.deepOrange,size:18,),
                                        Icon(Icons.star,color: Colors.deepOrange,size:18,),
                                        Icon(Icons.star,color: Colors.deepOrange,size:18,),
                                        Icon(Icons.star,color: Colors.black12,size:18,),
                                        SizedBox(width: 80),
                                        Icon(Icons.arrow_forward_ios,color: Colors.black38)

                                      ],),
                                    // Container(
                                    //   margin: EdgeInsets.only(top: 15),
                                    //   width: 190,
                                    //   height: 30,
                                    //   decoration: BoxDecoration(color: Colors.amber,borderRadius: BorderRadius.circular(20)),
                                    //   child: Center(child: Text("Add to cart",style: TextStyle(fontWeight: FontWeight.bold,fontSize: 15))),
                                    // ),
                                    Icon(Icons.favorite)
                                  ],
                                ),
                              ],
                            ),
                            SizedBox(
                              height: 10,
                            ),
                            Column(
                              children: [
                                Row(
                                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                                  children: [
                                    Container(
                                      // margin: EdgeInsets.only(right: 100,top: 10,left: 10),
                                      height: 30,
                                      width: 110,

                                      decoration: BoxDecoration(color: Colors.white
                                          ,borderRadius: BorderRadius.circular(10),
                                          border: Border.all(width: 1,color: Colors.black12,
                                      )
                                      ),
                                      child: Row(mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                        children: [
                                          InkWell(onTap: () {
                                            amazonprovider.Decrement();
                                          },
                                            child: Container(
                                             width: 30,
                                              height: 40,
                                              decoration: BoxDecoration(color: Colors.grey.shade300,
                                                  borderRadius:BorderRadius.only(bottomLeft: Radius.circular(10),
                                                  topLeft:Radius.circular(10) ) ),
                                              child: Center(child: Text("-",style: TextStyle(fontWeight: FontWeight.bold))),
                                            ),
                                          ),
                                          Center(child: Text(amazonprovider.count.toString())),
                                          InkWell(
                                            onTap: () {
                                              amazonprovider.Inrement();
                                            },
                                            child: Container(
                                              // margin: EdgeInsets.only(left: 19),
                                              width: 30,
                                              height: 40,
                                              decoration: BoxDecoration(color: Colors.grey.shade300,
                                                  borderRadius:BorderRadius.only(bottomRight: Radius.circular(10),
                                                  topRight:Radius.circular(10) ) ),
                                              child: Center(child: Text("+",style: TextStyle(fontWeight: FontWeight.bold),)),
                                            ),
                                          ),

                                        ],
                                      ),
                                    ),
                                    InkWell(onTap: () {
                                      amazonprovider.deletecart(amazonprovider.addcart[index].id.toString());
                                      amazonprovider.getcartdata();
                                      },
                                      child: Container(
                                        height: 30,
                                        width: 100,
                                        decoration: BoxDecoration(color: Colors.white,borderRadius:BorderRadius.circular(10),
                                            border: Border.all(width: 1,color: Colors.black12) ),
                                       child: Center(child: Text("Delete",style: TextStyle(fontWeight: FontWeight.bold),)),

                      ),
                                    ),
                                    Container(
                                      height: 30,
                                      width: 120,
                                      decoration: BoxDecoration(color: Colors.white,borderRadius:BorderRadius.circular(10),
                                          border: Border.all(width: 1,color: Colors.black12), ),
                                      child: Center(child: Text("Save for later",style: TextStyle(fontWeight: FontWeight.bold),)),

                                    ),
                                  ],
                                ),
                              ],
                            ),
                            Container(
                              margin: EdgeInsets.only(right: 250,top: 5),
                              height: 30,
                              width: 120,
                              decoration: BoxDecoration(color: Colors.white,borderRadius:BorderRadius.circular(10),
                                border: Border.all(width: 1,color: Colors.black12), ),
                              child: Center(child: Text("See more like this",style: TextStyle(fontWeight: FontWeight.bold,
                                  fontSize:12 ),)),

                            )

                          ],
                        ),
                      );

                    },

                  ),
                ),
                Container(
                  margin: EdgeInsets.only(left: 15,right: 15
                      ,bottom: 15,top: 20),
                  color: Colors.white,
                  width: 480,
                  height: 300,
                  child: Column(
                    children: [
                      Text("Customer who bought items in your \n Recent History also bought",
                          style: TextStyle(
                        fontSize: 20,fontWeight: FontWeight.bold
                      )),
                      SizedBox(width: width,
                        height: 240,
                        child: ListView.builder(
                          itemCount: amazonprovider.productdetails.length,
                          scrollDirection: Axis.horizontal,
                          itemBuilder:(context, index) {

                            return Padding(
                              padding: EdgeInsets.symmetric(horizontal: 10),
                              child: SizedBox(height: 240,
                                width: 100,
                                child: Column(
                                  children: [
                                    Container(
                                      width: 120,
                                      height: 70,
                                      color: Colors.white,
                                      child:   Image.network(amazonprovider.productdetails[index].photo),
                                    ),
                                    Text(amazonprovider.productdetails[index].product_name,
                                        maxLines: 2,style: TextStyle(overflow: TextOverflow.ellipsis,
                                      color: Colors.black,fontWeight: FontWeight.bold
                                    )),
                                    Text(amazonprovider.productdetails[index].color,style: TextStyle(
                                      color: Colors.blue,fontWeight: FontWeight.bold
                                    )),

                                    Row(
                                     children: [
                                       Icon(Icons.star,color: Colors.deepOrange,size:18,),
                                       Icon(Icons.star,color: Colors.deepOrange,size:18,),
                                       Icon(Icons.star,color: Colors.deepOrange,size:18,),
                                       Icon(Icons.star,color: Colors.deepOrange,size:18,),
                                       Icon(Icons.star,color: Colors.black12,size:18,),
                                     ],
                                    ),
                                    Text(amazonprovider.productdetails[index].discount,style: TextStyle(
                                color: Colors.red,fontWeight: FontWeight.bold
                                )),
                                    Text(amazonprovider.productdetails[index].price,style: TextStyle(
                                color: Colors.black,fontWeight: FontWeight.bold
                                )),
                                    InkWell(onTap: () {
                                      amazonprovider.Addcart(
                                          amazonprovider.productdetails[index].product_name,
                                          amazonprovider.productdetails[index].color,
                                          amazonprovider.productdetails[index].price,
                                          amazonprovider.productdetails[index].discount,
                                          amazonprovider.productdetails[index].photo,
                                        amazonprovider.productdetails[index].id,
                                        context
                                      );
                                      amazonprovider.getcartdata();

                                    },
                                      child: Container(
                                        width: 90,
                                        height: 30,
                                        decoration: BoxDecoration(color: Colors.yellow,borderRadius: BorderRadius.circular(5)),
                                        child: Center(child: Text("Add to cart",
                                            style: TextStyle(fontWeight: FontWeight.bold,fontSize: 15))),
                                      ),
                                    )
                                  ],
                                ),
                              ),
                            );
                          },
                        ),
                      ),
                    ],
                  ),
                ),
                Container(
                  margin: EdgeInsets.only(left: 15,right: 15,bottom: 15,top: 20),
                  color: Colors.white,
                  width: 480,
                  height: 300,
                  child: Column(
                    children: [
                      Text("Top deals for you",style: TextStyle(
                          fontSize: 20,fontWeight: FontWeight.bold
                      )),
                      SizedBox(width: width,
                        height: 240,
                        child: ListView.builder(
                          itemCount: 6,
                          // amazonprovider.productdetails.length,
                          scrollDirection: Axis.horizontal,
                          itemBuilder:(context, index) {
                            return Padding(
                              padding: EdgeInsets.symmetric(horizontal: 10),
                              child: SizedBox(height: 240,
                                width: 100,
                                child: Column(
                                  children: [
                                    Container(
                                      width: 130,
                                      height: 70,
                                      color: Colors.white,
                                      child:   Image.network(amazonprovider.productdetails[index].photo),
                                    ),
                                    Text(amazonprovider.productdetails[index].product_name,maxLines: 2,
                                        style: TextStyle(overflow: TextOverflow.ellipsis,
                                        color: Colors.black,fontWeight: FontWeight.bold
                                    )),
                                    Text(amazonprovider.productdetails[index].color,style: TextStyle(
                                        color: Colors.blue,fontWeight: FontWeight.bold
                                    )),
                                    Row(
                                      children: [
                                        Icon(Icons.star,color: Colors.deepOrange,size:18,),
                                        Icon(Icons.star,color: Colors.deepOrange,size:18,),
                                        Icon(Icons.star,color: Colors.deepOrange,size:18,),
                                        Icon(Icons.star,color: Colors.deepOrange,size:18,),
                                        Icon(Icons.star,color: Colors.black12,size:18,),
                                      ],
                                    ),
                                    Text(amazonprovider.productdetails[index].discount,style: TextStyle(
                                        color: Colors.red,fontWeight: FontWeight.bold
                                    )),
                                    Text(amazonprovider.productdetails[index].price,style: TextStyle(
                                        color: Colors.black,fontWeight: FontWeight.bold
                                    )),
                                    InkWell(onTap: () {
                                      amazonprovider.Addcart(
                                          amazonprovider.productdetails[index].product_name,
                                          amazonprovider.productdetails[index].color,
                                          amazonprovider.productdetails[index].price,
                                          amazonprovider.productdetails[index].discount,
                                          amazonprovider.productdetails[index].photo,
                                          amazonprovider.productdetails[index].id,
                                          context
                                      );
                                      amazonprovider.getcartdata();
                                      },
                                      child: Container(
                                        width: 90,
                                        height: 30,
                                        decoration: BoxDecoration(color: Colors.yellow,borderRadius: BorderRadius.circular(5)),
                                        child: Center(child: Text("Add to cart",
                                            style: TextStyle(fontWeight: FontWeight.bold,fontSize: 15))),
                                      ),
                                    )
                                  ],
                                ),
                              ),
                            );
                          },
                        ),
                      ),
                    ],
                  ),
                ),
                InkWell(onTap:() {
                  amazonprovider.onItemTapped(0);
                 // Navigator.push(context, MaterialPageRoute(builder: (context) => BottomNav(),)) ;
                },
                  child: Container(
                    height: 70,
                    width: width,
                    color: Colors.white,
                    child: Column(
                      children: [
                        Container(margin: EdgeInsets.only(top: 9),
                          height: 50,
                          width: 380,
                         decoration: BoxDecoration(color: Colors.yellowAccent,borderRadius: BorderRadius.circular(10)),
                          child: Center(child: Text("Continue shopping",
                              style: TextStyle(fontSize: 20,fontWeight: FontWeight.bold,color:Colors.black))),
                        ),
                      ],
                    ),
                  ),
                )
              ],
            ),
          );
        }
      ),
    );
  }
}
