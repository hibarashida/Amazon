import 'package:amazon/providerclass.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'Account.dart';
import 'Buyagain.dart';
import 'List.dart';
import 'bottomnavigationbar.dart';
import 'order.dart';

class ProfilePage extends StatelessWidget {
  const ProfilePage({super.key});

  @override
  Widget build(BuildContext context) {
    providerclass amazonprovider = Provider.of<providerclass>(context);

    var width = MediaQuery.of(context).size.width;
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        backgroundColor: Colors.teal.shade200,
        actions: [
          Row(
            children: [
              Padding(
                padding: const EdgeInsets.only(right: 260),
                child: Image.asset("assets/amazon.inlogo.png", scale: 4),
              ),
              const Icon(Icons.doorbell_outlined),
              const Icon(Icons.search)
            ],
          )
        ],
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            Container(
              width: width,
              height: 80,
              decoration: BoxDecoration(
                gradient: LinearGradient(
                  colors: [Colors.teal.shade200, Colors.white],
                  begin: Alignment.topCenter,
                  end: Alignment.bottomCenter,
                ),
              ),
              child: const Row(
                children: [
                  Text("  Hello,",
                      style: TextStyle(
                        fontWeight: FontWeight.normal,
                        fontSize: 20,
                      )),
                  Text(" Hiba",
                      style:
                          TextStyle(fontWeight: FontWeight.bold, fontSize: 25)),
                  Padding(
                    padding: EdgeInsets.only(left: 230),
                    child: CircleAvatar(
                      radius: 20,
                      backgroundImage: AssetImage("assets/personicon.png"),
                    ),
                  ),
                ],
              ),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                InkWell(
                  onTap: () {
                    Navigator.push(context,
                        MaterialPageRoute(builder: (context) => const Order()));
                  },
                  child: Container(
                    width: 160,
                    height: 40,
                    decoration: BoxDecoration(
                        color: Colors.grey.shade100,
                        border: Border.all(
                          width: 1,
                          color: Colors.black12,
                        ),
                        borderRadius: BorderRadius.circular(40)),
                    child: const Center(
                        child: Text("Your Orders",
                            style: TextStyle(
                                fontSize: 18, fontWeight: FontWeight.normal))),
                  ),
                ),
                InkWell(
                  onTap: () {
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => const BuyAgain(),
                        ));
                  },
                  child: Container(
                    width: 160,
                    height: 40,
                    decoration: BoxDecoration(
                        color: Colors.grey.shade100,
                        border: Border.all(
                          width: 1,
                          color: Colors.black12,
                        ),
                        borderRadius: BorderRadius.circular(40),),
                    child: const Center(
                        child: Text("Buy Again",
                            style: TextStyle(
                                fontSize: 18, fontWeight: FontWeight.normal))),
                  ),
                )
              ],
            ),
            const SizedBox(
              height: 10,
            ),
            Padding(
              padding: const EdgeInsets.only(bottom: 20),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  InkWell(
                    onTap: () {
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => const Account(),
                          ));
                    },
                    child: Container(
                      width: 160,
                      height: 40,
                      decoration: BoxDecoration(
                          color: Colors.grey.shade100,
                          border: Border.all(
                            width: 1,
                            color: Colors.black12,
                          ),
                          borderRadius: BorderRadius.circular(40)),
                      child: const Center(
                          child: Text("your Account",
                              style: TextStyle(
                                  fontSize: 18,
                                  fontWeight: FontWeight.normal))),
                    ),
                  ),
                  InkWell(
                    onTap: () {
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => const Lista(),
                          ));
                    },
                    child: Container(
                      width: 160,
                      height: 40,
                      decoration: BoxDecoration(
                          color: Colors.grey.shade100,
                          border: Border.all(
                            width: 1,
                            color: Colors.black12,
                          ),
                          borderRadius: BorderRadius.circular(40)),
                      child: const Center(
                          child: Text("Your Lists",
                              style: TextStyle(
                                  fontSize: 18,
                                  fontWeight: FontWeight.normal))),
                    ),
                  )
                ],
              ),
            ),
            const Padding(
              padding: EdgeInsets.symmetric(horizontal: 10),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text("Your Orders",
                      style:
                          TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),
                  Text("See all",
                      style: TextStyle(
                          fontSize: 18,
                          fontWeight: FontWeight.normal,
                          color: Colors.blue)),
                ],
              ),
            ),
            const Padding(
              padding: EdgeInsets.only(right: 100, top: 15),
              child: Text(
                "Hi! You have no recent orders. ",
                style: TextStyle(fontSize: 18, fontWeight: FontWeight.normal),
              ),
            ),
            InkWell(
              onTap: () {
                amazonprovider.onItemTapped(0);
                // Navigator.push(context, MaterialPageRoute(builder: (context) => BottomNav() ,));
              },
              child: Container(
                margin: const EdgeInsets.symmetric(horizontal: 10),
                width: width,
                height: 40,
                decoration: BoxDecoration(
                    color: Colors.grey.shade100,
                    border: Border.all(
                      width: 1,
                      color: Colors.black12,
                    ),
                    borderRadius: BorderRadius.circular(10)),
                child: const Center(
                    child: Text("Return to the Homepage",
                        style: TextStyle(
                            fontSize: 18, fontWeight: FontWeight.bold))),
              ),
            ),
            // Container( margin: EdgeInsets.only(top: 10),
            //   width: width,
            //   height: 3,
            //   color: Colors.black26,
            // ),
            // SizedBox(
            //   height: 10,
            // ),
            // Padding(
            //   padding:  EdgeInsets.symmetric(horizontal: 10),
            //   child: Row(
            //     mainAxisAlignment: MainAxisAlignment.spaceBetween,
            //     children: [
            //       Text("Keep shopping for",style: TextStyle(fontSize: 18,fontWeight: FontWeight.bold)),
            //       Text("Browsing history",style: TextStyle(fontSize: 15,fontWeight: FontWeight.normal,color: Colors.blue)),
            //     ],
            //   ),
            // ),
            // Padding(
            //   padding:  EdgeInsets.only(left: 10,top: 15,right:130),
            //   child: Text("",style:TextStyle(fontSize: 18,fontWeight: FontWeight.normal),),
            // ),
            // Container(
            //   margin:EdgeInsets.symmetric(horizontal: 10) ,
            //   width: width,
            //   height: 40,
            //   decoration: BoxDecoration(color:Colors.grey.shade100,border: Border.all(width: 1,color:Colors.black12,
            //   ),borderRadius: BorderRadius.circular(10)),
            //   child: Center(child: Text("Try Again",style: TextStyle(fontSize: 18,fontWeight: FontWeight.normal))),
            // ),
            Container(
              margin: const EdgeInsets.only(top: 10),
              width: width,
              height: 3,
              color: Colors.black26,
            ),
            const Padding(
              padding: EdgeInsets.only(top: 10, right: 290, bottom: 10),
              child: Text("Buy Again",
                  style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),
            ),
            const Padding(
              padding: EdgeInsets.only(right: 70, bottom: 10),
              child: Text(
                "See what others are reordering on Buy Again",
                style: TextStyle(fontSize: 14, fontWeight: FontWeight.bold),
              ),
            ),

            InkWell(
              onTap: () {
                Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => const BuyAgain(),
                    ));
              },
              child: Container(
                margin: const EdgeInsets.symmetric(horizontal: 10),
                width: width,
                height: 40,
                decoration: BoxDecoration(
                    color: Colors.grey.shade100,
                    border: Border.all(
                      width: 1,
                      color: Colors.black12,
                    ),
                    borderRadius: BorderRadius.circular(10)),
                child: const Center(
                    child: Text("Visit Buy Again",
                        style: TextStyle(
                            fontSize: 18, fontWeight: FontWeight.bold))),
              ),
            ),
            Container(
              margin: const EdgeInsets.only(top: 10, bottom: 20),
              width: width,
              height: 3,
              color: Colors.black26,
            ),
            const Padding(
                padding: EdgeInsets.symmetric(horizontal: 10),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text("Your Account",
                        style: TextStyle(
                            fontSize: 18, fontWeight: FontWeight.bold)),
                    Text("See all",
                        style: TextStyle(
                            fontSize: 18,
                            fontWeight: FontWeight.normal,
                            color: Colors.blue)),
                  ],
                )),
            const SizedBox(
              height: 10,
            ),
            SizedBox(
              height: 50,
              width: width,
              child: ListView.builder(
                  itemCount: amazonprovider.account.length,
                  scrollDirection: Axis.horizontal,
                  itemBuilder: (context, index) {
                    return Container(
                      margin: const EdgeInsets.only(right: 5),
                      height: 50,
                      width: 150,
                      decoration: BoxDecoration(
                          color: Colors.grey.shade200,
                          border: Border.all(
                            width: 1,
                            color: Colors.black12,
                          ),
                          borderRadius: BorderRadius.circular(10)),
                      child: Center(
                        child: Text(amazonprovider.account[index],
                            style: const TextStyle(
                                fontSize: 15, fontWeight: FontWeight.bold)),
                      ),
                    );
                  }),
            ),
            Container(
              margin: const EdgeInsets.only(top: 10, bottom: 50),
              width: width,
              height: 3,
              color: Colors.black26,
            ),
          ],
        ),
      ),
    );
  }
}
