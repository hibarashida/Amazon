import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import 'Account.dart';
import 'Amazonlens.dart';
import 'order.dart';

class coustomerService extends StatelessWidget {
  const coustomerService({super.key});

  @override
  Widget build(BuildContext context) {
    var width = MediaQuery.of(context).size.width;
    return Scaffold(
      appBar: AppBar(
        leading: InkWell(
            onTap: () {
              Navigator.pop(context);
            },
            child: Icon(Icons.arrow_back)),
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
      body: SingleChildScrollView(
        child: Column(
          children: [
            Container(
              width: width,
              height: 100,
              decoration: BoxDecoration(
                gradient: LinearGradient(
                  colors: [Colors.teal.shade200, Colors.white],
                  begin: Alignment.topCenter,
                  end: Alignment.bottomCenter,
                ),
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text("  Welcome to",
                      style: TextStyle(
                        fontWeight: FontWeight.normal,
                        fontSize: 20,
                      )),
                  Text("  Customer Service",
                      style:
                          TextStyle(fontWeight: FontWeight.bold, fontSize: 25)),
                ],
              ),
            ),
            SizedBox(
              height: 5,
            ),
            Align(
                alignment: Alignment.topLeft,
                child: Text("  Quick Links",
                    style:
                        TextStyle(fontWeight: FontWeight.bold, fontSize: 20))),
            SizedBox(
              height: 10,
            ),
            Container(
              margin: EdgeInsets.symmetric(horizontal: 10),
              width: width,
              height: 350,
              decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(10),
                  border: Border.all(
                    width: 1,
                    color: Colors.black12,
                  )),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: [
                      Image.asset("assets/cs1.jpeg", scale: 2),
                      SizedBox(
                        width: 250,
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              "Your Orders",
                              style: TextStyle(
                                  fontSize: 15, fontWeight: FontWeight.bold),
                            ),
                            Text(
                              "Track,return or view an order",
                              style: TextStyle(
                                  fontSize: 15, fontWeight: FontWeight.normal),
                            ),
                          ],
                        ),
                      ),
                      InkWell(
                          onTap: () {
                            Navigator.push(
                                context,
                                MaterialPageRoute(
                                  builder: (context) => Order(),
                                ));
                          },
                          child: Icon(
                            Icons.arrow_forward_ios,
                            size: 20,
                          ))
                    ],
                  ),
                  Container(
                    width: width,
                    height: 1,
                    color: Colors.black12,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: [
                      Image.asset("assets/se2.jpeg", scale: 2),
                      SizedBox(
                        width: 200,
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              "Returns & Refunds",
                              style: TextStyle(
                                  fontSize: 15, fontWeight: FontWeight.bold),
                            ),
                            Text(
                              "Returnor replace items",
                              style: TextStyle(
                                  fontSize: 15, fontWeight: FontWeight.normal),
                            ),
                          ],
                        ),
                      ),
                      InkWell(
                          onTap: () {
                            Navigator.push(
                                context,
                                MaterialPageRoute(
                                  builder: (context) => Order(),
                                ));
                          },
                          child: Icon(
                            Icons.arrow_forward_ios,
                            size: 20,
                          ))
                    ],
                  ),
                  Container(
                    width: width,
                    height: 1,
                    color: Colors.black12,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: [
                      Image.asset("assets/se3.jpeg", scale: 2),
                      SizedBox(
                        width: 200,
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              "Amazon Pay Transaction",
                              style: TextStyle(
                                  fontSize: 15, fontWeight: FontWeight.bold),
                            ),
                            Text(
                              "View cashback details and other \n transaction",
                              style: TextStyle(
                                  fontSize: 15, fontWeight: FontWeight.normal),
                            ),
                          ],
                        ),
                      ),
                      Icon(
                        Icons.arrow_forward_ios,
                        size: 20,
                      )
                    ],
                  ),
                  Container(
                    width: width,
                    height: 1,
                    color: Colors.black12,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: [
                      Image.asset("assets/se4.jpeg", scale: 2),
                      SizedBox(
                        width: 2,
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              "Account Settings",
                              style: TextStyle(
                                  fontSize: 15, fontWeight: FontWeight.bold),
                            ),
                            Text(
                              "Edit password,address or payment \n details",
                              style: TextStyle(
                                  fontSize: 15, fontWeight: FontWeight.normal),
                            ),
                          ],
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
                          child: Icon(
                            Icons.arrow_forward_ios,
                            size: 20,
                          ))
                    ],
                  ),
                ],
              ),
            ),
            SizedBox(
              height: 10,
            ),
            Container(
              width: width,
              height: 2,
              color: Colors.black12,
            ),
            Padding(
              padding: EdgeInsets.only(right: 220, top: 8, bottom: 8),
              child: Text(
                "Need more help?",
                style: TextStyle(fontWeight: FontWeight.bold, fontSize: 20),
              ),
            ),
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 10),
              child: TextField(
                decoration: InputDecoration(
                  prefixIcon: Icon(Icons.search),
                  border: OutlineInputBorder(),
                  contentPadding: EdgeInsets.only(top: 4),
                  hintText: 'Search',
                  hintStyle: TextStyle(fontSize: 17),
                ),
              ),
            ),
            Padding(
              padding: EdgeInsets.symmetric(vertical: 15),
              child: Row(
                children: [
                  Text(
                    "  Browse All Help Topics",
                    style: TextStyle(
                        fontSize: 15,
                        fontWeight: FontWeight.bold,
                        color: Colors.blue),
                  ),
                  Icon(
                    Icons.arrow_forward_ios,
                    color: Colors.blue,
                    size: 12,
                  )
                ],
              ),
            ),
            Container(
              width: width,
              height: 2,
              color: Colors.black12,
            ),
            Padding(
              padding: EdgeInsets.only(right: 120, top: 10, bottom: 10),
              child: Text(
                "Didn't find what you were looking for?",
                style: TextStyle(fontSize: 15, fontWeight: FontWeight.bold),
              ),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                Container(
                  height: 40,
                  width: 140,
                  decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(10),
                      border: Border.all(
                        width: 1,
                        color: Colors.black12,
                      )),
                  child: Row(
                    children: [
                      Image.asset("assets/chaticon.jpeg", scale: 2),
                      Center(
                          child: Text(
                        "Chat with us",
                        style: TextStyle(
                            fontSize: 15, fontWeight: FontWeight.bold),
                      ))
                    ],
                  ),
                ),
                Container(
                  height: 40,
                  width: 150,
                  decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(10),
                      border: Border.all(
                        width: 1,
                        color: Colors.black12,
                      )),
                  child: Row(
                    children: [
                      Image.asset("assets/talkicon.jpeg", scale: 2),
                      Center(
                          child: Text(
                        "Talk to us",
                        style: TextStyle(
                            fontSize: 15, fontWeight: FontWeight.bold),
                      ))
                    ],
                  ),
                ),
              ],
            ),
            SizedBox(
              height: 100,
            )
          ],
        ),
      ),
    );
  }
}
