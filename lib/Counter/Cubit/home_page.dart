import 'package:bloc_state_management/Counter/Cubit/counter_cubit.dart';
import 'package:bloc_state_management/Counter/Cubit/inc_button.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class MyCubitHomePage extends StatelessWidget {
  const MyCubitHomePage({super.key});

  @override
  Widget build(BuildContext context) {
    final counterCubit = BlocProvider.of<CounterCubit>(context);
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
        title: const Text('Counter'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            const Text(
              'You have pushed the button this many times:',
            ),
            BlocBuilder(   //BlocBuilder<CounterCubit,int>  and bloc: is not necessary
                bloc: counterCubit,
              builder: (context,value) {
                return Text(
                  '$value',
                  style: Theme.of(context).textTheme.headlineMedium,
                );
              }
            ),
            TextButton(onPressed: (){
              Navigator.push(context, MaterialPageRoute(builder: (context)=>IncButton()));
            }, child: Text('Navigate')),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: counterCubit.incrementCounter,
        tooltip: 'Increment',
        child: const Icon(Icons.add),
      ),
    );
  }
}

