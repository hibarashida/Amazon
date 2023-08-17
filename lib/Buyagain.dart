import 'package:amazon/providerclass.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'Amazonlens.dart';
import 'order.dart';

class BuyAgain extends StatelessWidget {
  const BuyAgain({super.key});

  @override
  Widget build(BuildContext context) {
    var width = MediaQuery.of(context).size.width;
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
      body: Consumer<providerclass>(builder: (context, value, child) {
        return SingleChildScrollView(
          child: Column(
            children: [
              const Padding(
                padding: EdgeInsets.only(top: 10, left: 10, bottom: 10),
                child: Row(
                  children: [
                    Text("Buy Again",
                        style: TextStyle(
                            fontWeight: FontWeight.bold, fontSize: 20)),
                    SizedBox(
                      width: 20,
                    ),
                    Text("Subscribe & Save",
                        style: TextStyle(
                            fontWeight: FontWeight.normal,
                            fontSize: 15,
                            color: Colors.teal)),
                  ],
                ),
              ),
              const Padding(
                padding: EdgeInsets.symmetric(horizontal: 10),
                child: SizedBox(
                  height: 35,
                  child: TextField(
                    decoration: InputDecoration(
                      prefixIcon: Icon(Icons.search),
                      border: OutlineInputBorder(),
                      contentPadding: EdgeInsets.only(top: 4),
                      hintText: 'Search all order',
                      hintStyle: TextStyle(fontSize: 17),
                    ),
                  ),
                ),
              ),
              Container(
                margin: const EdgeInsets.only(
                  top: 10,
                ),
                width: width,
                height: 3,
                color: Colors.black12,
              ),
              const Padding(
                padding: EdgeInsets.only(top: 10, left: 10, bottom: 10),
                child: Text(
                  "There are no recommended items for you to buy again at this time.Check your orders for items you previously purchased",
                  style: TextStyle(fontSize: 15, fontWeight: FontWeight.bold),
                ),
              ),
              InkWell(onTap: () {
                Navigator.push(context,MaterialPageRoute(builder: (context) => Order(),));
              },
                child: Container(
                  margin: const EdgeInsets.symmetric(horizontal: 10),
                  height: 40,
                  width: width,
                  decoration: BoxDecoration(
                      color: Colors.amber,
                      borderRadius: BorderRadius.circular(10)),
                  child: const Center(
                      child: Text("Your Orders",
                          style: TextStyle(
                              fontSize: 15, fontWeight: FontWeight.bold))),
                ),
              ),
              Container(
                margin: const EdgeInsets.only(top: 10),
                width: width,
                height: 40,
                color: Colors.black38,
                child: const Padding(
                  padding: EdgeInsets.only(top: 5, left: 10),
                  child: Text("Discover",
                      style:
                          TextStyle(fontSize: 20, fontWeight: FontWeight.bold)),
                ),
              ),
              Container(
                margin: const EdgeInsets.only(left: 15, right: 15, top: 20),
                color: Colors.white,
                width: 480,
                height: 280,
                child: Column(
                  children: [
                    const Text("Frequently repurchased in costumetics",
                        style: TextStyle(
                            fontSize: 20, fontWeight: FontWeight.bold)),
                    SizedBox(
                      width: width,
                      height: 240,
                      child: ListView.builder(
                        itemCount: value.amazonecart.length,
                        scrollDirection: Axis.horizontal,
                        itemBuilder: (context, index) {
                          return Padding(
                            padding: const EdgeInsets.symmetric(horizontal: 10),
                            child: SizedBox(
                              height: 240,
                              width: 100,
                              child: Column(
                                children: [
                                  Container(
                                    width: 120,
                                    height: 70,
                                    color: Colors.white,
                                    child:
                                        Image.asset(value.amazonecart[index]),
                                  ),
                                  Text(value.carttext[index],
                                      maxLines: 2,
                                      style: const TextStyle(
                                          overflow: TextOverflow.ellipsis,
                                          color: Colors.teal,
                                          fontWeight: FontWeight.bold)),
                                  const Row(
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
                                    ],
                                  ),
                                  Text(value.cartrate[index],
                                      style: const TextStyle(
                                          color: Colors.red,
                                          fontWeight: FontWeight.bold)),
                                  Container(
                                    width: 130,
                                    height: 30,
                                    decoration: BoxDecoration(
                                        color: Colors.yellow,
                                        borderRadius:
                                            BorderRadius.circular(15)),
                                    child: const Center(
                                        child: Text("Add to cart",
                                            style: TextStyle(
                                                fontWeight: FontWeight.bold,
                                                fontSize: 15))),
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
                margin: const EdgeInsets.only(left: 15, right: 15, bottom: 15),
                color: Colors.white,
                width: 480,
                height: 280,
                child: Column(
                  children: [
                    const Text("Frequently repurchased in electronics ",
                        style: TextStyle(
                            fontSize: 20, fontWeight: FontWeight.bold)),
                    SizedBox(
                      width: width,
                      height: 240,
                      child: ListView.builder(
                        itemCount: value.amazonecart2.length,
                        scrollDirection: Axis.horizontal,
                        itemBuilder: (context, index) {
                          return Padding(
                            padding: const EdgeInsets.symmetric(horizontal: 10),
                            child: SizedBox(
                              height: 240,
                              width: 100,
                              child: Column(
                                children: [
                                  Container(
                                    width: 130,
                                    height: 70,
                                    color: Colors.white,
                                    child:
                                        Image.asset(value.amazonecart2[index]),
                                  ),
                                  Text(value.carttext2[index],
                                      maxLines: 2,
                                      style: const TextStyle(
                                          overflow: TextOverflow.ellipsis,
                                          color: Colors.teal,
                                          fontWeight: FontWeight.bold)),
                                  const Row(
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
                                    ],
                                  ),
                                  Text(value.cartrate2[index],
                                      style: const TextStyle(
                                          color: Colors.red,
                                          fontWeight: FontWeight.bold)),
                                  Container(
                                    width: 130,
                                    height: 30,
                                    decoration: BoxDecoration(
                                        color: Colors.yellow,
                                        borderRadius:
                                            BorderRadius.circular(15)),
                                    child: const Center(
                                        child: Text("Add to cart",
                                            style: TextStyle(
                                                fontWeight: FontWeight.bold,
                                                fontSize: 15))),
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
                margin: const EdgeInsets.only(
                  left: 15,
                  right: 15,
                ),
                color: Colors.white,
                width: 480,
                height: 280,
                child: Column(
                  children: [
                    const Text("Top deals for you",
                        style: TextStyle(
                            fontSize: 20, fontWeight: FontWeight.bold)),
                    SizedBox(
                      width: width,
                      height: 240,
                      child: ListView.builder(
                        itemCount: value.buyagainimg.length,
                        scrollDirection: Axis.horizontal,
                        itemBuilder: (context, index) {
                          return Padding(
                            padding: const EdgeInsets.symmetric(horizontal: 10),
                            child: SizedBox(
                              height: 240,
                              width: 100,
                              child: Column(
                                children: [
                                  Container(
                                    width: 120,
                                    height: 70,
                                    color: Colors.white,
                                    child:
                                        Image.asset(value.buyagainimg[index]),
                                  ),
                                  Text(value.buyagainimgtxt[index],
                                      maxLines: 2,
                                      style: const TextStyle(
                                          overflow: TextOverflow.ellipsis,
                                          color: Colors.teal,
                                          fontWeight: FontWeight.bold)),
                                  const Row(
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
                                    ],
                                  ),
                                  Text(value.bgrate[index],
                                      style: const TextStyle(
                                          color: Colors.red,
                                          fontWeight: FontWeight.bold)),
                                  Container(
                                    width: 130,
                                    height: 30,
                                    decoration: BoxDecoration(
                                        color: Colors.yellow,
                                        borderRadius:
                                            BorderRadius.circular(15)),
                                    child: const Center(
                                        child: Text("Add to cart",
                                            style: TextStyle(
                                                fontWeight: FontWeight.bold,
                                                fontSize: 15))),
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
            ],
          ),
        );
      }),
    );
  }
}
