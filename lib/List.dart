import 'package:amazon/providerclass.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'Amazonlens.dart';
import 'Deals.dart';

class Lista extends StatelessWidget {
  const Lista({super.key});

  @override
  Widget build(BuildContext context) {
    providerclass amazonprovider = Provider.of<providerclass>(context);
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
            Padding(
              padding: EdgeInsets.only(top: 10, bottom: 5, right: 250),
              child: Text(
                "Your Lists",
                style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
              ),
            ),
            Padding(
              padding: EdgeInsets.only(bottom: 10, left: 10, right: 240),
              child: Text(
                "Grouped for you ",
                style: TextStyle(fontSize: 15, fontWeight: FontWeight.bold),
              ),
            ),
            Padding(
              padding: EdgeInsets.symmetric(vertical: 10, horizontal: 10),
              child: SizedBox(
                child: Column(
                  children: [
                    InkWell(
                      onTap: () {
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) => Deals(),
                            ));
                      },
                      child: Row(
                        children: [
                          Container(
                            height: 60,
                            width: 60,
                            decoration: BoxDecoration(
                                image: DecorationImage(
                                    image: AssetImage("assets/tabimgw1.jpeg"),
                                    fit: BoxFit.fill),
                                borderRadius: BorderRadius.circular(15),
                                color: Colors.black12,
                                border: Border.all(
                                    color: Colors.black12, width: 2)),
                          ),
                          Container(
                            height: 60,
                            width: 60,
                            decoration: BoxDecoration(
                                image: DecorationImage(
                                    image: AssetImage("assets/listimg.jpg"),
                                    fit: BoxFit.fill),
                                borderRadius: BorderRadius.circular(15),
                                color: Colors.black12,
                                border: Border.all(
                                    color: Colors.black12, width: 2)),
                          ),
                        ],
                      ),
                    ),
                    Row(
                      children: [
                        Container(
                          height: 60,
                          width: 60,
                          decoration: BoxDecoration(
                              image: DecorationImage(
                                  image: AssetImage("assets/img4,3.jpg"),
                                  fit: BoxFit.fill),
                              borderRadius: BorderRadius.circular(15),
                              color: Colors.black12,
                              border:
                                  Border.all(color: Colors.black12, width: 2)),
                        ),
                        Container(
                          height: 60,
                          width: 60,
                          decoration: BoxDecoration(
                              image: DecorationImage(
                                  image: AssetImage("assets/mobile4.jpg"),
                                  fit: BoxFit.fill),
                              borderRadius: BorderRadius.circular(15),
                              color: Colors.black12,
                              border:
                                  Border.all(color: Colors.black12, width: 2)),
                        ),
                      ],
                    ),
                    Padding(
                      padding: EdgeInsets.only(right: 300, bottom: 10),
                      child: Text(
                        "Deals",
                        style: TextStyle(
                            fontSize: 15, fontWeight: FontWeight.normal),
                      ),
                    ),
                  ],
                ),
              ),
            ),
            const Padding(
              padding: EdgeInsets.symmetric(horizontal: 12, vertical: 10),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    "Your lists and registers",
                    style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                  ),
                  Stack(children: [
                    CircleAvatar(
                      radius: 17,
                      backgroundColor: Colors.black12,
                      child: CircleAvatar(
                        radius: 16,
                        backgroundColor: Colors.white,
                        child: Icon(Icons.add, size: 18),
                      ),
                    ),
                  ]),
                ],
              ),
            ),
            SizedBox(
              height: 80,
              child: Row(
                children: [
                  SizedBox(
                    width: 300,
                    child: ListView.builder(
                      physics: AlwaysScrollableScrollPhysics(),
                      shrinkWrap: true,
                      itemCount: amazonprovider.yourlistr.length,
                      scrollDirection: Axis.horizontal,
                      itemBuilder: (context, index) {
                        return Row(
                          children: [
                            Container(
                              // width: width,
                              height: 50,
                              color: Colors.black,
                              child:
                                  Image.asset(amazonprovider.yourlistr[index]),
                            ),
                            Text(amazonprovider.yourlistrtxt[index]),
                          ],
                        );
                      },
                    ),
                  ),
                  Text("see all")
                ],
              ),
            ),
            Container(
              margin: EdgeInsets.symmetric(horizontal: 10, vertical: 15),
              width: width,
              height: 2,
              color: Colors.black12,
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 10),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text("All saves",
                      style:
                          TextStyle(fontWeight: FontWeight.bold, fontSize: 20)),
                  Container(
                    height: 35,
                    width: 80,
                    decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(30),
                        border: Border.all(
                          width: 2,
                          color: Colors.black12,
                        )),
                    child: Center(
                        child: Text(
                      "Filter",
                      style: TextStyle(fontWeight: FontWeight.bold),
                    )),
                  )
                ],
              ),
            ),
            Column(
              children: [
                SizedBox(
                  height: 500,
                  child: ListView.builder(
                    physics: NeverScrollableScrollPhysics(),
                    itemCount: amazonprovider.listl.length,
                    itemBuilder: (context, index) {
                      return Container(
                        margin: EdgeInsets.only(
                            bottom: 10, top: 10, left: 10, right: 10),
                        height: 200,
                        width: width,
                        decoration: BoxDecoration(
                            color: Colors.white,
                            borderRadius: BorderRadius.circular(10),
                            border: Border.all(
                              width: 2,
                              color: Colors.black12,
                            )),
                        child: Row(
                          children: [
                            // ClipRRect(borderRadius: BorderRadius.circular(10),
                            Container(
                                margin: EdgeInsets.only(right: 10),
                                height: 200,
                                width: 100,
                                color: Colors.black12,
                                child: Image(
                                  image:
                                      AssetImage(amazonprovider.listl[index]),
                                )),
                            Column(
                              mainAxisAlignment: MainAxisAlignment.start,
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                SizedBox(
                                  width: 200,
                                  child: Text(amazonprovider.listltxt[index],
                                      maxLines: 2,
                                      style: TextStyle(
                                          overflow: TextOverflow.ellipsis,
                                          color: Colors.black,
                                          fontWeight: FontWeight.bold)),
                                ),
                                Text(amazonprovider.listltxt2[index],
                                    style: TextStyle(color: Colors.black54)),
                                Text(amazonprovider.listlrate[index],
                                    style:
                                        TextStyle(fontWeight: FontWeight.bold)),
                                Text(amazonprovider.listl3[index],
                                    style: TextStyle(color: Colors.teal)),
                                Row(
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
                                Container(
                                  margin: EdgeInsets.only(top: 15),
                                  width: 190,
                                  height: 30,
                                  decoration: BoxDecoration(
                                      color: Colors.amber,
                                      borderRadius: BorderRadius.circular(20)),
                                  child: Center(
                                      child: Text("Add to cart",
                                          style: TextStyle(
                                              fontWeight: FontWeight.bold,
                                              fontSize: 15))),
                                ),
                                Icon(Icons.favorite)
                              ],
                            ),
                          ],
                        ),
                      );
                    },
                  ),
                ),
                Text("End of saved items")
              ],
            )
          ],
        ),
      ),
    );
  }
}
