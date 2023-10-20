import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:siakad_app/bloc/login/login_bloc.dart';
import 'package:siakad_app/bloc/logout/logout_bloc.dart';
import 'package:siakad_app/data/datasources/auth_local_datasource.dart';
import 'package:siakad_app/data/datasources/auth_remote_datasource.dart';
import 'package:siakad_app/pages/auth/auth_page.dart';
import 'package:siakad_app/pages/auth/splash_page.dart';
import 'package:siakad_app/pages/civitas_akademik/dosen_page.dart';
import 'package:siakad_app/pages/mahasiswa/mahasiswa_page.dart';
import 'package:flutter/src/widgets/framework.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(
          create: (context) => LoginBloc(AuthRemoteDatasource()),
        ),
        BlocProvider(
          create: (context) => LogoutBloc(AuthRemoteDatasource()),
        ),
      ],
      child: MaterialApp(
        title: 'Flutter Demo',
        theme: ThemeData(
          colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
          useMaterial3: true,
        ),
        home: FutureBuilder<bool>(
          future: AuthLocalDatasource().isLogin(),
          builder: (context, snapshot) {
            if (snapshot.connectionState == ConnectionState.waiting) {
              return const SplashPage();
            } else if (snapshot.hasData && snapshot.data!) {
              return FutureBuilder<String>(
                future: AuthLocalDatasource().getUserRole(),
                builder: (context, snapshot) {
                  if (snapshot.connectionState == ConnectionState.waiting) {
                    return const SplashPage();
                  } else if (snapshot.hasData) {
                    String role = snapshot.data!;
                    if (role == 'mahasiswa') {
                      return const MahasiswaPage();
                    } else if (role == 'dosen') {
                      return const DosenPage();
                    } else {
                      return const AuthPage();
                    }
                  } else {
                    return const AuthPage();
                  }
                },
              );
            } else {
              return const AuthPage();
            }
          },
        ),
        debugShowCheckedModeBanner: false,
      ),
    );
  }
}
