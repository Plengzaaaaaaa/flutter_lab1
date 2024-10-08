import 'package:flutter/material.dart';
import 'package:flutter_lab1/models/product_model.dart';

// Sample ProductDetailPage
class ProductDetailPage extends StatelessWidget {
  final ProductModel product;

  const ProductDetailPage({required this.product, super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text(product.productName)),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'Product Name: ${product.productName}',
              style: const TextStyle(fontSize: 22, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 8.0),
            Text(
              'Type: ${product.productType}',
              style: const TextStyle(fontSize: 20),
            ),
            Text(
              'Price: ${product.price} ${product.unit}',
              style: const TextStyle(fontSize: 20),
            ),
            Text(
              'unit:  ${product.unit}',
              style: const TextStyle(fontSize: 20),
            ),
            // Add more details if necessary
          ],
        ),
      ),
    );
  }
}
