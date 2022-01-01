import 'package:flutter/cupertino.dart';
import 'package:machine_test_kozhikode/apis/apis_home.dart';
import 'package:machine_test_kozhikode/models/student_model.dart';

class ProviderHome with ChangeNotifier{

  StudentModel? studentModel;
  bool isstudentLoasding=true;
  StudentDet? studentDet;
  bool isdetloading=true;
  var subjects;
  bool isSubjectloading=true;
  var subjectDet;
  bool issbjectDetLoading=true;


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
}
