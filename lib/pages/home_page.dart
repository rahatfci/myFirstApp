import 'package:flutter/material.dart';
import 'package:sdmga_project/widgets/category.dart';
import 'package:sdmga_project/widgets/items.dart';
import 'package:sdmga_project/widgets/gender.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 1,
        backgroundColor: const Color(0xFF6200EE),
        leading: const Padding(
          padding: EdgeInsets.all(5.0),
          child: CircleAvatar(
            backgroundImage: AssetImage("assets/avatar.png"),
            radius: 50,
          ),
        ),
        title: const Text(
          "E-commerce",
        ),
        actions: [
          IconButton(
              tooltip: "Search",
              onPressed: () {},
              icon: const Icon(
                Icons.search,
                size: 30,
                color: Colors.white,
              )),
          IconButton(
              tooltip: "Cart",
              onPressed: () {},
              icon: const Icon(
                Icons.shopping_cart,
                size: 30,
                color: Colors.white,
              )),
          IconButton(
              tooltip: "Account",
              onPressed: () {
                
              },
              icon: const Icon(
                Icons.account_circle,
                size: 30,
                color: Colors.white,
              )),
        ],
      ),
      body: Padding(
        padding: const EdgeInsets.only(top: 15, bottom: 5, right: 14, left: 14),
        child: Column(
          children: const <Widget>[Gender(), Category(), Items()],
        ),
      ),
    );
  }


}
