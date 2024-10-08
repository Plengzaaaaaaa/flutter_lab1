import 'package:flutter/material.dart';
import 'package:flutter_lab1/controllers/product_controller.dart';
import 'package:flutter_lab1/models/product_model.dart';
import 'package:flutter_lab1/pages/admin/view/AdminPage.dart';
import 'package:flutter_lab1/providers/user_provider.dart';
import 'package:provider/provider.dart';

class AddProductPage extends StatefulWidget {
  const AddProductPage({Key? key}) : super(key: key);

  @override
  _AddProductPageState createState() => _AddProductPageState();
}

class _AddProductPageState extends State<AddProductPage> {
  final _formKey = GlobalKey<FormState>();
  final TextEditingController _productNameController = TextEditingController();
  final TextEditingController _productTypeController = TextEditingController();
  final TextEditingController _priceController = TextEditingController();
  final TextEditingController _unitController = TextEditingController();

  late ProductController _controller;

  @override
  void initState() {
    super.initState();
    _controller = ProductController();
  }

  @override
  void dispose() {
    _productNameController.dispose();
    _productTypeController.dispose();
    _priceController.dispose();
    _unitController.dispose();
    super.dispose();
  }

  void _submitProduct(String token) async {
    if (_formKey.currentState!.validate()) {
      final newProduct = ProductModel(
        productName: _productNameController.text,
        productType: _productTypeController.text,
        price: int.parse(_priceController.text),
        unit: _unitController.text,
      );
      try {
        await _controller.postProduct(token, newProduct);
        ScaffoldMessenger.of(context).showSnackBar(
          const SnackBar(content: Text('Product added successfully!')),
        );
        Navigator.pushAndRemoveUntil(
          context,
          MaterialPageRoute(builder: (context) => const AdminPage()),
          (route) => false, // Removes all previous routes
        ); // Go back to the previous screen after adding
      } catch (error) {
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(content: Text('Failed to add product: $error')),
        );
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    final token = Provider.of<UserProvider>(context).accessToken;

    return Scaffold(
      appBar: AppBar(
        title: const Text('Add New Product'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Form(
          key: _formKey,
          child: ListView(
            children: [
              TextFormField(
                controller: _productNameController,
                decoration: const InputDecoration(labelText: 'Product Name'),
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Please enter a product name';
                  }
                  return null;
                },
              ),
              TextFormField(
                controller: _productTypeController,
                decoration: const InputDecoration(labelText: 'Product Type'),
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Please enter a product type';
                  }
                  return null;
                },
              ),
              TextFormField(
                controller: _priceController,
                decoration: const InputDecoration(labelText: 'Price'),
                keyboardType: TextInputType.number,
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Please enter a price';
                  }
                  if (int.tryParse(value) == null) {
                    return 'Please enter a valid number';
                  }
                  return null;
                },
              ),
              TextFormField(
                controller: _unitController,
                decoration: const InputDecoration(labelText: 'Unit'),
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Please enter a unit';
                  }
                  return null;
                },
              ),
              const SizedBox(height: 20),
              ElevatedButton(
                onPressed: () => _submitProduct(token),
                child: const Text('Add Product'),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
