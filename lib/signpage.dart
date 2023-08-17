import 'dart:io';

import 'package:amazon/providerclass.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class SignPage extends StatelessWidget {
  const SignPage({super.key});

  @override
  Widget build(BuildContext context) {
    var width = MediaQuery.of(context).size.width;
    providerclass amazonprovider = Provider.of<providerclass>(context);

    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        backgroundColor: Colors.teal.shade200,
        title: const Text("Amazon.in",style:TextStyle(fontWeight: FontWeight.bold,fontSize: 30)),

      ),
      body: SingleChildScrollView(
        child:
        Column(
          children: [
            Center(
              child: InkWell(onTap:() {
                amazonprovider.getImage();
              },
                child:amazonprovider.fileImage!=null ? CircleAvatar(
                  radius: 60,
                  backgroundImage:FileImage(amazonprovider.fileImage!)):const CircleAvatar(
                   radius: 60,
                  backgroundImage:AssetImage("assets/personicon.png"),
                   ),
              ),
            ),
            Padding(
              padding:  const EdgeInsets.symmetric(horizontal: 10,vertical: 10),
              child: TextField(
                  controller:amazonprovider.namecontroller ,
              decoration: const InputDecoration(
              hintText: " Name :",
              border: OutlineInputBorder(),
              contentPadding: EdgeInsets.only(top:4 ),
              )
              ),
            ),
            Padding(
              padding:  const EdgeInsets.symmetric(horizontal: 10,vertical: 10),
              child: TextField(
                controller: amazonprovider.phnnocontroller,
                  keyboardType: TextInputType.number,
                  decoration: const InputDecoration(
                    hintText: " phn no :",
                    border: OutlineInputBorder(),
                    contentPadding: EdgeInsets.only(top:4 ),
                  )
              ),
            ),
            Padding(
              padding:  const EdgeInsets.symmetric(horizontal: 10,vertical: 10),
              child: TextField(
                controller: amazonprovider.emailidcontroller,
                  decoration: const InputDecoration(
                    hintText: " Email id :",
                    border: OutlineInputBorder(),
                    contentPadding: EdgeInsets.only(top:4 ),
                  )
              ),
            ),
            Padding(
              padding:  const EdgeInsets.symmetric(horizontal: 10,vertical: 10),
              child: TextField(
                controller: amazonprovider.passwordcontroller,
                obscureText: true,
                decoration: const InputDecoration(
                  border: OutlineInputBorder(),
                  hintText: 'Enter password',
                ),
              )
            ),
            InkWell(
              onTap: () {
                amazonprovider.addData();
               
              },
              child: Container(
                margin: const EdgeInsets.symmetric(vertical: 10),
                height: 35,
                width:100,
                decoration: BoxDecoration(color: Colors.blue,borderRadius: BorderRadius.circular(20)),
                child: const Center(child: Text("Signup",style: TextStyle(fontWeight: FontWeight.bold,color: Colors.white))),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
