class UserEntity {
  final String? userId,
      userName,
      firstName,
      lastName,
      bioInfo,
      address,
      locationAddress,
      dataOfBirth,
      email,
      password,
      phone,
      image;
  final bool? gender, active;
  const UserEntity({
    this.userId,
    this.userName,
    this.firstName,
    this.lastName,
    this.bioInfo,
    this.address,
    this.locationAddress,
    this.dataOfBirth,
    this.email,
    this.password,
    this.phone,
    this.image,
    this.gender,
    this.active,
  });
}
