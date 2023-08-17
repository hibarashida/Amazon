import 'package:amazon/providerclass.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class Carousel extends StatelessWidget {
  const Carousel({super.key});

  @override
  Widget build(BuildContext context) {
    providerclass amazonprovider = Provider.of<providerclass>(context);

    return Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.white,
          title: Center(child: Image.asset("assets/amazon.in.png")),
        ),
        body: Center(
          child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                const Text("Add Carosuel Details",
                    style:
                        TextStyle(fontWeight: FontWeight.bold, fontSize: 20)),
                Container(
                  height: 170,
                  width: 300,
                  decoration: BoxDecoration(
                      color: Colors.white,
                      border: Border.all(width: 1, color: Colors.grey),
                      borderRadius: BorderRadius.circular(10)),
                  child: InkWell(
                      onTap: () {
                        amazonprovider.getimagec();
                      },
                      child: amazonprovider.carouselfileimg == null
                          ? const Center(child: Text("click here"))
                          : Image.file(amazonprovider.carouselfileimg!)),
                ),
                SizedBox(
                  width: 300,
                  child: TextField(
                    controller: amazonprovider.descriptionnamecontroller,
                    decoration: const InputDecoration(
                      hintText: "  enter Description :",
                      border: OutlineInputBorder(),
                      contentPadding: EdgeInsets.only(top: 4),
                    ),
                  ),
                ),
                InkWell(
                  onTap: () {
                    amazonprovider.Addcarousel();
                    amazonprovider.descriptionnamecontroller.clear();
                  },
                  child: Container(
                    height: 50,
                    width: 100,
                    decoration: BoxDecoration(
                      color: Colors.blue,
                      border: Border.all(width: 1, color: Colors.grey),
                      borderRadius: BorderRadius.circular(10),
                    ),
                    child: const Center(
                        child: Text("add",
                            style: TextStyle(
                                fontWeight: FontWeight.bold, fontSize: 15))),
                  ),
                ),
              ]),
        ));
  }
}
