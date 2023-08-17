import 'package:amazon/providerclass.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:pinput/pinput.dart';
import 'package:provider/provider.dart';

class Otplogin extends StatelessWidget {
  const Otplogin({super.key});

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
        child: Column(
          children: [
            Container(
              margin: const EdgeInsets.symmetric(horizontal: 10, vertical: 15),
              height: height,
              width: width,
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(10),
                  border: Border.all(width: 2, color: Colors.black12)),
              child: Column(
                children: [
                  const Padding(
                    padding: EdgeInsets.only(right: 150, top: 10, bottom: 10),
                    child: Text("Verification Code :",
                        style: TextStyle(
                            fontSize: 25,
                            fontWeight: FontWeight.bold,
                            color: Colors.teal)),
                  ),
                  const Padding(
                    padding: EdgeInsets.only(right: 100, bottom: 10),
                    child: Text("we have sent the verification code to",
                        style: TextStyle(fontSize: 15, color: Colors.grey)),
                  ),
                  Row(
                    children: [
                      const Text("  +91***********",
                          style: TextStyle(
                            fontSize: 15,
                            fontWeight: FontWeight.bold,
                          )),
                      InkWell(
                        onTap: () {
                          Navigator.pop(context);
                        },
                        child: const Text("  Change phone number?",
                            style: TextStyle(
                                fontSize: 15,
                                fontWeight: FontWeight.bold,
                                color: Colors.teal)),
                      ),
                    ],
                  ),
                  const Padding(
                    padding: EdgeInsets.only(right: 250, top: 10),
                    child: Text("Enter Your OTP",
                        style: TextStyle(
                            fontWeight: FontWeight.bold, fontSize: 15)),
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 10),
                    child: Pinput(
                      controller: amazonprovider.otpverifycontroller,
                      length: 6,
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      defaultPinTheme: PinTheme(
                          textStyle:
                              const TextStyle(fontWeight: FontWeight.bold),
                          height: 50,
                          width: 50,
                          decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(15),
                              border: Border.all(
                                  color: Colors.grey.withOpacity(0.9)))),
                    ),
                  ),
                  InkWell(
                    onTap: () {
                      amazonprovider.verify(context);
                    },
                    child: Container(
                      margin: const EdgeInsets.symmetric(
                          horizontal: 15, vertical: 20),
                      height: 40,
                      width: width,
                      decoration: BoxDecoration(
                          color: Colors.amber,
                          borderRadius: BorderRadius.circular(20)),
                      child: const Center(
                          child: Text("Verify",
                              style: TextStyle(
                                  fontSize: 15, fontWeight: FontWeight.bold))),
                    ),
                  ),
                  InkWell(
                    onTap: () {},
                    child: Container(
                      margin: const EdgeInsets.symmetric(horizontal: 15),
                      height: 40,
                      width: width,
                      decoration: BoxDecoration(
                          color: Colors.amber,
                          borderRadius: BorderRadius.circular(20)),
                      child: const Center(
                          child: Text("Create Your Amazon Account",
                              style: TextStyle(
                                  fontSize: 15, fontWeight: FontWeight.bold))),
                    ),
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
