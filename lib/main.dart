import 'dart:io';

import 'package:bloc/bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:myshop/layouts/home/desktop/home.dart';
import 'package:myshop/layouts/login/login_screen.dart';
import 'package:myshop/layouts/products/product_screen.dart';
import 'package:myshop/shared/cubit/bloc_observer.dart';
import 'package:myshop/shared/cubit/cubit.dart';
import 'package:myshop/shared/cubit/states.dart';
import 'package:myshop/shared/networks/remote/DioHelper.dart';
import 'package:myshop/shared/networks/remote/httpOverrides.dart';

import 'layouts/login/desktop/desktop_login_screen.dart';

void main() {
  DioHelper.init();
  HttpOverrides.global = new MyHttpOverrides();
  Bloc.observer = MyBlocObserver();
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return BlocProvider(

      create: (BuildContext context)=> MyShopCubit()..getHomeData(),
      child: BlocConsumer<MyShopCubit,MyShopStates>(
        listener: (BuildContext context, state) {  },
        builder: (BuildContext context, Object? state)=>MaterialApp(
          debugShowCheckedModeBanner: false,
          home:Builder(
              builder: (context) {
                if(MediaQuery.of(context).size.width.toInt() <= 560)
                  return MediaQuery(
                      data: MediaQuery.of(context).copyWith(
                          textScaleFactor: .5
                      ),
                      child: LoginScreen()
                  );
                return DesktopLoginScreen();
              }
          ),
        ),
      ),
    );
  }
}
