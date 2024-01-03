import 'package:cook_snap/app/constants/app_constants.dart';
import 'package:flutter/material.dart';

class InputField extends StatelessWidget {
  final String? Function(String?)? validator;
  const InputField({super.key, this.validator});

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      obscureText: true,
      validator: validator,
      style: const TextStyle(
        color: AppColors.textColor,
        fontSize: 16.0,
        fontWeight: FontWeight.w500,
      ),
      onTapOutside: (event) {
        FocusScope.of(context).unfocus();
      },
      decoration: const InputDecoration(
        enabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.all(Radius.circular(32.0)),
          borderSide: BorderSide(color: AppColors.borderColor, width: 2.0),
        ),
        focusedBorder: OutlineInputBorder(
          borderSide: BorderSide(color: AppColors.accentColor, width: 2.0),
          borderRadius: BorderRadius.all(Radius.circular(32.0)),
        ),
        hintStyle: TextStyle(
          color: AppColors.secondaryColor,
          fontSize: 16.0,
          fontWeight: FontWeight.w500,
        ),
        prefixIcon: Icon(Icons.email_outlined),
        suffixIcon: Icon(Icons.remove_red_eye_outlined,
            color: AppColors.secondaryColor),
        contentPadding: EdgeInsets.symmetric(vertical: 18.0, horizontal: 32.0),
        border: OutlineInputBorder(
          borderRadius: BorderRadius.all(Radius.circular(32.0)),
          borderSide: BorderSide(color: AppColors.borderColor, width: 2.0),
        ),
        hintText: 'Enter your email',
      ),
    );
  }
}
