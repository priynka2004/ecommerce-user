import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:provider/provider.dart';
import 'package:task/auth/provider/auth_provider.dart';
import 'package:task/product/provider/product_provider.dart';
import 'package:task/product/ui/screen/favorite_product_screen.dart';
import 'package:task/product/ui/widget/product_list_widget.dart';

class DashboardScreen extends StatefulWidget {
  const DashboardScreen({super.key});

  @override
  State<DashboardScreen> createState() => _DashboardScreenState();
}

class _DashboardScreenState extends State<DashboardScreen> {
  @override
  void initState() {
    init();
    super.initState();
  }

  Future<void> init() async {
    SchedulerBinding.instance.addPostFrameCallback((timeStamp) async {
      Provider.of<AuthProvider>(context, listen: false).loadUser();
      Provider.of<ProductProvider>(context, listen: false).loadProducts();
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Consumer<AuthProvider>(
          builder: (context, authProvider, child) {
            final userName =
                Provider.of<AuthProvider>(context).user?.firstName ?? 'User';
            return Text('Hello $userName');
          },
        ),
        actions: [
          IconButton(
            onPressed: () {
              Navigator.of(context).push(
                MaterialPageRoute<void>(
                  builder: (context) => const FavoriteProductScreen(),
                ),
              );
            },
            icon: const Icon(Icons.favorite),
          )
        ],
      ),
      body: Consumer<ProductProvider>(
        builder: (context, productProvider, child) {
          return Padding(
            padding: const EdgeInsets.all(16),
            child: productProvider.isLoading
                ? const Center(
                    child: CircularProgressIndicator(),
                  )
                : ProductListWidget(productList: productProvider.productList),
          );
        },
      ),
    );
  }
}
