// To parse this JSON data, do
//
//     final welcome = welcomeFromJson(jsonString);

import 'dart:convert';

StudentModel welcomeFromJson(String str) => StudentModel.fromJson(json.decode(str));

String welcomeToJson(StudentModel data) => json.encode(data.toJson());

class StudentModel {
  StudentModel({
    this.students,
  });

  List<Student>? students;

  factory StudentModel.fromJson(Map<String, dynamic> json) => StudentModel(
    students: json["students"] == null ? null : List<Student>.from(json["students"].map((x) => Student.fromJson(x))),
  );

  Map<String, dynamic> toJson() => {
    "students": students == null ? null : List<dynamic>.from(students!.map((x) => x.toJson())),
  };
}

class Student {
  Student({
    this.age,
    this.email,
    this.id,
    this.name,
  });

  int? age;
  String? email;
  int? id;
  String? name;

  factory Student.fromJson(Map<String, dynamic> json) => Student(
    age: json["age"] == null ? null : json["age"],
    email: json["email"] == null ? null : json["email"],
    id: json["id"] == null ? null : json["id"],
    name: json["name"] == null ? null : json["name"],
  );

  Map<String, dynamic> toJson() => {
    "age": age == null ? null : age,
    "email": email == null ? null : email,
    "id": id == null ? null : id,
    "name": name == null ? null : name,
  };
}
