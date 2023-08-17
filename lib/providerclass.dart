import 'dart:collection';
import 'dart:developer';
import 'dart:io';
import 'package:amazon/Carouseladmin.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/cupertino.dart';
import 'package:image_cropper/image_cropper.dart';
import 'package:image_picker/image_picker.dart';

import 'bottomnavigationbar.dart';
import 'cartmodelcls.dart';
import 'listvewimgmodlcls.dart';
import 'modelclass.dart';
import 'modelclasscarousel.dart';
import 'modelcls.dart';
import 'otplogin.dart';

class providerclass extends ChangeNotifier {
  int Activeindex = 0;
  int count = 0;
  int count2 = 0;
  Reference ref = FirebaseStorage.instance.ref("IMAGE URL");

  List<String> images = [
    "assets/mobile.jpg",
    "assets/minitv.png",
    "assets/home.jpg",
    "assets/grocery.webp",
    "assets/essentials.jpg",
    "assets/fashion.jpg",
    "assets/electronics.jpg",
    "assets/deals.jpg",
    "assets/books,toys.webp",
    "assets/beauty.jpg",
    "assets/appliances.webp"
  ];
  List<String> text = [
    "Mobile",
    "Mini tv",
    "Home",
    "Grocery",
    "Essentials",
    "Fashion",
    "Electronics",
    "Deals",
    "Book,Toys",
    "Beauty",
    "Appliances"
  ];

  List<String> img22 = [
    "assets/img1.jpg",
    "assets/img2.jpg",
    "assets/img3.jpg",
    "assets/img4.jpg",
    "assets/img5.jpg",
    "assets/img6.jpg",
    "assets/img7.jpg",
    "assets/img8.jpg"
  ];

  void activeIndex(int index) {
    Activeindex = index;
    notifyListeners();
  }

  List<String> select = [
    "assets/primedayimg3,1.jpg",
    "assets/mobile3,2.jpg",
    "assets/fashionandbeauty3.jpg",
    "assets/fridge3,4.jpg",
    "assets/img3,7.jpg",
    "assets/img3,11.jpg",
    "assets/img3,12.jpg",
    "assets/img3,5.jpg",
    "assets/img3,10.jpg",
    "assets/img3,8.jpg",
  ];

  List<String> amazonecart = [
    "assets/cart1.jpg",
    "assets/cart2.jpg",
    "assets/cart3.jpg",
    "assets/cart4.jpg",
    "assets/cart5.jpg",
    "assets/cart6.jpg",
  ];
  List<String> carttext = [
    "Swiss Beauty pure Stick.peaches n cream",
    "Lakme to 5 matte.powder",
    "Swiss beauty powder.Shades",
    "Swiss beauty hd matte Stick.athena ",
    "Derma Essential  Cream.100 gram",
    "Swiss beauty Liquid ",
  ];
  List<String> cartrate = [
    "₹171.00",
    "₹402.00",
    "₹201.00",
    "₹209.00",
    "₹299.00",
    "₹171.00",
  ];
  List<String> buyagainimg = [
    "assets/cart5.jpg",
    "assets/cart3.jpg",
    "assets/cart2,5.jpg",
    "assets/cart2,3.jpg",
    "assets/cart6.jpg",
  ];
  List<String> buyagainimgtxt = [
    "Derma Essential  Cream.100 gram",
    "Swiss beauty powder.Shades",
    "AmazonBasics TrueWireless in-Ear",
    "Dell USB Wireless Keyboardand Mouse",
    "Swiss beauty Liquid ",
  ];
  List<String> bgrate = [
    "₹299.00",
    "₹201.00",
    "₹849.00",
    "₹699.00",
    "₹171.00",
  ];

  List<String> amazonecart2 = [
    "assets/cart2,1.jpg",
    "assets/cart2,2.jpg",
    "assets/cart2,3.jpg",
    "assets/cart2,4.jpg",
    "assets/cart2,5.jpg",
    "assets/cart2,6.jpg",
  ];

  List<String> carttext2 = [
    "Boult Audio FXCharge Wireless Ear Bluetooth",
    "Zebronics Zeb-Ban Wireless BT Headphone",
    "Dell USB Wireless Keyboardand Mouse",
    "TP-Link USB Bluetooth Adapter",
    "AmazonBasics TrueWireless in-Ear",
    "boAt Rockerz Bluetooth On EarHeadphones With Mic",
  ];
  List<String> cartrate2 = [
    "₹999.00",
    "₹699.00",
    "₹1,331.00",
    "₹599.00",
    "₹849.00",
    "1225.00",
  ];

  List<String> menu = [
    "assets/menu1.jpeg",
    "assets/menu2.jpeg",
    "assets/menu3.jpeg",
    "assets/menu4.jpeg",
    "assets/menu5.jpeg",
    "assets/menu6.jpeg",
    "assets/menu7.jpeg",
    "assets/menu8.jpeg",
    "assets/menu9.jpeg",
    "assets/menu10.jpeg",
    "assets/menu11.jpeg",
    "assets/menu12.jpeg",
    "assets/menu13.jpeg",
    "assets/menu14.jpeg",
    "assets/menu15.jpeg",
    "assets/menu16.jpeg",
    "assets/menu17.jpeg",
    "assets/menu18.jpeg",
  ];
  List<String> menutext = [
    "Prime",
    "Deals and Saving",
    "Mobile & Electronic Device ",
    "Fashion & Beauty",
    "Groceries & pet Supplies",
    "Health & personal Care",
    "Home,furniture & Appliance",
    "Music,video & GAMES",
    "FunZon & Inspiration",
    "Book and Education",
    "Toys,Children &Baby",
    "Payments and Bookings",
    "Automotive",
    "Office & Professional",
    "Sports,Outdoor & travel",
    "Gifting",
    "Sell on amazon",
    "Your Thing",
  ];

  List<String> primeimg = [
    "assets/prime1.jpg",
    "assets/prime2.jpg",
  ];
  List<String> primetext = [
    "Prime videp",
    "Prime  Music",
  ];
  List<String> dealsimg = [
    "assets/deals.jpg",
    "assets/deals2.png",
    "assets/deals3.jpg",
    "assets/deals4.png",
    "assets/deals5.png",
    "assets/deals6.png",
  ];

  List<String> dealstext = [
    "Today's Deals",
    "Rewards",
    "Amazon Coupons",
    "Clearance Store",
    "Amazon Renewed",
    "Subscribe & Save",
  ];

  List<String> Deviceimg = [
    "assets/mobile.jpg",
    "assets/mobile2.jpg",
    "assets/mobile3.jpg",
    "assets/mobile4.jpg",
    "assets/appliances.webp",
    "assets/mobile5.png",
    "assets/mobile6.png",
    "assets/mobile7.png",
  ];
  List<String> Devicetxt = [
    "Mobile Phones & Accessories",
    "Amazon Business",
    "Electronics",
    "Computer & Accessories",
    "Tvs & Appliances",
    "Kindle E-readers",
    "Amazon Launchpad",
    "Local Shops on Amazon"
  ];
  List<String> Fashionimg = [
    "assets/f1.jpg",
    "assets/f2.jpg",
    "assets/f3.jpg",
    "assets/cart1.jpg",
    "assets/f4.jpg",
    "assets/img4,2.jpg",
    "assets/img4,3.jpg",
    "assets/f5.png",
    "assets/mobile7.png",
  ];
  List<String> fashiontext = [
    "Women's Fashion",
    "Men's Fashion",
    "Kids Fashion",
    "Beauty",
    "Shoes & Footwear",
    "Watches",
    "Bags ,Wallets & Luggage",
    "Handloom & Handicrafts",
    "Local Shops on Amazon"
  ];
  List<String> suppliesimg = [
    "assets/g1.jpg",
    "assets/g2.jpg",
    "assets/g3.jpg",
    "assets/g4.jpg",
    "assets/deals6.png",
  ];
  List<String> suppliestext = [
    "Grocery & Gourmet Food",
    "Amazon Fresh",
    "Daily Essentials",
    "Pet Supplies",
    "Subscribe & save"
  ];
  List<String> careimg = [
    "assets/c1.jpg",
    "assets/c2.jpg",
    "assets/cart1.jpg",
    "assets/c3.jpg",
    "assets/g3.jpg",
    "assets/deals6.png",
  ];
  List<String> caretext = [
    "Grooming & Wellness Device",
    "Health & Household supplies",
    "Beauty",
    "Amazon Pharmacy",
    "Daily Essentials",
    "Subscribe & Save",
  ];
  List<String> Applianceimg = [
    "assets/home.jpg",
    "assets/a1.jpg",
    "assets/mobile4.jpg",
    "assets/f5.png",
    "assets/mobile7.png",
    "assets/c2.jpg",
  ];
  List<String> Appliancetxt = [
    "Home & Kitchen",
    "Furniture",
    "TVs & Appliance",
    "Handloom & Handicraft",
    "Local Shops on Amazon",
    "Health & Household Spplies",
  ];
  List<String> gamingimg = [
    "assets/v1.jpg",
    "assets/v2.jpg",
    "assets/minitv.jpg",
    "assets/prime1.jpg",
    "assets/prime2.jpg",
  ];
  List<String> gamingtxt = [
    "Video Games",
    "Musical Instrument",
    "Amazon miniTV",
    "Prime Video",
    "Prime Music",
  ];
  List<String> funzoneimg = [
    "assets/f1.png",
    "assets/fz2.jpg",
  ];
  List<String> funzonetxt = [
    "Amazon Live",
    "Funzone",
  ];
  List<String> booksimg = [
    "assets/mobile5.png",
  ];
  List<String> bookstxt = ["Kindle E-readers"];
  List<String> toys = ["assets/t1.jpg", "assets/f3.jpg", "assets/t2.png"];
  List<String> toystxt = [
    "Toys & Games",
    "Kid's Fashion",
    "Baby Wishlist",
  ];
  List<String> paymentimg = [
    "assets/amazonpay.png",
    "assets/deals2.png",
    "assets/p3.jpg",
    "assets/p5.png",
    "assets/p4.jpg",
    "assets/p7.png",
  ];
  List<String> paymenttxt = [
    "Amazon Pay",
    "Rewards",
    "Mobile Recharge",
    "Travel Tickets",
    "Movie Tickets",
    "Car & bike insurance",
  ];
  List<String> automotiveimg = [
    "assets/p7.png",
  ];
  List<String> automotivetxt = [
    "Insurance",
  ];
  List<String> officeimg = [
    "assets/mobile4.jpg",
    "assets/mobile2.jpg",
  ];
  List<String> officetxt = [
    "Computer & Accessories",
    "Amazon Business",
  ];
  List<String> sportsimg = [
    "assets/p5.png",
    "assets/img4,3.jpg",
  ];
  List<String> sportstxt = [
    "Travel Tickets",
    "Bags ,Wallets & Luggage",
  ];
  List<String> giftimg = [
    "assets/gt1.png",
    "assets/f5.png",
    "assets/mobile6.png",
  ];
  List<String> gifttxt = [
    "Gift Cards",
    "Handloom & Handicraft",
    "Amazon Launchpad",
  ];
  List<String> sellimg = ["assets/sell.jpeg"];
  List<String> selltxt = ["Sell on Amazon"];
  List<String> yourthngimg = [
    "assets/thing1.jpeg",
    "assets/thing2.jpeg",
    "assets/thing3.jpeg",
    "assets/thing4.jpeg",
    "assets/thing5.jpeg",
    "assets/thing6.jpeg"
  ];
  List<String> yourthngtxt = [
    "Your Orders",
    "Buy Again",
    "Your List",
    "your Account",
    "Your Transactions",
    "Your Recmmendations",
  ];
  List<String> allimg = [
    "assets/tabimgw1.jpeg",
    "assets/tabimgh1.jpeg",
    "assets/tabimgm1.jpeg",
    "assets/tabkimgw2.jpeg",
    "assets/tabimg2.jpeg",
    "assets/tabimgw3.jpeg",
    "assets/tabimgh2.jpeg",
    "assets/tabimg3.jpeg",
    "assets/tabimgh3.jpeg",
    "assets/tabimg4.jpeg",
  ];
  List<String> alltext = [
    "Rashi Shrivastava",
    "new style",
    "kunal sharma",
    "Khushi soni",
    "Styleonair",
    "Reena t",
    "#stylesnap",
    "sameer",
    "new styles",
    "Irshad",
  ];
  List<String> alltabp = [
    "assets/tabimgw1.jpeg",
    "assets/tabimgh1.jpeg",
    "assets/tabimgm1.jpeg",
    "assets/tabkimgw2.jpeg",
    "assets/tabimg2.jpeg",
    "assets/tabimgw3.jpeg",
    "assets/tabimgh2.jpeg",
    "assets/tabimg3.jpeg",
    "assets/tabimgh3.jpeg",
    "assets/tabimg4.jpeg",
  ];
  List<String> womenimg = [
    "assets/tabimgw1.jpeg",
    "assets/tabkimgw2.jpeg",
    "assets/tabimgw3.jpeg",
  ];
  List<String> womentext = [
    "Rashi Shrivastava",
    "Khushi soni",
    "Styleonair",
  ];
  List<String> womenimgp = [
    "assets/tabimgw1.jpeg",
    "assets/tabkimgw2.jpeg",
    "assets/tabimgw3.jpeg",
  ];
  List<String> menimg = [
    "assets/tabimgm1.jpeg",
    "assets/tabimg2.jpeg",
    "assets/tabimg3.jpeg",
    "assets/tabimg4.jpeg",
  ];
  List<String> mentext = ["kunal sharma", "Styleonair", "sameer", "Irshad"];
  List<String> menimgp = [
    "assets/tabimgm1.jpeg",
    "assets/tabimg2.jpeg",
    "assets/tabimg3.jpeg",
    "assets/tabimg4.jpeg",
  ];
  List<String> homeimg = [
    "assets/tabimgh1.jpeg",
    "assets/tabimgh2.jpeg",
    "assets/tabimgh3.jpeg"
  ];

  List<String> hometext = [
    "new style",
    " #stylesnap",
    "new styles",
  ];
  List<String> homeimgp = [
    "assets/tabimgh1.jpeg",
    "assets/tabimgh2.jpeg",
    "assets/tabimgh3.jpeg"
  ];
  List<String> account = [
    "Your Addresses",
    "Top-up your Amazon Pay balance",
    "ManageYour Profiles",
    "View Amazon Pay balanace statement",
    "Amazon Pay UPI",
    "Subscribe & Save"
  ];
  List<String> listl = [
    "assets/tabimgw1.jpeg",
    "assets/listimg.jpg",
  ];
  List<String> listltxt = [
    "Istyle can dress for women soild belted wrap dress bishop sleeves surplice",
    "Minimalist 10% vitamin C face serum for  glowing skin highly stable & effective skin",
  ];
  List<String> listltxt2 = [
    "by istyle",
    "by minimalist (health  and beauty)",
  ];
  List<String> listlrate = [
    "₹849.00",
    "₹664.00",
  ];
  List<String> listl3 = ["FREE Delivary", "FREE Delivary"];

  List<String> yourlistr = [
    "assets/tabimgw1.jpeg",
    "assets/listimg2.png",
  ];
  List<String> yourlistrtxt = [
    "Shopping \n list",
    "Alexa List",
  ];
  List<String> dressimg = [
    "assets/Dress1.jpeg",
    "assets/dress2.jpeg",
    "assets/dress3.jpeg",
    "assets/dress4.jpeg",
    "assets/tabimgw1.jpeg",
    "assets/tabkimgw2.jpeg",
    "assets/tabimgw3.jpeg",
  ];
  List<String> dressimg2 = [
    "assets/Dress1.jpeg",
    "assets/dress2.jpeg",
    "assets/dress4.jpeg",
    "assets/tabimgw1.jpeg",
    "assets/tabkimgw2.jpeg",
    "assets/tabimgw3.jpeg",
  ];
  List<String> dresstxt2 = [
    "₹849.00",
    "₹649.00",
    "₹749.00",
    "₹649.00",
    "₹849.00",
    "₹549.00",
  ];
  // List<String>

  File? fileImage;
  String imageurl = "";

  File? categoryfileimg;
  String img = "";

  File? productfileimg;
  String imges = "";
  // File? productfileimg2;
  // File? productfileimg3;
  // String imgs = "";
  // String Imgs = "";
  File? carouselfileimg;
  String cimg = "";

  File? listfileimg;
  String limg="";

  int selectedIndex = 0;

  void onItemTapped(int index) {
    selectedIndex = index;
    notifyListeners();
  }

  String checkvalue = "";

  void ordertype(String? val) {
    checkvalue = val!;
    notifyListeners();
  }

  String checkvalue2 = "";

  void ordertypes(String? val) {
    checkvalue = val!;
    notifyListeners();
  }

  TextEditingController namecontroller = TextEditingController();
  TextEditingController phnnocontroller = TextEditingController();
  TextEditingController emailidcontroller = TextEditingController();
  TextEditingController passwordcontroller = TextEditingController();
  TextEditingController loginphnnumber = TextEditingController();
  TextEditingController loginpassword = TextEditingController();

  // ImagePicker picker = ImagePicker();
  List<category> categoryimg = [];
  List<products> productdetails = [];
  List<Cartdetails> addcart = [];
  List<carousel> addcarousel = [];
  List<Listviewimg> addlistviewimg=[];
  // List<Dress>
  final FirebaseFirestore db = FirebaseFirestore.instance;

  Future<void> addData() async {
    String id = DateTime.now().millisecondsSinceEpoch.toString();
    HashMap<String, Object> map = HashMap();
    map["Emailid"] = emailidcontroller.text;
    map["Name"] = namecontroller.text;
    map["Phnno"] = phnnocontroller.text;
    map["password"] = passwordcontroller.text;

    if (fileImage != null) {
      String photoId = DateTime.now().millisecondsSinceEpoch.toString();
      ref = FirebaseStorage.instance.ref().child(photoId);
      await ref.putFile(fileImage!).whenComplete(() async {
        await ref.getDownloadURL().then((value) {
          map["PHOTO"] = value;
          map["ID_PHOTO"] = photoId;
          // editMap['IMAGE_URL'] = value;
          notifyListeners();
        });
        notifyListeners();
      });
      notifyListeners();
    } else {
      map['PHOTO'] = imageurl;
      // editMap['IMAGE_URL'] = imageUrl;
    }

    db.collection("details").doc(id).set(map);
    notifyListeners();
  }

  void setImage(File image) {
    fileImage = image;
    notifyListeners();
  }

  Future getImage() async {
    final imagePicker = ImagePicker();
    final pickedImage =
        await imagePicker.pickImage(source: ImageSource.gallery);

    if (pickedImage != null) {
      setImage(File(pickedImage.path));
    } else {
      print('No image selected.');
    }
  }

  //login

  void loginpage(BuildContext context) {
    db
        .collection("details")
        .where("Phnno", isEqualTo: loginphnnumber.text)
        .where("password", isEqualTo: loginpassword.text)
        .get()
        .then((value) {
      if (value.docs.isNotEmpty) {
        Navigator.push(
            context, MaterialPageRoute(builder: (context) => BottomNav()));
      } else {}
    });
  }

  //admin page

  TextEditingController categorynamecontroller = TextEditingController();

  Future<void> adddata2() async {
    String id = DateTime.now().millisecondsSinceEpoch.toString();
    HashMap<String, Object> categorymap = HashMap();
    categorymap["Category id"] = id;
    categorymap["categoryname"] = categorynamecontroller.text;

    if (categoryfileimg != null) {
      String photoId = DateTime.now().millisecondsSinceEpoch.toString();
      ref = FirebaseStorage.instance.ref().child(photoId);
      await ref.putFile(categoryfileimg!).whenComplete(() async {
        await ref.getDownloadURL().then((value) {
          categorymap["photo"] = value;
          // categorymap["id photo"] = photoId;
          // editMap['IMAGE_URL'] = value;
          notifyListeners();
        });
        notifyListeners();
      });
      notifyListeners();
    } else {
      categorymap['photo'] = img;
      // editMap['IMAGE_URL'] = imageUrl;
    }

    db.collection("Category").doc(id).set(categorymap);
    notifyListeners();
  }

  void setImage2(File image) {
    categoryfileimg = image;
    notifyListeners();
  }

  Future getImage2() async {
    final imagePicker2 = ImagePicker();
    final pickedImage2 =
        await imagePicker2.pickImage(source: ImageSource.gallery);

    if (pickedImage2 != null) {
      setImage2(File(pickedImage2.path));
    } else {
      print('No image selected.');
    }
    void Clear() {
      categorynamecontroller.clear();
    }
  }

  String productSelectedCategoryID = "";

  TextEditingController productnamecontroller = TextEditingController();
  TextEditingController colorcontroller = TextEditingController();
  TextEditingController pricecontroller = TextEditingController();
  TextEditingController discountcontroller = TextEditingController();
  TextEditingController categyct = TextEditingController();


  Future<void> addproduct() async {
    String id = DateTime.now().millisecondsSinceEpoch.toString();
    HashMap<String, Object> productmap = HashMap();
    productmap["product id"] = id;
    productmap["product name"] = productnamecontroller.text;
    productmap["color"] = colorcontroller.text;
    productmap["price"] = pricecontroller.text;
    productmap["discount"] = discountcontroller.text;
    productmap["category"] = categyct.text;
    productmap["categoryId"] = productSelectedCategoryID;

    if (productfileimg != null) {
      String photoId = DateTime.now().millisecondsSinceEpoch.toString();
      ref = FirebaseStorage.instance.ref().child(photoId);
      await ref.putFile(productfileimg!).whenComplete(() async {
        await ref.getDownloadURL().then((value) {
          productmap["photo"] = value;
          // productmap["id photo"] = photoId;
          // editMap['IMAGE_URL'] = value;
          notifyListeners();
        });
        notifyListeners();
      });
      notifyListeners();
    } else {
      productmap['photo'] = imges;
      // editMap['IMAGE_URL'] = imageUrl;
    }
    db.collection("Product").doc(id).set(productmap);
    notifyListeners();
  }

  void setImage3(File image) {
    productfileimg = image;
    notifyListeners();
  }

  Future getimg() async {
    final imagePick = ImagePicker();
    final pickedImg = await imagePick.pickImage(source: ImageSource.gallery);

    if (pickedImg != null) {
      cropImage(pickedImg.path, "");
    } else {
      print('No image selected.');
    }
  }

  void Clear() {
    productnamecontroller.clear();
    colorcontroller.clear();
    pricecontroller.clear();
    discountcontroller.clear();
    categyct.clear();
    productfileimg = null;
  }

  void getcategorydata() {
    db.collection("Category").get().then((value) {
      if (value.docs.isNotEmpty) {
        categoryimg.clear();
        for (var element in value.docs) {
          Map<dynamic, dynamic> map = element.data();
          categoryimg.add(category(
              map["String id"].toString(),
              map["photo"].toString(),
              map["categoryname"].toString()));
          notifyListeners();
        }
      }
      notifyListeners();
    });
  }

  void getproductdata() {
    db.collection("Product").get().then((value) {
      if (value.docs.isNotEmpty) {
        productdetails.clear();
        for (var elements in value.docs) {
          Map<String, dynamic> productmap = elements.data();
          productdetails.add(products(
              productmap["product id"].toString(),
              productmap["photo"].toString(),
              productmap["color"].toString(),
              productmap["categoryId"].toString(),
              productmap["product name"].toString(),
              productmap["discount"].toString(),
              productmap["price"].toString()));
          notifyListeners();
        }
      }
      notifyListeners();
    });
  }

  //otp
  TextEditingController otpverifycontroller = TextEditingController();

  String VerificationId = "";
  TextEditingController otp_verbify = TextEditingController();
  FirebaseAuth auth = FirebaseAuth.instance;

  void sendotp(BuildContext context) async {
    await auth.verifyPhoneNumber(
      phoneNumber: "+91${loginphnnumber.text}",
      verificationCompleted: (PhoneAuthCredential credential) async {
        await auth.signInWithCredential(credential);
      },
      verificationFailed: (FirebaseAuthException e) {
        if (e.code == "invalid-phone-number") {
          print("provided phone number is invalid");
        }
      },
      codeSent: (String verificationId, int? resendToken) {
        VerificationId = verificationId;
        Navigator.pushReplacement(
            context,
            MaterialPageRoute(
              builder: (context) => Otplogin(),
            ));
        log("Verification Id : $verificationId");
      },
      codeAutoRetrievalTimeout: (String verificationId) {},
      timeout: const Duration(seconds: 60),
    );
  }

  void verify(BuildContext context) async {
    PhoneAuthCredential credential = PhoneAuthProvider.credential(
        verificationId: VerificationId, smsCode: otpverifycontroller.text);
    await auth.signInWithCredential(credential).then((value) {
      if (value.user != null) {
        Navigator.pushReplacement(
            context,
            MaterialPageRoute(
              builder: (context) => BottomNav(),
            ));
      } else {
        if (kDebugMode) {
          print("6546");
        }
      }
    });
  }
  //add
  void Inrement() {
    count++;
    notifyListeners();
  }

  void Decrement() {
    count--;
    notifyListeners();
  }

  void Addcart(
      String name, color, price, discount, photo, BuildContext context) {
    String id = DateTime.now().millisecondsSinceEpoch.toString();
    HashMap<String, Object> addcartmap = HashMap();
    addcartmap["string id"] = id;
    addcartmap["name"] = name;
    addcartmap["color"] = color;
    addcartmap["price"] = price;
    addcartmap["discount"] = discount;
    addcartmap["Photo"] = photo;
    db.collection("cart").doc(id).set(addcartmap);

    ScaffoldMessenger.of(context).showSnackBar(SnackBar(
      content: Text("Added to cart"),
      backgroundColor: Colors.yellow,
      elevation: 10,
      behavior: SnackBarBehavior.floating,
      margin: EdgeInsets.all(5),
    ));
    notifyListeners();
  }

  void getcartdata() {
    db.collection("cart").get().then((value) {
      addcart.clear();
      if (value.docs.isNotEmpty) {
        for (var elements in value.docs) {
          Map<String, dynamic> addcartmap = elements.data();
          addcart.add(Cartdetails(
              addcartmap["string id"].toString(),
              addcartmap["Photo"].toString(),
              addcartmap["name"].toString(),
              addcartmap["color"].toString(),
              addcartmap["price"].toString(),
              addcartmap["discount"].toString()));
          notifyListeners();
        }
        ;
      }
      notifyListeners();
    });
  }

  void deletecart(String id) {
    print(id + "123456");

    db.collection("cart").doc(id).delete();

    notifyListeners();
  }

  TextEditingController descriptionnamecontroller = TextEditingController();

  Future<void> Addcarousel() async {
    String id = DateTime.now().millisecondsSinceEpoch.toString();
    HashMap<String, Object> carouselymap = HashMap();
    carouselymap["carousel id"] = id;
    carouselymap["descriptionname"] = descriptionnamecontroller.text;

    if (carouselfileimg != null) {
      String photoId = DateTime.now().millisecondsSinceEpoch.toString();
      ref = FirebaseStorage.instance.ref().child(photoId);
      await ref.putFile(carouselfileimg!).whenComplete(() async {
        await ref.getDownloadURL().then((value) {
          carouselymap["photo"] = value;

          notifyListeners();
        });
        notifyListeners();
      });
      notifyListeners();
    } else {
      carouselymap['photo'] = cimg;
      // editMap['IMAGE_URL'] = imageUrl;
    }

    db.collection("Carousel").doc(id).set(carouselymap);
    notifyListeners();
  }

  void setimage(File image) {
    carouselfileimg = image;
    notifyListeners();
  }

  Future getimagec() async {
    final imagePickerc = ImagePicker();
    final pickedImagec =
        await imagePickerc.pickImage(source: ImageSource.gallery);

    if (pickedImagec != null) {
      setimage(File(pickedImagec.path));
    } else {
      print('No image selected.');
    }
    void Clear() {
      descriptionnamecontroller.clear();
    }
  }

  void getcarouseldata() {
    db.collection("Carousel").get().then((value) {
      if (value.docs.isNotEmpty) {
        addcarousel.clear();
        for (var element in value.docs) {
          Map<dynamic, dynamic> carouselmap = element.data();
          addcarousel.add(carousel(
              carouselmap["carousel id"].toString(),
              carouselmap["photo"].toString(),
              carouselmap["descriptionname"] ?? ""));

          notifyListeners();
        }
      }
      notifyListeners();
    });
  }

  Future<void> cropImage(String path, String from) async {
    final croppedFile = await ImageCropper().cropImage(
      sourcePath: path,
      aspectRatioPresets: Platform.isAndroid
          ? [
              CropAspectRatioPreset.square,
              CropAspectRatioPreset.ratio3x2,
              CropAspectRatioPreset.original,
              CropAspectRatioPreset.ratio4x3,
              CropAspectRatioPreset.ratio16x9,
            ]
          : [
              CropAspectRatioPreset.original,
              CropAspectRatioPreset.square,
              CropAspectRatioPreset.ratio3x2,
              CropAspectRatioPreset.ratio4x3,
              CropAspectRatioPreset.ratio5x3,
              CropAspectRatioPreset.ratio5x4,
              CropAspectRatioPreset.ratio7x5,
              CropAspectRatioPreset.ratio16x9,
              CropAspectRatioPreset.ratio16x9
            ],
      uiSettings: [
        AndroidUiSettings(
            toolbarTitle: 'Cropper',
            toolbarColor: Colors.white,
            toolbarWidgetColor: Colors.black,
            initAspectRatio: CropAspectRatioPreset.original,
            lockAspectRatio: false),
        IOSUiSettings(
          title: 'Cropper',
        )
      ],
    );
    if (croppedFile != null) {
      productfileimg = File(croppedFile.path);

      notifyListeners();
    }
  }

  void getproductadmindata(String cateid) {
    db.collection("Product")
        .where("categoryId", isEqualTo: cateid)
        .get()
        .then((value) {
      if (value.docs.isNotEmpty) {
        productdetails.clear();
        for (var elements in value.docs) {
          Map<String, dynamic> productmap = elements.data();
          productdetails.add(products(
              productmap["product id"].toString(),
              productmap["photo"].toString(),
              productmap["color"].toString(),
              productmap["categoryId"].toString(),
              productmap["product name"].toString(),
              productmap["discount"].toString(),
              productmap["price"].toString()));
          notifyListeners();
        }
      }
      notifyListeners();
    });
  }


  String dealsImage ="";

  void dealsSelection(String image){
    dealsImage = image;
    notifyListeners();
  }

  String dressz="";
   void dressSize(String size){
       dressz= size;
       notifyListeners();

   }
//listviewimg
  Future<void> Addlistimg() async {
    String id = DateTime.now().millisecondsSinceEpoch.toString();
    HashMap<String, Object> listymap = HashMap();
    listymap["listimgid"] = id;

    if (listfileimg != null) {
      String photoId = DateTime.now().millisecondsSinceEpoch.toString();
      ref = FirebaseStorage.instance.ref().child(photoId);
      await ref.putFile(listfileimg!).whenComplete(() async {
        await ref.getDownloadURL().then((value) {
          listymap["photo"] = value;

          notifyListeners();
        });
        notifyListeners();
      });
      notifyListeners();
    } else {
      listymap['photo'] = limg;
      // editMap['IMAGE_URL'] = imageUrl;
    }

    db.collection("Explorelistimg").doc(id).set(listymap);
    notifyListeners();
  }

  void Setimage(File image) {
    listfileimg = image;
    notifyListeners();
  }

  Future getimagel() async {
    final imagePickerl = ImagePicker();
    final pickedImagel =
    await imagePickerl.pickImage(source: ImageSource.gallery);

    if (pickedImagel != null) {
      Setimage(File(pickedImagel.path));
    } else {
      print('No image selected.');
    }

  }
  void getlistimgdata() {
    db.collection("Explorelistimg").get().then((value) {
      if (value.docs.isNotEmpty) {
        addlistviewimg.clear();
        for (var element in value.docs) {
          Map<dynamic, dynamic> listymap = element.data();
          addlistviewimg.add(Listviewimg(
              listymap["listimgid"].toString(),
              listymap["photo"].toString()));

          notifyListeners();
        }
      }
      notifyListeners();
    });
  }



}
