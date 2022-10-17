import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:shop/app/components/app_drawer.dart';
import 'package:shop/app/components/badge.dart';
import 'package:shop/app/components/product_grid.dart';
import 'package:shop/app/models/cart.dart';
import 'package:shop/app/models/product_list.dart';
import 'package:shop/app/utils/app_routes.dart';

enum FilterOptions {
  favorite,
  all,
}

class ProductsOverviewView extends StatefulWidget {
  const ProductsOverviewView({Key? key}) : super(key: key);

  @override
  State<ProductsOverviewView> createState() => _ProductsOverviewViewState();
}

class _ProductsOverviewViewState extends State<ProductsOverviewView> {
  bool _isLoading = true;

  @override
  void initState() {
    super.initState();
    Provider.of<ProductList>(
      context,
      listen: false,
    ).loadProducts().then((value) {
      _isLoading = false;
    });
  }

  @override
  Widget build(BuildContext context) {
    final provider = Provider.of<ProductList>(context);

    return Scaffold(
      appBar: AppBar(
        title: const Text('Minha Loja'),
        actions: [
          PopupMenuButton(
            icon: const Icon(Icons.more_vert),
            itemBuilder: (_) => [
              const PopupMenuItem(
                value: FilterOptions.favorite,
                child: Text('Somente Favoritos'),
              ),
              const PopupMenuItem(
                value: FilterOptions.all,
                child: Text('Todos'),
              )
            ],
            onSelected: (FilterOptions selectedValue) {
              selectedValue == FilterOptions.favorite
                  ? provider.showFavoriteOnly()
                  : provider.showAll();
            },
          ),
          Consumer<Cart>(
            child: IconButton(
              onPressed: () {
                Navigator.of(context).pushNamed(AppRoutes.cart);
              },
              icon: const Icon(Icons.shopping_cart),
            ),
            builder: (ctx, cart, child) =>
                Badge(value: cart.itemsCount.toString(), child: child!),
          ),
        ],
      ),
      body: _isLoading
          ? const Center(
              child: CircularProgressIndicator(),
            )
          : const ProductGrid(),
      drawer: const AppDrawer(),
    );
  }
}
