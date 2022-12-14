import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:shop/app/components/app_drawer.dart';
import 'package:shop/app/components/order.dart';
import 'package:shop/app/models/order_list.dart';

class OrdersView extends StatelessWidget {
  const OrdersView({Key? key}) : super(key: key);

  Future<void> _refreshOrders(BuildContext context) {
    return Provider.of<OrderList>(
      context,
      listen: false,
    ).loadOrders();
  }

  @override
  Widget build(BuildContext context) {
    return RefreshIndicator(
      onRefresh: () => _refreshOrders(context),
      child: Scaffold(
        appBar: AppBar(
          title: const Text('Meus Pedidos'),
        ),
        drawer: const AppDrawer(),
        body: FutureBuilder(
            future: Provider.of<OrderList>(context, listen: false).loadOrders(),
            builder: (ctx, snapshot) {
              if (snapshot.connectionState == ConnectionState.waiting) {
                return const Center(
                  child: CircularProgressIndicator(),
                );
              } else if (snapshot.error != null) {
                return const Center(
                  child: Text('Ocorreu um erro!'),
                );
              } else {
                return Consumer<OrderList>(
                  builder: (ctx, orders, child) => ListView.builder(
                      itemCount: orders.itemsCount,
                      itemBuilder: (ctx, i) =>
                          OrderWidget(order: orders.items[i])),
                );
              }
            }),
      ),
    );
  }
}
