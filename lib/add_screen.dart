// ignore_for_file: must_be_immutable

import 'package:crud_functions/model.dart';
import 'package:crud_functions/provider.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class AddScreen extends StatelessWidget {
  AddScreen({super.key});

 
  @override
  Widget build(BuildContext context) {
     TextEditingController nameController = TextEditingController();
  TextEditingController emailController = TextEditingController();
  TextEditingController addressController = TextEditingController();
  TextEditingController phoneController = TextEditingController();

    final pro = Provider.of<Serviceprovider>(context,);
    return Scaffold(
      appBar: AppBar(),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          TextField(
              controller: nameController,
              decoration: InputDecoration(
                  hintText: 'name',
                  border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(20)))),
          TextField(
              controller: emailController,
              decoration: InputDecoration(
                  hintText: 'e_mail',
                  border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(20)))),
          TextField(
              controller: addressController,
              decoration: InputDecoration(
                  hintText: 'address',
                  border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(20)))),
          TextField(
              controller: phoneController,
              decoration: InputDecoration(
                  hintText: 'phone-no',
                  border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(20)))),
        ],
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          pro.addalldata(ApiModel(
              address: addressController.text,
              email: emailController.text,
              phone: phoneController.text,
              name: nameController.text));
          Navigator.pop(context);
        },
        child:const Text('Submit'),
      ),
    );
  }
}
