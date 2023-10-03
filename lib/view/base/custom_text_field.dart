// import 'package:flutter/services.dart';
// import 'package:flutter/material.dart';
// import 'package:jazeera_paints/util/dimensions.dart';
// import 'package:jazeera_paints/util/styles.dart';
//
// class TextValidator {
//   static String? validate(String? value, {int minLength = 0, int maxLength = 100}) {
//     if (value == null || value.isEmpty) {
//       return 'This field is required';
//     }
//     if (value.length < minLength) {
//       return 'This field must be at least $minLength characters long.';
//     }
//     if (value.length > maxLength) {
//       return 'This field must be less than $maxLength characters long.';
//     }
//     // Add any other validation logic here.
//     return null;
//   }
// }
//
// class CustomTextField extends StatefulWidget {
//   final TextEditingController controller;
//   final String hintText;
//   final int maxLines;
//   final FocusNode focusNode;
//   final TextInputAction inputAction;
//   final TextInputType inputType;
//   final bool isAmount;
//   final bool isNumber;
//   final FocusNode nextFocus;
//   final TextCapitalization capitalization;
//   final bool isEnabled;
//   final bool isPassword;
//   final String prefixIcon;
//   final double prefixSize;
//   final bool divider;
//
//   const CustomTextField({Key? key,
//     required this.controller,
//     required this.hintText,
//     this.maxLines =1,
//     required this.focusNode,
//     this.inputAction = TextInputAction.next,
//     this.inputType = TextInputType.text,
//     this.isAmount = false,
//     this.isNumber = false,
//     required this.nextFocus,
//     this.capitalization = TextCapitalization.none,
//     this.isEnabled = true,
//     this.isPassword = false,
//     this.prefixSize = Dimensions.PADDING_SIZE_SMALL,
//     this.divider = false,
//     required this.prefixIcon,
//
//   }) : super(key: key);
//
//   @override
//   State<CustomTextField> createState() => _CustomTextFieldState();
// }
//
// class _CustomTextFieldState extends State<CustomTextField> {
//   bool _obscureText = true;
//
//   @override
//   Widget build(BuildContext context) {
//     return Container(
//       decoration: BoxDecoration(
//         borderRadius: BorderRadius.circular(5.0),
//         border: Border.all(
//           color: Colors.grey.shade400,
//         ),
//       ),
//       child: Row(
//         children: [
//           Expanded(
//             flex: 1,
//             child: Container(
//               decoration: const BoxDecoration(
//                 borderRadius: BorderRadius.only(
//                   topLeft: Radius.circular(5.0),
//                   bottomLeft: Radius.circular(5.0),
//                 ),
//               ),
//               padding: const EdgeInsets.symmetric(horizontal: 16.0),
//               child: TextField(
//                 maxLines: widget.maxLines,
//                 controller: widget.controller,
//                 focusNode: widget.focusNode,
//                 style: robotoRegular.copyWith(fontSize: Dimensions.fontSizeLarge),
//                 textInputAction: widget.nextFocus == null ? TextInputAction.done : widget.inputAction,
//                 keyboardType: widget.isAmount ? TextInputType.number : widget.inputType,
//                 cursorColor: Theme.of(context).primaryColor,
//                 textCapitalization: widget.capitalization,
//                 enabled: widget.isEnabled,
//                 autofocus: false,
//                 obscureText: widget.isPassword ? _obscureText : false,
//                 inputFormatters: widget.inputType == TextInputType.phone ? <TextInputFormatter>[FilteringTextInputFormatter.allow(RegExp('[0-9]'))]
//                     : widget.isAmount ? [FilteringTextInputFormatter.allow(RegExp(r'[0-9.]'))] : widget.isNumber ? [FilteringTextInputFormatter.allow(RegExp(r'[0-9]'))] : null,
//                 decoration: InputDecoration(
//                   border: OutlineInputBorder(
//                     borderRadius: BorderRadius.circular(Dimensions.RADIUS_SMALL),
//                     borderSide: BorderSide(style: BorderStyle.none, width: 0),
//                   ),
//                   isDense: true,
//                   hintText: widget.hintText,
//                   hintStyle: robotoRegular.copyWith(fontSize: Dimensions.fontSizeLarge, color: Theme.of(context).hintColor),
//                   filled: true,
//                   prefixIcon: widget.prefixIcon != null ? Padding(
//                     padding: EdgeInsets.symmetric(horizontal: widget.prefixSize),
//                     child: Image.asset(widget.prefixIcon, height: 20, width: 20),
//                   ) : null,
//                   suffixIcon: widget.isPassword ? IconButton(
//                     icon: Icon(_obscureText ? Icons.visibility_off : Icons.visibility, color: Theme.of(context).hintColor.withOpacity(0.3)),
//                     onPressed: _toggle,
//                   ) : null,
//                 ),
//                 ),
//             ),
//           ),
//           widget.divider ? const Padding(padding: EdgeInsets.symmetric(horizontal: Dimensions.PADDING_SIZE_LARGE), child: Divider()) : SizedBox(),
//
//         ],
//       ),
//     );
//   }
//   void _toggle() {
//     setState(() {
//       _obscureText = !_obscureText;
//     });
//   }
// }
