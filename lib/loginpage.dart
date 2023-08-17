import 'package:amazon/providerclass.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'otplogin.dart';

class LoginPage extends StatelessWidget {
  const LoginPage({super.key});

  @override
  Widget build(BuildContext context) {
    var width = MediaQuery.of(context).size.width;
    var height = MediaQuery.of(context).size.height;
    providerclass amazonprovider = Provider.of<providerclass>(context);

    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        title: Center(child: Image.asset("assets/amazon.in.png")),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            Container(
              margin: EdgeInsets.symmetric(horizontal: 10, vertical: 15),
              height: height,
              width: width,
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(10),
                  border: Border.all(width: 2, color: Colors.black12)),
              child: Column(
                children: [
                  Padding(
                    padding: EdgeInsets.only(right: 260, top: 10, bottom: 10),
                    child: Text("Login",
                        style: TextStyle(
                            fontSize: 25, fontWeight: FontWeight.bold)),
                  ),
                  Padding(
                    padding: EdgeInsets.only(right: 190),
                    child: Text("Email or Mobile number",
                        style: TextStyle(fontWeight: FontWeight.bold)),
                  ),
                  Padding(
                    padding: EdgeInsets.symmetric(horizontal: 10, vertical: 10),
                    child: TextField(
                        controller: amazonprovider.loginphnnumber,
                        decoration: InputDecoration(
                          hintText: " Email or number :",
                          border: OutlineInputBorder(),
                          contentPadding: EdgeInsets.only(top: 4),
                        )),
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text("   Passwords",
                          style: TextStyle(fontWeight: FontWeight.bold)),
                      Text("Forget password   ",
                          style: TextStyle(color: Colors.blue)),
                    ],
                  ),
                  Padding(
                      padding:
                          EdgeInsets.symmetric(horizontal: 10, vertical: 10),
                      child: TextField(
                        controller: amazonprovider.loginpassword,
                        obscureText: true,
                        decoration: InputDecoration(
                          border: OutlineInputBorder(),
                          hintText: 'Enter password',
                        ),
                      )),
                  InkWell(
                    onTap: () {
                      amazonprovider.loginpage(context);
                    },
                    child: Container(
                      margin:
                          EdgeInsets.symmetric(horizontal: 15, vertical: 20),
                      height: 40,
                      width: width,
                      decoration: BoxDecoration(
                          color: Colors.amber,
                          borderRadius: BorderRadius.circular(20)),
                      child: Center(
                          child: Text("Login",
                              style: TextStyle(
                                  fontSize: 15, fontWeight: FontWeight.bold))),
                    ),
                  ),
                  InkWell(
                    onTap: () {
                      amazonprovider.sendotp(context);

                      // Navigator.push(context,MaterialPageRoute(builder: (context) =>Otplogin() ,) );
                    },
                    child: Container(
                      margin: EdgeInsets.symmetric(horizontal: 15),
                      height: 40,
                      width: width,
                      decoration: BoxDecoration(
                          color: Colors.amber,
                          borderRadius: BorderRadius.circular(20)),
                      child: Center(
                          child: Text("Enter otp",
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
