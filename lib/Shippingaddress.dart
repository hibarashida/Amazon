import 'package:amazon/providerclass.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:provider/provider.dart';

class ShippingAdress extends StatelessWidget {
  String from;
  ShippingAdress({super.key,required this.from});

  @override
  Widget build(BuildContext context) {
    providerclass amazonprovider = Provider.of<providerclass>(context);
    // final  _formKey = GlobalKey<FormState>();

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
        title: Row(
          children: [
            Text(from=="EDIT"?"Edit your":"Enter a",
                style: TextStyle(
                    color: Colors.black,
                    fontWeight: FontWeight.bold,
                    fontSize: 20)),
            const Text("  shipping Address",
                style: TextStyle(
                    color: Colors.black,
                    fontWeight: FontWeight.bold,
                    fontSize: 20)),
          ],
        ),
      ),
      body: SingleChildScrollView(
        child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
          const Padding(
            padding: EdgeInsets.only(top: 10, left: 10, bottom: 10),
            child: Text("Enter a shipping address",
                style: TextStyle(
                    color: Colors.black,
                    fontWeight: FontWeight.bold,
                    fontSize: 20)),
          ),
          const Padding(
            padding: EdgeInsets.only(left: 10, bottom: 10),
            child: Text("Add a new address",
                style: TextStyle(
                    color: Colors.black,
                    fontWeight: FontWeight.bold,
                    fontSize: 20)),
          ),
          Container(
              margin:  EdgeInsets.symmetric(horizontal: 5),
              width: width,
              height: 40,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(8),
                color: Colors.grey.shade300,
              ),
              child: InkWell(onDoubleTap: () {
                showDialog(
                  context: context,
                  builder: (ctx) => AlertDialog(
                    title: const Text("Alert Dialog Box"),
                    content: const Text("You have raised a Alert Dialog Box"),
                    actions: <Widget>[
                      TextButton(
                        onPressed: () {
                          Navigator.pop(context);
                        },
                        child: Container(
                          color: Colors.green,
                          padding: const EdgeInsets.all(14),
                          child: const Text("edit"),
                        ),
                      ),
                    ],
                  )
                );
              }
              ,child: Center(child:  Text("Use Current location",
                  style: TextStyle(color: Colors.black,
                  fontSize: 15),)),
              )),
          Row(
            children: [
              SizedBox(
                width: 10,
              ),
             Container(
               height: 1,
               width: 150,
               color: Colors.black12,
             ) ,
              Text("OR",style: TextStyle(fontSize: 20,fontWeight: FontWeight.bold),),
              Container(
                height: 1,
                width: 160,
                color: Colors.black12,
              )
            ],
          ),


          Consumer<providerclass>(
              builder: (context,value3,child)  {
              return InkWell(
                onTap: () {
                  showDialog(
                      context: context,
                      builder: (ctx) => AlertDialog(
                        titlePadding:  EdgeInsets.only(left: 240,top: 10),
                        title:  InkWell(onTap: () {
                          Navigator.pop(context);
                        },
                            child: Icon(Icons.close)),
                        content:  SingleChildScrollView(
                          child:  Column(
                            children: [
                              Divider(
                              color: Colors.black12,
                              thickness: 1,
                            ),

                              InkWell(
                                onTap: () {
                                  Navigator.pop(context);
                                  value3.cntname("Antaractica");
                                },
                                  child: Text("Antaractica")),
                            Divider(
                              color: Colors.black12,
                              thickness: 1,
                            ),
                              InkWell(
                                  onTap: () {
                                    Navigator.pop(context);
                                    value3.cntname("Armenia");
                                  },
                                  child: Text("Armenia")),
                            Divider(
                              color: Colors.black12,
                              thickness: 1,
                            ),
                              InkWell(
                                  onTap: () {
                                    Navigator.pop(context);
                                    value3.cntname("Australia");
                                  },
                                  child: Text("Australia")),

                            Divider(
                              color: Colors.black12,
                              thickness: 1,
                            ), InkWell(
                                  onTap: () {
                                    Navigator.pop(context);
                                    value3.cntname("Canada");
                                  },
                                  child: Text("Canada")),
                            Divider(
                              color: Colors.black12,
                              thickness: 1,
                            ),
                              InkWell(
                                  onTap: () {
                                    Navigator.pop(context);
                                    value3.cntname("china");
                                  },
                                  child: Text("china")),

                            Divider(
                              color: Colors.black12,
                              thickness: 1,
                            ),
                              InkWell(
                                  onTap: () {
                                    Navigator.pop(context);
                                    value3.cntname("France");
                                  },
                                  child: Text("France")),
                            Divider(
                              color: Colors.black12,
                              thickness: 1,
                            ),
                              InkWell(
                                  onTap: () {
                                    Navigator.pop(context);
                                    value3.cntname("India");
                                  },
                                  child: Text("India")),
                            Divider(
                              color: Colors.black12,
                              thickness: 1,
                            ),
                              InkWell(
                                  onTap: () {
                                    Navigator.pop(context);
                                    value3.cntname("Japan");
                                  },
                                  child: Text("Japan")),
                            Divider(
                              color: Colors.black12,
                              thickness: 1,
                            ),
                              InkWell(
                                  onTap: () {
                                    Navigator.pop(context);
                                    value3.cntname("Mali");
                                  },
                                  child: Text("Mali")),
                            Divider(
                              color: Colors.black12,
                              thickness: 1,
                            ),
                              InkWell(
                                  onTap: () {
                                    Navigator.pop(context);
                                    value3.cntname("Maldives");
                                  },
                                  child: Text("Maldives")),
                            Divider(
                              color: Colors.black12,
                              thickness: 1,
                            ),
                            ],),
                        ),

                      )
                  );
                },
                child:Consumer<providerclass>(
                    builder: (context,value,child)  {
                      // print(value.countryname+"iuhh");
                    return Container(
                        margin: EdgeInsets.symmetric(
                       horizontal: 8,
                        vertical: 10
                      ),
                      height: 40,
                      width: width,
                      decoration: BoxDecoration(color: Colors.grey.shade300,
                          borderRadius: BorderRadius.circular(10),
                          border: Border.all(width: 1,color: Colors.black12)),
                      child: Row(mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(value.countryname),
                          Icon( Icons.keyboard_arrow_down_outlined)
                        ],

                      )
                    );
                  }
                ),
              );
            }
          ),
          Padding(
            padding: EdgeInsets.only(left: 10,),
            child: Text("Full name (First and Last name)",style: TextStyle(fontSize: 15,fontWeight: FontWeight.bold,),),
          ),
          Row(
            children: [
              SizedBox(
                width: width,
                child: Padding(
                  padding:  EdgeInsets.symmetric(horizontal: 10,
                  vertical: 10),
                  child: Consumer<providerclass>(
                    builder: (context,val,child) {
                      // print("dgcgcg"+val.fullnamecontroller.text.toString());
                      return TextField(
                        controller: val.fullnamecontroller,
                        decoration:  InputDecoration(
                          // hintText: "  enter category :",
                          border: OutlineInputBorder(),
                          contentPadding: EdgeInsets.only(top: 4),
                          suffixIcon:
                          InkWell(
                            onTap: () {
                              amazonprovider.fullnamecontroller.clear();
                            },
                            child: Icon(
                              Icons.close,
                              size: 18,
                              color: Colors.black,
                            ),
                          ),
                        ),
                        // validator: (value) {
                        //   if(value!.isEmpty){
                        //     return "this field is requried";
                        //   }else{
                        //   return null ;
                        //   }
                        // },
                      );
                    }
                  ),
                ),
              ),

            ],
          ),
        Padding(
          padding: EdgeInsets.only(left: 10,),
          child: Text("Mobile Number",style: TextStyle(fontSize: 15,fontWeight: FontWeight.bold,),),
        ),
        Row(
          children: [
            SizedBox(
              width: width,
              child: Padding(
                padding:  EdgeInsets.symmetric(horizontal: 10,
                    vertical: 10),
                child: Consumer<providerclass>(
                  builder: (context,value1,child) {
                    return TextField(
                      controller: value1.mobilenumbnercontroller,
                      keyboardType: TextInputType.number,
                      inputFormatters: [LengthLimitingTextInputFormatter(10)],

                      decoration:   InputDecoration(
                        // hintText: "  enter category :",
                        border: OutlineInputBorder(),
                        contentPadding: EdgeInsets.only(top: 4),
                        suffixIcon: InkWell(
                          onTap: () {
                            amazonprovider.mobilenumbnercontroller.clear();
                          },
                          child: Icon(
                            Icons.close,
                            size: 18,
                            color: Colors.black,
                          ),
                        ),
                      ),
                      // validator: (value) {
                      //   if(value!.isEmpty){
                      //     return "this field is requried";
                      //   }else{
                      //     return null ;
                      //   }
                      // },

                    );
                  }
                ),
              ),
            ),

          ],
        ) ,
              Padding(
                padding: EdgeInsets.only(left: 10,bottom: 10),
                child: Text("May be used to assist delivary",
                  style: TextStyle(fontSize: 10,fontWeight: FontWeight.normal,),),
              ),

              Padding(
                padding: EdgeInsets.only(left: 10,),
                child: Text("Flat, House no.,Building,company,Apartment",
                  style: TextStyle(fontSize: 15,fontWeight: FontWeight.bold,),),
              ),
              SizedBox(
                width: width,
                child: Padding(
                  padding:  EdgeInsets.symmetric(horizontal: 10,
                      vertical: 10),
                  child:Consumer<providerclass>(
                    builder: (context,value3,child) {
                      return TextField(
                        controller: value3.houseadrscontroller,
                        decoration:  InputDecoration(
                          // hintText: "  enter category :",
                          border: OutlineInputBorder(),
                          contentPadding: EdgeInsets.only(top: 4),
                        ),
                        // validator: (value) {
                        //   if(value!.isEmpty){
                        //     return "this field is requried";
                        //   }else{
                        //     return null ;
                        //   }
                        // },
                      );
                    }
                  ),
                ),
              ),
              Padding(
                padding: EdgeInsets.only(left: 10,),
                child: Text("Area,Street,Sector,Village",
                  style: TextStyle(fontSize: 15,fontWeight: FontWeight.bold,),),
              ),
              SizedBox(
                width: width,
                child: Padding(
                  padding:  EdgeInsets.symmetric(horizontal: 10,
                      vertical: 10),
                  child: Consumer<providerclass>(
                    builder: (context,value4,child) {
                      return TextField(
                        controller:value4.areacontroller,
                        decoration:  InputDecoration(
                          // hintText: "  enter category :",
                          border: OutlineInputBorder(),
                          contentPadding: EdgeInsets.only(top: 4),
                        ),
                        // validator: (value) {
                        //   if(value!.isEmpty){
                        //     return "this field is requried";
                        //   }else{
                        //     return null ;
                        //   }
                        // },
                      );
                    }
                  ),
                ),

              ), Padding(
                padding: EdgeInsets.only(left: 10,),
                child: Text("Landmark",
                  style: TextStyle(fontSize: 15,fontWeight: FontWeight.bold,),),
              ),
              SizedBox(
                width: width,
                child: Padding(
                  padding:  EdgeInsets.symmetric(horizontal: 10,
                      vertical: 10),
                  child: Consumer<providerclass>(
                    builder: (context,value5,child) {
                      return TextField(
                        controller: value5.landmarkcontroller,
                        decoration:  InputDecoration(
                          hintText: " E.g. near apollo hospital",
                          border: OutlineInputBorder(),
                          contentPadding: EdgeInsets.only(top: 4),
                        ),
                        // validator: (value) {
                        //   if(value!.isEmpty){
                        //     return "this field is requried";
                        //   }else{
                        //     return null ;
                        //   }
                        // },
                      );
                    }
                  ),
                ),
              ),
              Padding(
                padding: EdgeInsets.only(left: 10,),
                child: Text("Pincode",
                  style: TextStyle(fontSize: 15,fontWeight: FontWeight.bold,),),
              ),
              SizedBox(
                width: width,
                child: Padding(
                  padding:  EdgeInsets.symmetric(horizontal: 10,
                      vertical: 10),
                  child: Consumer<providerclass>(
                    builder: (context,value6,child) {
                      return TextField(
                        controller: value6.pincodecontroller,
                        keyboardType: TextInputType.number,
                        inputFormatters: [LengthLimitingTextInputFormatter(6)],
                        decoration:  InputDecoration(
                          hintText: "  6 digit[0-9]PIN code",
                          border: OutlineInputBorder(),
                          contentPadding: EdgeInsets.only(top: 4),
                        ),
                        // validator: (value) {
                        //   if(value!.isEmpty){
                        //     return "this field is requried";
                        //   }else{
                        //     return null ;
                        //   }
                        // },
                      );
                    }
                  ),
                ),
              ),
              Padding(
                padding: EdgeInsets.only(left: 10,),
                child: Text("Town/City",
                  style: TextStyle(fontSize: 15,fontWeight: FontWeight.bold,),),
              ),
              SizedBox(
                width: width,
                child: Padding(
                  padding:  EdgeInsets.symmetric(horizontal: 10,
                      vertical: 10),
                  child:Consumer<providerclass>(
                    builder: (context,value7,child) {
                      return TextFormField(
                        controller: value7.towncontroller,
                        decoration:  InputDecoration(
                          // hintText: " E.g. near apollo hospital",
                          border: OutlineInputBorder(),
                          contentPadding: EdgeInsets.only(top: 4),
                        ),
                        validator: (value) {
                          if(value!.isEmpty){
                            return "this field is requried";
                          }else{
                            return null ;
                          }
                        },
                      );
                    }
                  ),
                ),
              ),
              Padding(
                padding: EdgeInsets.only(left: 10,),
                child: Text("State",
                  style: TextStyle(fontSize: 15,fontWeight: FontWeight.bold,),),
              ),
              Consumer<providerclass>(
                  builder: (context,value4,child)  {
                    return InkWell(
                      onTap: () {
                        showDialog(
                            context: context,
                            builder: (ctx) => AlertDialog(
                              titlePadding:  EdgeInsets.only(left: 240,top: 10),
                              title:  InkWell(onTap: () {
                                Navigator.pop(context);
                              },
                                  child: Icon(Icons.close)),
                              content:  SingleChildScrollView(
                                child:  Column(
                                  children: [
                                    Divider(
                                      color: Colors.black12,
                                      thickness: 1,
                                    ),

                                    InkWell(
                                        onTap: () {
                                          Navigator.pop(context);
                                          value4.stname("DELHI");
                                        },
                                        child: Text("DELHI")),
                                    Divider(
                                      color: Colors.black12,
                                      thickness: 1,
                                    ),
                                    InkWell(
                                        onTap: () {
                                          Navigator.pop(context);

                                          value4.stname("GOA");
                                        },
                                        child: Text("GOA")),
                                    Divider(
                                      color: Colors.black12,
                                      thickness: 1,
                                    ),
                                    InkWell(
                                        onTap: () {
                                          Navigator.pop(context);

                                          value4.stname("KERALA");
                                        },
                                        child: Text("KERALA")),

                                    Divider(
                                      color: Colors.black12,
                                      thickness: 1,
                                    ), InkWell(
                                        onTap: () {
                                          Navigator.pop(context);

                                          value4.stname("LADAKH");
                                        },
                                        child: Text("LADAKH")),
                                    Divider(
                                      color: Colors.black12,
                                      thickness: 1,
                                    ),
                                    InkWell(
                                        onTap: () {
                                          Navigator.pop(context);

                                          value4.stname("LAKSHADWEEP");
                                        },
                                        child: Text("LAKSHADWEEP")),

                                    Divider(
                                      color: Colors.black12,
                                      thickness: 1,
                                    ),
                                    InkWell(

                                        onTap: () {
                                          Navigator.pop(context);

                                          value4.stname("HIMACHAL PRADESH");
                                        },
                                        child: Text("HIMACHAL PRADESH")),
                                    Divider(
                                      color: Colors.black12,
                                      thickness: 1,
                                    ),
                                    InkWell(
                                        onTap: () {
                                          Navigator.pop(context);

                                          value4.stname("MADHYA PRADESH");
                                        },
                                        child: Text("MADHYA PRADESH")),
                                    Divider(
                                      color: Colors.black12,
                                      thickness: 1,
                                    ),
                                    InkWell(
                                        onTap: () {
                                          Navigator.pop(context);

                                          value4.stname("MAHARASHTRA");
                                        },
                                        child: Text("MAHARASHTRA")),
                                    Divider(
                                      color: Colors.black12,
                                      thickness: 1,
                                    ),
                                    InkWell(
                                        onTap: () {
                                          Navigator.pop(context);

                                          value4.stname("MANIPUR");
                                        },
                                        child: Text("MANIPUR")),
                                    Divider(
                                      color: Colors.black12,
                                      thickness: 1,
                                    ),
                                    InkWell(
                                        onTap: () {
                                          Navigator.pop(context);

                                          value4.stname("TAMIL NADU");
                                        },
                                        child: Text("TAMIL NADU")),
                                    Divider(
                                      color: Colors.black12,
                                      thickness: 1,
                                    ),
                                  ],),
                              ),

                            )
                        );
                      },
                      child:Consumer<providerclass>(
                          builder: (context,value,child)  {
                            return Container(
                                margin: EdgeInsets.symmetric(
                                    horizontal: 8,
                                    vertical: 10
                                ),
                                height: 40,
                                width: width,
                                decoration: BoxDecoration(color: Colors.grey.shade300,
                                    borderRadius: BorderRadius.circular(10),
                                    border: Border.all(width: 1,color: Colors.black12)),
                                child: Row(mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                  children: [
                                    Text(value4.statename),
                                    Icon( Icons.keyboard_arrow_down_outlined)
                                  ],

                                )
                            );
                          }
                      ),
                    );
                  }
              ),
              Row(
                children: [
                  Checkbox(
                    activeColor: Colors.black,
                    // shape: const CircleBorder(),
                    checkColor: Colors.white,
                    value: amazonprovider.checkvalue3,
                    side:const BorderSide(color:Colors.grey, width: 2),
                    onChanged: (bool? value) {
                      amazonprovider.defaultads(value);
                    },
                  ),
                  Text("Make this  default address",style: TextStyle(fontSize: 15),)
                ],
              ),
              InkWell(onTap: () {
                Navigator.pop(context);

                // final FormState? form = _formKey.currentState;
                // if(form!.validate()) {
                  amazonprovider.addaddress("ADDADRESS","");
                },
              // },
                child: Container(
                  margin:  EdgeInsets.symmetric(horizontal: 10,vertical: 10),
                  height: 40,
                  width: width,
                  decoration: BoxDecoration(
                      color: Colors.amber, borderRadius: BorderRadius.circular(10)),
                  child: const Center(
                      child: Text("Add address",
                          style: TextStyle(
                              fontSize: 15, fontWeight: FontWeight.bold
                          ))),
                ),
              ),

            ]),
      ),
    );
  }
}
