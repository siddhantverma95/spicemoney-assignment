import 'package:flutter/material.dart';
import 'package:spicemoney_ecom_assignment/features/productList/product_list_view_model.dart';
import 'package:spicemoney_ecom_assignment/features/productList/product_view.dart';
import 'package:states_rebuilder/states_rebuilder.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Injector(
      inject: [
        Inject(() => ProductListViewModel()),
      ],
      builder: (context) => MaterialApp(
        title: 'Flutter Demo',
        theme: ThemeData(
            primaryColor: Colors.white,
            accentColor: Colors.pink.shade800,
            textButtonTheme: TextButtonThemeData(
                style: ButtonStyle(
                    foregroundColor: MaterialStateProperty.all(Colors.black)))),
        home: Material(child: SafeArea(child: ProductView())),
      ),
    );
  }
}
