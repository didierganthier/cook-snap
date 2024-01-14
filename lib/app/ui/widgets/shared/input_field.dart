import 'package:cook_snap/app/constants/app_constants.dart';
import 'package:cook_snap/utils/cook_snap_icons.dart';
import 'package:flutter/material.dart';

enum InputFieldType { email, password }

class InputField extends StatefulWidget {
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
  State<InputField> createState() => _InputFieldState();
}

class _InputFieldState extends State<InputField> {
  bool isPasswordVisible = false;

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
      switch (widget.type) {
        case InputFieldType.email:
          iconData = CookSnapIcons.message;
        case InputFieldType.password:
          iconData = CookSnapIcons.lock;
      }
      return Icon(iconData, size: 18.0);
    }

    Widget? getSuffixIcon() {
      switch (widget.type) {
        case InputFieldType.password:
          return IconButton(
            icon: const Icon(
              Icons.remove_red_eye_outlined,
              size: 18.0,
            ),
            color: AppColors.secondaryColor,
            onPressed: () {
              setState(() {
                isPasswordVisible = !isPasswordVisible;
              });
            },
          );
        default:
          return null;
      }
    }

    return TextFormField(
      obscureText: widget.type == InputFieldType.password && !isPasswordVisible,
      validator: widget.validator,
      style: TextThemes.textFieldsStyle,
      onTapOutside: (event) {
        FocusScope.of(context).unfocus();
      },
      decoration: InputDecoration(
        enabledBorder: inputFieldBorder,
        focusedBorder: focusedInputFieldBorder,
        hintStyle: TextThemes.textFieldsHintStyle,
        prefixIcon: getPrefixIcon(),
        suffixIcon: getSuffixIcon(),
        contentPadding:
            const EdgeInsets.symmetric(vertical: 16.0, horizontal: 32.0),
        border: inputFieldBorder,
        hintText: widget.hint,
      ),
    );
  }
}
