import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class AppTextfieald extends StatelessWidget {
  final prefixicon;
  final hinttext;
  final TextEditingController? controller;
  final keyboardtype;
  final suffix;
  final String? Function(String? value)? validator;
  final void Function(String value)? onchanged;
  final bool obsecuretext;
  final bool? inputunderline;
  final inputformatters;
  final bool? filled;
  final Color? fillcolor;
  final double? fontsize;
  final TextInputAction? textInputAction;
  final void Function(String value)? onSubmitted;
  final TextStyle? hintStyle;
  final FocusNode? focusNode;
  final int? maxLines;

  const AppTextfieald(
      {Key? key,
      this.prefixicon,
      this.hinttext,
      this.controller,
      this.keyboardtype,
      this.suffix,
      this.obsecuretext = false,
      this.validator,
      this.onchanged,
      this.inputunderline = true,
      this.inputformatters,
      this.fontsize = 15,
      this.filled,
      this.fillcolor,
      this.textInputAction,
      this.onSubmitted,
      this.hintStyle,
      this.focusNode,
      this.maxLines})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(top: 1),
      child: TextFormField(
        controller: controller,
        onChanged: onchanged,
        validator: validator,
        onFieldSubmitted: onSubmitted,
        keyboardType: keyboardtype,
        // textInputAction: textInputAction,
        obscureText: obsecuretext,
        mouseCursor: MouseCursor.defer,
        maxLines: maxLines ?? 1,
        // style: TextStyle(color: Colors.black),
        decoration: InputDecoration(
            prefixIcon: prefixicon,
            suffixIcon: Padding(
                padding: const EdgeInsets.only(top: 0, left: 5), child: suffix),
            hintText: hinttext,
            border: OutlineInputBorder(),
            filled: filled,
            contentPadding: EdgeInsets.only(top: 2, left: 15),
            fillColor: fillcolor,
            hintStyle: hintStyle),
      ),
    );
  }
}
