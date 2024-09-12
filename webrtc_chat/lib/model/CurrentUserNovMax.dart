import 'dart:convert';

CurrentUserNovMax CurrentUserNovMaxFromJson(String str) =>
    CurrentUserNovMax.fromJson(json.decode(str));

String CurrentUserNovMaxToJson(CurrentUserNovMax data) => json.encode(data.toJson());

class CurrentUserNovMax {
  CurrentUserNovMax({
    this.status,
    this.message,
    this.errMessage,
    this.tokenType,
    this.accessToken,
    this.type,
    this.both,
    this.user,
    this.orgs,
    this.address,
    this.brandOrg,
  });

  int? status;
  String? message;
  String? errMessage;
  String? tokenType;
  String? accessToken;
  String? type;
  int? both;
  User? user;
  List<Org>? orgs;
  Address? address;
  BrandOrg? brandOrg;

  factory CurrentUserNovMax.fromJson(Map<String, dynamic> json) => CurrentUserNovMax(
        status: json["status"] == null ? null : json["status"],
        message: json["message"] == null ? null : json["message"],
        errMessage: json["err_message"] == null ? null : json["err_message"],
        tokenType: json["token_type"] == null ? null : json["token_type"],
        accessToken: json["access_token"] == null ? null : json["access_token"],
        type: json["type"] == null ? null : json["type"],
        both: json["both"] == null ? null : json["both"],
        user: json["user"] == null ? null : User.fromJson(json["user"]),
        orgs: json["orgs"] == null
            ? null
            : List<Org>.from(json["orgs"].map((x) => Org.fromJson(x))),
        address:
            json["address"] == null ? null : Address.fromJson(json["address"]),
        brandOrg: json["brand_org"] == null
            ? null
            : BrandOrg.fromJson(json["brand_org"]),
      );

  Map<String, dynamic> toJson() => {
        "status": status == null ? null : status,
        "message": message == null ? null : message,
        "err_message": errMessage == null ? null : errMessage,
        "token_type": tokenType == null ? null : tokenType,
        "access_token": accessToken == null ? null : accessToken,
        "type": type == null ? null : type,
        "both": both == null ? null : both,
        "user": user == null ? null : user!.toJson(),
        "orgs": orgs == null
            ? null
            : List<dynamic>.from(orgs!.map((x) => x.toJson())),
        "address": address == null ? null : address!.toJson(),
        "brand_org": brandOrg == null ? null : brandOrg!.toJson(),
      };
}

class Address {
  Address({
    this.id,
    this.fullAddress,
  });

  int? id;
  String? fullAddress;

  factory Address.fromJson(Map<String, dynamic> json) => Address(
        id: json["id"] == null ? null : json["id"],
        fullAddress: json["full_address"] == null ? null : json["full_address"],
      );

  Map<String, dynamic> toJson() => {
        "id": id == null ? null : id,
        "full_address": fullAddress == null ? null : fullAddress,
      };
}

class Org {
  Org({
    this.name,
    this.code,
  });

  String? name;
  String? code;

  factory Org.fromJson(Map<String, dynamic> json) => Org(
        name: json["name"] == null ? null : json["name"],
        code: json["code"] == null ? null : json["code"],
      );

  Map<String, dynamic> toJson() => {
        "name": name == null ? null : name,
        "code": code == null ? null : code,
      };
}

class User {
  User({
    this.name,
    this.id,
    this.username,
    this.dob,
    this.cover,
    this.mobile,
    this.email,
    this.anniversaryAt,
    this.gender,
  });

  String? name;
  String? id;
  String? username;
  String? dob;
  String? cover;
  String? mobile;
  String? email;
  String? anniversaryAt;
  dynamic? gender;

  factory User.fromJson(Map<String, dynamic> json) => User(
        name: json["name"] == null ? null : json["name"],
        id: json["id"] == null ? null : json["id"],
        username: json["username"] == null ? null : json["username"],
        dob: json["dob"] == null ? null : json["dob"],
        cover: json["cover"] == null ? null : json["cover"],
        mobile: json["mobile"] == null ? null : json["mobile"],
        email: json["email"] == null ? null : json["email"],
        anniversaryAt:
            json["anniversary_at"] == null ? null : json["anniversary_at"],
        gender: json["gender"],
      );

  Map<String, dynamic> toJson() => {
        "name": name == null ? null : name,
        "id": id == null ? null : id,
        "username": username == null ? null : username,
        "dob": dob == null ? null : dob,
        "cover": cover == null ? null : cover,
        "mobile": mobile == null ? null : mobile,
        "email": email == null ? null : email,
        "anniversary_at": anniversaryAt == null ? null : anniversaryAt,
        "gender": gender,
      };
}

class BrandOrg {
  BrandOrg({
    this.name,
    this.code,
    this.cover,
    this.color,
  });

  String? name;
  String? code;
  String? cover;
  String? color;

  factory BrandOrg.fromJson(Map<String, dynamic> json) => BrandOrg(
        name: json["name"] == null ? null : json["name"],
        code: json["code"] == null ? null : json["code"],
        cover: json["cover"] == null ? null : json["cover"],
        color: json["color"] == null ? null : json["color"],
      );

  Map<String, dynamic> toJson() => {
        "name": name == null ? null : name,
        "code": code == null ? null : code,
        "cover": cover == null ? null : cover,
        "color": color == null ? null : color,
      };
}
