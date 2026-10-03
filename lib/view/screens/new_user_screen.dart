import 'package:contact_app/view/widgets/custom_text_from_feild.dart';
import 'package:flutter/material.dart';
import 'package:contact_app/core/utils/app_dialog.dart';
import 'package:contact_app/feature/data/firebase/firebase_user.dart';
import 'package:contact_app/feature/model/contact_user.dart';
import 'package:contact_app/view/widgets/custom_material_button.dart';
class NewContactScreen extends StatefulWidget {
  const NewContactScreen({super.key, this.user});
  final ContactUser? user; 

  @override
  State<NewContactScreen> createState() => _NewContactScreenState();
}

class _NewContactScreenState extends State<NewContactScreen> {
  late TextEditingController nameController;
  late TextEditingController phoneController;

  @override
  void initState() {
    super.initState();
    nameController = TextEditingController(text: widget.user?.name);
    phoneController = TextEditingController(text: widget.user?.phone);
  }

  @override
  void dispose() {
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
        title: Text(
          widget.user == null ? "Add New Contact" : "Update Contact",
          style: const TextStyle(
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
              CustomTextFormField(
                label: "Name",
                hint: "Enter Name",
                controller: nameController,
              ),
              const SizedBox(height: 15),
              CustomTextFormField(
                label: "Phone Number",
                hint: "Enter Phone Number",
                controller: phoneController,
              ),
              const SizedBox(height: 50),
              CustomMaterialButton(
                text: widget.user == null ? "Add New Contact" : "Update Contact",
                onPressed: () async {
                  if (widget.user == null) {
                    await addUser();
                  } else {
                    await updateUser();
                  }
                },
              ),
            ],
          ),
        ),
      ),
    );
  }

//add user
  Future<void> addUser() async {
    var name = nameController.text;
    var phone = phoneController.text;

    AppDialog.showLoading(context);
    try {
      await FirebaseService.addUser(ContactUser(name: name, phone: phone));
      if (!mounted) return;
      Navigator.of(context).pop();
      Navigator.of(context).pop();
    } catch (e) {
      if (!mounted) return;
      Navigator.of(context).pop();
      AppDialog.showError(context, e.toString());
    }
  }

//update user
  Future<void> updateUser() async {
    AppDialog.showLoading(context);
    try {
      await FirebaseService.update(
        ContactUser(
          id: widget.user!.id,
          name: nameController.text,
          phone: phoneController.text,
        ),
      );
      if (!mounted) return;
      Navigator.of(context).pop();
      Navigator.of(context).pop();
    } catch (e) {
      if (!mounted) return;
      Navigator.of(context).pop();
      AppDialog.showError(context, e.toString());
    }
  }}