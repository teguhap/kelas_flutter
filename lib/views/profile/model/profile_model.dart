class ProfileModel {
  String? username;
  String? contact;
  String? birthDate;
  String? address;
  String? image;

  ProfileModel(
      {this.username, this.contact, this.birthDate, this.address, this.image});

  factory ProfileModel.fromJson(Map<String, dynamic> json) => ProfileModel(
        username: json["username"],
        contact: json["contact"],
        birthDate: json["birth_date"],
        address: json["address"],
        image: json["image"],
      );

  Map<String, dynamic> toJson() => {
        "username": username,
        "contact": contact,
        "birth_date": birthDate,
        "address": address,
        "image": image,
      };
}
