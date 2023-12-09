import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:school_management_system/Config/config.dart';

class CustomDropDownButton extends StatelessWidget {
  const CustomDropDownButton({
    super.key,
    required this.selectedValue,
    this.hintText = 'Core Profile',
    required this.onChanged,
    required this.items,
    this.validator,
  });

  final String? selectedValue;
  final String hintText;
  final void Function(String?)? onChanged;
  final List<DropdownMenuItem<String>>? items;
  final String? Function(String?)? validator;

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 56,
      padding: const EdgeInsets.only(left: 16.0, right: 16.0, top: 4.0),
      decoration: BoxDecoration(
          color: AppColor.kTextFieldColor,
          border: Border.all(color: AppColor.kBorderColor, width: 0.5),
          borderRadius: BorderRadius.circular(4.r)),
      child: DropdownButtonFormField<String>(
        value: selectedValue,
        hint: Text(
          hintText,
          style: kBody.copyWith(color: Colors.black),
        ),
        dropdownColor: AppColor.kSecondaryLightColor,
        icon: const Icon(Icons.keyboard_arrow_down),
        style: kBody.copyWith(color: Colors.black),
        decoration: const InputDecoration(border: InputBorder.none),
        padding: EdgeInsets.zero,
        onChanged: onChanged,
        items: items,
        validator: validator,
      ),
    );
  }
}

class DropDownWithLabel extends StatelessWidget {
  const DropDownWithLabel(
      {super.key,
      required this.selectedValue,
      required this.label,
      this.hint = 'Select Option',
      required this.items,
      this.onChanged});

  final String? selectedValue;
  final String label, hint;
  final List<DropdownMenuItem<String>>? items;
  final void Function(String?)? onChanged;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          label,
          style: kSubTitle,
        ),
        const SizedBox(
          height: 16,
        ),
        CustomDropDownButton(
          selectedValue: selectedValue,
          hintText: hint,
          items: items,
          onChanged: onChanged,
        ),
        const SizedBox(
          height: 19,
        ),
      ],
    );
  }
}
