class ProfileModel {
  final String id;
  final String name;
  final String phone;
  final String email;
  final String address;
  final String image;

  ProfileModel({
    required this.id,
    required this.name,
    required this.phone,
    required this.email,
    required this.address,
    required this.image,
  });

  factory ProfileModel.fromJson(Map<String, dynamic> json) {
    return ProfileModel(
      id: json['_id'],
      name: json['name'],
      phone: json['phone'],
      email: json['email'],
      address: json['address'],
      image: json['image'],
    );
  }
}


/*
{
    "message": {
        "_id": "69e94e0ddd023b6995c9ddf4",
        "name": "malak",
        "phone": "01010039770",
        "email": "malak@gmail.com",
        "address": "not added",
        "image": "http://supermarket-dan1.onrender.com/api/v1/portfolio/simple.jpg"
    }
}

 */