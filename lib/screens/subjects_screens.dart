import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:machine_test_kozhikode/providers/provider_home.dart';
import 'package:machine_test_kozhikode/screens/subject_details.dart';
import 'package:machine_test_kozhikode/widgets%20and%20helpers/CustomText.dart';
import 'package:provider/provider.dart';
class SubjectsScreen extends StatefulWidget {
  const SubjectsScreen({Key? key}) : super(key: key);

  @override
  State<SubjectsScreen> createState() => _SubjectsScreenState();
}

class _SubjectsScreenState extends State<SubjectsScreen> {
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
  }
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(

        body: Column(
          children: [
            SizedBox(height: 20,),
            Consumer<ProviderHome>(builder:(context,data,child){
              if (data.isSubjectloading ==false) {
                //List<dynamic>rep=data.subjects['subjects'];
                return ListView.builder(
                  shrinkWrap: true,
                  physics: const BouncingScrollPhysics(),
                  itemCount: data.subjects.length,
                  itemBuilder: (context,index){
                    return Column(
                      children: [
                        ListTile(
                          onTap: (){
                            data.getSubjectDetails(data.subjects[index]['id']);
                            Navigator.push(context, MaterialPageRoute(builder: (context)=>SubjectDetails()));
                          },
                          style: ListTileStyle.drawer,
                          leading: Text(
                              '${data.subjects[index]['id']}.'
                          ),
                          title: Text(
                              '${data.subjects[index]['name']}.'
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
