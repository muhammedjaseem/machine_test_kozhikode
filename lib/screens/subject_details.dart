import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:machine_test_kozhikode/providers/provider_home.dart';
import 'package:machine_test_kozhikode/widgets%20and%20helpers/CustomText.dart';
import 'package:provider/provider.dart';
class SubjectDetails extends StatelessWidget {
  const SubjectDetails({Key? key}) : super(key: key);

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
            return data.issbjectDetLoading ==false?Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                const SizedBox(height: 20,),
                CustomText(text: "SUBJECT DETAILS",size: 30,color: Colors.amber,),
                Padding(
                  padding: const EdgeInsets.only(left: 10,right: 10,top: 20),
                  child: Card(
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        ListTile(leading: CustomText(text: 'ID:',size: 20,),
                          dense: true,
                          title: CustomText(text: '${data.subjectDet['id']}',size: 22,),),
                        ListTile(leading: CustomText(text: 'Subject Name:',size: 18,),
                          dense: true,
                          title: CustomText(text: '${data.subjectDet['name']}',size: 18,color: Colors.red),),
                        ListTile(
                          dense: true,
                          leading: CustomText(text: 'Teacher:',size: 16,),
                          title: CustomText(text: '${data.subjectDet['teacher']}',size: 16,color: Colors.red),)
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
