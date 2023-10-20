// import 'package:flutter/material.dart';
// import 'package:siakad_app/bloc/login/login_bloc.dart';
// import 'package:siakad_app/data/datasources/auth_remote_datasource.dart';
// import 'package:siakad_app/pages/auth/splash_page.dart';
// import 'package:flutter_bloc/flutter_bloc.dart';

// void main() {
//   runApp(const MyApp());
// }

// class MyApp extends StatelessWidget {
//   const MyApp({super.key});

//   @override
//   Widget build(BuildContext context) {
//     return BlocProvider(
//       create: (context) => LoginBloc(AuthRemoteDatasource()),
//       child: MaterialApp(
//         title: 'Flutter Demo',
//         theme: ThemeData(
//           colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
//           useMaterial3: true,
//         ),
//         home: const SplashPage(),
//         debugShowCheckedModeBanner: false,
//       ),
//     );
//   }
// }
