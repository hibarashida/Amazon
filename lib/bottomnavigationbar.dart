import 'package:amazon/amazoneapp.dart';
import 'package:amazon/profiepage.dart';
import 'package:amazon/providerclass.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'cartpage.dart';
import 'menupage.dart';

class BottomNav extends StatelessWidget {
  const BottomNav({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final pages = [Amazonapp(), ProfilePage(), CartPage(), MenuPage()];
    providerclass provider = Provider.of<providerclass>(context, listen: true);
    return Scaffold(
      bottomNavigationBar: Container(
        height: 50,
        decoration: BoxDecoration(
          border: Border.all(color: Colors.black12, width: 2),
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            IconButton(
                // enableFeedback: false,
                onPressed: () {
                  provider.onItemTapped(0);
                },
                icon: Icon(Icons.home)),
            IconButton(
                // enableFeedback: false,
                onPressed: () {
                  provider.onItemTapped(1);
                },
                icon: Icon(Icons.person)),
            IconButton(
                // enableFeedback: false,
                onPressed: () {
                  provider.onItemTapped(2);
                  provider.getcartdata();
                },
                icon: Icon(Icons.shopping_cart)),
            IconButton(
                onPressed: () {
                  provider.onItemTapped(3);
                },
                icon: Icon(Icons.menu))
          ],
        ),
      ),
      body: pages[provider.selectedIndex],
    );
  }
}
