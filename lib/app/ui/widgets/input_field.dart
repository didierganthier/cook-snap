import 'package:cook_snap/app/constants/app_constants.dart';
import 'package:flutter/material.dart';

enum InputFieldType { email, password }

class InputField extends StatelessWidget {
  final String? Function(String?)? validator;
  final InputFieldType type;
  final String? hint;

  const InputField({
    super.key,
    this.validator,
    this.type = InputFieldType.email,
    this.hint,
  });

  @override
  Widget build(BuildContext context) {
    const inputFieldBorder = OutlineInputBorder(
      borderRadius: BorderRadius.all(Radius.circular(32.0)),
      borderSide: BorderSide(color: AppColors.borderColor, width: 2.0),
    );

    OutlineInputBorder focusedInputFieldBorder = inputFieldBorder.copyWith(
      borderSide: const BorderSide(color: AppColors.accentColor, width: 2.0),
    );

    Icon? getPrefixIcon() {
      IconData iconData;
      switch (type) {
        case InputFieldType.email:
          iconData = Icons.email_outlined;
        case InputFieldType.password:
          iconData = Icons.lock_outline;
      }
      return Icon(iconData);
    }

    return TextFormField(
      obscureText: type == InputFieldType.password,
      validator: validator,
      style: TextThemes.textFieldsStyle,
      onTapOutside: (event) {
        FocusScope.of(context).unfocus();
      },
      decoration: InputDecoration(
        enabledBorder: inputFieldBorder,
        focusedBorder: focusedInputFieldBorder,
        hintStyle: TextThemes.textFieldsHintStyle,
        prefixIcon: getPrefixIcon(),
        suffixIcon: type == InputFieldType.password
            ? const Icon(Icons.remove_red_eye_outlined,
                color: AppColors.secondaryColor)
            : null,
        contentPadding:
            const EdgeInsets.symmetric(vertical: 18.0, horizontal: 32.0),
        border: inputFieldBorder,
        hintText: hint,
      ),
    );
  }
}
