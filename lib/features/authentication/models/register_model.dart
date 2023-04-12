import 'dart:convert';

RegisterModel registerModelFromJson(String str) =>
    RegisterModel.fromJson(json.decode(str));

String registerModelToJson(RegisterModel data) => json.encode(data.toJson());

class RegisterModel {
  RegisterModel({
    required this.status,
    required this.data,
  });

  final RegisterModelStatus status;
  final Data data;

  factory RegisterModel.fromJson(Map<String, dynamic> json) => RegisterModel(
        status: RegisterModelStatus.fromJson(json["status"]),
        data: Data.fromJson(json["data"]),
      );

  Map<String, dynamic> toJson() => {
        "status": status.toJson(),
        "data": data.toJson(),
      };
}

class Data {
  Data({
    required this.email,
    required this.hp,
    required this.firstname,
    required this.lastname,
    required this.grup,
    required this.role,
    required this.tglLahir,
    required this.jenisKelamin,
    required this.id,
    required this.status,
    required this.accountStatus,
  });

  final String email;
  final String hp;
  final String firstname;
  final String lastname;
  final String grup;
  final String role;
  final DateTime tglLahir;
  final int jenisKelamin;
  final int id;
  final AccountStatusClass status;
  final AccountStatusClass accountStatus;

  factory Data.fromJson(Map<String, dynamic> json) => Data(
        email: json["email"] ?? "",
        hp: json["hp"] ?? "",
        firstname: json["firstname"] ?? "",
        lastname: json["lastname"] ?? "",
        grup: json["grup"] ?? "",
        role: json["role"] ?? "",
        tglLahir: DateTime.parse(json["tgl_lahir"] ?? '2000-01-01'),
        jenisKelamin: json["jenis_kelamin"] ?? 1,
        id: json["id"] ?? 0,
        status: AccountStatusClass.fromJson(json["status"]),
        accountStatus:
            AccountStatusClass.fromJson(json["account_status"] ?? {}),
      );

  Map<String, dynamic> toJson() => {
        "email": email,
        "hp": hp,
        "firstname": firstname,
        "lastname": lastname,
        "grup": grup,
        "role": role,
        "tgl_lahir":
            "${tglLahir.year.toString().padLeft(4, '0')}-${tglLahir.month.toString().padLeft(2, '0')}-${tglLahir.day.toString().padLeft(2, '0')}",
        "jenis_kelamin": jenisKelamin,
        "id": id,
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
        kode: json["kode"] ?? 0,
        keterangan: json["keterangan"] ?? '',
      );

  Map<String, dynamic> toJson() => {
        "kode": kode,
        "keterangan": keterangan,
      };
}

class RegisterModelStatus {
  RegisterModelStatus({
    required this.kode,
    required this.keterangan,
  });

  final String kode;
  final String keterangan;

  factory RegisterModelStatus.fromJson(Map<String, dynamic> json) =>
      RegisterModelStatus(
        kode: json["kode"],
        keterangan: json["keterangan"],
      );

  Map<String, dynamic> toJson() => {
        "kode": kode,
        "keterangan": keterangan,
      };
}
