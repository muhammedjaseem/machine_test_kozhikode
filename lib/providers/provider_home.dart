import 'dart:convert';

import 'package:flutter/cupertino.dart';
import 'package:http/http.dart';
import 'package:machine_test_kozhikode/apis/apis_home.dart';
import 'package:machine_test_kozhikode/models/student_model.dart';
import 'package:http/http.dart' as http;
class ProviderHome with ChangeNotifier{

  StudentModel? studentModel;
  bool isstudentLoasding=true;
  StudentDet? studentDet;
  bool isdetloading=true;
  var subjects;
  bool isSubjectloading=true;
  var subjectDet,clasrooms,classroomdetails;
  bool issbjectDetLoading=true,isclassroomsloading= true,isclassroomdetailsloading=true;


  Future<void>getStudentData()async{
    try{
      isstudentLoasding =false;
      studentModel =await getStudent();
    }
    catch(e){
      isstudentLoasding =true;
      print(e);
    }
    notifyListeners();
  }
  Future<void>getStudentDetail(id)async{
    try{
      isdetloading =false;
      studentDet =await getStudentDet(id);
    }
    catch(e){
      isdetloading =true;
      print(e);
    }
    notifyListeners();
  }
  Future<void>getSubject()async{
    try{
      isSubjectloading =false;
      subjects =await getSubjects();
    }
    catch(e){
      isSubjectloading =true;
      print(e);
    }
    notifyListeners();
  }
  Future<void>getSubjectDetails(id)async{
    try{
      issbjectDetLoading =false;
      subjectDet =await getSubjectDet(id);
    }
    catch(e){
      issbjectDetLoading =true;
      print(e);
    }
    notifyListeners();
  }
  Future<void>getClassrooms()async{
    try{
      isclassroomsloading =false;
      clasrooms =await getClassroom();
    }
    catch(e){
      isclassroomsloading =true;
      print(e);
    }
    notifyListeners();
  }
  Future<void>getClassroomDetails(id)async{
    try{
      isclassroomdetailsloading =false;
      classroomdetails =await getClassroomtDet(id);
    }
    catch(e){
      isclassroomdetailsloading =true;
      print(e);
    }
    notifyListeners();
  }

  Future<Response?>assignSubjet(classroomid,subjectid)async{
    print(classroomid.toString() +subjectid.toString());
    try {
      var url = Uri.parse('https://hamon-interviewapi.herokuapp.com/classrooms/$classroomid?api_key=5b4DB');
      var response = await http.patch(url,body: {
        "subject":subjectid.toString()
      });
      if (response.statusCode == 200) {
        print(response.body);
        getClassroomDetails(classroomid);
        return Response(response.body, 200);
      } else {
        print(response.statusCode.toString());
      }
    } catch (e) {
      print("Assign error");
    }
    notifyListeners();
  }
}