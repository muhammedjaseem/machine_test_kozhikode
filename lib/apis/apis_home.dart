import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:machine_test_kozhikode/models/student_model.dart';
import 'package:http/http.dart' as http;
import '../app_config.dart';


Future<StudentModel?>getStudent()async{
  try {
    var url = Uri.parse('https://hamon-interviewapi.herokuapp.com/students/?api_key=5b4DB');
    var response = await http.get(url);
    if (response.statusCode == 200) {
      print(response.body);
      return StudentModel.fromJson(jsonDecode(response.body));
    } else {
      print(response.statusCode.toString());
    }
  } catch (e) {
    print("Get student error");
  }
}