// class RegisterRequest {
//   String countryMobileCode;
//   String userName;
//   String email;
//   String password;
//   String profilePicture;
//   String mobileNumber;

//   RegisterRequest(this.countryMobileCode, this.userName, this.email,
//       this.password, this.profilePicture, this.mobileNumber);
// }

class LoginRequest {
  LoginRequest({
    required this.mobileNumber,
    required this.otp,
  });
  late final String mobileNumber;
  late final String otp;

  LoginRequest.fromJson(Map<String, dynamic> json) {
    mobileNumber = json['mobileNumber'];
    otp = json['otp'];
  }

  Map<String, dynamic> toJson() {
    final _data = <String, dynamic>{};
    _data['mobileNumber'] = mobileNumber;
    _data['otp'] = otp;
    return _data;
  }
}

class LoginOtpRequest {
  LoginOtpRequest({required this.mobileNumber});
  late final String mobileNumber;

  LoginOtpRequest.fromJson(Map<String, dynamic> json) {
    mobileNumber = json['mobileNumber'];
  }

  Map<String, dynamic> toJson() {
    final _data = <String, dynamic>{};
    _data['mobileNumber'] = mobileNumber;
    return _data;
  }
}
