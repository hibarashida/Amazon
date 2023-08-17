import 'package:amazon/productadmin.dart';
import 'package:amazon/profiepage.dart';
import 'package:amazon/providerclass.dart';
import 'package:amazon/splashscreen.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'Adminpanel.dart';
import 'Amazonlens.dart';
import 'Carouseladmin.dart';
import 'Customerservice.dart';
import 'Sign-in.dart';
import 'amazoneapp.dart';
import 'amazonsigninpage.dart';
import 'bottomnavigationbar.dart';
import 'cartpage.dart';
import 'category admin.dart';
import 'fashion.dart';
import 'loginpage.dart';
import 'otplogin.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(
          create: (context) => providerclass(),
        ),
      ],
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'Flutter Demo',
        theme: ThemeData(
          colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
          useMaterial3: true,
        ),
          home: SplashScreen(),
        // home: Otplogin() ,
        // home: LoginPage() ,
        //   home: Adminpanel() ,
        //  home: Product() ,
        // home: Carousel() ,
        //    home: Fashion() ,
        //   home: Amazon() ,
      ),
    );
  }
}
