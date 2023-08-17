import 'package:amazon/Amazonlens.dart';
import 'package:amazon/providerclass.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'Account.dart';
import 'Buyagain.dart';
import 'Customerservice.dart';
import 'List.dart';
import 'Sign-in.dart';
import 'order.dart';

class MenuPage extends StatelessWidget {
  const MenuPage({super.key});

  @override
  Widget build(BuildContext context) {
    providerclass amazonprovider = Provider.of<providerclass>(context);

    var width = MediaQuery.of(context).size.width;
    return Scaffold(
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
      floatingActionButton: Container(
        height: 80,
        width: width,
        color: Colors.white,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            InkWell(
              onTap: () {
                Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => Order(),
                    ));
              },
              child: Container(
                height: 30,
                width: 70,
                decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(5),
                    border: Border.all(color: Colors.black38, width: 1)),
                child: Center(
                    child: Text(
                  "Order",
                  style: TextStyle(fontSize: 15, fontWeight: FontWeight.bold),
                )),
              ),
            ),
            InkWell(
              onTap: () {
                Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => BuyAgain(),
                    ));
              },
              child: Container(
                height: 30,
                width: 95,
                decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(5),
                    border: Border.all(color: Colors.black38, width: 1)),
                child: Center(
                    child: Text("Buy Again",
                        style: TextStyle(
                            fontSize: 15, fontWeight: FontWeight.bold))),
              ),
            ),
            InkWell(
              onTap: () {
                Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => Account(),
                    ));
              },
              child: Container(
                height: 30,
                width: 80,
                decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(5),
                    border: Border.all(color: Colors.black38, width: 1)),
                child: Center(
                    child: Text("Account",
                        style: TextStyle(
                            fontSize: 15, fontWeight: FontWeight.bold))),
              ),
            ),
            InkWell(
              onTap: () {
                Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => Lista(),
                    ));
              },
              child: Container(
                height: 30,
                width: 50,
                decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(5),
                    border: Border.all(color: Colors.black38, width: 1)),
                child: Center(
                    child: Text("List",
                        style: TextStyle(
                            fontSize: 15, fontWeight: FontWeight.bold))),
              ),
            ),
          ],
        ),
      ),
      backgroundColor: Colors.teal.shade100,
      appBar: AppBar(
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
                prefixIcon: Icon(Icons.search),
                border: OutlineInputBorder(),
                contentPadding: EdgeInsets.only(top: 4),
                hintText: 'Search Amazon.in',
                hintStyle: TextStyle(fontSize: 17),
                suffixIcon: InkWell(
                    onTap: () {
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => AmazonLens(),
                          ));
                    },
                    child: Icon(Icons.document_scanner_outlined))),
          ),
        ),
      ),
      body: Consumer<providerclass>(builder: (context, value, child) {
        return SingleChildScrollView(
          child: Column(
            children: [
              Container(
                margin: EdgeInsets.symmetric(horizontal: 20, vertical: 10),
                height: 90,
                width: width,
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(9),
                  border: Border.all(color: Colors.black54, width: 1),
                ),
                child: Row(
                  children: [
                    Column(
                      children: [
                        Container(
                          margin: EdgeInsets.only(left: 15, top: 5),
                          height: 50,
                          width: 130,
                          decoration: BoxDecoration(
                              color: Colors.yellow,
                              borderRadius: BorderRadius.circular(9),
                              border:
                                  Border.all(color: Colors.black12, width: 1)),
                          child: Image.asset("assets/amazonpay.png",
                              color: Colors.black),
                        ),
                        SizedBox(
                          height: 5,
                        ),
                        Text(
                          "Amazon Pay",
                          style: TextStyle(
                              fontSize: 15, fontWeight: FontWeight.bold),
                        )
                      ],
                    ),
                    SizedBox(
                      width: 20,
                    ),
                    Column(
                      children: [
                        Container(
                          margin: EdgeInsets.only(top: 5),
                          height: 50,
                          width: 130,
                          decoration: BoxDecoration(
                              color: Colors.yellow,
                              borderRadius: BorderRadius.circular(9),
                              border:
                                  Border.all(color: Colors.black12, width: 1)),
                          child: Image.asset("assets/minitv2.png", scale: 4),
                        ),
                        SizedBox(
                          height: 5,
                        ),
                        Text(
                          "Amazon miniTV",
                          style: TextStyle(
                              fontSize: 15, fontWeight: FontWeight.bold),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
              SizedBox(
                height: 10,
              ),
              SizedBox(
                height: 1470,
                child: GridView.builder(
                  physics: NeverScrollableScrollPhysics(),
                  itemCount: value.menu.length,
                  padding: EdgeInsets.zero,
                  gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                      crossAxisCount: 2,
                      childAspectRatio: 1 / .5,
                      crossAxisSpacing: 1.0,
                      mainAxisSpacing: 15.0,
                      mainAxisExtent: 150),
                  itemBuilder: (context, index) {
                    return InkWell(
                      onTap: () {},
                      child: Container(
                        margin: EdgeInsets.symmetric(horizontal: 8),
                        decoration: BoxDecoration(
                            color: Colors.white,
                            border: Border.all(color: Colors.black38, width: 2),
                            borderRadius: BorderRadius.circular(10),
                            image: DecorationImage(
                                image: AssetImage(
                                  value.menu[index],
                                ),
                                fit: BoxFit.fill,
                                scale: 4)),
                        child: Padding(
                          padding: EdgeInsets.only(left: 5, top: 5),
                          child: Text(value.menutext[index],
                              style: TextStyle(fontWeight: FontWeight.bold)),
                        ),
                      ),
                    );
                  },
                ),
              ),
              Container(
                margin: EdgeInsets.symmetric(horizontal: 10, vertical: 10),
                width: width,
                height: 40,
                decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(10),
                    border: Border.all(color: Colors.black38, width: 1)),
                child: Row(
                  children: [
                    Text("    Customer Service",
                        style: TextStyle(
                          fontWeight: FontWeight.bold,
                        )),
                    SizedBox(
                      width: 190,
                    ),
                    InkWell(
                        onTap: () {
                          Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (context) => coustomerService(),
                              ));
                        },
                        child: Icon(
                          Icons.arrow_forward_ios,
                          size: 15,
                          color: Colors.black,
                        ))
                  ],
                ),
              ),
              Container(
                margin: EdgeInsets.symmetric(horizontal: 10),
                width: width,
                height: 40,
                decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(10),
                    border: Border.all(color: Colors.black38, width: 1)),
                child: Row(
                  // mainAxisAlignment:  MainAxisAlignment.spaceBetween,
                  children: [
                    Text("    Settings",
                        style: TextStyle(
                          fontWeight: FontWeight.bold,
                        )),
                    SizedBox(
                      width: 240,
                    ),
                    Icon(
                      Icons.keyboard_arrow_down_outlined,
                      size: 25,
                      color: Colors.black,
                    ),
                    // Image.asset("")
                  ],
                ),
              ),
              InkWell(
                onTap: () {
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => SignIn(),
                      ));
                },
                child: Container(
                  margin: EdgeInsets.symmetric(horizontal: 10, vertical: 10),
                  width: width,
                  height: 40,
                  decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(10),
                      border: Border.all(color: Colors.black38, width: 1)),
                  child: Row(
                    // mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text("  Sign In",
                          style: TextStyle(
                            fontWeight: FontWeight.bold,
                          )),
                      SizedBox(
                        width: 260,
                      ),
                      Icon(
                        Icons.arrow_forward_ios,
                        size: 15,
                        color: Colors.black,
                      )
                    ],
                  ),
                ),
              ),
              SizedBox(
                height: 100,
              )
            ],
          ),
        );
      }),
    );
  }
}
