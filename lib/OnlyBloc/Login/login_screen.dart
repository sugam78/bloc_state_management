import 'package:bloc_state_management/OnlyBloc/Login/bloc/auth_bloc.dart';
import 'package:bloc_state_management/OnlyBloc/Login/bloc/auth_state.dart';
import 'package:bloc_state_management/OnlyBloc/Login/bloc/bloc_event.dart';
import 'package:bloc_state_management/OnlyBloc/Login/home_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'Widgets/gradient_button.dart';
import 'Widgets/login_field.dart';

// class LoginScreen extends StatefulWidget {
//   const LoginScreen({super.key});
//
//   @override
//   State<LoginScreen> createState() => _LoginScreenState();
// }
//
// class _LoginScreenState extends State<LoginScreen> {
//   final emailController = TextEditingController();
//   final passwordController = TextEditingController();
//
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(),
//  bloc builder is used in changing the ui stuff and
//  // bloclistener helps in showing snackbar ,navigation , dialog ,etc
//       body: BlocListener<AuthBloc, AuthState>(
//         listener: (context, state) {
//           if (state is AuthFailure) {
//             ScaffoldMessenger.of(context).showSnackBar(
//                 SnackBar(content: Text(state.error)));
//           }
//           if (state is AuthSuccess) {
//             Navigator.push(
//                 context, MaterialPageRoute(builder: (context) => HomeScreen()));
//           }
//         },
//         child: BlocBuilder<AuthBloc, AuthState>(
//           builder: (context, state) {
//             if(state is AuthLoading){
//               return Center(child: CircularProgressIndicator(),);
//             }
//             return SingleChildScrollView(
//               child: Center(
//                 child: Column(
//                   mainAxisAlignment: MainAxisAlignment.center,
//                   children: [
//                     const Text(
//                       'Sign in.',
//                       style: TextStyle(
//                         fontWeight: FontWeight.bold,
//                         fontSize: 50,
//                       ),
//                     ),
//
//                     const SizedBox(height: 15),
//                     LoginField(
//                       hintText: 'Email',
//                       controller: emailController,
//                     ),
//                     const SizedBox(height: 15),
//                     LoginField(
//                       hintText: 'Password',
//                       controller: passwordController,
//                     ),
//                     const SizedBox(height: 20),
//                     GradientButton(
//                       onPressed: () {
//                         context.read<AuthBloc>().add(AuthLoginRequested(
//                             email: emailController.text.trim(),
//                             password: passwordController.text.trim()));
//                       },
//                     ),
//                   ],
//                 ),
//               ),
//             );
//           },
//         ),
//       ),
//     );
//   }
// }

//Instead of using bloc builder and bloc listener nested we can use block consumer
// blocconsumer = blocbuilder+ bloclistener

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  final emailController = TextEditingController();
  final passwordController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: BlocConsumer<AuthBloc, AuthState>(
        listener: (context, state) {
          if (state is AuthFailure) {
            ScaffoldMessenger.of(context).showSnackBar(
                SnackBar(content: Text(state.error)));
          }
          if (state is AuthSuccess) {
            Navigator.push(
                context, MaterialPageRoute(builder: (context) => HomeScreen()));
          }
        },
        builder: (context,state){
          if(state is AuthLoading){
            return Center(child: CircularProgressIndicator(),);
          }
          return SingleChildScrollView(
            child: Center(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  const Text(
                    'Sign in.',
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 50,
                    ),
                  ),

                  const SizedBox(height: 15),
                  LoginField(
                    hintText: 'Email',
                    controller: emailController,
                  ),
                  const SizedBox(height: 15),
                  LoginField(
                    hintText: 'Password',
                    controller: passwordController,
                  ),
                  const SizedBox(height: 20),
                  GradientButton(
                    onPressed: () {
                      context.read<AuthBloc>().add(AuthLoginRequested(
                          email: emailController.text.trim(),
                          password: passwordController.text.trim()));
                    },
                  ),
                ],
              ),
            ),
          );
        },
        ),
    );
  }
}
