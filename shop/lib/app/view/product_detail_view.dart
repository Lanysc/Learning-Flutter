import 'package:flutter/material.dart';
import 'package:shop/app/models/product.dart';

class ProductDetailView extends StatelessWidget {
  const ProductDetailView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final Product product =
        ModalRoute.of(context)!.settings.arguments as Product;
    return Scaffold(
      appBar: AppBar(
        title: Text(product.name),
      ),
      body: SingleChildScrollView(
          child: Column(
        children: [
          SizedBox(
            height: 300,
            width: double.infinity,
            child: Image.network(
              product.imageUrl,
              fit: BoxFit.cover,
            ),
          ),
          const SizedBox(
            height: 10,
          ),
          Text(
            product.price > 0 ? 'R\$ ${product.price}' : 'Valor Inisponivel',
            style: TextStyle(
              color: Colors.grey,
              fontSize: product.price > 0 ? 20 : 15
            ),
          ),
          const SizedBox(height: 10),
          Container(
            padding: const EdgeInsets.symmetric(
              horizontal: 10
            ),
            width: double.infinity,
            child: Text(
              product.description,
              textAlign: TextAlign.center,
            ),
          )
        ],
      )),
    );
  }
}
