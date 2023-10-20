// import 'package:flutter/material.dart';
// import 'package:flutter_bloc/flutter_bloc.dart';
// import 'package:siakad_app/common/constants/colors.dart';
// import 'package:siakad_app/data/models/request/auth_request_model.dart';

// import '../../bloc/login/login_bloc.dart';
// import '../../common/components/buttons.dart';
// import '../../common/constants/images.dart';
// import '../pages/civitas_akademik/dosen_page.dart';
// import '../pages/mahasiswa/mahasiswa_page.dart';
// import 'login_bottom_sheet_archive.dart';

// class AuthPage extends StatefulWidget {
//   const AuthPage({super.key});

//   @override
//   State<AuthPage> createState() => _AuthPageState();
// }

// class _AuthPageState extends State<AuthPage> {
//   final usernameController = TextEditingController();
//   final passwordController = TextEditingController();

//   @override
//   void dispose() {
//     usernameController.dispose();
//     passwordController.dispose();
//     super.dispose();
//   }

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       body: Center(
//         child: Column(
//           mainAxisAlignment: MainAxisAlignment.center,
//           children: [
//             Image.asset(
//               Images.logoColor,
//               width: 200.0,
//             ),
//             const SizedBox(height: 8.0),
//             const Text(
//               "Melayani Edukasi, Memudahkan \nAdministrasi!",
//               style: TextStyle(
//                 fontSize: 15,
//                 fontWeight: FontWeight.w600,
//                 color: ColorResource.grey,
//               ),
//               textAlign: TextAlign.center,
//             ),
//           ],
//         ),
//       ),
//       bottomNavigationBar: Padding(
//         padding: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 24.0),
//         child: Column(
//           mainAxisSize: MainAxisSize.min,
//           children: [
//             Button.filled(
//               onPressed: () {
//                 showModalBottomSheet(
//                   context: context,
//                   useSafeArea: true,
//                   isScrollControlled: true,
//                   builder: (BuildContext context) {
//                     return LoginBottomSheet(
//                       usernameController: usernameController,
//                       passwordController: passwordController,
//                       onPressed: () {
//                         Navigator.pop(context);
//                         Navigator.pushReplacement(
//                           context,
//                           MaterialPageRoute(
//                             builder: (context) => const DosenPage(),
//                           ),
//                         );
//                       },
//                     );
//                   },
//                 );
//               },
//               label: 'CIVITAS AKADEMIK',
//             ),
//             const SizedBox(height: 8.0),
//             Button.outlined(
//               onPressed: () {
//                 showModalBottomSheet(
//                   context: context,
//                   useSafeArea: true,
//                   isScrollControlled: true,
//                   builder: (BuildContext context) {
//                     return BlocConsumer<LoginBloc, LoginState>(
//                       listener: (context, state) {
//                         state.maybeWhen(
//                           orElse: () {},
//                           loaded: (data) async {
//                             Navigator.pop(context);
//                             Navigator.pushReplacement(
//                               context,
//                               MaterialPageRoute(
//                                 builder: (context) => const MahasiswaPage(),
//                               ),
//                             );
//                           },
//                           error: (message) {
//                             ScaffoldMessenger.of(context).showSnackBar(
//                               SnackBar(
//                                 content: Text(message),
//                                 backgroundColor: Colors.red,
//                               ),
//                             );
//                           },
//                         );
//                       },
//                       builder: (context, state) {
//                         return state.maybeWhen(
//                           orElse: () {
//                             return LoginBottomSheet(
//                               usernameController: usernameController,
//                               passwordController: passwordController,
//                               onPressed: () {
//                                 final model = AuthRequestModel(
//                                   email: usernameController.text,
//                                   password: passwordController.text,
//                                 );
//                                 context
//                                     .read<LoginBloc>()
//                                     .add(LoginEvent.login(model));
//                               },
//                             );
//                           },
//                           loading: () => const Center(
//                             child: CircularProgressIndicator(),
//                           ),
//                         );
//                       },
//                     );
//                   },
//                 );
//               },
//               label: 'MAHASISWA',
//             ),
//             const SizedBox(height: 32.0),
//             const Text.rich(
//               TextSpan(
//                 text: "Dengan memilih salah satu, Anda menyetujuinya ",
//                 children: [
//                   TextSpan(
//                     text: '\nKetentuan Layanan & Kebijakan Privasi',
//                     style: TextStyle(
//                       fontWeight: FontWeight.w600,
//                       color: ColorResource.primary,
//                     ),
//                   ),
//                 ],
//               ),
//               style: TextStyle(
//                 fontSize: 12,
//                 color: ColorResource.grey,
//               ),
//               textAlign: TextAlign.center,
//             ),
//           ],
//         ),
//       ),
//     );
//   }
// }
//=========================================
// class AuthPage extends StatefulWidget {
//   const AuthPage({super.key});

//   @override
//   State<AuthPage> createState() => _AuthPageState();
// }

// class _AuthPageState extends State<AuthPage> {
//   final usernameController = TextEditingController();
//   final passwordController = TextEditingController();

//   @override
//   void dispose() {
//     usernameController.dispose();
//     passwordController.dispose();
//     super.dispose();
//   }

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       body: Center(
//         child: Column(
//           mainAxisAlignment: MainAxisAlignment.center,
//           children: [
//             Image.asset(
//               Images.logoColor,
//               width: 200.0,
//             ),
//             const SizedBox(height: 8.0),
//             const Text(
//               "Melayani Edukasi, Memudahkan \nAdministrasi!",
//               style: TextStyle(
//                 fontSize: 15,
//                 fontWeight: FontWeight.w600,
//                 color: ColorResource.grey,
//               ),
//               textAlign: TextAlign.center,
//             ),
//           ],
//         ),
//       ),
//       bottomNavigationBar: Padding(
//         padding: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 24.0),
//         child: Column(
//           mainAxisSize: MainAxisSize.min,
//           children: [
//             Button.filled(
//               onPressed: () {
//                 showModalBottomSheet(
//                   context: context,
//                   useSafeArea: true,
//                   isScrollControlled: true,
//                   builder: (BuildContext context) {
//                     return BlocProvider(
//                       create: (context) => LoginBloc(AuthRemoteDatasource()),
//                       child: const LoginBottomSheet(),
//                     );
//                   },
//                 );
//               },
//               label: 'MASUK',
//             ),
//             const SizedBox(height: 32.0),
//             const Text.rich(
//               TextSpan(
//                 text: "Dengan memilih salah satu, Anda menyetujuinya ",
//                 children: [
//                   TextSpan(
//                     text: '\nKetentuan Layanan & Kebijakan Privasi',
//                     style: TextStyle(
//                       fontWeight: FontWeight.w600,
//                       color: ColorResource.primary,
//                     ),
//                   ),
//                 ],
//               ),
//               style: TextStyle(
//                 fontSize: 12,
//                 color: ColorResource.grey,
//               ),
//               textAlign: TextAlign.center,
//             ),
//           ],
//         ),
//       ),
//     );
//   }
// }