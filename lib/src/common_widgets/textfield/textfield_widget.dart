import 'package:flutter/material.dart';

import '../../constants/constants.dart';

class TextFieldWidget extends StatelessWidget {
  const TextFieldWidget({
    super.key,
    required this.textEditingController,
    required this.hintText,
    this.validator,
  }) : _isSearch = false;

  const TextFieldWidget.search({
    super.key,
    required this.textEditingController,
    required this.hintText,
    this.validator,
  }) : _isSearch = true;

  final TextEditingController textEditingController;
  final String hintText;
  final String? Function(String?)? validator;
  final bool _isSearch;

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      controller: textEditingController,
      validator: validator,
      decoration: InputDecoration(
        border: const OutlineInputBorder(
          borderRadius: BorderRadius.all(Radius.circular(12)),
          borderSide: BorderSide(
            width: 1,
            color: ColorApp.halfGrey,
          ),
        ),
        focusedBorder: const OutlineInputBorder(
          borderRadius: BorderRadius.all(Radius.circular(12)),
          borderSide: BorderSide(
            width: 2,
            color: ColorApp.purpleLight // Color Primary,
          ),
        ),
        hintText: hintText,
        hintStyle: const TextStyle(
          color: Colors.black,
        ),
        suffixIcon: _isSearch == true ? const Icon(Icons.search) : null,
      ),
    );
  }
}
