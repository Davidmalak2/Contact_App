import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:contact_app/feature/model/contact_user.dart';

abstract class FirebaseService {
//collection reference for ContactUser
  static CollectionReference<ContactUser> collection() {
    return FirebaseFirestore.instance
        .collection("Contact")
        .withConverter<ContactUser>(
          fromFirestore: (snapshot, _) => ContactUser.fromJson(snapshot.data()!),
          toFirestore: (value, _) => value.toJson(),
        );
  }

//add new contact
  static Future<void> addUser(ContactUser user) async {
    await collection().doc().set(user);
  }

//delete contact
  static Future<void> delete(String id) async {
    await collection().doc(id).delete();
  }

//update contact
  static Future<void> update(ContactUser user) async {
    await collection().doc(user.id).update(user.toJson());
  }

//get all contacts
  static Future<List<ContactUser>> getAllData() async {
    var data = await collection().get();
    return data.docs.map((e) {
      ContactUser contact = e.data();
      contact.id = e.id; 
      return contact;
    }).toList();
  }
}