import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:tubes_mobpro/tubes/themes/app_theme.dart';

class TextfieldWidget extends StatefulWidget {
  final String? label;
  final TextEditingController? controller;
  final TextInputType? keyboardType;
  final bool? obscureText;
  final String? obscureCharacter;
  final String? hintText;
  final Widget? prefixIcon;
  final IconData? suffixIcon;
  final FormFieldValidator<String>? validator;
  final int? maxLines;
  final bool? readOnly;

  const TextfieldWidget(
      {super.key,
      this.label = "",
      // required this.controller,
      this.keyboardType = TextInputType.text,
      this.obscureText = false,
      this.obscureCharacter = "*",
      this.hintText,
      this.prefixIcon,
      this.suffixIcon,
      this.validator,
      this.controller,
      this.readOnly = false,
      this.maxLines = 1});

  const TextfieldWidget.password(
      {super.key,
      this.label = "",
      this.hintText,
      this.prefixIcon,
      this.validator,
      this.controller,
      this.readOnly = false,
      this.maxLines = 1})
      : keyboardType = TextInputType.visiblePassword,
        obscureText = true,
        obscureCharacter = "*",
        suffixIcon = Icons.visibility_off;

  @override
  State<TextfieldWidget> createState() => _TextfieldWidgetState();
}

class _TextfieldWidgetState extends State<TextfieldWidget> {
  late FocusNode _focusNode;
  bool _isFocused = false;
  late bool _isObscured;
  late IconData? _suffixIcon;
  bool _isPassword = false;

  @override
  void initState() {
    super.initState();
    _isPassword =
        widget.keyboardType == TextInputType.visiblePassword ? true : false;
    _suffixIcon = widget.suffixIcon;
    _focusNode = FocusNode();
    _isObscured = widget.obscureText ?? false;

    _focusNode.addListener(() {
      setState(() {
        _isFocused = _focusNode.hasFocus;
      });
    });
  }

  void toogleObscure() {
    setState(() {
      if (_isObscured) {
        _isObscured = false;
        _suffixIcon = Icons.visibility;
      } else {
        _isObscured = true;
        _suffixIcon = Icons.visibility_off;
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
      Builder(builder: (context) {
        if (widget.label != "") {
          return Text(
            widget.label!,
            style: AppTextStyle.body2SemiBold,
          );
        } else {
          return const SizedBox.shrink();
        }
      }),
      Gap(widget.label != "" ? 4 : 0),
      TextFormField(
        controller: widget.controller,
        validator: widget.validator,
        focusNode: _focusNode,
        keyboardType: widget.keyboardType!,
        obscureText: _isObscured,
        obscuringCharacter: widget.obscureCharacter!,
        style: AppTextStyle.body2Regular,
        minLines: 1,
        maxLines: widget.maxLines,
        readOnly: widget.readOnly!,
        decoration: InputDecoration(
          contentPadding:
              const EdgeInsets.only(top: 10, bottom: 10, left: 20, right: 20),
          filled: true,
          fillColor: _isFocused ? AppColors.N0 : Colors.transparent,
          hintText: widget.hintText,
          hintStyle: AppTextStyle.body2Regular.copyWith(
            color: AppColors.N600,
          ),
          prefixIcon: widget.prefixIcon,
          // suffixIcon: Icon(widget.suffixIcon),
          suffixIcon: _isPassword
              ? IconButton(onPressed: toogleObscure, icon: Icon(_suffixIcon))
              : Icon(_suffixIcon),
          border: OutlineInputBorder(
              borderRadius: BorderRadius.circular(8.0),
              borderSide: const BorderSide(
                color: Color.fromARGB(255, 129, 129, 129),
                width: 1.0,
              )),
          focusedBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(8.0),
              borderSide: const BorderSide(
                color: Color.fromARGB(255, 129, 129, 129),
                width: 1.0,
              )),
        ),
      ),
    ]);
  }
}
