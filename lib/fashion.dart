import 'package:amazon/providerclass.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:pinput/pinput.dart';
import 'package:provider/provider.dart';

import 'Amazonlens.dart';
import 'Dress.dart';

class Fashion extends StatelessWidget {
  bool show;
   Fashion({super.key,required this.show});

  @override
  Widget build(BuildContext context) {
    providerclass amazonprovider = Provider.of<providerclass>(context);
    var width = MediaQuery.of(context).size.width;
    var height = MediaQuery.of(context).size.height;


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
      body: Column(
        children: [
          Container(
            width: width,
            height: 40,
            color: Colors.lightBlueAccent,
            child: const Row(
              children: [
                Icon(Icons.location_on_outlined),
                SizedBox(
                  width: 10,
                ),
                Text(
                  "Select a location to see product availbility",
                  style:
                      TextStyle(fontSize: 18, fontWeight: FontWeight.normal),
                )
              ],
            ),
          ),
          Expanded(
            // width: 50,
            // height: height,
            child: GridView.builder(
              // physics:  NeverScrollableScrollPhysics(),
              itemCount: amazonprovider.productdetails.length,
              gridDelegate:  SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 2,
                  childAspectRatio: .45,
                  crossAxisSpacing: 5.0,
                  mainAxisSpacing: 20.0),
              itemBuilder: (context, index) {
                return InkWell(onTap: () {
                  Navigator.push(context, MaterialPageRoute(builder: (context) => Dress(
                    photo: amazonprovider.productdetails[index].photo,
                    name: amazonprovider.productdetails[index].product_name,
                     color: amazonprovider.productdetails[index].color,
                    prize: amazonprovider.productdetails[index].price,
                    discount: amazonprovider.productdetails[index].discount,
                    show: show,

                  ),));
                },
                  child: Container(
                    height: 400,
                    decoration: BoxDecoration(
                        border: Border.all(width: 1, color: Colors.black12)),
                    child: Column(
                      children: [
                        Container(
                          color: Colors.blue,
                          height: 230,
                          width: 190,
                          child: Image.network(
                            amazonprovider.productdetails[index].photo,
                            fit: BoxFit.fill,
                          ),
                        ),
                        Text(
                            amazonprovider.productdetails[index].product_name,
                            style: TextStyle(
                                color: Colors.black,
                                fontSize: 20,
                                fontWeight: FontWeight.bold)),
                         Text( amazonprovider.productdetails[index].color,

                            style: TextStyle(
                              color: Colors.black,
                              fontSize: 20,
                            )),
                        const Row(
                          mainAxisAlignment: MainAxisAlignment.center,
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
                         Text( amazonprovider.productdetails[index].price,

                            style: TextStyle(
                                color: Colors.black,
                                fontSize: 20,
                                fontWeight: FontWeight.bold)),
                         Text(
                            amazonprovider.productdetails[index].discount,

                            style: TextStyle(
                                color: Colors.red,
                                fontSize: 20,
                                fontWeight: FontWeight.normal)),
                        const Text("Free delivery by Amazon",
                            style: TextStyle(
                                color: Colors.black54,
                                fontSize: 15,
                                fontWeight: FontWeight.normal)),
                      ],
                    ),
                  ),
                );
              },
            ),
          )
        ],
      ),
    );
  }
}
