import 'package:bloc_state_management/Counter/Bloc/counter_bloc.dart';
import 'package:bloc_state_management/Counter/Bloc/home_page.dart';
import 'package:bloc_state_management/Counter/Cubit/counter_cubit.dart';
import 'package:bloc_state_management/OnlyBloc/Login/bloc/auth_bloc.dart';
import 'package:bloc_state_management/OnlyBloc/Login/home_screen.dart';
import 'package:bloc_state_management/OnlyBloc/Login/login_screen.dart';
import 'package:bloc_state_management/OnlyBloc/Slider/bloc/slider_bloc.dart';
import 'package:bloc_state_management/OnlyBloc/Slider/home_page.dart';
import 'package:bloc_state_management/OnlyBloc/app_bloc_observer.dart';
import 'package:bloc_state_management/Todo/Bloc/bloc/todo_bloc.dart';
import 'package:bloc_state_management/Todo/Cubit/todo_cubit.dart';
import 'package:bloc_state_management/Todo/Bloc/todo_list.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'Counter/Cubit/home_page.dart';

void main() {
  Bloc.observer = AppBlocObserver();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(create: (_)=>CounterCubit(),),
        BlocProvider(create: (_)=>CounterBloc(),),
        BlocProvider(create: (_)=>TodoCubit(),),
        BlocProvider(create: (_)=>TodoBloc(),),
        BlocProvider(create: (_)=>AuthBloc(),),
        BlocProvider(create: (_)=>SliderBloc(),),
      ],
      child: MaterialApp(
        title: 'Flutter Bloc',
        theme: ThemeData(),
        home:  HomePage(),
      ),
    );
  }
}

