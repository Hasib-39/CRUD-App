import 'package:flutter/material.dart';

class AddNewProductScreen extends StatefulWidget {
  const AddNewProductScreen({super.key});
  static const String name = '/add-new-product';
  @override
  State<AddNewProductScreen> createState() => _AddNewProductScreenState();
}

class _AddNewProductScreenState extends State<AddNewProductScreen> {
  final TextEditingController _nameTEController = TextEditingController();
  final TextEditingController _priceTEController = TextEditingController();
  final TextEditingController _totalPriceTEController = TextEditingController();
  final TextEditingController _quantityTEController = TextEditingController();
  final TextEditingController _codeTEController = TextEditingController();
  final TextEditingController _imageTEController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Add New Product"),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: _buildProductForm(),
        ),
      ),
    );
  }

  Widget _buildProductForm() {
    return Form(
        child: Column(
          children: [
            TextFormField(
              controller: _nameTEController,
              decoration: InputDecoration(
                hintText: 'Name',
                labelText: 'Product Name'
              ),
              validator: (String? value){
                if(value?.trim().isEmpty ?? true){
                  return 'Enter product name';
                }
                return null;
              },
            ),
            TextFormField(
              controller: _priceTEController,
              decoration: InputDecoration(
                  hintText: 'Price',
                  labelText: 'Product Price'
              ),
              validator: (String? value){
                if(value?.trim().isEmpty ?? true){
                  return 'Enter product price';
                }
                return null;
              },
            ),
            TextFormField(
              controller: _totalPriceTEController,
              decoration: InputDecoration(
                  hintText: 'Total Price',
                  labelText: 'Product Total Price'
              ),
              validator: (String? value){
                if(value?.trim().isEmpty ?? true){
                  return 'Enter product total price';
                }
                return null;
              },
            ),
            TextFormField(
              controller: _quantityTEController,
              decoration: InputDecoration(
                  hintText: 'Quantity',
                  labelText: 'Product Quantity'
              ),
              validator: (String? value){
                if(value?.trim().isEmpty ?? true){
                  return 'Enter product quantity';
                }
                return null;
              },
            ),
            TextFormField(
              controller: _codeTEController,
              decoration: InputDecoration(
                  hintText: 'Code',
                  labelText: 'Product Code'
              ),
              validator: (String? value){
                if(value?.trim().isEmpty ?? true){
                  return 'Enter product code';
                }
                return null;
              },
            ),
            TextFormField(
              controller: _imageTEController,
              decoration: InputDecoration(
                  hintText: 'Image url',
                  labelText: 'Product Image'
              ),
              validator: (String? value){
                if(value?.trim().isEmpty ?? true){
                  return 'Enter product image';
                }
                return null;
              },
            ),
            const SizedBox(
              height: 16,
            ),
            ElevatedButton(onPressed: (){}, child: const Text('Add Product')),
          ],
        ),
      );
  }

  void dispose(){
    _nameTEController.dispose();
    _codeTEController.dispose();
    _priceTEController.dispose();
    _totalPriceTEController.dispose();
    _quantityTEController.dispose();
    _imageTEController.dispose();
    super.dispose();
  }
}
