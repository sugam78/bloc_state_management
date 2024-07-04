import 'package:bloc_state_management/OnlyBloc/Slider/bloc/slider_bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: BlocBuilder<SliderBloc, double>(
          builder: (context, state) {
            return Slider(value: state, onChanged: (value) {
              BlocProvider.of<SliderBloc>(context).add(OnChange(value));
            },);
          },
        ),
      ),
    );
  }
}
