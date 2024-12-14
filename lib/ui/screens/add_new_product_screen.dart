import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart';

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
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  bool _addNewProductInProgress = false;

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
      key: _formKey,
        child: Column(
          children: [
            TextFormField(
              autovalidateMode: AutovalidateMode.onUserInteraction,
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
              autovalidateMode: AutovalidateMode.onUserInteraction,
              keyboardType: TextInputType.number,
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
              autovalidateMode: AutovalidateMode.onUserInteraction,
              keyboardType: TextInputType.number,
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
              autovalidateMode: AutovalidateMode.onUserInteraction,
              keyboardType: TextInputType.number,
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
              autovalidateMode: AutovalidateMode.onUserInteraction,
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
              autovalidateMode: AutovalidateMode.onUserInteraction,
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
            Visibility(
              visible: _addNewProductInProgress == false,
              replacement: const Center(child: CircularProgressIndicator()),
              child: ElevatedButton(onPressed: (){
                if(_formKey.currentState!.validate()){
                  _addNewProduct();
                }
              }, child: const Text('Add Product')),
            ),
          ],
        ),
      );
  }


  Future<void> _addNewProduct() async {
    _addNewProductInProgress  = true;
    setState(() {
    });
    Uri uri = Uri.parse('https://crud.teamrabbil.com/api/v1/CreateProduct');
    Map<String, dynamic> requestBody = {
      "Img":_imageTEController.text.trim(),
      "ProductCode":_codeTEController.text.trim(),
      "ProductName":_nameTEController.text.trim(),
      "Qty":_quantityTEController.text.trim(),
      "TotalPrice":_totalPriceTEController.text.trim(),
      "UnitPrice":_priceTEController.text.trim()
    };
    Response response = await post(
        uri,
        headers: {
          'Content-type' : 'application/json'
        },
        body: jsonEncode(requestBody));
    print(response.statusCode);
    print(response.body);
    _addNewProductInProgress = false;
    setState(() {

    });
    if(response.statusCode == 200){
      _clearTextField();
      ScaffoldMessenger.of(context).showSnackBar(const SnackBar(content: Text('New Product added')));
    }
    else{
      ScaffoldMessenger.of(context).showSnackBar(const SnackBar(content: Text('New Product add failed')));

    }
  }

  void _clearTextField(){
    _nameTEController.clear();
    _codeTEController.clear();
    _priceTEController.clear();
    _totalPriceTEController.clear();
    _quantityTEController.clear();
    _imageTEController.clear();
  }
  @override
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
