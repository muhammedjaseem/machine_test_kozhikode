import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:machine_test_kozhikode/providers/provider_home.dart';
import 'package:machine_test_kozhikode/widgets%20and%20helpers/CustomText.dart';
import 'package:provider/provider.dart';
class StudentDetails extends StatefulWidget {
  const StudentDetails({Key? key}) : super(key: key);

  @override
  State<StudentDetails> createState() => _StudentDetailsState();
}

class _StudentDetailsState extends State<StudentDetails> {
  String? selectedClassroom;
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.white,
          elevation: 0.1,
          leading: IconButton(
          onPressed: (){
            Navigator.pop(context);
          },
          icon: Icon(Icons.arrow_back_ios,color: Colors.black
            ,),
        ),),
        body: Consumer<ProviderHome>(builder: (context,data,child){
          return data.isdetloading ==false?Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              const SizedBox(height: 20,),
              CustomText(text: "DETAILS",size: 30,color: Colors.amber,),
              Padding(
                padding: const EdgeInsets.only(left: 10,right: 10,top: 20),
                child: Card(
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                     ListTile(leading: CustomText(text: 'Name:',size: 22,),
                     dense: true,
                     title: CustomText(text: '${data.studentDet?.name}',size: 22,color: Colors.red,),),
                      ListTile(leading: CustomText(text: 'Age:',size: 18,),
                        dense: true,
                        title: CustomText(text: '${data.studentDet?.age}',size: 18),),
                    ListTile(
                      dense: true,
                      leading: CustomText(text: 'Email:',size: 16,),
                     title: CustomText(text: '${data.studentDet?.email}',size: 16),),
                      CustomText(text: "Assign a Classroom"),
                      ClipRRect(
                        borderRadius: BorderRadius.circular(6),
                        child: Container(
                          height: 50,
                          width: MediaQuery.of(context).size.width,
                          margin: EdgeInsets.only(left: 20,right: 20,bottom: 20),
                          decoration: BoxDecoration(
                              border: Border.all(color: Colors.black54),
                              borderRadius: BorderRadius.circular(7),
                              color: Colors.yellow),
                          child: Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: DropdownButton(
                                value: selectedClassroom,
                                isExpanded: true,
                                underline: Container(),
                                hint: const Text(
                                  'Assign a Classroom',
                                  style: TextStyle(),
                                ),
                                items: [
                                  for (var i = 0;
                                  i < data.subjects.length;
                                  i++)
                                    DropdownMenuItem(
                                      child: Text(data.clasrooms[i]['name']),
                                      value: data.clasrooms[i]['name'],
                                    )
                                ],
                                onChanged: (value) {
                                  setState(() {
                                    selectedClassroom =value.toString();
                                  });
                                }),
                          ),
                        ),
                      ),
                      SizedBox(
                          height: 40,
                          width: 100,
                          child: ElevatedButton(onPressed: (){
                            for (var i = 0;
                            i < data.subjects.length;
                            i++) {
                              if(selectedClassroom ==data.clasrooms[i]['name'] && data.classroomdetails !=null){
                                print(data.subjects[i]['name']);
                                data.assignClassroom(data.studentDet?.id.toString(), data.subjects[i]['id']);
                              }
                            }

                          }, child: CustomText(text: "Assign",color: Colors.white,))),
                      SizedBox(height: 20,)
                    ],
                  ),
                ),
              ),
            ],
          ):CupertinoActivityIndicator();
        })
      ),
    );
  }
}
