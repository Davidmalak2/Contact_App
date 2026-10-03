class ContactUser {
  String? id;
  String? name;
  String? phone;

  ContactUser({
    this.id,
    required this.name,
    required this.phone,
  });

  Map<String, dynamic> toJson() {
    return {
      "name": name,
      "phone": phone,
      "id": id,
    };
  }

  ContactUser.fromJson(Map<String, dynamic> json) {
    name = json["name"];
    phone = json["phone"];
    id = json["id"];
  }
}