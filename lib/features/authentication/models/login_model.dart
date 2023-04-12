import 'dart:convert';

LoginModel loginModelFromJson(String str) =>
    LoginModel.fromJson(json.decode(str));

String loginModelToJson(LoginModel data) => json.encode(data.toJson());

class LoginModel {
  LoginModel({
    required this.status,
    required this.accessToken,
    required this.tokenType,
    required this.data,
  });

  final LoginModelStatus status;
  final String accessToken;
  final String tokenType;
  final Data data;

  factory LoginModel.fromJson(Map<String, dynamic> json) => LoginModel(
        status: LoginModelStatus.fromJson(json["status"]),
        accessToken: json["access_token"],
        tokenType: json["token_type"],
        data: Data.fromJson(json["data"]),
      );

  Map<String, dynamic> toJson() => {
        "status": status.toJson(),
        "access_token": accessToken,
        "token_type": tokenType,
        "data": data.toJson(),
      };
}

class Data {
  Data({
    required this.id,
    required this.email,
    required this.hp,
    required this.firstname,
    required this.lastname,
    required this.grup,
    required this.tglLahir,
    required this.jenisKelamin,
    required this.referralCode,
    required this.status,
    required this.accountStatus,
  });

  final int id;
  final String email;
  final String hp;
  final String firstname;
  final String lastname;
  final String grup;
  final dynamic tglLahir;
  final dynamic jenisKelamin;
  final String referralCode;
  final AccountStatusClass status;
  final AccountStatusClass accountStatus;

  factory Data.fromJson(Map<String, dynamic> json) => Data(
        id: json["id"],
        email: json["email"],
        hp: json["hp"],
        firstname: json["firstname"],
        lastname: json["lastname"],
        grup: json["grup"],
        tglLahir: json["tgl_lahir"],
        jenisKelamin: json["jenis_kelamin"],
        referralCode: json["referral_code"],
        status: AccountStatusClass.fromJson(json["status"]),
        accountStatus: AccountStatusClass.fromJson(json["account_status"]),
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "email": email,
        "hp": hp,
        "firstname": firstname,
        "lastname": lastname,
        "grup": grup,
        "tgl_lahir": tglLahir,
        "jenis_kelamin": jenisKelamin,
        "referral_code": referralCode,
        "status": status.toJson(),
        "account_status": accountStatus.toJson(),
      };
}

class AccountStatusClass {
  AccountStatusClass({
    required this.kode,
    required this.keterangan,
  });

  final int kode;
  final String keterangan;

  factory AccountStatusClass.fromJson(Map<String, dynamic> json) =>
      AccountStatusClass(
        kode: json["kode"],
        keterangan: json["keterangan"],
      );

  Map<String, dynamic> toJson() => {
        "kode": kode,
        "keterangan": keterangan,
      };
}

class LoginModelStatus {
  LoginModelStatus({
    required this.kode,
    required this.keterangan,
  });

  final String kode;
  final String keterangan;

  factory LoginModelStatus.fromJson(Map<String, dynamic> json) =>
      LoginModelStatus(
        kode: json["kode"],
        keterangan: json["keterangan"],
      );

  Map<String, dynamic> toJson() => {
        "kode": kode,
        "keterangan": keterangan,
      };
}
