import 'dart:io';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:graduation_project/Screens/cart.dart';
import 'package:graduation_project/Screens/color.dart';
import 'package:graduation_project/Screens/favorite.dart';
import 'package:graduation_project/Screens/home.dart';
import 'package:graduation_project/Screens/orders.dart';
import 'package:graduation_project/task/AdminPages/login_page.dart';
import 'package:graduation_project/task/Bloc/appDataBaseLogic.dart';
import 'package:graduation_project/task/Bloc/appDataBaseState.dart';

class Store extends StatelessWidget {
  late int userId;
  late String name, email, url;
  Store(this.userId, this.name, this.email, this.url);

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
        create: (context) =>
            Appdatabaselogic()..createDatabaseAndTables(userId),
        child: BlocConsumer<Appdatabaselogic, Appdatabasestate>(
            listener: (context, state) {},
            builder: (context, state) {
              Appdatabaselogic usersapplogic = BlocProvider.of(context);
              return DefaultTabController(
                length: 4,
                child: Scaffold(
                  appBar: AppBar(
                    foregroundColor: Colors.white,
                    title: Text(
                      "E-Store",
                      style: TextStyle(
                          fontSize: 25,
                          fontWeight: FontWeight.bold,
                          color: Colors.white),
                    ),
                    backgroundColor: AppColor.SecondPrimaryColor,
                    bottom: const TabBar(tabs: [
                      Column(
                        children: [
                          Icon(
                            Icons.home,
                            color: Colors.white,
                            size: 30,
                          ),
                          Text(
                            "Home",
                            style: TextStyle(color: Colors.white, fontSize: 15),
                          )
                        ],
                      ),
                      Column(
                        children: [
                          Icon(
                            Icons.shopping_bag,
                            color: Colors.white,
                            size: 30,
                          ),
                          Text(
                            "Orders",
                            style: TextStyle(color: Colors.white, fontSize: 15),
                          )
                        ],
                      ),
                      Column(
                        children: [
                          Icon(
                            Icons.shopping_cart,
                            color: Colors.white,
                            size: 30,
                          ),
                          Text(
                            "Cart",
                            style: TextStyle(color: Colors.white, fontSize: 15),
                          )
                        ],
                      ),
                      Column(
                        children: [
                          Icon(
                            Icons.favorite,
                            color: Colors.white,
                            size: 30,
                          ),
                          Text(
                            "Favorites",
                            style: TextStyle(color: Colors.white, fontSize: 15),
                          )
                        ],
                      ),
                    ]),
                  ),
                  drawer: Drawer(
                    backgroundColor: AppColor
                        .SecondPrimaryColor, // Change the background color to orange

                    child: ListView(
                      children: [
                        UserAccountsDrawerHeader(
                          decoration: BoxDecoration(
                            color: AppColor
                                .SecondPrimaryColor, // Change the color to orange
                          ),
                          accountName: Text(name),
                          accountEmail: Text(email),
                          currentAccountPicture: CircleAvatar(
                            backgroundImage: FileImage(File(url.toString())),
                          ),
                        ),
                        ListTile(
                          leading: Icon(Icons.home),
                          title: Text('Home'),
                          onTap: () {
                            // Navigate to the home page
                            Navigator.of(context).pop();
                          },
                        ),
                        ListTile(
                          leading: Icon(Icons.logout),
                          title: Text('Logout'),
                          onTap: () {
                            Navigator.of(context)
                                .push(MaterialPageRoute(builder: (c) {
                              return LoginPage();
                            }));
                          },
                        ),
                      ],
                    ),
                  ),
                  body: TabBarView(children: [
                    Home(userId: userId),
                    Orders(userId),
                    Cart(userId),
                    Favorite(
                      userId: userId,
                    ),
                  ]),
                ),
              );
            }));
  }
}
/**/
