import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';


class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      appBar: AppBar(
        title: const Text(
          "David's Contacts",
          style: TextStyle(color: Colors.white, fontSize: 30),
        ),
        backgroundColor: Colors.black,
      ),
      //Dynamic ListView to display contacts
      body: ListView.builder(
        itemCount: 20,
        itemBuilder: (context, index) => CardPerson(
          title: "David $index",
          subtitle: "012102937$index",
        ),
      ),

     // FloatingActionButton to add new contact   
      floatingActionButton: FloatingActionButton(
        backgroundColor: Colors.blue,
        onPressed: () {
          // Navigate to the AddUserScreen when the button is pressed
          Navigator.pushNamed(context, "add_contact");
        },
        child: const Text(
          "Add",
          style: TextStyle(
            fontSize: 16,
            fontWeight: FontWeight.bold,
            color: Colors.white,
          ),
        ),
      ),
    );
  }
  void getAllContacts() async {
    var collection = FirebaseFirestore.instance.collection("contacts");
    var query = await collection.get();
    var docs = query.docs;
    var list = docs.map((doc) {
      var map = doc.data();
      return dataUser(map["name"], map["phone"]);
    }).toList();
    var users = list;
    setState(() {});
  }
}

void setState(Null Function() param0) {}
// CardPerson widget to display individual contact information
class CardPerson extends StatelessWidget {
  const CardPerson({
    super.key,
    required this.title,
    required this.subtitle,
  });

  final String title;
  final String subtitle;

  @override
  Widget build(BuildContext context) {
    return Card(
      margin: const EdgeInsets.all(16),
      child: ListTile(
        title: Text(
          title,
          style: const TextStyle(fontSize: 20, color: Colors.black),
        ),
        subtitle: Text(
          subtitle,
          style: const TextStyle(fontSize: 16, color: Colors.grey),
        ),
        trailing: const Icon(
          Icons.person,
          size: 30,
          color: Colors.blue,
        ),
      ),
    );
  }}
  class dataUser{
    String name;
    String phone;
    dataUser( this.name, this.phone);
  }