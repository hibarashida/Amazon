import 'package:amazon/providerclass.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'Amazonlens.dart';

class Filter extends StatelessWidget {
  const Filter({super.key});

  @override
  Widget build(BuildContext context) {
    providerclass amazonprovider = Provider.of<providerclass>(context);

    var width = MediaQuery.of(context).size.width;
    return Scaffold(
      appBar: AppBar(leading:
      InkWell(onTap: () {
        Navigator.pop(context);
      },
          child: Icon(Icons.arrow_back)),
        backgroundColor: Colors.teal.shade200,
        title: Container(
          width: width,
          height:40 ,
          decoration: BoxDecoration(borderRadius:BorderRadius.circular(5),color: Colors.white,),
          child: TextField(
            decoration: InputDecoration(
                prefixIcon: Icon(Icons.search),
                border: OutlineInputBorder(),
                contentPadding: EdgeInsets.only(top:4 ),
                hintText: 'Search Amazon.in',hintStyle:TextStyle(fontSize: 17) ,
                suffixIcon: InkWell(onTap: () {
                  Navigator.push(context,MaterialPageRoute(builder:(context) => AmazonLens(),) );
                },
                    child: Icon(Icons.document_scanner_outlined))
            ),
          ),
        ),
      ),
      body: Column(
        children: [
          Container(
            width: width,
            height: 40,
           decoration:BoxDecoration( color: Colors.grey.shade200,border: Border.all(width: 1,color:Colors.black26 )) ,
          child: Row(
            children: [
              Icon(Icons.arrow_back_ios_new,size: 15,),
              Text("  Back",style: TextStyle(fontWeight: FontWeight.bold,fontSize: 15),),SizedBox(
                width: 260,
              ),
              Container(
                height: 25,
                width: 85,
                child: ElevatedButton(onPressed: () {
                  Navigator.pop(context);
                  }, child: Text("Apply",)),
              )
            ],
          ),
          ),
          Container(
            height: 28,
              width: width,
              decoration: BoxDecoration(color: Colors.grey.shade200,border: Border.all(width: 1,color: Colors.black12)),
              child: Padding(
                padding: EdgeInsets.only(left: 10,top: 5,bottom: 5),
                child: Text("FILTER BY TYPE",style: TextStyle(color: Colors.black,
                    fontWeight: FontWeight.bold,fontSize: 13,),),
              )),
      //      Checkbox(activeColor: Colors.grey,
      //   checkColor: Colors.white,
      //   value:amazonprovider.checkvalue,
      //   // side:BorderSide(color: Colors.green, width: 2),
      //   onChanged: (bool? value) {
      //    amazonprovider.ordertype(value);
      //
      //   },
      // )

          Row(
            children: [
              Radio(

                  value: "radio ",
                  groupValue:amazonprovider.checkvalue,
                  onChanged: (value){
                    amazonprovider.checkvalue = value.toString();
                    amazonprovider.notifyListeners();
                  }
              ),
              Text("Orders",style: TextStyle(fontWeight: FontWeight.bold),)
            ],
          ),
          Container(
            height: 1,
            width: width,
            color: Colors.black12,
          ),
          Row(
            children: [
              Radio(
                  value: "irsirshirshh",
                  groupValue:amazonprovider.checkvalue,
                  onChanged: (value){
                    amazonprovider.checkvalue = value.toString();
                    amazonprovider.notifyListeners();
                  }
              ),
              Text("Not Yet shipped",style: TextStyle(fontWeight: FontWeight.bold),)
            ],
          ),
          Container(
            height: 1,
            width: width,
            color: Colors.black12,
          ),
          Row(
            children: [
              Radio(
                  value: "irsh",
                  groupValue: amazonprovider.checkvalue,
                  onChanged: (value){
                    amazonprovider.checkvalue = value.toString();
                    amazonprovider.notifyListeners();
                  }
              ),
              Text("Cancelled",style: TextStyle(fontWeight: FontWeight.bold))
            ],
          ),
          Container(
            height: 1,
            width: width,
            color: Colors.black12,
          ),
          Container(
              height: 28,
              width: width,
              decoration: BoxDecoration(color: Colors.grey.shade200,border: Border.all(width: 1,color: Colors.black12)),
              child: Padding(
                padding: EdgeInsets.only(left: 10,top: 5,bottom: 5),
                child: Text("FILTER BY ORDER DATE",style: TextStyle(color: Colors.black,
                  fontWeight: FontWeight.bold,fontSize: 13,),),
              )),
          Row(
            children: [
              Radio(
                  value: "1",
                  groupValue: amazonprovider.checkvalue2,
                  onChanged: (value){
                    amazonprovider.checkvalue2 = value.toString();
                    amazonprovider.notifyListeners();
                  }
              ),
              Text("Last 30 days",style: TextStyle(fontWeight: FontWeight.bold))
            ],
          ),
          Container(
            height: 1,
            width: width,
            color: Colors.black12,
          ),
          Row(
            children: [
              Radio(
                  value: "2",
                  groupValue: amazonprovider.checkvalue2,
                  onChanged: (value){
                    amazonprovider.checkvalue2 = value.toString();
                    amazonprovider.notifyListeners();
                  }
              ),
              Text("Last 3 months",style: TextStyle(fontWeight: FontWeight.bold))
            ],
          ),
          Container(
            height: 1,
            width: width,
            color: Colors.black12,
          ),
          Row(
            children: [
              Radio(
                  value: "3",
                  groupValue: amazonprovider.checkvalue2,
                  onChanged: (value){
                    amazonprovider.checkvalue2 = value.toString();
                    amazonprovider.notifyListeners();
                  }
              ),
              Text("2023",style: TextStyle(fontWeight: FontWeight.bold))
            ],
          ),
          Container(
            height: 1,
            width: width,
            color: Colors.black12,
          ),
          Row(
            children: [
              Radio(
                  value: "4",
                  groupValue: amazonprovider.checkvalue2,
                  onChanged: (value){
                    amazonprovider.checkvalue2 = value.toString();
                    amazonprovider.notifyListeners();
                  }
              ),
              Text("2022",style: TextStyle(fontWeight: FontWeight.bold))
            ],
          ),
          Container(
            height: 1,
            width: width,
            color: Colors.black12,
          ),
          Row(
            children: [
              Radio(
                  value: "5",
                  groupValue: amazonprovider.checkvalue2,
                  onChanged: (value){
                    amazonprovider.checkvalue2 = value.toString();
                    amazonprovider.notifyListeners();
                  }
              ),
              Text("2021",style: TextStyle(fontWeight: FontWeight.bold))
            ],
          ),
          Container(
            height: 1,
            width: width,
            color: Colors.black12,
          ),
          Container(
            margin: EdgeInsets.symmetric(horizontal: 10,vertical: 15),

            height: 40,
            width:width ,
            decoration: BoxDecoration(color: Colors.amber,borderRadius: BorderRadius.circular(10)),
            child: Center(child: Text("Apply",style: TextStyle(fontWeight: FontWeight.bold))),
          ),
        ],
      ),
    );
  }
}
