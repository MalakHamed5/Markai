import '../../../../core/api/urls.dart';

class UserModel {
  final String name;
  final String phone;
  final String email;
  final String address;
  final String image;

  UserModel({required this.name, required this.phone, required this.email, required this.address, required this.image}); 
  


  factory UserModel.fromJson(Map<String , dynamic> json){
    return UserModel(
      name: json[ApiKeys.name] ?? '',
      phone: json[ApiKeys.phone] ?? '',
      email: json[ApiKeys.email] ?? '',
      address: json[ApiKeys.address] ?? '',
      image: json[ApiKeys.image] ?? '',
    );
  }

 Map<String , dynamic> toJson(){
    return {
      ApiKeys.name: name,
      ApiKeys.phone: phone,
      ApiKeys.email: email,
      ApiKeys.address: address,
      ApiKeys.image: image,
    };
  }
}
