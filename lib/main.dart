import 'dart:io';

import 'package:ecommerce_full/blocs/cart.bloc.dart';
import 'package:ecommerce_full/blocs/home.bloc.dart';
import 'package:ecommerce_full/blocs/theme.bloc.dart';
import 'package:ecommerce_full/blocs/user.bloc.dart';
import 'package:ecommerce_full/ui/android/pages/tabs.page.dart';
import 'package:ecommerce_full/ui/ios/pages/tabs.page.dart' as iOS;
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  // This widget is the root of your application.5
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider<HomeBloc>.value(
          value: HomeBloc(),
        ),
        ChangeNotifierProvider<CartBloc>.value(
          value: CartBloc(),
        ),
        ChangeNotifierProvider<UserBloc>.value(
          value: UserBloc(),
        ),
        ChangeNotifierProvider<ThemeBloc>.value(
          value: ThemeBloc(),
        ),
      ],
      child: Main(),
    );
  }
}

class Main extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final ThemeBloc bloc = Provider.of<ThemeBloc>(context);
    // final tabBar = Platform.isIOS ? iOS.TabsPage() : TabsPage();
    final tabBar = TabsPage();

    return MaterialApp(
      title: 'Shopping Cart',
      debugShowCheckedModeBanner: false,
      theme: bloc.theme,
      home: Scaffold(
        body: DefaultTabController(
          length: 3,
          child: tabBar,
        ),
      ),
    );
  }
}
