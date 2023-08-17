import 'package:amazon/signpage.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class SignIn extends StatelessWidget {
  const SignIn({super.key});

  @override
  Widget build(BuildContext context) {
    var width = MediaQuery.of(context).size.width;
    return Scaffold(backgroundColor: Colors.grey.shade100,
      appBar: AppBar(centerTitle: true,
       backgroundColor: Colors.teal.shade200,
        title: const Text("Amazon.in",style:TextStyle(fontWeight: FontWeight.bold,fontSize: 30)),
      ),
      body: Column(
        children: [
          Container(
            width: width,
            height: 1,
            color: Colors.black38,
          ),
          const Padding(
            padding:  EdgeInsets.only(right: 300),
            child: Text("Welcome",style: TextStyle(fontSize: 20,fontWeight: FontWeight.normal,)),
          ),
          Container(
            margin: const EdgeInsets.symmetric(vertical: 10,horizontal: 15),
            width: width,
            height: 120,
            decoration: BoxDecoration(color: Colors.white,borderRadius: BorderRadius.circular(10),
                border: Border.all(width: 1,color:Colors.black12,) ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  children: [const SizedBox(
                    width: 10,
                    height: 50,
                  ),
                    InkWell(onTap:  () {
                      Navigator.push(context, MaterialPageRoute(builder: (context) => const SignPage(),));
                    },
                      child: const CircleAvatar(
                        radius: 15,
                        backgroundColor: Colors.black12,
                      ),
                    ),
                    const SizedBox(
                      width: 10,
                    ),
                    const Text("Create account.",style: TextStyle(fontWeight: FontWeight.bold,fontSize: 15)),
                    const Text("New to Amazon?",style: TextStyle(fontWeight: FontWeight.normal,fontSize: 15)),
                  ],
                ),
                const SizedBox(height:1),
                Container(
                  width: width,
                  height: 1,
                  color: Colors.black12,
                ),
                const Row(
                  children: [SizedBox(
                    width: 10,
                    height: 60,

                  ),
                    CircleAvatar(
                      radius: 15,
                      backgroundColor: Colors.black12,
                    ),
                    SizedBox(
                      width: 10,
                    ),
                    Text("Sign in.",style: TextStyle(fontWeight: FontWeight.bold,fontSize: 15)),
                    Text("Already a customer",style: TextStyle(fontWeight: FontWeight.normal,fontSize: 15)),
                  ],
                ),
              ],
            ),
          ),
          const Row(mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              Text("Conditions of Use",style: TextStyle(fontSize: 15,fontWeight: FontWeight.normal,color: Colors.blue)),
              Text("Privacy Notice",style: TextStyle(fontSize: 15,fontWeight: FontWeight.normal,color: Colors.blue)),
              Text("Help",style: TextStyle(fontSize: 15,fontWeight: FontWeight.normal,color: Colors.blue)),
            ],
          ),
        ],
      ),
    );
  }
}
