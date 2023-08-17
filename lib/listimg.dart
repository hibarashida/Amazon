import 'package:amazon/providerclass.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class ListImg extends StatelessWidget {
  const ListImg({super.key});

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
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                const Text("Add List Images",
                    style:
                    TextStyle(fontWeight: FontWeight.bold, fontSize: 20)),
                Container(
                  height: 250,
                  width: 250,
                  decoration: BoxDecoration(
                      color: Colors.white,
                      border: Border.all(width: 1, color: Colors.grey),
                      borderRadius: BorderRadius.circular(10)),
                  child: InkWell(
                      onTap: () {
                        amazonprovider.getimagel();
                      },
                      child: amazonprovider.listfileimg == null
                          ? const Center(child: Text("click here"))
                          : Image.file(amazonprovider.listfileimg!)),
                ),

                InkWell(
                  onTap: () {
                    amazonprovider.Addlistimg();
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
