import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:machine_test_kozhikode/providers/provider_home.dart';
import 'package:machine_test_kozhikode/widgets%20and%20helpers/CustomText.dart';
import 'package:provider/provider.dart';
class StudentDetails extends StatelessWidget {
  const StudentDetails({Key? key}) : super(key: key);

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
                     title: CustomText(text: '${data.studentDet?.email}',size: 16),)
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
