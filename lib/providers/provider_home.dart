import 'package:flutter/cupertino.dart';
import 'package:machine_test_kozhikode/apis/apis_home.dart';
import 'package:machine_test_kozhikode/models/student_model.dart';

class ProviderHome with ChangeNotifier{

  StudentModel? studentModel;
  bool isstudentLoasding=true;

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

}
