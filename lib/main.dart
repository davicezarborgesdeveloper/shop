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
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (_) => ProductList(),
      child: MaterialApp(
        title: 'Flutter Demo',
        theme: ThemeData(
          colorScheme: ColorScheme.fromSwatch().copyWith(
            primary: Colors.purple,
            secondary: Colors.deepOrange,
          ),
          fontFamily: 'Lato',
        ),
        home: const ProductsOverviewPage(),
        routes: {
          AppRoutes.productDetail: (ctx) => const ProductDetailPage(),
        },
        debugShowCheckedModeBanner: false,
      ),
    );
  }
}
