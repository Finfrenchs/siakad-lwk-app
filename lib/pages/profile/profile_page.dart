// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_dash/flutter_dash.dart';
import 'package:siakad_app/bloc/logout/logout_bloc.dart';
import 'package:siakad_app/common/components/buttons.dart';
import 'package:siakad_app/data/datasources/auth_local_datasource.dart';

import '../../common/components/custom_scaffold.dart';
import '../../common/components/row_text.dart';
import '../../common/constants/colors.dart';
import '../../common/constants/icons.dart';
import '../auth/auth_page.dart';

class ProfilePage extends StatefulWidget {
  final String role;
  const ProfilePage({
    Key? key,
    required this.role,
  }) : super(key: key);

  @override
  State<ProfilePage> createState() => _ProfilePageState();
}

class _ProfilePageState extends State<ProfilePage> {
  @override
  Widget build(BuildContext context) {
    return CustomScaffold(
      body: ListView(
        padding: const EdgeInsets.symmetric(horizontal: 16.0),
        shrinkWrap: true,
        physics: const NeverScrollableScrollPhysics(),
        children: [
          const SizedBox(height: 60.0),
          Container(
            decoration: BoxDecoration(
              borderRadius: const BorderRadius.all(Radius.circular(10.0)),
              color: ColorResource.white,
              boxShadow: [
                BoxShadow(
                  color: ColorResource.black.withOpacity(0.25),
                  offset: const Offset(0, 3),
                  spreadRadius: 0,
                  blurRadius: 4.0,
                  blurStyle: BlurStyle.outer,
                ),
              ],
            ),
            child: Column(
              children: [
                const SizedBox(height: 22.0),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    ClipRRect(
                      borderRadius:
                          const BorderRadius.all(Radius.circular(50.0)),
                      child: Image.network(
                        'https://avatars.githubusercontent.com/u/88362497?v=4',
                        width: 72.0,
                        height: 72.0,
                        fit: BoxFit.cover,
                      ),
                    ),
                    const SizedBox(width: 10.0),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Container(
                          padding: const EdgeInsets.symmetric(
                              horizontal: 11.0, vertical: 2.0),
                          decoration: BoxDecoration(
                            borderRadius:
                                const BorderRadius.all(Radius.circular(16.0)),
                            border: Border.all(color: ColorResource.primary),
                          ),
                          child: Text(
                            widget.role,
                            style: const TextStyle(
                              color: ColorResource.primary,
                              fontSize: 8,
                              fontWeight: FontWeight.w500,
                            ),
                          ),
                        ),
                        const Text(
                          "Muhamad Kelvin Madrianto Fahendra",
                          style: TextStyle(
                            fontWeight: FontWeight.w700,
                            color: ColorResource.primary,
                          ),
                        ),
                        const Text(
                          "Senin, 02 Oktober 2023",
                          style: TextStyle(
                            fontSize: 8,
                            fontWeight: FontWeight.w500,
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
                const SizedBox(height: 10.0),
                Dash(
                  length: MediaQuery.of(context).size.width - 60.0,
                  dashColor: const Color(0xffD5DFE7),
                ),
                const SizedBox(height: 16.0),
              ],
            ),
          ),
          const SizedBox(height: 60.0),
          Container(
            padding:
                const EdgeInsets.symmetric(horizontal: 16.0, vertical: 14.0),
            decoration: BoxDecoration(
              borderRadius: const BorderRadius.all(Radius.circular(10.0)),
              color: ColorResource.white,
              boxShadow: [
                BoxShadow(
                  color: ColorResource.black.withOpacity(0.25),
                  offset: const Offset(0, 3),
                  spreadRadius: 0,
                  blurRadius: 4.0,
                  blurStyle: BlurStyle.outer,
                ),
              ],
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                RowText(
                  icon: const ImageIcon(IconName.profileLine),
                  label: 'Edit Informasi Profil',
                  value: '',
                  valueColor: ColorResource.primary,
                  onTap: () {
                    // Navigator.push(
                    //   context,
                    //   MaterialPageRoute(
                    //     builder: (context) => const EditProfilePage(),
                    //   ),
                    // );
                  },
                ),
                const SizedBox(height: 12.0),
                RowText(
                  icon: const Icon(Icons.notifications),
                  label: 'Notifikasi',
                  value: 'ON',
                  valueColor: ColorResource.primary,
                  onTap: () {},
                ),
                const SizedBox(height: 12.0),
                RowText(
                  icon: const Icon(Icons.translate),
                  label: 'Bahasa',
                  value: 'Indonesia',
                  valueColor: ColorResource.primary,
                  onTap: () {},
                ),
              ],
            ),
          ),
          const SizedBox(height: 24.0),
          Container(
            padding:
                const EdgeInsets.symmetric(horizontal: 16.0, vertical: 14.0),
            decoration: BoxDecoration(
              borderRadius: const BorderRadius.all(Radius.circular(10.0)),
              color: ColorResource.white,
              boxShadow: [
                BoxShadow(
                  color: ColorResource.black.withOpacity(0.25),
                  offset: const Offset(0, 3),
                  spreadRadius: 0,
                  blurRadius: 4.0,
                  blurStyle: BlurStyle.outer,
                ),
              ],
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                RowText(
                  icon: const ImageIcon(IconName.projector2Line),
                  label: 'Keamanan',
                  value: '',
                  valueColor: ColorResource.primary,
                  onTap: () {},
                ),
                const SizedBox(height: 12.0),
                RowText(
                  icon: const ImageIcon(IconName.mentalHealthLine),
                  label: 'Tema',
                  value: 'Mode Terang',
                  valueColor: ColorResource.primary,
                  onTap: () {},
                ),
              ],
            ),
          ),
          const SizedBox(height: 24.0),
          Container(
            padding:
                const EdgeInsets.symmetric(horizontal: 16.0, vertical: 14.0),
            decoration: BoxDecoration(
              borderRadius: const BorderRadius.all(Radius.circular(10.0)),
              color: ColorResource.white,
              boxShadow: [
                BoxShadow(
                  color: ColorResource.black.withOpacity(0.25),
                  offset: const Offset(0, 3),
                  spreadRadius: 0,
                  blurRadius: 4.0,
                  blurStyle: BlurStyle.outer,
                ),
              ],
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                RowText(
                  icon: const ImageIcon(IconName.contactsLine),
                  label: 'Help & Support',
                  value: '',
                  valueColor: ColorResource.primary,
                  onTap: () {},
                ),
                const SizedBox(height: 12.0),
                RowText(
                  icon: const ImageIcon(IconName.chatQuoteLine),
                  label: 'Contact us',
                  value: '',
                  valueColor: ColorResource.primary,
                  onTap: () {},
                ),
                const SizedBox(height: 12.0),
                RowText(
                  icon: const Icon(Icons.lock),
                  label: 'Privacy policy',
                  value: '',
                  valueColor: ColorResource.primary,
                  onTap: () {},
                ),
              ],
            ),
          ),
          const SizedBox(
            height: 30,
          ),
          BlocConsumer<LogoutBloc, LogoutState>(
            listener: (context, state) {
              state.maybeWhen(
                orElse: () {},
                loaded: (message) {
                  AuthLocalDatasource().removeAuthData();
                  Navigator.pushReplacement(context,
                      MaterialPageRoute(builder: (context) {
                    return const AuthPage();
                  }));

                  ScaffoldMessenger.of(context).showSnackBar(
                    SnackBar(
                      content: Text(message),
                      backgroundColor: ColorResource.green,
                    ),
                  );
                },
                error: (message) {
                  ScaffoldMessenger.of(context).showSnackBar(
                    SnackBar(
                      content: Text(message),
                      backgroundColor: Colors.red,
                    ),
                  );
                },
              );
            },
            builder: (context, state) {
              return state.maybeWhen(orElse: () {
                return Button.filled(
                    onPressed: () {
                      context
                          .read<LogoutBloc>()
                          .add(const LogoutEvent.logout());
                    },
                    label: 'Logout');
              }, loading: () {
                return const Center(
                  child: CircularProgressIndicator(
                    color: ColorResource.primary,
                  ),
                );
              });
            },
          ),
        ],
      ),
    );
  }
}
