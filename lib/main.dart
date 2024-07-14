import 'package:bloc/bloc.dart';
import 'package:flutter/material.dart';
import 'package:route_task/cubit/bloc_observer.dart';
import 'package:route_task/routes/app_links.dart';
import 'package:route_task/routes/routes.dart';
import 'package:route_task/services/dio_helper.dart';

void main() async{
  WidgetsFlutterBinding.ensureInitialized();
  Bloc.observer = MyBlocObserver();
  DioHelper.init();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Route Task',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.blue),
        useMaterial3: true,
      ),
      routes: appRoutes(context),
      initialRoute: ScreensNames.appLayout,
    );
  }
}

