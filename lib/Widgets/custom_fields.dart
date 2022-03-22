import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

Widget getWidgetTextField(BuildContext context,
    TextEditingController textEditingController, String title,
    {TextInputAction? inputAction,
    TextInputType? fieldKeyboardType,
    FocusNode? focusNode,
    FormFieldValidator? validator,
    bool error = false,
    String? errorText,
    String? labelText,
    int? maxLength,
    bool isReadOnly = false}) {
  return SizedBox(
    width: MediaQuery.of(context).size.width * .78,
    child: TextFormField(
      cursorColor: const Color(0xff8D8D8D),
      controller: textEditingController,
      keyboardType: fieldKeyboardType ?? TextInputType.text,
      textInputAction: inputAction ?? TextInputAction.next,
      maxLength: maxLength,
      focusNode: focusNode,
      readOnly: isReadOnly,
      decoration: InputDecoration(
        fillColor: Colors.white,
        filled: true,
        labelStyle: GoogleFonts.titilliumWeb(
            fontSize: 16,
            fontWeight: FontWeight.w500,
            color: const Color(0xff8D8D8D)),
        hintText: title,
        hintStyle: const TextStyle(
            color: Color(0xff8D8D8D),
            fontWeight: FontWeight.w400,
            fontSize: 13),
        counterText: '',
        enabledBorder: InputBorder.none,
        focusedBorder: InputBorder.none,
      ),
      validator: validator
    ),
  );
}

Widget signUpWidget(
    BuildContext context, TextEditingController textEditingController,
    {TextInputAction? inputAction,
    TextInputType? fieldKeyboardType,
    FocusNode? focusNode,
    bool error = false,
    FormFieldValidator? validator,
    String? errorText,
    String? labelText,
    int? maxLength,
    bool isReadOnly = false}) {
  return SizedBox(
    height: MediaQuery.of(context).size.height * .07,
    width: MediaQuery.of(context).size.width * .78,
    child: TextFormField(
      cursorColor: const Color(0xff8D8D8D),
      controller: textEditingController,
      keyboardType: fieldKeyboardType ?? TextInputType.text,
      textInputAction: inputAction ?? TextInputAction.next,
      maxLength: maxLength,
      focusNode: focusNode,
      readOnly: isReadOnly,
      decoration: InputDecoration(
        hintText: labelText,
        fillColor: Colors.white,
        filled: true,
        
        hintStyle: const TextStyle(
            color: Color(0xff8D8D8D),
            fontWeight: FontWeight.w400,
            fontSize: 13),
        counterText: '',
        enabledBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(5),
            borderSide: BorderSide.none),
        focusedBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(5),
            borderSide: BorderSide.none),
      ),
      validator: validator
    ),
  );
}
