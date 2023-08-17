import 'package:amazon/providerclass.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class AmazonLens extends StatelessWidget {
  const AmazonLens({super.key});

  @override
  Widget build(BuildContext context) {
    providerclass amazonlensprovider = Provider.of<providerclass>(context);
    var width = MediaQuery.of(context).size.width;
    return Scaffold(
      body: SafeArea(
        child: DefaultTabController(
          length: 4,

          child: Column(
            children: [
              Padding(
                padding:EdgeInsets.only(left: 10,bottom: 10),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    InkWell(onTap: () {
                      Navigator.pop(context);
                    },
                        child: Icon(Icons.arrow_back)),
                    SizedBox(
                      // width: ,
                        child: Row(
                          children: [
                            Icon(Icons.document_scanner_outlined),
                            Text("Amazon",style: TextStyle(fontWeight: FontWeight.bold,fontSize: 15)),
                            Text(" lens ",style: TextStyle(fontSize: 15,fontWeight: FontWeight.normal),)
                          ],
                        )),
                           Padding(
                             padding:  EdgeInsets.only(right: 10),
                             child: Stack(
                               children:[ CircleAvatar(
                                 radius: 14,
                                 backgroundColor: Colors.black,
                                 child: CircleAvatar(
                                   radius: 11,
                                   backgroundColor: Colors.white,
                                   child:   Icon(Icons.question_mark_sharp,size: 18) ,
                                 ),
                               ) ,]
                             ),
                           )],
                ),
              ),
              Container(
                width: width,
                height: 3,
                color: Colors.black12,
              ),
              Padding(
                padding:EdgeInsets.only(right: 120,top: 14,bottom: 10),
                child: Text("Find the look from your photos",style: TextStyle(fontSize: 18,
                    fontWeight:FontWeight.bold ),),
              ),
              Container(
                margin: EdgeInsets.symmetric(horizontal: 10),
                height: 40,
                width:width,
                decoration: BoxDecoration( color: Colors.orangeAccent,borderRadius: BorderRadius.circular(5)),
                child: Center(child: Text("Upload a photos")),
              ),SizedBox(
                height: 15,
              ),
              Container(
                width: width,
                height: 3,
                color: Colors.black12,
              ),
              Padding(
                padding:  EdgeInsets.only(right: 180,top: 10,bottom: 7),
                child: Text("Explore thses looks",style: TextStyle(fontWeight: FontWeight.bold,fontSize: 20),),
              ),
              Container(
                width:width,
                height: 50,
                child: TabBar(
                  labelStyle: TextStyle(fontWeight: FontWeight.bold),
                  indicatorColor: Colors.black,
                  labelColor: Colors.black,
                  tabs: [
                  Tab(text: "All",height: 20,),
                  Tab(text: "WOMEN",height: 20),
                  Tab(text: "MEN",height: 20),
                  Tab(text: "HOME",height: 20),
                ],

                ),
              ),
              Expanded(
                child: TabBarView(children: [
                  ListView.builder(
                    itemCount:amazonlensprovider.allimg.length ,
                    itemBuilder: (context, index) {
                      return Column(
                        children: [
                          Container(
                            height: 50,


                            child: Row(
                              children: [
                                CircleAvatar(
                                  radius: 20,
                                  backgroundImage:AssetImage(amazonlensprovider.alltabp[index]),
                                ),
                                SizedBox(
                                  width: 10,
                                ),
                                Text(amazonlensprovider.alltext[index],style: TextStyle(fontWeight: FontWeight.bold),)
                              ],
                            ),
                          ),
                          Container(
                            height: 500,
                            width: width,
                            child: Image.asset(amazonlensprovider.allimg[index],fit: BoxFit.fill),
                          )
                        ],
                      );
                    },
                  ),
                  ListView.builder(
                    itemCount:amazonlensprovider.womenimg.length ,
                    itemBuilder: (context, index) {
                      return Column(
                        children: [
                          Container(
                            height: 50,
                            child: Row(
                              children: [
                                CircleAvatar(
                                  radius: 20,
                                  backgroundImage:AssetImage(amazonlensprovider.womenimgp[index]),
                                ),
                                SizedBox(
                                  width: 10,
                                ),
                                Text(amazonlensprovider.womentext[index],style: TextStyle(fontWeight: FontWeight.bold),)
                              ],
                            ),
                          ),
                          Container(
                            height: 500,
                            width: width,
                            child: Image.asset(amazonlensprovider.womenimg[index],fit: BoxFit.fill),
                          )
                        ],
                      );
                    },
                  ),
                  ListView.builder(
                    itemCount:amazonlensprovider.menimg.length ,
                    itemBuilder: (context, index) {
                      return Column(
                        children: [
                          Container(
                            height: 50,


                            child: Row(
                              children: [
                                CircleAvatar(
                                  radius: 20,
                                  backgroundImage:AssetImage(amazonlensprovider.menimgp[index]),
                                ),
                                SizedBox(
                                  width: 10,
                                ),
                                Text(amazonlensprovider.mentext[index],style: TextStyle(fontWeight: FontWeight.bold),)
                              ],
                            ),
                          ),
                          Container(
                            height: 500,
                            width: width,
                            child: Image.asset(amazonlensprovider.menimg[index],fit: BoxFit.fill),
                          )
                        ],
                      );
                    },
                  ),
                  ListView.builder(
                    itemCount:amazonlensprovider.homeimg.length ,
                    itemBuilder: (context, index) {
                      return Column(
                        children: [
                          Container(
                            height: 50,


                            child: Row(
                              children: [
                                CircleAvatar(
                                  radius: 20,
                                  backgroundImage:AssetImage(amazonlensprovider.homeimgp[index]),
                                ),
                                SizedBox(
                                  width: 10,
                                ),
                                Text(amazonlensprovider.hometext[index],style: TextStyle(fontWeight: FontWeight.bold),)
                              ],
                            ),
                          ),
                          Container(
                            height: 500,
                            width: width,
                            child: Image.asset(amazonlensprovider.homeimg[index],fit: BoxFit.fill),
                          ),
                        ],
                      );
                    },
                  ),

                ]),
              )
            ],
          ),
        ),
      )
    );
  }
}
