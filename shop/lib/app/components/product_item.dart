import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:shop/app/models/product.dart';
import 'package:shop/app/models/product_list.dart';
import 'package:shop/app/utils/app_routes.dart';

class ProductItem extends StatelessWidget {
  final Product product;
  const ProductItem({
    Key? key,
    required this.product,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final msg = ScaffoldMessenger.of(context);
    return ListTile(
      leading: CircleAvatar(
        backgroundImage: NetworkImage(product.imageUrl),
      ),
      title: Text(product.name),
      trailing: SizedBox(
        width: 100,
        child: Row(children: [
          IconButton(
            onPressed: () {
              Navigator.of(context).pushNamed(
                AppRoutes.productForm,
                arguments: product,
              );
            },
            color: Theme.of(context).colorScheme.primary,
            icon: const Icon(Icons.edit),
          ),
          IconButton(
            onPressed: () {
              showDialog<bool>(
                context: context,
                builder: (ctx) => AlertDialog(
                  title: const Text('Tem Certeza ?'),
                  content: const Text('Quer remover o item do carrinho'),
                  actions: [
                    TextButton(
                        onPressed: (() {
                          Navigator.of(context).pop(false);
                        }),
                        child: const Text('Não')),
                    TextButton(
                      onPressed: (() {
                        Navigator.of(context).pop(true);
                      }),
                      child: const Text('Sim'),
                    )
                  ],
                ),
              ).then((value) async {
                if (value ?? false) {
                  try {
                    await Provider.of<ProductList>(
                      context,
                      listen: false,
                    ).removeProduct(product);
                  } catch (error) {
                    msg.showSnackBar(
                      SnackBar(
                        content: Text(error.toString()),
                      ),
                    );
                  }
                }
              });
            },
            color: Theme.of(context).errorColor,
            icon: const Icon(Icons.delete),
          )
        ]),
      ),
    );
  }
}
