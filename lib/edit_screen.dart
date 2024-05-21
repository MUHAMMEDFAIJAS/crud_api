import 'package:crud_functions/model.dart';
import 'package:crud_functions/provider.dart';
import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:provider/provider.dart';

class EditScreen extends StatefulWidget {
  String? id;
  String? name;
  String? email;
  String? address;
  String? phone;
  EditScreen({
    super.key,
    this.name,
    this.address,
    this.email,
    this.phone,
    this.id,
  });

  @override
  State<EditScreen> createState() => _EditScreenState();
}

class _EditScreenState extends State<EditScreen> {
  @override
  Widget build(BuildContext context) {
    final pro = Provider.of<Serviceprovider>(context);
    TextEditingController nameController =
        TextEditingController(text: widget.name);
    TextEditingController emailController =
        TextEditingController(text: widget.email);
    TextEditingController addressController =
        TextEditingController(text: widget.address);
    TextEditingController phoneController =
        TextEditingController(text: widget.phone);
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
                    borderRadius: BorderRadius.circular(20))),
          ),
          const Gap(20),
          TextField(
            controller: emailController,
            decoration: InputDecoration(
                hintText: 'e-mail',
                border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(20))),
          ),
          const Gap(20),
          TextField(
            controller: addressController,
            decoration: InputDecoration(
                hintText: 'address',
                border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(20))),
          ),
          const Gap(20),
          TextField(
            controller: phoneController,
            decoration: InputDecoration(
                hintText: 'phone_no',
                border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(20))),
          ),
          TextButton(
              onPressed: () {
                pro.updatealldata(ApiModel(
                    address: addressController.text,
                    name: nameController.text,
                    email: emailController.text,
                    phone: phoneController.text,
                    id: widget.id));
                Navigator.pop(context);
              },
              child: const Text('submit')),
        ],
      ),
    );
  }
}
