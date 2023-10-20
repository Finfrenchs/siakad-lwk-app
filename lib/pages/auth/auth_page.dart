import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:siakad_app/bloc/login/login_bloc.dart';
import 'package:siakad_app/common/constants/colors.dart';
import 'package:siakad_app/data/datasources/auth_local_datasource.dart';

import '../../common/components/buttons.dart';
import '../../common/constants/images.dart';
import '../../data/models/request/auth_request_model.dart';
import '../civitas_akademik/dosen_page.dart';
import '../mahasiswa/mahasiswa_page.dart';
import 'widgets/login_bottom_sheet.dart';

class AuthPage extends StatefulWidget {
  const AuthPage({super.key});

  @override
  State<AuthPage> createState() => _AuthPageState();
}

class _AuthPageState extends State<AuthPage> {
  final emailController = TextEditingController();
  final passwordController = TextEditingController();

  @override
  void dispose() {
    emailController.dispose();
    passwordController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Image.asset(
              Images.logoColor,
              width: 200.0,
            ),
            const SizedBox(height: 8.0),
            const Text(
              "Melayani Edukasi, Memudahkan \nAdministrasi!",
              style: TextStyle(
                fontSize: 15,
                fontWeight: FontWeight.w600,
                color: ColorResource.grey,
              ),
              textAlign: TextAlign.center,
            ),
          ],
        ),
      ),
      bottomNavigationBar: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 24.0),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Button.filled(
              onPressed: () {
                showModalBottomSheet(
                  context: context,
                  useSafeArea: true,
                  isScrollControlled: true,
                  builder: (BuildContext context) {
                    return BlocConsumer<LoginBloc, LoginState>(
                      listener: (context, state) {
                        state.maybeWhen(
                          orElse: () {},
                          loaded: (data) async {
                            AuthLocalDatasource().saveAuthData(data);
                            if (data.user.roles == 'dosen') {
                              Navigator.pushReplacement(
                                context,
                                MaterialPageRoute(
                                  builder: (context) => const DosenPage(),
                                ),
                              );
                            } else if (data.user.roles == 'mahasiswa') {
                              showDialog(
                                  context: context,
                                  builder: (context) {
                                    return AlertDialog(
                                      title: const Center(
                                          child: Text('Pemberitahuan')),
                                      content: Text(
                                          textAlign: TextAlign.center,
                                          'Anda adalah ${data.user.roles}. \nPilih opsi Mahasiswa/Mahasiswi untuk masuk.'),
                                    );
                                  });
                            } else {
                              showDialog(
                                  context: context,
                                  builder: (context) {
                                    return AlertDialog(
                                      title: const Center(
                                          child: Text('Pemberitahuan')),
                                      content: Text(
                                          textAlign: TextAlign.center,
                                          'Anda adalah ${data.user.roles}. \nPlatform mobile hanya digunakan untuk Mahasiswa dan Dosen.'),
                                    );
                                  });
                            }
                          },
                          error: (message) {
                            showDialog(
                                context: context,
                                builder: (context) {
                                  return AlertDialog(
                                    title: const Center(
                                        child: Text('Pemberitahuan')),
                                    content: Text(
                                      message,
                                      textAlign: TextAlign.center,
                                    ),
                                  );
                                });
                          },
                        );
                      },
                      builder: (context, state) {
                        return state.maybeWhen(orElse: () {
                          return LoginBottomSheet(
                            emailController: emailController,
                            passwordController: passwordController,
                            onPressed: () {
                              final model = AuthRequestModel(
                                email: emailController.text,
                                password: passwordController.text,
                              );
                              context
                                  .read<LoginBloc>()
                                  .add(LoginEvent.login(model));
                            },
                          );
                        }, loading: () {
                          return Center(
                            child: Container(
                              width: double.infinity,
                              height: double.infinity,
                              alignment: Alignment.center,
                              decoration: const BoxDecoration(
                                color: Colors.transparent,
                              ),
                              child: const Column(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  CircularProgressIndicator(
                                    backgroundColor: Colors.transparent,
                                    color: ColorResource.primary,
                                  ),
                                  SizedBox(
                                    height: 20,
                                  ),
                                  Text(
                                    'Loading...',
                                    style: TextStyle(
                                        fontSize: 16,
                                        color: ColorResource.black),
                                  ),
                                ],
                              ),
                            ),
                          );
                        });
                      },
                    );
                  },
                );
              },
              label: 'CIVITAS AKADEMIK',
            ),
            const SizedBox(height: 8.0),
            Button.outlined(
              onPressed: () {
                showModalBottomSheet(
                  context: context,
                  useSafeArea: true,
                  isScrollControlled: true,
                  builder: (BuildContext context) {
                    return BlocConsumer<LoginBloc, LoginState>(
                      listener: (context, state) {
                        state.maybeWhen(
                          orElse: () {},
                          loaded: (data) async {
                            AuthLocalDatasource().saveAuthData(data);
                            if (data.user.roles == 'mahasiswa') {
                              Navigator.pushReplacement(
                                context,
                                MaterialPageRoute(
                                  builder: (context) => const MahasiswaPage(),
                                ),
                              );
                            } else if (data.user.roles == 'dosen') {
                              showDialog(
                                  context: context,
                                  builder: (context) {
                                    return AlertDialog(
                                      title: const Center(
                                          child: Text('Pemberitahuan')),
                                      content: Text(
                                          textAlign: TextAlign.center,
                                          'Anda adalah ${data.user.roles}. \nPilih opsi Civitas Akademik untuk masuk.'),
                                    );
                                  });
                            } else {
                              showDialog(
                                  context: context,
                                  builder: (context) {
                                    return AlertDialog(
                                      title: const Center(
                                          child: Text('Pemberitahuan')),
                                      content: Text(
                                          textAlign: TextAlign.center,
                                          'Anda adalah ${data.user.roles}. \nPlatform mobile hanya digunakan untuk Mahasiswa dan Dosen.'),
                                    );
                                  });
                            }
                          },
                          error: (message) {
                            showDialog(
                                context: context,
                                builder: (context) {
                                  return AlertDialog(
                                    title: const Center(
                                        child: Text('Pemberitahuan')),
                                    content: Text(
                                      message,
                                      textAlign: TextAlign.center,
                                    ),
                                  );
                                });
                          },
                        );
                      },
                      builder: (context, state) {
                        return state.maybeWhen(orElse: () {
                          return LoginBottomSheet(
                            emailController: emailController,
                            passwordController: passwordController,
                            onPressed: () {
                              final model = AuthRequestModel(
                                email: emailController.text,
                                password: passwordController.text,
                              );
                              context
                                  .read<LoginBloc>()
                                  .add(LoginEvent.login(model));
                            },
                          );
                        }, loading: () {
                          return Center(
                            child: Container(
                              width: double.infinity,
                              height: double.infinity,
                              alignment: Alignment.center,
                              decoration: const BoxDecoration(
                                color: Colors.transparent,
                              ),
                              child: const Column(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  CircularProgressIndicator(
                                    backgroundColor: Colors.transparent,
                                    color: ColorResource.primary,
                                  ),
                                  SizedBox(
                                    height: 20,
                                  ),
                                  Text(
                                    'Loading...',
                                    style: TextStyle(
                                        fontSize: 16,
                                        color: ColorResource.black),
                                  ),
                                ],
                              ),
                            ),
                          );
                        });
                      },
                    );
                  },
                );
              },
              label: 'MAHASISWA / MAHASISWI',
            ),
            const SizedBox(height: 32.0),
            const Text.rich(
              TextSpan(
                text: "Dengan memilih salah satu, Anda menyetujuinya ",
                children: [
                  TextSpan(
                    text: '\nKetentuan Layanan & Kebijakan Privasi',
                    style: TextStyle(
                      fontWeight: FontWeight.w600,
                      color: ColorResource.primary,
                    ),
                  ),
                ],
              ),
              style: TextStyle(
                fontSize: 12,
                color: ColorResource.grey,
              ),
              textAlign: TextAlign.center,
            ),
          ],
        ),
      ),
    );
  }
}
