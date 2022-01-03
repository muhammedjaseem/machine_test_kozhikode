import 'package:flutter/material.dart';
import 'package:machine_test_kozhikode/providers/provider_home.dart';
import 'package:machine_test_kozhikode/screens/student_screen.dart';
import 'package:machine_test_kozhikode/screens/subjects_screens.dart';
import 'package:provider/provider.dart';

import 'classroom_screen.dart';

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
    Provider.of<ProviderHome>(context,listen: false).getSubject();
  }
  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 3,
      child: Scaffold(
        appBar: AppBar(
          title: const Text('Options'),
          bottom: const TabBar(
            indicatorSize: TabBarIndicatorSize.label,
            tabs: [
              Tab(text: 'Classrooms'),
              Tab(text: 'Subjects'),
              Tab(text: 'Students'),
            ],
          ),
        ),
        body:  const TabBarView(
          children: <Widget>[
            ClassRoomScreen(),
            SubjectsScreen(),
            StudentScreen(),
          ],
        ),
      ),
    );
  }
}
