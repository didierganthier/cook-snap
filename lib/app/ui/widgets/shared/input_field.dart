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
  late FocusNode focusNode;
  late TextEditingController _controller;
  // control booleans
  bool isFocused = false;
  bool hasValue = false;

  @override
  void initState() {
    super.initState();
    //  initialize focus node
    focusNode = FocusNode();
    focusNode.addListener(() {
      setState(() {
        isFocused = focusNode.hasFocus;
      });
    });

    // initialize controller
    _controller = TextEditingController();
    _controller.addListener(() {
      setState(() {
        hasValue = _controller.text.isNotEmpty;
      });
    });
  }

  @override
  void dispose() {
    focusNode.dispose();
    _controller.dispose();
    super.dispose();
  }

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
      return Icon(
        iconData,
        size: 18.0,
        color: isFocused ? AppColors.accentColor : AppColors.primaryColor,
      );
    }

    Widget? getSuffixIcon() {
      switch (widget.type) {
        case InputFieldType.password:
          return hasValue
              ? IconButton(
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
                )
              : null;
        default:
          return null;
      }
    }

    bool getObsureTextState() =>
        widget.type == InputFieldType.password && !isPasswordVisible;

    return TextFormField(
      controller: _controller,
      focusNode: focusNode,
      obscureText: getObsureTextState(),
      validator: widget.validator,
      style: TextThemes.textFieldsStyle,
      onTapOutside: (event) {
        focusNode.unfocus();
      },
      onChanged: (value) {
        setState(() {
          hasValue = value.isNotEmpty;
        });
        // todo: pass the value to the parent widget
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
