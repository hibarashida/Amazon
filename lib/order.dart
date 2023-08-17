import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'Amazonlens.dart';
import 'Filter.dart';

class Order extends StatelessWidget {
  const Order({super.key});

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
      body: Column(
        children: [
          const Padding(
            padding: EdgeInsets.only(right: 250, top: 10, bottom: 10),
            child: Text(
              "Your Orders",
              style: TextStyle(fontWeight: FontWeight.bold, fontSize: 25),
            ),
          ),
          Container(
            height: 40,
            width: width,
            decoration: BoxDecoration(
                color: Colors.white,
                border: Border.all(width: 1, color: Colors.black12)),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                SizedBox(
                  height: 50,
                  width: width / 1.5,
                  child: const TextField(
                      decoration: InputDecoration(
                    border: InputBorder.none,
                    prefixIcon: Icon(Icons.search),
                    contentPadding: EdgeInsets.only(top: 1),
                    hintText: 'Search all orders',
                    hintStyle: TextStyle(fontSize: 17),
                  )),
                ),
                SizedBox(
                  child: Row(
                    children: [
                      Container(
                        height: 45,
                        width: 1,
                        color: Colors.black12,
                      ),
                      const Text(
                        "  Filter",
                        style: TextStyle(
                            fontSize: 15, fontWeight: FontWeight.bold),
                      ),
                      InkWell(
                          onTap: () {
                            Navigator.push(
                                context,
                                MaterialPageRoute(
                                  builder: (context) => const Filter(),
                                ));
                          },
                          child: const Icon(
                            Icons.arrow_forward_ios,
                            size: 15,
                          ))
                    ],
                  ),
                )
              ],
            ),
          ),
          const Text(
            "past three months",
            style:
                TextStyle(fontWeight: FontWeight.bold, color: Colors.black38),
          ),
          Container(
            margin: const EdgeInsets.only(top: 5),
            width: width,
            height: 2,
            color: Colors.black12,
          )
        ],
      ),
    );
  }
}
