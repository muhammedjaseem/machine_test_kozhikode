import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:machine_test_kozhikode/providers/provider_home.dart';
import 'package:provider/provider.dart';
class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
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
            Center(child: Text("STUDENTS",style: GoogleFonts.poppins(fontSize: 30,wordSpacing: 2,fontWeight: FontWeight.bold),)),
            Expanded(
              child: Consumer<ProviderHome>(builder:(context,data,child){
                return data.isstudentLoasding ==false?ListView.builder(
                  itemCount: data.studentModel?.students?.length,
                    itemBuilder: (context,index){
                  return ListTile(
                    leading: Text(
                      '${data.studentModel?.students?[index].name}'
                    ),
                    title: Text(
                        '${data.studentModel?.students?[index].name}'
                    ),
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
