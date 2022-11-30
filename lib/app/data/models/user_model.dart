import 'package:social_media_network/app/domain/entities/user_entity.dart';

class UserModel extends UserEntity {
  const UserModel(
      {super.userId,
      super.userName,
      super.firstName,
      super.lastName,
      super.bioInfo,
      super.address,
      super.locationAddress,
      super.dataOfBirth,
      super.email,
      super.password,
      super.phone,
      super.image,
      super.gender,
      super.active});

  factory UserModel.fromJson(Map<String, dynamic> data) {
    return UserModel(
      userId: data["id"],
      userName: data["userName"],
      firstName: data["firstName"],
      lastName: data["lastName"],
      email: data["email"],
      phone: data["phoneNumber"],
      gender: data["sex"],
      active: data["active"],
    );
  }
  static Map<String, dynamic> toJson(UserEntity model) {
    return {
      "userName": model.userName,
      "firstName": model.firstName,
      "lastName": model.lastName,
      "email": model.email,
      "passwordHash": model.password,
      "phoneNumber": model.phone,
      "sex": model.gender,
    };
  }
}
