import 'package:amazon/productadmin.dart';
import 'package:amazon/providerclass.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'Carouseladmin.dart';
import 'category admin.dart';
import 'listimg.dart';

class Adminpanel extends StatelessWidget {
  const Adminpanel({super.key});

  @override
  Widget build(BuildContext context) {
    providerclass amazonprovider = Provider.of<providerclass>(context);

    var width = MediaQuery.of(context).size.width;
    var height = MediaQuery.of(context).size.height;
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.teal.shade500,
        title: Center(
            child: Image.asset(
          "assets/amazon.inlogo.png",
          scale: 2,
        )),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            Container(
              height: height,
              width: width,
              color: Colors.grey.shade300,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  SizedBox(
                    width: 200,
                    child: ElevatedButton(
                        style: ElevatedButton.styleFrom(primary: Colors.teal),
                        onPressed: () {
                          Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (context) => const Category(),
                              ));
                        },
                        child: const Text("Category",
                            style: TextStyle(color: Colors.white))),
                  ),
                  SizedBox(
                    width: 200,
                    child: ElevatedButton(
                        style: ElevatedButton.styleFrom(primary: Colors.teal),
                        onPressed: () {
                          Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (context) => const Carousel(),
                              ));
                        },
                        child: const Text("Carousel",
                            style: TextStyle(color: Colors.white))),
                  ),  SizedBox(
                    width: 200,
                    child: ElevatedButton(
                        style: ElevatedButton.styleFrom(primary: Colors.teal),
                        onPressed: () {
                          Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (context) => const ListImg(),
                              ));
                        },
                        child: const Text("Explorelistimg",
                            style: TextStyle(color: Colors.white))),
                  ),
                  SizedBox(
                    width: 200,
                    child: ElevatedButton(
                        style: ElevatedButton.styleFrom(primary: Colors.teal),
                        onPressed: () {
                          amazonprovider.getcategorydata();
                          Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (context) => const Product(),
                              ));
                        },
                        child: const Text(
                          "Products",
                          style: TextStyle(color: Colors.white),
                        )),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
