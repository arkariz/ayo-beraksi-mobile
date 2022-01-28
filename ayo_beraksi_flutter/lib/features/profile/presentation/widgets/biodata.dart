// import 'package:ayo_beraksi_flutter/core/config/theme_constants.dart';
// import 'package:ayo_beraksi_flutter/features/login/presentation/bloc/login_bloc.dart';
// import 'package:ayo_beraksi_flutter/features/profile/presentation/bloc/name_bloc/name_bloc.dart';
// import 'package:ayo_beraksi_flutter/features/profile/presentation/bloc/phone_bloc/phone_bloc.dart';
// import 'package:flutter/material.dart';
// import 'package:flutter_bloc/flutter_bloc.dart';

// class Biodata extends StatelessWidget {
//   Biodata({Key? key}) : super(key: key);

//   final nameController = TextEditingController(text: "Radias Mahes");
//   final FocusNode nameNode = FocusNode();

//   final tlpController = TextEditingController(text: "08765423134");
//   final FocusNode tlpNode = FocusNode();

//   final mailController = TextEditingController(text: "RadiasMahes@gmail.com");
//   final FocusNode mailNode = FocusNode();

//   @override
//   Widget build(BuildContext context) {
//     Size size = MediaQuery.of(context).size;

//     return BlocBuilder<LoginBloc, LoginState>(
//       builder: (context, state) {
//         if (state is LoginDone) {
//           nameController.text = state.user!.name!;
//           tlpController.text = state.user!.noTlp!;
//           mailController.text = state.user!.email!;

//           return Column(children: [
//             BiodataTextField(
//               controller: nameController,
//               node: nameNode,
//               size: size,
//               icon: Icons.person_outline,
//               label: "NAMA",
//               blocEvent: "changeName",
//             ),
//             BiodataTextField(
//               controller: tlpController,
//               node: tlpNode,
//               size: size,
//               icon: Icons.phone_outlined,
//               label: "NOMOR TELEPON",
//               blocEvent: "changeTelepon",
//             ),
//             BiodataTextField(
//               controller: mailController,
//               node: mailNode,
//               size: size,
//               icon: Icons.mail_outline,
//               label: "EMAIL",
//               blocEvent: "changeEmail",
//             )
//           ]);
//         }
//         return const SizedBox();
//       },
//     );
//   }
// }

// class BiodataTextField extends StatefulWidget {
//   const BiodataTextField(
//       {Key? key,
//       required this.controller,
//       required this.node,
//       required this.size,
//       required this.icon,
//       required this.label,
//       required this.blocEvent})
//       : super(key: key);

//   final TextEditingController controller;
//   final FocusNode node;
//   final Size size;
//   final IconData icon;
//   final String label;
//   final String blocEvent;

//   @override
//   _BiodataTextFieldState createState() => _BiodataTextFieldState();
// }

// class _BiodataTextFieldState extends State<BiodataTextField> {
//   bool isReadOnly = true;

//   @override
//   Widget build(BuildContext context) {
//     return Padding(
//       padding: const EdgeInsets.only(bottom: 10),
//       child: Row(
//         children: [
//           SizedBox(
//             width: widget.size.width * 0.75,
//             child: TextField(
//               focusNode: widget.node,
//               readOnly: isReadOnly ? true : false,
//               controller: widget.controller,
//               keyboardType: widget.blocEvent == "changeTelepon" ? TextInputType.number : TextInputType.text,
//               decoration: InputDecoration(
//                   icon: Icon(widget.icon),
//                   labelText: widget.label,
//                   border: isReadOnly ? InputBorder.none : const OutlineInputBorder()),
//               textInputAction: TextInputAction.done,
//             ),
//           ),
//           IconButton(
//               onPressed: () {
//                 if (widget.blocEvent == "changeName") {
//                   BlocProvider.of<NameBloc>(context).add(ChangeName({"name": widget.controller.text}));
//                 } else if (widget.blocEvent == "changeTelepon") {
//                   BlocProvider.of<PhoneBloc>(context).add(ChangeTeleponEvent({"no_telp": widget.controller.text}));
//                 } else {
//                   null;
//                 }

//                 setState(() => isReadOnly = !isReadOnly);
//                 isReadOnly
//                     ? FocusScope.of(context).requestFocus(FocusNode())
//                     : FocusScope.of(context).requestFocus(widget.node);
//               },
//               icon: const Icon(
//                 Icons.edit_outlined,
//                 color: kPrimaryColor,
//               ))
//         ],
//       ),
//     );
//   }
// }
