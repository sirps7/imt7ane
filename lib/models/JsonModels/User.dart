// To parse this JSON data, do
//
//     final user = userFromMap(jsonString);

import 'dart:convert';

class User {
  User({
    required this.token,
    required this.account,
    required this.profileOut,
  });

  Token token;
  Account account;
  ProfileOut profileOut;

  factory User.fromJson(String str) => User.fromMap(json.decode(str));

  String toJson() => json.encode(toMap());

  factory User.fromMap(Map<String, dynamic> json) => User(
    token: Token.fromMap(json["token"]),
    account: Account.fromMap(json["account"]),
    profileOut: ProfileOut.fromMap(json["profile_out"]),
  );

  Map<String, dynamic> toMap() => {
    "token": token.toMap(),
    "account": account.toMap(),
    "profile_out": profileOut.toMap(),
  };
}

class Account {
  Account({
    required this.email,
  });

  String email;

  factory Account.fromJson(String str) => Account.fromMap(json.decode(str));

  String toJson() => json.encode(toMap());

  factory Account.fromMap(Map<String, dynamic> json) => Account(
    email: json["email"],
  );

  Map<String, dynamic> toMap() => {
    "email": email,
  };
}

class ProfileOut {
  ProfileOut({
    required this.name,
    required this.gender,
    required this.stage,
    required this.id,
  });

  String name;
  String gender;
  Stage stage;
  int id;

  factory ProfileOut.fromJson(String str) => ProfileOut.fromMap(json.decode(str));

  String toJson() => json.encode(toMap());

  factory ProfileOut.fromMap(Map<String, dynamic> json) => ProfileOut(
    name: json["name"],
    gender: json["gender"],
    stage: Stage.fromMap(json["stage"]),
    id: json["id"],
  );

  Map<String, dynamic> toMap() => {
    "name": name,
    "gender": gender,
    "stage": stage.toMap(),
    "id": id,
  };
}

class Stage {
  Stage({
    required this.stages,
    required this.type,
    required this.id,
  });

  String stages;
  String type;
  int id;

  factory Stage.fromJson(String str) => Stage.fromMap(json.decode(str));

  String toJson() => json.encode(toMap());

  factory Stage.fromMap(Map<String, dynamic> json) => Stage(
    stages: json["stages"],
    type: json["type"],
    id: json["id"],
  );

  Map<String, dynamic> toMap() => {
    "stages": stages,
    "type": type,
    "id": id,
  };
}

class Token {
  Token({
    required this.access,
  });

  String access;

  factory Token.fromJson(String str) => Token.fromMap(json.decode(str));

  String toJson() => json.encode(toMap());

  factory Token.fromMap(Map<String, dynamic> json) => Token(
    access: json["access"],
  );

  Map<String, dynamic> toMap() => {
    "access": access,
  };
}
