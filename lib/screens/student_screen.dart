import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:machine_test_kozhikode/providers/provider_home.dart';
import 'package:machine_test_kozhikode/screens/student_details.dart';
import 'package:provider/provider.dart';
class StudentScreen extends StatefulWidget {
  const StudentScreen({Key? key}) : super(key: key);

  @override
  State<StudentScreen> createState() => _StudentScreenState();
}

class _StudentScreenState extends State<StudentScreen> {
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    Provider.of<ProviderHome>(context,listen: false).getStudentData();
  }
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            SizedBox(height: 20,),
            Expanded(
              child: Consumer<ProviderHome>(builder:(context,data,child){
                return data.isstudentLoasding ==false?ListView.builder(
                  shrinkWrap: true,
                  physics: BouncingScrollPhysics(),
                  itemCount: data.studentModel?.students?.length,
                    itemBuilder: (context,index){
                  return Column(
                    children: [
                      ListTile(
                        onTap: (){
                          data.getStudentDetail(data.studentModel?.students?[index].id);
                          Navigator.push(context, MaterialPageRoute(builder: (context)=>StudentDetails()));
                        },
                        style: ListTileStyle.drawer,
                        leading: Text(
                          '${data.studentModel?.students?[index].id}.'
                        ),
                        title: Text(
                            '${data.studentModel?.students?[index].name}'
                        ),
                      ),
                      Divider(),
                    ],
                  );
                }): const CupertinoActivityIndicator();
              }),
            )
          ],
        )
      ),
    );
  }
}
