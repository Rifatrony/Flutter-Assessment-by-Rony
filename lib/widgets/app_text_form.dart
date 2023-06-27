// ignore_for_file: must_be_immutable

import 'package:flutter/material.dart';
import 'package:flutter_assessment_test_rony/utils/diamentions.dart';
import 'package:flutter_assessment_test_rony/utils/utils.dart';

class AppTextForm extends StatelessWidget {
  final TextEditingController controller;
  final FocusNode currentFocus;
  final FocusNode nextFocus;
  final bool? isObscure;
  final RegExp exception;
  final String? emptyMessage;
  final String? validationErrorMessage;
  String myLabel;

  AppTextForm({
    super.key,
    required this.controller,
    required this.currentFocus,
    required this.nextFocus,
    this.isObscure = false,
    required this.exception,
    this.emptyMessage,
    this.validationErrorMessage,
    required this.myLabel,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(
        left: Diamentions.widtht10,
        right: Diamentions.widtht10,
        top: Diamentions.height15,
      ),
      child: TextFormField(
        focusNode: currentFocus,
        obscureText: isObscure!,
        obscuringCharacter: "*",
        decoration: InputDecoration(
          isDense: true,
          labelText: myLabel,
          enabledBorder: const OutlineInputBorder(),
          border: const OutlineInputBorder(),
        ),
        autovalidateMode: AutovalidateMode.onUserInteraction,
        validator: (value) {
          if (value!.isEmpty) {
            return emptyMessage;
          } else if (!exception.hasMatch(value)) {
            return validationErrorMessage;
          } else {
            return null;
          }
        },
        onFieldSubmitted: (value) {
          Utils.fieldFocusChange(
            context,
            currentFocus,
            nextFocus,
          );
        },
      ),
    );
  }
}
