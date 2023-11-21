import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:task/auth/provider/auth_provider.dart';
import 'package:task/auth/repository/auth_repository.dart';
import 'package:task/auth/service/auth_service.dart';
import 'package:task/auth/ui/login_screen.dart';
import 'package:task/product/provider/product_provider.dart';
import 'package:task/product/repository/product_repository.dart';
import 'package:task/product/service/product_service.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
        providers: [
          ChangeNotifierProvider(
              create: (context) => AuthProvider(AuthRepository(AuthService()))),
          ChangeNotifierProvider(
              create: (context) =>
                  ProductProvider(ProductRepository(ProductService())))
        ],
        child: MaterialApp(
            debugShowCheckedModeBanner: false,
            theme: ThemeData(
              primarySwatch: Colors.blue,
            ),
            home: const LoginScreen()));
  }
}
