import 'package:amazon/providerclass.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class Category extends StatelessWidget {
  const Category({super.key});

  @override
  Widget build(BuildContext context) {
    providerclass amazonprovider = Provider.of<providerclass>(context);

    var width = MediaQuery.of(context).size.width;
    var height = MediaQuery.of(context).size.height;
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        title: Center(child: Image.asset("assets/amazon.in.png")),
      ),
      body: SingleChildScrollView(
        child: Container(
          margin: const EdgeInsets.only(top: 50, left: 15, right: 15),
          height: 300,
          width: width,
          decoration: BoxDecoration(
            color: Colors.black12,
            border: Border.all(
              width: 2,
              color: Colors.grey,
            ),
            borderRadius: BorderRadius.circular(10),
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              Row(
                children: [
                  const Text("Name:",
                      style: TextStyle(
                          color: Colors.teal,
                          fontSize: 20,
                          fontWeight: FontWeight.bold)),
                  SizedBox(
                    width: 250,
                    height: 40,
                    child: TextField(
                      controller: amazonprovider.categorynamecontroller,
                      decoration: const InputDecoration(
                        hintText: "  enter category :",
                        border: OutlineInputBorder(),
                        contentPadding: EdgeInsets.only(top: 4),
                      ),
                    ),
                  ),
                ],
              ),
              Row(
                children: [
                  const Text("img :",
                      style: TextStyle(
                          color: Colors.teal,
                          fontSize: 20,
                          fontWeight: FontWeight.bold)),
                  Container(
                      height: 100,
                      width: 200,
                      color: Colors.white,
                      child: InkWell(
                          onTap: () {
                            amazonprovider.getImage2();
                          },
                          child: amazonprovider.categoryfileimg == null
                              ? const Center(child: Text("click here"))
                              : Image.file(amazonprovider.categoryfileimg!))),
                ],
              ),
              Center(
                child: InkWell(
                  onTap: () {
                    amazonprovider.adddata2();
                  },
                  child: Container(
                    width: 90,
                    height: 30,
                    decoration: BoxDecoration(
                        color: Colors.blue,
                        borderRadius: BorderRadius.circular(5)),
                    child: const Center(
                        child: Text("Add ",
                            style: TextStyle(
                                fontWeight: FontWeight.bold, fontSize: 15))),
                  ),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
