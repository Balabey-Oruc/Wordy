import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:wordy/data/bloc/word/word_cubit.dart';
import 'package:wordy/presentation/home_page/home_screen.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
      designSize: const Size(392.72, 803.63),
      builder: (context) => MaterialApp(
        debugShowCheckedModeBanner: false,
        home: BlocProvider(
          create: (context) => WordCubit(),
          child: HomeScreen(),
        ),
      ),
    );
  }
}
