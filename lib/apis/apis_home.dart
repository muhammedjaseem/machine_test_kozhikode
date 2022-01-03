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
Future<StudentDet?>getStudentDet(id)async{
  try {
    var url = Uri.parse('https://hamon-interviewapi.herokuapp.com/students/$id?api_key=5b4DB');
    var response = await http.get(url);
    if (response.statusCode == 200) {
      print(response.body);
      return StudentDet.fromJson(jsonDecode(response.body));
    } else {
      print(response.statusCode.toString());
    }
  } catch (e) {
    print("Get student Details error");
  }
}



getSubjects()async{
  try {
    var url = Uri.parse('https://hamon-interviewapi.herokuapp.com/subjects?api_key=5b4DB');
    var response = await http.get(url);
    if (response.statusCode == 200) {
      Map<String,dynamic> res=jsonDecode(response.body);
      List<dynamic>rep=res['subjects'];
      return rep;
    } else {
      print(response.statusCode.toString());
    }
  } catch (e) {
    print("Get student error");
  }
}
getSubjectDet(id)async{
  try {
    var url = Uri.parse('https://hamon-interviewapi.herokuapp.com/subjects/$id?api_key=5b4DB');
    var response = await http.get(url);
    if (response.statusCode == 200) {
      Map<String,dynamic> res=jsonDecode(response.body);
      print(res);
      return res;
    } else {
      print(response.statusCode.toString());
    }
  } catch (e) {
    print("Get student error");
  }
}


getClassroom()async{
  try {
    var url = Uri.parse('https://hamon-interviewapi.herokuapp.com/classrooms?api_key=5b4DB');
    var response = await http.get(url);
    if (response.statusCode == 200) {
      Map<String,dynamic> res=jsonDecode(response.body);
      List<dynamic>rep=res['classrooms'];
      print(res);
      return rep;
    } else {
      print(response.statusCode.toString());
    }
  } catch (e) {
    print("Get student error");
  }
}
getClassroomtDet(id)async{
  try {
    var url = Uri.parse('https://hamon-interviewapi.herokuapp.com/classrooms/$id?api_key=5b4DB');
    var response = await http.get(url);
    if (response.statusCode == 200) {
      Map<String,dynamic> res=jsonDecode(response.body);
      print(res);
      return res;
    } else {
      print(response.statusCode.toString());
    }
  } catch (e) {
    print("Get student error");
  }
}
