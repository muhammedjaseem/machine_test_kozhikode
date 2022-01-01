import 'package:flutter/material.dart';
import 'package:machine_test_kozhikode/providers/provider_home.dart';
import 'package:machine_test_kozhikode/screens/home_screen.dart';
import 'package:machine_test_kozhikode/screens/subjects_screens.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (context)=>ProviderHome()),
      ],
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'Machine Test',
        theme: ThemeData(
        ),
        home: const SubjectsScreen(),
      ),
    );
  }
}

// 5b4DB ///api key

