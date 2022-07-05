import 'package:drohealth/model/category_model.dart';
import 'package:drohealth/screens/cart/checkout_screen.dart';
import 'package:drohealth/screens/category/category_view_all_screen.dart';
import 'package:drohealth/screens/category/category_detail_screen.dart';
import 'package:drohealth/screens/navbar/dashboardScreen.dart';
import 'package:drohealth/screens/product_details/product_details.dart';
import 'package:flutter/material.dart';

import 'model/drug_model.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
          // This is the theme of your application.

          primarySwatch: Colors.blue,
          fontFamily: 'Proxima Nova'),
      debugShowCheckedModeBanner: false,
      initialRoute: '/',
      routes: {
        '/': (context) => const DashBoard(),
        '/productcategory': (context) =>
            const CategoryScreen(),
        '/viewall': (context) => CategoryScreen(),
        '/productDetail': (context) => ProductDetails(
            drug: ModalRoute.of(context)?.settings.arguments
                as Drug),
        '/checkout': (context) => const CheckOutScreen(),
        '/categorydetail': (context) =>
            CategoryDetailScreen(
                category: ModalRoute.of(context)
                    ?.settings
                    .arguments as Category),
      },
    );
  }
}
