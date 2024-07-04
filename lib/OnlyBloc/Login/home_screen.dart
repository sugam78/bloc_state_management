import 'package:bloc_state_management/OnlyBloc/Login/bloc/auth_bloc.dart';
import 'package:bloc_state_management/OnlyBloc/Login/bloc/auth_state.dart';
import 'package:bloc_state_management/OnlyBloc/Login/bloc/bloc_event.dart';
import 'package:bloc_state_management/OnlyBloc/Login/login_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
   // final authState = context
       // .watch<AuthBloc>()
    //    .state
   // as AuthSuccess; //when using context.watch it is okay to not use bloc builder and it refreshes all the ui
    return Scaffold(
      appBar: AppBar(
        title: Text('Home Screen'),
      ),
      body: BlocConsumer<AuthBloc, AuthState>(
        listener: (context, state) {
          if(state is AuthInitial){
            Navigator.push(
         context, MaterialPageRoute(builder: (context) => LoginScreen()));
          }
        },
        builder: (context, state) {
          if(state is AuthLoading){
            return Center(child: CircularProgressIndicator(),);
          }
          return Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Center(
                child: Text((state as AuthSuccess).uid),
              ),
              TextButton(onPressed: () {
                context.read<AuthBloc>().add(AuthLogoutRequested());
              }, child: Text('signout'),
              )
            ],
          );
        },
      ),
    );
  }
}
