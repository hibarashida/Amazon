import 'package:amazon/providerclass.dart';
import 'package:amazon/selectpayament.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'Shippingaddress.dart';

class Delivaryaddress extends StatelessWidget {
  String photo;
  String name;
  String color;
  String prize;
  String discount;
  String productid;
  String qty;
  Delivaryaddress({super.key,required this.photo,required this.name,required this.color,
    required this.prize,required this.discount,required this.productid,required this.qty});

  @override
  Widget build(BuildContext context) {
    providerclass amazonprovider = Provider.of<providerclass>(context,listen: false);
    amazonprovider.getaddress();
    var width = MediaQuery.of(context).size.width;
    var height = MediaQuery.of(context).size.height;
    return Scaffold(
      backgroundColor: Colors.grey.shade200,
      appBar: AppBar(
        leading: InkWell(
            onTap: () {
              Navigator.pop(context);

            },
            child: const Icon(Icons.arrow_back)),
        backgroundColor: Colors.teal.shade200,
        title: const Text("Select a delivary address",
            style: TextStyle(
                color: Colors.black,
                fontWeight: FontWeight.bold,
                fontSize: 20)),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            Container(
              width: width,
              height: 120,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(8),
                border: Border.all(width: 1, color: Colors.grey.shade800),
                color: Colors.white,
              ),
              child: Row(
                children: [
                  Container(
                    width: 120,
                    height: 150,
                    child: Column(
                      children: [
                        SizedBox(
                            width: 50,
                            height: 80,
                            child: Image.network(photo)),
                        Text("$qty item",
                            style: const TextStyle(
                                color: Colors.teal, fontWeight: FontWeight.bold)),
                      ],
                    ),
                  ),
                  Column(
                    children: [
                      Text(
                        name,
                        style: const TextStyle(
                            fontWeight: FontWeight.normal, fontSize: 20),
                      ),
                      Text(
                        "₹$prize",
                        style: const TextStyle(
                            fontWeight: FontWeight.normal, fontSize: 20),
                      ),
                      Text(
                        discount,
                        style: const TextStyle(color: Colors.red,
                            fontWeight: FontWeight.normal, fontSize: 20),
                      ),
                    ],
                  )
                ],
              ),
            ),
            SizedBox(

              height:350 ,
              child: Consumer<providerclass>(
                builder: (context,val,child) {
                  return ListView.builder(
                      itemCount:amazonprovider.addresslist.length ,
                  itemBuilder: (context,index) {
                      return Container(
                        margin: const EdgeInsets.symmetric(horizontal: 10, vertical: 10),
                        width: width,
                        height: 360,
                        color: Colors.white,
                        child: Column(
                          children: [
                            Container(
                              // width: width,
                              height: 140,
                              // color: Colors.red,
                              child: Row(children: [
                                Radio(
                                  value:val.addresslist[index].id,
                                  activeColor: Colors.green.shade500,
                                  groupValue: val.address123,
                                  onChanged: ( value) {
                                    val.address123=value.toString();
                                    val.addaddress("CHECKBOX", val.addresslist[index].id);
                                    val.name = val.addresslist[index].name;
                                    val.housename = val.addresslist[index].houseadrs;
                                    val.areaname = val.addresslist[index].areaadress;
                                    val.Towncity = val.addresslist[index].towncity;
                                    val.state = val.addresslist[index].state;
                                    val.pincode = val.addresslist[index].pincode;
                                    print("ghjk"+val.address123);
                                    print("ghjk"+val.housename);
                                  },
                                ),
                                // SizedBox(
                                //   width: 50,
                                // ),
                                Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Text(
                                        amazonprovider.addresslist[index].name,
                                        style: const TextStyle(fontWeight: FontWeight.bold,fontSize: 15)),

                                Text(
                                    amazonprovider.addresslist[index].houseadrs,
                                    style: const TextStyle(fontWeight: FontWeight.normal,fontSize: 15)),
                                Text(
                                    amazonprovider.addresslist[index].areaadress,
                                    style: const TextStyle(fontWeight: FontWeight.normal,fontSize: 15)),
                                Row(
                                  children: [
                                    Text(
                                        amazonprovider.addresslist[index].towncity+",",
                                        style: const TextStyle(fontWeight: FontWeight.normal,fontSize: 15)),

                                    Text(
                                        amazonprovider.addresslist[index].state+",",
                                        style: const TextStyle(fontWeight: FontWeight.normal,fontSize: 15)),
                                    Text(
                                        amazonprovider.addresslist[index].pincode,
                                        style: const TextStyle(fontWeight: FontWeight.normal,fontSize: 15)),
                                  ],
                                ),
                                Text(
                                    amazonprovider.addresslist[index].country,
                                    style: const TextStyle(fontWeight: FontWeight.normal,fontSize: 15)),
                                Text("phonenumber :"+amazonprovider.addresslist[index].mobileno,
                                    style: const TextStyle(fontWeight: FontWeight.normal,fontSize: 15)),
                                  ],
                                ),
                              ]),
                            ),
                            InkWell(onTap: () {
                                  amazonprovider.getaddress();
                                  Navigator.push(context,MaterialPageRoute(builder: (context) => SelectPayment(
                                    photo: photo,
                                    productid: productid,
                                    color: color,
                                    discount: discount,
                                    prize: prize,
                                    name: name,
                                    qty: amazonprovider.qty,
                                  )) );
                            },
                              child: Container(

                                margin: const EdgeInsets.symmetric(horizontal: 10, vertical: 10),
                                height: 50,
                                width: width,
                                decoration: BoxDecoration(
                                    color: Colors.amber.shade300,
                                    borderRadius: BorderRadius.circular(10)),
                                child:  const Center(
                                    child: Text(" Deliver to this address",
                                        style: TextStyle(
                                            fontSize: 15, fontWeight: FontWeight.bold))),
                              ),
                            ),
                            InkWell(onTap: () {

                              Navigator.push(context, MaterialPageRoute(builder: (context) => ShippingAdress(from:"EDIT" ) ,));
                            },
                              child: Container(
                                margin: const EdgeInsets.symmetric(horizontal: 10, vertical: 10),
                                height: 35,
                                width: width,
                                decoration: BoxDecoration(
                                    color: Colors.white,
                                    border: Border.all(width: 1, color: Colors.black12),

                                    borderRadius: BorderRadius.circular(10)),
                                child: const Center(
                                    child: Text("Edit Address",
                                        style: TextStyle(
                                            fontSize: 15, fontWeight: FontWeight.bold))),
                              ),
                            ),
                            Container(
                              margin: const EdgeInsets.symmetric(horizontal: 10, vertical: 10),
                              height: 35,
                              width: width,
                              decoration: BoxDecoration(
                                  color: Colors.white,
                                  border: Border.all(width: 1, color: Colors.black12),

                                  borderRadius: BorderRadius.circular(10)),
                              child: const Center(
                                  child: Text("Add delivary instruction",
                                      style: TextStyle(
                                          fontSize: 15, fontWeight: FontWeight.bold))),
                            ),
                          ],
                        ),
                      );
                    }
                  );
                }
              ),
            ),
            Container(
              margin: const EdgeInsets.symmetric(horizontal: 10,vertical: 10),
              width: width,
              height: 100,
              color: Colors.white,
              child: Column(mainAxisAlignment:  MainAxisAlignment.spaceAround,
                children: [
                  InkWell(onTap: () {
                    amazonprovider.clear();
                    Navigator.push(context,  MaterialPageRoute(builder: (context) => ShippingAdress(from: "NEW",) ,));
                  },
                    child
                        : const Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,

                      children: [
                        Text("  Add a new Address",
                            style: TextStyle(
                                fontSize: 15, fontWeight: FontWeight.bold)),
                        Icon(Icons.arrow_forward_ios)
                      ],
                    ),
                  ),
                  const Divider(color: Colors.black12,thickness: 1,),
                  const Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text("  Find a pickup location near you",
                          style: TextStyle(
                              fontSize: 15, fontWeight: FontWeight.bold)),
                      Icon(Icons.arrow_forward_ios)
                    ],
                  ),
                ],

              ),
            ),

            Row(
              children: [
                const SizedBox(
                  width: 10,
                ),
                Container(
                  height: 1,
                  width: 150,
                  color: Colors.black12,
                ) ,
                const Text("  or  ",
                  style: TextStyle(fontSize: 20,fontWeight: FontWeight.normal),),
                Container(
                  height: 1,
                  width: 160,
                  color: Colors.black12,
                ),
              ],
            ),
            Center(

                child: InkWell(onTap: () {
                 amazonprovider.onItemTapped(2);
                 },
                    child: const Text("Back to cart",
                      style: TextStyle(color: Colors.teal,fontWeight: FontWeight.bold),))
            )
          ],
        ),
      ),
    );
  }
}
