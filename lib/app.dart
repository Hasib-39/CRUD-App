import 'package:crud_app/ui/screens/product_list_screen.dart';
import 'package:crud_app/ui/screens/add_new_product_screen.dart';
import 'package:crud_app/ui/screens/update_product_screen.dart';
import 'package:flutter/material.dart';

class CRUDApp extends StatelessWidget {
  const CRUDApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: ProductListScreen(),
      initialRoute: '/',
      routes: {
        '/' : (context) => const ProductListScreen(),
        AddNewProductScreen.name: (context) => const AddNewProductScreen(),
        UpdateProductScreen.name: (context) => const UpdateProductScreen()
      },
    );
  }
}
