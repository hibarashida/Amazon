import 'package:amazon/providerclass.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'delivaryadress.dart';

class SelectPayment extends StatelessWidget {

  String photo;
  String name;
  String color;
  String prize;
  String discount;
  String productid;
  String qty;
  SelectPayment({super.key,required this.photo,required this.name,required this.color,
    required this.prize,required this.discount,required this.productid,required this.qty});

  @override
  Widget build(BuildContext context) {

    providerclass amazonprovider = Provider.of<providerclass>(context);
    amazonprovider.getaddress();

    var width = MediaQuery.of(context).size.width;
    var height = MediaQuery.of(context).size.height;
    return Scaffold(
      backgroundColor: Colors.grey.shade50,
      appBar: AppBar(
        backgroundColor: Colors.teal.shade200,
        automaticallyImplyLeading: false,
        title: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            InkWell(
                onTap: () {

                  Navigator.pop(context);
                },
                child: const  Text(
                  "CANCEL",
                  style: TextStyle(fontSize: 15, fontWeight: FontWeight.normal),
                )),
            const Text(
              "Select a Payment Method",
              style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
            ),
          ],
        ),
      ),
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
              width: width,
              height: 280,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(8),
                border: Border.all(width: 1, color: Colors.black12),
                color: Colors.white,
              ),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      SizedBox(
                        width: 100,
                        height: 120,
                        child: Column(
                          children: [
                            SizedBox(
                              width: 50,
                                height: 80,
                                child: Image.network(photo)),
                             const SizedBox(
                               height: 10,
                             ),
                             Text("$qty item",
                                style: const TextStyle(
                                    color: Colors.teal,
                                    fontWeight: FontWeight.bold)),
                          ],
                        ),
                      ),
                      const SizedBox(
                        width: 20,
                      ),
                       Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: [
                          Text(
                            name,
                            style: const TextStyle(
                                fontWeight: FontWeight.normal, fontSize: 20),
                          ),Text(
                            color,
                            style: const TextStyle(
                                fontWeight: FontWeight.normal, fontSize: 15),
                          ),
                          Text(
                            "₹$prize",
                            style: const TextStyle(
                                fontWeight: FontWeight.normal,
                                fontSize: 20),
                          ),

                          Text(
                            discount,
                            style: const TextStyle(
                                color: Colors.red,
                                fontWeight: FontWeight.normal,
                                fontSize: 20),
                          ),

                        ],
                      )
                    ],
                  ),
                  const Divider(
                    height: 0,
                    color: Colors.black12,
                    thickness: 1,
                  ),
                   Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      const SizedBox(
                        width: 80,
                        child: Text("Delivary to",
                            style: TextStyle(
                                color: Colors.teal,
                                fontWeight: FontWeight.bold)),
                      ),
                      InkWell(onTap: () {
                        Navigator.push(context, MaterialPageRoute(builder: (context) => Delivaryaddress(
                          qty:qty ,
                          name:name ,
                          prize: prize,
                          discount: discount,
                          color: color,
                          productid:productid ,
                          photo:photo ,
                        ),));
                      },
                        child:  Consumer<providerclass>(
                          builder: (context,val,child) {
                            return Container(
                              child: Column(
                                mainAxisAlignment: MainAxisAlignment.start,
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text(val.name,
                                      style: TextStyle(fontWeight: FontWeight.bold)),
                                  Row(
                                    children: [
                                      Text(val.housename+", "),
                                       Text(val.areaname+", "),

                                      Text(val.state),
                                    ],
                                  ),
                                  Row(
                                    children: [
                                      Text(val.Towncity+", "),
                                      Text(val.pincode),
                                    ],
                                  ),
                                ],
                              ),
                            );
                          }
                        ),
                      ),
                      const Icon(
                        Icons.arrow_forward_ios,
                        size: 18,
                      ),
                    ],
                  ),
                  const Divider(
                    height: 10,
                    color: Colors.black12,
                    thickness: 1,
                  ),
                  const Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      SizedBox(
                        width: 70,
                        child: Text("  Get it by",
                            style: TextStyle(
                                color: Colors.teal,
                                fontWeight: FontWeight.bold)),
                      ),
                      Column(
                        mainAxisAlignment: MainAxisAlignment.start,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text("Thursday,24 Aug",
                              style: TextStyle(fontWeight: FontWeight.bold)),
                          Text("FREE  Delivary with your Prime \n memebership"),
                        ],
                      ),
                      Icon(
                        Icons.arrow_forward_ios,
                        size: 18,
                      )
                    ],
                  ),
                ],
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(left: 15, top: 10, bottom: 10),
              child: Text(
                "MORE WAYS TO PAY",
                style: TextStyle(
                    fontWeight: FontWeight.bold,color: Colors.grey.shade700),
              ),
            ),
            Container(
              margin: const EdgeInsets.symmetric(horizontal: 10),
              height: 70,
              width: width,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(8),
                border: Border.all(width: 1, color: Colors.black12),
                color: Colors.white,
              ),
              child: Row(
                children: [
                  Radio(
                      value: "credit and debit card",
                      groupValue: amazonprovider.checkval,
                      activeColor: Colors.teal,
                      onChanged: (value) {
                        amazonprovider.checkval = value.toString();
                        amazonprovider.notifyListeners();
                      }),
                  const Text(
                    "Credit or debit card",
                    style: TextStyle(fontWeight: FontWeight.bold),
                  )
                ],
              ),
            ),
            Container(
              margin: const EdgeInsets.symmetric(horizontal: 10),
              height: 70,
              width: width,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(8),
                border: Border.all(width: 1, color: Colors.black12),
                color: Colors.white,
              ),
              child: Row(
                children: [
                  Radio(
                      value: "upi",
                      groupValue: amazonprovider.checkval,
                      activeColor: Colors.teal,
                      onChanged: (value) {
                        amazonprovider.checkval = value.toString();
                        amazonprovider.notifyListeners();
                      }),
                  const Text(
                    "UPI",
                    style: TextStyle(fontWeight: FontWeight.bold),
                  )
                ],
              ),
            ),
            Container(
              margin: const EdgeInsets.symmetric(horizontal: 10),
              height: 70,
              width: width,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(8),
                border: Border.all(width: 1, color: Colors.black12),
                color: Colors.white,
              ),
              child: Row(
                children: [
                  Radio(
                      value: "net banking",
                      groupValue: amazonprovider.checkval,
                      activeColor: Colors.teal,
                      onChanged: (value) {
                        amazonprovider.checkval = value.toString();
                        amazonprovider.notifyListeners();
                      }),
                  const Text(
                    "Net Banking",
                    style: TextStyle(fontWeight: FontWeight.bold),
                  )
                ],
              ),
            ),
            Container(
              margin: const EdgeInsets.symmetric(horizontal: 10),
              height: 70,
              width: width,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(8),
                border: Border.all(width: 1, color: Colors.black12),
                color: Colors.white,
              ),
              child: Row(
                children: [
                  Radio(
                      value: "cash on delivery",
                      groupValue: amazonprovider.checkval,
                      activeColor: Colors.teal,
                      onChanged: (value) {
                        amazonprovider.checkval = value.toString();
                        amazonprovider.notifyListeners();
                      }),
                  const Text(
                    "Cash on delivary/Pay on delivary",
                    style: TextStyle(fontWeight: FontWeight.bold),
                  )
                ],
              ),
            ),
            Container(
              margin: const EdgeInsets.symmetric(horizontal: 10, vertical: 10),
              height: 40,
              width: width,
              decoration: BoxDecoration(
                  color: Colors.amber, borderRadius: BorderRadius.circular(10)),
              child: const Center(
                  child: Text("Continue",
                      style: TextStyle(
                          fontSize: 15, fontWeight: FontWeight.bold))),

            ),
          ],
        ),
      ),
    );
  }
}
