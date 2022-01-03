import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:machine_test_kozhikode/providers/provider_home.dart';
import 'package:machine_test_kozhikode/screens/subject_details.dart';
import 'package:machine_test_kozhikode/widgets%20and%20helpers/CustomText.dart';
import 'package:provider/provider.dart';

import 'classroom_details.dart';
class ClassRoomScreen extends StatefulWidget {
  const ClassRoomScreen({Key? key}) : super(key: key);

  @override
  _ClassRoomScreenState createState() => _ClassRoomScreenState();
}

class _ClassRoomScreenState extends State<ClassRoomScreen> {
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    Provider.of<ProviderHome>(context,listen: false).getClassrooms();
  }
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(

        body: Column(
          children: [
            SizedBox(height: 20,),
            Consumer<ProviderHome>(builder:(context,data,child){
              if (data.isclassroomsloading ==false || data.clasrooms !=null) {
              //  List<dynamic>rep=data.clasrooms['classrooms'];
                return ListView.builder(
                    shrinkWrap: true,
                    physics: BouncingScrollPhysics(),
                    itemCount: data.clasrooms.length ?? 0,
                    itemBuilder: (context,index){
                      return Column(
                        children: [
                          ListTile(
                            onTap: (){
                              data.getClassroomDetails(data.clasrooms[index]['id']);
                              Navigator.push(context, MaterialPageRoute(builder: (context)=>ClassRoomDetails()));
                            },
                            style: ListTileStyle.drawer,
                            leading: Text(
                                '${data.clasrooms[index]['id']}.'
                            ),
                            title: Text(
                                '${data.clasrooms[index]['name']}.'
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
