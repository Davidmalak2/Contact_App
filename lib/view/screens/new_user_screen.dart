import 'package:flutter/material.dart';
import 'package:contact_app/view/widgets/custom_text_from_feild.dart';
import 'package:contact_app/view/widgets/custom_material_button.dart';

class NewContactScreen extends StatefulWidget {
  const NewContactScreen({super.key});

  @override
  State<NewContactScreen> createState() => _NewContactScreenState();
}

class _NewContactScreenState extends State<NewContactScreen> {
  // State variables & text controllers
  String dropdownButtonValue = "Pending";
  final TextEditingController nameController = TextEditingController();
  final TextEditingController phoneController = TextEditingController();
  int colorSelected = 4283215696;

  @override
  void dispose() {
    // Clean up controllers when widget is disposed
    nameController.dispose();
    phoneController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xffF5F7FB),
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        title: const Text(
          "Add New Contact",
          style: TextStyle(
            fontSize: 25,
            fontWeight: FontWeight.bold,
            color: Colors.black,
          ),
        ),
        centerTitle: false,
      ),
      body: Padding(
        padding: const EdgeInsets.all(24.0),
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // User Name Field
              CustomTextFormField(
                label: "Name",
                hint: "Enter Name",
                controller: nameController,
              ),
              const SizedBox(height: 15),

              // Phone Number Field
              CustomTextFormField(
                label: "Phone Number",
                hint: "Enter Phone Number",
                controller: phoneController,
              ),
              const SizedBox(height: 25),

              // Save Button
              CustomMaterialButton(
                text: "Save",
                onPressed: () async {
                  // TODO: Add save logic here (e.g. Hive database)
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}