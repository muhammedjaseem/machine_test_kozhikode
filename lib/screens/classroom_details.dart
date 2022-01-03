import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:machine_test_kozhikode/providers/provider_home.dart';
import 'package:machine_test_kozhikode/widgets%20and%20helpers/CustomText.dart';
import 'package:provider/provider.dart';

class ClassRoomDetails extends StatefulWidget {
  const ClassRoomDetails({Key? key}) : super(key: key);

  @override
  State<ClassRoomDetails> createState() => _ClassRoomDetailsState();
}

class _ClassRoomDetailsState extends State<ClassRoomDetails> {
  String? selectedsubject;
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
          appBar: AppBar(
            backgroundColor: Colors.white,
            elevation: 0.1,
            leading: IconButton(
              onPressed: () {
                Navigator.pop(context);
              },
              icon: Icon(
                Icons.arrow_back_ios,
                color: Colors.black,
              ),
            ),
          ),
          body: Consumer<ProviderHome>(builder: (context, data, child) {
            if (data.isclassroomdetailsloading == false) {
              return Column(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  const SizedBox(
                    height: 20,
                  ),
                  CustomText(
                    text: "CLASS ROOM DETAILS",
                    size: 30,
                    color: Colors.amber,
                  ),
                  Padding(
                    padding:
                        const EdgeInsets.only(left: 10, right: 10, top: 20),
                    child: Card(
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          ListTile(
                            leading: CustomText(
                              text: 'ID:',
                              size: 20,
                            ),
                            dense: true,
                            title: CustomText(
                              text: '${data.classroomdetails?['id'] ?? ""}',
                              size: 22,
                            ),
                          ),
                          ListTile(
                            leading: CustomText(
                              text: 'Name:',
                              size: 18,
                            ),
                            dense: true,
                            title: CustomText(
                                text: '${data.classroomdetails?['name'] ?? ""}',
                                size: 18,
                                color: Colors.red),
                          ),
                          ListTile(
                            leading: CustomText(
                              text: 'Layout:',
                              size: 18,
                            ),
                            dense: true,
                            title: CustomText(
                                text: '${data.classroomdetails?['layout'] ??""}',
                                size: 18,
                                color: Colors.red),
                          ),
                          ListTile(
                            leading: CustomText(
                              text: 'Size:',
                              size: 18,
                            ),
                            dense: true,
                            title: CustomText(
                                text: '${data.classroomdetails?['size'] ?? ""}',
                                size: 18),
                          ),
                          ListTile(
                            dense: true,
                            leading: CustomText(
                              text: 'Subject:',
                              size: 16,
                            ),
                            title: CustomText(
                                text: '${data.classroomdetails?['subject'] ?? ""}',
                                size: 16,
                                color: Colors.red),
                          ),
                          CustomText(text: "Assign a Subject"),
                          ClipRRect(
                            borderRadius: BorderRadius.circular(6),
                            child: Container(
                              height: 50,
                              width: MediaQuery.of(context).size.width,
                              margin: const EdgeInsets.only(left: 20,right: 20,bottom: 20),
                              decoration: BoxDecoration(
                                  border: Border.all(color: Colors.black54),
                                  borderRadius: BorderRadius.circular(7),
                                  color: Colors.yellow),
                              child: Padding(
                                padding: const EdgeInsets.all(8.0),
                                child: DropdownButton(
                                    value: selectedsubject,
                                    isExpanded: true,
                                    underline: Container(),
                                    hint: const Text(
                                      'Assign a subject',
                                      style: TextStyle(),
                                    ),
                                    items: [
                                      for (var i = 0;
                                          i < data.subjects.length;
                                          i++)
                                        DropdownMenuItem(
                                          child: Text(data.subjects[i]['name']),
                                          value: data.subjects[i]['name'],
                                        )
                                    ],
                                    onChanged: (value) {
                                      setState(() {
                                        selectedsubject =value.toString();
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
                                i++)
                                if(selectedsubject ==data.subjects[i]['name']){
                                  print(data.subjects[i]['name']);
                                  data.assignSubjet(context,data.classroomdetails['id'], data.subjects[i]['id']);
                                }
                                  
                              }, child: CustomText(text: "Assign",color: Colors.white,))),
                        SizedBox(height: 20,)
                        ],
                      ),
                    ),
                  ),
                ],
              );
            } else {
              return CupertinoActivityIndicator();
            }
          })),
    );
  }
}
/*


ClipRRect(
                                                    borderRadius:
                                                        BorderRadius.circular(
                                                            6),
                                                    child: Container(
                                                      height:
                                                          size.height * 0.06,
                                                      width: size.width * 0.43,
                                                      decoration: BoxDecoration(
                                                          border: Border.all(
                                                              color: Colors
                                                                  .black54),
                                                          borderRadius:
                                                              BorderRadius
                                                                  .circular(7),
                                                          color: Colors.white),
                                                      child: Padding(
                                                        padding:
                                                            const EdgeInsets
                                                                .all(8.0),
                                                        child: DropdownButton(
                                                            value: selectedsize,
                                                            isExpanded: true,
                                                            underline:
                                                                Container(),
                                                            hint: Text(
                                                              'Choose size',
                                                              style:
                                                                  TextStyle(),
                                                            ),
                                                            items: [
                                                              for (var i = 0;
                                                                  i < arr2.length;
                                                                  i++)
                                                                DropdownMenuItem(
                                                                  child: Text(
                                                                      arr2[i]
                                                                          .size),
                                                                  value: arr2[i]
                                                                      .size,
                                                                )
                                                            ],
                                                            onChanged: (value) {
                                                              setState(() {
                                                                selectedsize =
                                                                    value;
                                                              });
                                                            }),
                                                      ),
                                                    ),
                                                  )

*/
/*
 Container(
                      height: 43,
                      width: 110,
                      margin: EdgeInsets.all(0),
                      padding: EdgeInsets.only(left: 4),
                      color: HexColor("FEC753"),
                      child: DropdownButtonFormField<SubCategories>(
                        decoration:
                            InputDecoration(enabledBorder: InputBorder.none),
                        icon: const Icon(Icons.arrow_drop_down),
                        dropdownColor: Colors.white,
                        style: TextStyle(color: Colors.black),
                        iconEnabledColor: Colors.black,
                        iconSize: 24,
                        elevation: 16,
                        hint: CheersClubText(
                          text: "DRINKS",
                          fontColor: Colors.black,
                          fontWeight: FontWeight.w600,
                          fontSize: 14,
                        ),
                        value: selecteddrink,
                        // style: VFuelStyles.formTextStyle(),
                        onChanged: (value) {
                          selecteddrink = value;
                          mainselected=value;
                          placeOrderCubit.loadProducts(
                              restId, "${selecteddrink!.id}");
                        },
                        items: subCategories_drks
                            ?.map<DropdownMenuItem<SubCategories>>(
                                (SubCategories value) {
                          return DropdownMenuItem<SubCategories>(
                            value: value,
                            child: Text(value.name!),
                          );
                        }).toList(),
                      )),

*/
