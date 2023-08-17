import 'package:amazon/providerclass.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'Adminpanel.dart';
import 'amazoneapp.dart';
import 'bottomnavigationbar.dart';
import 'loginpage.dart';

class Amazon extends StatelessWidget {
  const Amazon({super.key});

  @override
  Widget build(BuildContext context) {
    providerclass amazonprovider = Provider.of<providerclass>(context);
    var width = MediaQuery.of(context).size.width;
    var height = MediaQuery.of(context).size.height;

    return Scaffold(backgroundColor:  Colors.grey.shade300,


      appBar: AppBar(
        backgroundColor: Colors.teal.shade200,
        title: Center(
            child: Image.asset(
              "assets/amazon.inlogo.png",
              scale: 2,
            )),
      ),
      body:
      Column(mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
           const Center(
             child: Text("Sign in to Your Account",style:TextStyle(
                 fontSize: 20,fontWeight: FontWeight.bold
             )),
           ),
          Row(mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              InkWell(
                onTap: () {
                  Navigator.push(context, MaterialPageRoute(builder: (context) => const Adminpanel(),));
                },
                child: Container(
                  width:150,
                  height: 40,
                  decoration: BoxDecoration(
                      color: Colors.teal.shade200,border: Border.all(color: Colors.white,width: 1),
                      borderRadius: BorderRadius.circular(20)),
                  child: const Center(
                    child: Text("Admin Sign in",style: TextStyle(fontSize: 15,fontWeight: FontWeight.bold,color: Colors.white
                    )),
                  ),

                ),
              ),
              InkWell(onTap: () {
                Navigator.push(context, MaterialPageRoute(builder: (context) =>
                    const LoginPage(),));
              },
                child: Container(
                  width:150,
                  height: 40,
                  decoration: BoxDecoration(
                      color: Colors.teal.shade200,border: Border.all(color: Colors.white,width: 1),
                      borderRadius: BorderRadius.circular(20)),
                  child: const Center(
                    child: Text("User Sign in",style: TextStyle(fontSize: 15,fontWeight: FontWeight.bold,color: Colors.white
                         )),
                  ),
                ),
              ),
            ],
          ),
          InkWell(onTap: () {
            Navigator.push(context, MaterialPageRoute(builder: (context) => const BottomNav(),));
          },
            child: Container(
              margin: const EdgeInsets.only(bottom: 190),
              width:150,
              height: 40,
              decoration: BoxDecoration(
                  color: Colors.teal.shade200,border: Border.all(color: Colors.white,width: 1),
                  borderRadius: BorderRadius.circular(20)),
              child: const Center(
                child: Text("Skip>>",style: TextStyle(fontSize: 15,fontWeight: FontWeight.bold,color: Colors.white
                )),
              ),

            ),
          )
         ],
      ),
    );
  }
}
