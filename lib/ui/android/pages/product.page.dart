import 'package:ecommerce_full/models/product-details.model.dart';
import 'package:ecommerce_full/repositories/product.repository.dart';
import 'package:ecommerce_full/ui/shared/widgets/shared/generic-progress-indicator.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';

class ProductPage extends StatelessWidget {
  final String id;
  final _repository = ProductRepository();

  ProductPage({@required this.id});

  @override
  Widget build(BuildContext context) {
    return FutureBuilder<ProductDetailsModel>(
      future: _repository.getbyId(id),
      builder: (context, snapshot) {
        switch (snapshot.connectionState) {
          case ConnectionState.none:
            return Text('Aguardando..');
          case ConnectionState.active:

          case ConnectionState.waiting:
            return Center(
              child: GenericProgressIndicator(),
            );
          case ConnectionState.done:
            if (snapshot.hasError) {
              return Center(
                child: Text('Não foi possivel obter o produto'),
              );
            }
            ProductDetailsModel product = snapshot.data;
            return content(product);
          default:
        }
      },
    );
  }

  Widget content(ProductDetailsModel product) {
    return Scaffold(
      appBar: AppBar(),
      body: ListView.builder(
          scrollDirection: Axis.horizontal,
          itemCount: product.images.length,
          itemBuilder: (content, index) {
            return Container(
              width: 200,
              child: Image.network(product.images[index]),
            );
          }),
    );
  }
}
