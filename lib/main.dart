import 'dart:io';

import 'package:desktop_window/desktop_window.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:shop/models/product_list.dart';
import 'package:shop/pages/product_detail_page.dart';
import 'package:shop/pages/products_overview_page.dart';
import 'package:shop/utils/app_routes.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await setWindowSizeDesktop();
  runApp(const MyApp());
}

setWindowSizeDesktop() async {
  if (Platform.isWindows) {
    await DesktopWindow.setWindowSize(
        Size(392.72727272727275, 803.6363636363636));
  }
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (_) => ProductList(),
      child: MaterialApp(
        title: 'Flutter Demo',
        debugShowCheckedModeBanner: false,
        theme: ThemeData(
            primarySwatch: Colors.purple,
            colorScheme: ColorScheme.fromSeed(
              seedColor: Colors.purple,
              primary: Colors.purple,
              secondary: Colors.deepOrange,
            ),
            fontFamily: 'Lato',
            appBarTheme: AppBarTheme(centerTitle: true)),
        initialRoute: '/',
        routes: {
          AppRoutes.productsOverview: (_) => ProductsOverviewPage(),
          AppRoutes.productDetail: (_) => ProductDetailPage()
        },
      ),
    );
  }
}
