import 'package:flutter/material.dart';
import 'package:services_repo/core/utils/app_colors.dart';

class StartEndTimeField extends StatelessWidget {
  const StartEndTimeField(
      {super.key,
      required this.hintText,
      required this.controller,
      required this.onPressed});

  final String hintText;
  final TextEditingController controller;
  final void Function() onPressed;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onPressed,
      child: TextFormField(
        controller: controller,
        style: const TextStyle(color: Colors.black),
        decoration: InputDecoration(
          enabled: false,
          fillColor: AppColors.myGrey,
          filled: true,
          hintText: hintText,
          border: OutlineInputBorder(
            borderSide: BorderSide.none,
            borderRadius: BorderRadius.circular(15),
          ),
        ),
      ),
    );
  }
}
