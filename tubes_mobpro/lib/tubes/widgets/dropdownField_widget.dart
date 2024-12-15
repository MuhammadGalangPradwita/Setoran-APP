import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:tubes_mobpro/tubes/themes/app_theme.dart';

class DropdownMenuWidget<T> extends StatefulWidget {
  final String label;
  final List<T> options;
  final String Function(T) optionLabel;
  final void Function(T?)? onChanged;
  final T? initialValue;
  final bool isRequired;
  final String? Function(T?)? customValidator;
  final double? width;

  const DropdownMenuWidget({
    super.key,
    required this.label,
    required this.options,
    required this.optionLabel,
    this.onChanged,
    this.initialValue,
    this.isRequired = false,
    this.customValidator,
    this.width,
  });

  @override
  State<DropdownMenuWidget<T>> createState() => _DropdownMenuWidgetState<T>();
}

class _DropdownMenuWidgetState<T> extends State<DropdownMenuWidget<T>> {
  T? _selectedValue;

  @override
  void initState() {
    super.initState();
    _selectedValue = widget.initialValue;
  }

  String? _validate(T? value) {
    // Custom validator takes precedence
    if (widget.customValidator != null) {
      return widget.customValidator!(value);
    }

    // Default required validation
    if (widget.isRequired && value == null) {
      return '${widget.label} is required';
    }

    return null;
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          widget.label,
          style: AppTextStyle.body2SemiBold,
        ),
        const Gap(4),
        DropdownMenu<T>(
          menuStyle: const MenuStyle(
            backgroundColor: WidgetStatePropertyAll(AppColors.N0),
          ),
          textStyle: AppTextStyle.body2Regular,
          inputDecorationTheme: InputDecorationTheme(
            contentPadding:
                const EdgeInsets.only(top: 10, bottom: 10, left: 20, right: 20),
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
          width: widget.width ?? 300,
          initialSelection: _selectedValue,
          onSelected: (T? value) {
            setState(() {
              _selectedValue = value;
            });
            widget.onChanged?.call(value);
          },
          dropdownMenuEntries:
              widget.options.map<DropdownMenuEntry<T>>((T option) {
            return DropdownMenuEntry<T>(
                value: option, label: widget.optionLabel(option));
          }).toList(),
        ),
      ],
    );
  }
}
