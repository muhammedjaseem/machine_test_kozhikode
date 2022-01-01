import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:machine_test_kozhikode/providers/provider_home.dart';
import 'package:machine_test_kozhikode/screens/subject_details.dart';
import 'package:machine_test_kozhikode/widgets%20and%20helpers/CustomText.dart';
import 'package:provider/provider.dart';
class ClassRoomScreen extends StatefulWidget {
  const ClassRoomScreen({Key? key}) : super(key: key);

  @override
  _ClassRoomScreenState createState() => _ClassRoomScreenState();
}

class _ClassRoomScreenState extends State<ClassRoomScreen> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(

        body: Column(
          children: [
            Padding(
              padding: const EdgeInsets.only(top: 20,bottom: 20),
              child: CustomText(text: "SUBJECTS",color: Colors.yellow,size: 30,weight: FontWeight.w600,),
            ),
            Consumer<ProviderHome>(builder:(context,data,child){
              if (data.isSubjectloading ==false) {
                List<dynamic>rep=data.subjects['subjects'];
                return ListView.builder(
                    shrinkWrap: true,
                    physics: BouncingScrollPhysics(),
                    itemCount: rep.length,
                    itemBuilder: (context,index){
                      return Column(
                        children: [
                          ListTile(
                            onTap: (){
                              data.getSubjectDetails(rep[index]['id']);
                              Navigator.push(context, MaterialPageRoute(builder: (context)=>SubjectDetails()));
                            },
                            style: ListTileStyle.drawer,
                            leading: Text(
                                '${rep[index]['id']}.'
                            ),
                            title: Text(
                                '${rep[index]['name']}.'
                            ),
                          ),
                          Divider(),
                        ],
                      );
                    });
              } else {
                return const CupertinoActivityIndicator();
              }
            }),
          ],
        ),
      ),
    );
  }
}
