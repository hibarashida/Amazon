import 'package:amazon/providerclass.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'modelclass.dart';

class Product extends StatelessWidget {
  const Product({super.key});

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
              width: width,
              height: height,
              decoration: BoxDecoration(
                color: Colors.white,
                border: Border.all(
                  width: 2,
                  color: Colors.grey,
                ),
                borderRadius: BorderRadius.circular(10),
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  Row(
                    children: [
                      const Text(
                        "Name :",
                        style: TextStyle(
                            fontWeight: FontWeight.bold,
                            fontSize: 20,
                            color: Colors.teal),
                      ),
                      SizedBox(
                        width: 320,
                        height: 35,
                        child: TextField(
                            controller: amazonprovider.productnamecontroller,
                            decoration: const InputDecoration(
                              hintText: "  product name :",
                              border: OutlineInputBorder(),
                              contentPadding: EdgeInsets.only(top: 4),
                            )),
                      ),
                    ],
                  ),
                  Row(
                    children: [
                      const Text("img :",
                          style: TextStyle(
                              fontWeight: FontWeight.bold,
                              fontSize: 20,
                              color: Colors.teal)),
                      Container(
                        width: 100,
                        height: 100,
                        color: Colors.white,
                        child: InkWell(
                            onTap: () {
                              amazonprovider.getimg();
                            },
                            child: amazonprovider.productfileimg == null
                                ? const Center(child: Text("click here"))
                                : Image.file(amazonprovider.productfileimg!)),
                      )
                    ],
                  ),
                  // Row(
                  //   children: [
                  //     Text("img 2:",style: TextStyle(fontWeight: FontWeight.bold,fontSize: 20,color: Colors.teal)),
                  //     Container(
                  //       width: 100,
                  //       height: 100,
                  //       color: Colors.white,
                  //       child: InkWell(onTap: () {
                  //         amazonprovider.Getimg();
                  //       },
                  //           child: amazonprovider.productfileimg2==null? Center(child: Text("click here")):Image.file(amazonprovider.productfileimg2!)),
                  //
                  //     )
                  //   ],
                  // ),
                  // Row(
                  //   children: [
                  //     Text("img 3:",style: TextStyle(color:Colors.teal,fontSize: 20,fontWeight: FontWeight.bold)),
                  //     Container(
                  //         height: 100,
                  //         width: 100,
                  //         color: Colors.white,
                  //         child: InkWell(onTap: () {
                  //           amazonprovider.getimges();
                  //         },
                  //             child:amazonprovider.productfileimg3==null? Center(child: Text("click here")):Image.file(amazonprovider.productfileimg3!))),
                  //
                  //   ],
                  // ),
                  Row(
                    children: [
                      const Text(
                        "Color :",
                        style: TextStyle(
                            fontWeight: FontWeight.bold,
                            fontSize: 20,
                            color: Colors.teal),
                      ),
                      SizedBox(
                        width: 320,
                        height: 35,
                        child: TextField(
                            controller: amazonprovider.colorcontroller,
                            decoration: const InputDecoration(
                              // hintText: "  product name :",
                              border: OutlineInputBorder(),
                              contentPadding: EdgeInsets.only(top: 4),
                            )),
                      ),
                    ],
                  ),
                  Row(
                    children: [
                      const Text(
                        "Price :",
                        style: TextStyle(
                            fontWeight: FontWeight.bold,
                            fontSize: 20,
                            color: Colors.teal),
                      ),
                      SizedBox(
                        width: 320,
                        height: 35,
                        child: TextField(
                            controller: amazonprovider.pricecontroller,
                            keyboardType: TextInputType.number,
                            decoration: const InputDecoration(
                              border: OutlineInputBorder(),
                              contentPadding: EdgeInsets.only(top: 4),
                            )),
                      ),
                    ],
                  ),
                  Row(
                    children: [
                      const Text(
                        "Discount :",
                        style: TextStyle(
                            fontWeight: FontWeight.bold,
                            fontSize: 20,
                            color: Colors.teal),
                      ),
                      SizedBox(
                        width: 300,
                        height: 35,
                        child: TextField(
                            controller: amazonprovider.discountcontroller,
                            keyboardType: TextInputType.number,
                            decoration: const InputDecoration(
                              // hintText: "  product name :",
                              border: OutlineInputBorder(),
                              contentPadding: EdgeInsets.only(top: 4),
                            )),
                      ),
                    ],
                  ),
                  Row(
                    children: [
                      const Text(
                        "Category :",
                        style: TextStyle(
                            fontWeight: FontWeight.bold,
                            fontSize: 20,
                            color: Colors.teal),
                      ),
                      SizedBox(
                        width: width / 1.5,
                        child: Consumer<providerclass>(
                            builder: (context, value, child) {
                          return Autocomplete<category>(
                            optionsBuilder:
                                (TextEditingValue textEditingValue) {
                              return value.categoryimg
                                  .where((category item) => item.name
                                      .toLowerCase()
                                      .contains(
                                          textEditingValue.text.toLowerCase()))
                                  .toList();
                            },
                            displayStringForOption: (category option) =>
                                option.name,
                            fieldViewBuilder: (BuildContext context,
                                TextEditingController
                                    fieldTextEditingController,
                                FocusNode fieldFocusNode,
                                VoidCallback onFieldSubmitted) {
                              WidgetsBinding.instance.addPostFrameCallback((_) {
                                fieldTextEditingController.text =
                                    value.categyct.text;
                              });

                              return SizedBox(
                                child: TextField(
                                  maxLines: null,
                                  decoration: InputDecoration(
                                    contentPadding: const EdgeInsets.symmetric(
                                        vertical: 16, horizontal: 14),
                                    hintStyle: TextStyle(
                                        color: Colors.black.withOpacity(0.6),
                                        fontFamily: "PoppinsMedium",
                                        fontSize: 13,
                                        fontWeight: FontWeight.bold),
                                    fillColor: Colors.white,
                                    filled: true,
                                    border: const UnderlineInputBorder(
                                      // borderRadius: BorderRadius.circular(30),
                                      borderSide: BorderSide(
                                          width: 2, color: Colors.grey),
                                    ),
                                    focusedBorder: const UnderlineInputBorder(
                                        // borderRadius: BorderRadius.circular(30),
                                        borderSide: BorderSide(
                                            color: Colors.grey, width: 2)),
                                    enabledBorder: const UnderlineInputBorder(
                                      // borderRadius: BorderRadius.circular(30),
                                      borderSide: BorderSide(
                                          width: 2, color: Colors.grey),
                                    ),
                                    hintText: "Select a category",
                                    suffixIcon: const Icon(
                                      Icons.keyboard_arrow_down_sharp,
                                      size: 25,
                                      color: Colors.black38,
                                    ),
                                  ),
                                  onChanged: (txt) {
                                    // value.categyct.text = txt;
                                    print("ololololo");
                                  },
                                  controller: fieldTextEditingController,
                                  focusNode: fieldFocusNode,
                                ),
                              );
                            },
                            onSelected: (category selection) {
                              value.categyct.text = selection.name;
                              value.productSelectedCategoryID = selection.id;
                              print(selection.id + "asdfg");
                              // value.requestMemberAssembly=selection.assembly;
                              // value.requestMemberDistrict=selection.district;
                              // value.requestMemberState=selection.state;
                            },
                            optionsViewBuilder: (BuildContext context,
                                AutocompleteOnSelected<category> onSelected,
                                Iterable<category> options) {
                              return Align(
                                alignment: Alignment.topLeft,
                                child: Material(
                                  child: Container(
                                    width: 200,
                                    height: 300,
                                    color: Colors.white,
                                    child: ListView.builder(
                                      padding: const EdgeInsets.all(10.0),
                                      itemCount: options.length,
                                      itemBuilder:
                                          (BuildContext context, int index) {
                                        final category option =
                                            options.elementAt(index);

                                        return GestureDetector(
                                          onTap: () {
                                            onSelected(option);
                                          },
                                          child: Container(
                                            color: Colors.white,
                                            height: 50,
                                            width: 200,
                                            child: Column(
                                                crossAxisAlignment:
                                                    CrossAxisAlignment.start,
                                                children: [
                                                  Text(option.name,
                                                      style: const TextStyle(
                                                          fontWeight:
                                                              FontWeight.bold)),
                                                  const SizedBox(height: 10)
                                                ]),
                                          ),
                                        );
                                      },
                                    ),
                                  ),
                                ),
                              );
                            },
                          );
                        }),
                      ),
                    ],
                  ),
                  InkWell(
                    onTap: () {
                      amazonprovider.addproduct();
                      amazonprovider.Clear();
                    },
                    child: Container(
                      margin: const EdgeInsets.symmetric(horizontal: 10),
                      width: width,
                      height: 30,
                      decoration: BoxDecoration(
                          color: Colors.amber,
                          borderRadius: BorderRadius.circular(5)),
                      child: const Center(
                          child: Text("Add",
                              style: TextStyle(
                                  fontWeight: FontWeight.bold, fontSize: 15))),
                    ),
                  )
                ],
              )),
        ));
  }
}
