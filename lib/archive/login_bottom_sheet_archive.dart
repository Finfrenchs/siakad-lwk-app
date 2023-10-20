// // ignore_for_file: public_member_api_docs, sort_constructors_first
// import 'package:flutter/material.dart';

// import '../../../common/components/buttons.dart';
// import '../../../common/components/custom_text_field.dart';
// import '../../../common/constants/colors.dart';

// class LoginBottomSheet extends StatefulWidget {
//   final VoidCallback onPressed;
//   final TextEditingController? usernameController;
//   final TextEditingController? passwordController;

//   const LoginBottomSheet({
//     Key? key,
//     required this.onPressed,
//     this.usernameController,
//     this.passwordController,
//   }) : super(key: key);

//   @override
//   State<LoginBottomSheet> createState() => _LoginBottomSheetState();
// }

// class _LoginBottomSheetState extends State<LoginBottomSheet> {
//   @override
//   Widget build(BuildContext context) {
//     return ConstrainedBox(
//       constraints: const BoxConstraints(
//         maxHeight: 760,
//       ),
//       child: Container(
//         padding: const EdgeInsets.all(16.0),
//         child: Column(
//           mainAxisSize: MainAxisSize.min,
//           children: [
//             Row(
//               mainAxisAlignment: MainAxisAlignment.spaceBetween,
//               children: [
//                 IconButton(
//                   icon: const Icon(Icons.chevron_left),
//                   onPressed: () {
//                     Navigator.pop(context);
//                   },
//                 ),
//                 const Text(
//                   "Masuk",
//                   style: TextStyle(
//                     fontSize: 18.0,
//                     fontWeight: FontWeight.bold,
//                   ),
//                 ),
//                 const SizedBox(width: 40.0),
//               ],
//             ),
//             const Divider(),
//             Expanded(
//               child: Column(
//                 crossAxisAlignment: CrossAxisAlignment.start,
//                 children: [
//                   const SizedBox(height: 24.0),
//                   const Text(
//                     "Selamat Datang",
//                     style: TextStyle(
//                       fontSize: 24,
//                       fontWeight: FontWeight.w700,
//                     ),
//                   ),
//                   const SizedBox(height: 8.0),
//                   const Text(
//                     "Masukkan username dan password agar bisa mengakses informasi administrasi.",
//                     style: TextStyle(
//                       color: ColorResource.grey,
//                     ),
//                   ),
//                   const SizedBox(height: 50.0),
//                   CustomTextField(
//                     controller: widget.usernameController!,
//                     label: 'Username',
//                   ),
//                   const SizedBox(height: 12.0),
//                   CustomTextField(
//                     controller: widget.passwordController!,
//                     label: 'Password',
//                     obscureText: true,
//                   ),
//                   const SizedBox(height: 24.0),
//                   Button.filled(
//                     onPressed: widget.onPressed,
//                     label: 'Masuk',
//                   ),
//                   const SizedBox(height: 12.0),
//                 ],
//               ),
//             ),
//           ],
//         ),
//       ),
//     );
//   }
// }

///========================================================================
// class LoginBottomSheet extends StatefulWidget {
//   const LoginBottomSheet({
//     Key? key,
//   }) : super(key: key);

//   @override
//   State<LoginBottomSheet> createState() => _LoginBottomSheetState();
// }

// class _LoginBottomSheetState extends State<LoginBottomSheet> {
//   final emailController = TextEditingController();
//   final passwordController = TextEditingController();

//   @override
//   void dispose() {
//     emailController.dispose();
//     passwordController.dispose();
//     super.dispose();
//   }

//   @override
//   Widget build(BuildContext context) {
//     return Container(
//       padding: EdgeInsets.only(
//         top: 20,
//         right: 20,
//         left: 20,
//         bottom: MediaQuery.of(context).viewInsets.bottom,
//       ),
//       child: Column(
//         mainAxisSize: MainAxisSize.min,
//         children: [
//           Row(
//             mainAxisAlignment: MainAxisAlignment.spaceBetween,
//             children: [
//               IconButton(
//                 icon: const Icon(Icons.chevron_left),
//                 onPressed: () {
//                   Navigator.pop(context);
//                 },
//               ),
//               const Text(
//                 "Masuk",
//                 style: TextStyle(
//                   fontSize: 18.0,
//                   fontWeight: FontWeight.bold,
//                 ),
//               ),
//               const SizedBox(width: 40.0),
//             ],
//           ),
//           const Divider(),
//           Column(
//             crossAxisAlignment: CrossAxisAlignment.start,
//             children: [
//               const SizedBox(height: 24.0),
//               const Text(
//                 "Selamat Datang",
//                 style: TextStyle(
//                   fontSize: 24,
//                   fontWeight: FontWeight.w700,
//                 ),
//               ),
//               const SizedBox(height: 8.0),
//               const Text(
//                 "Masukkan username dan password agar bisa mengakses informasi administrasi.",
//                 style: TextStyle(
//                   color: ColorResource.grey,
//                 ),
//               ),
//               const SizedBox(height: 50.0),
//               CustomTextField(
//                 controller: emailController,
//                 label: 'Email',
//                 textInputType: TextInputType.emailAddress,
//               ),
//               const SizedBox(height: 12.0),
//               CustomTextField(
//                 controller: passwordController,
//                 label: 'Password',
//                 obscureText: true,
//                 textInputType: TextInputType.visiblePassword,
//               ),
//               const SizedBox(height: 24.0),
//               BlocConsumer<LoginBloc, LoginState>(
//                 listener: (context, state) {
//                   state.maybeWhen(
//                     orElse: () {},
//                     loaded: (data) async {
//                       if (data.user.roles == 'mahasiswa') {
//                         Navigator.pushReplacement(
//                           context,
//                           MaterialPageRoute(
//                             builder: (context) => const MahasiswaPage(),
//                           ),
//                         );
//                       } else if (data.user.roles == 'dosen') {
//                         Navigator.pushReplacement(
//                           context,
//                           MaterialPageRoute(
//                             builder: (context) => const DosenPage(),
//                           ),
//                         );
//                       } else {
//                         showDialog(
//                             context: context,
//                             builder: (context) {
//                               return AlertDialog(
//                                 title:
//                                     const Center(child: Text('Pemberitahuan')),
//                                 content: Text(
//                                     textAlign: TextAlign.center,
//                                     'Anda adalah ${data.user.roles}. \nPlatform mobile hanya digunakan untuk Mahasiswa dan Dosen.'),
//                               );
//                             });
//                       }
//                     },
//                     error: (message) {
//                       showDialog(
//                           context: context,
//                           builder: (context) {
//                             return AlertDialog(
//                               title: const Center(child: Text('Pemberitahuan')),
//                               content: Text(
//                                 message,
//                                 textAlign: TextAlign.center,
//                               ),
//                             );
//                           });
                      
//                     },
//                   );
//                 },
//                 builder: (context, state) {
//                   return state.maybeWhen(
//                     orElse: () {
//                       return Button.filled(
//                         onPressed: () {
//                           final model = AuthRequestModel(
//                             email: emailController.text,
//                             password: passwordController.text,
//                           );
//                           context
//                               .read<LoginBloc>()
//                               .add(LoginEvent.login(model));
//                         },
//                         label: 'Masuk',
//                       );
//                     },
//                     loading: () => const Center(
//                       child: CircularProgressIndicator(),
//                     ),
//                   );
//                 },
//               ),
//               const SizedBox(height: 50.0),
//             ],
//           ),
//         ],
//       ),
//     );
//   }
// }

