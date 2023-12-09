import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:school_management_system/Config/config.dart';

class CustomTextField extends StatelessWidget {
  final TextEditingController? controller;
  final bool? obscureText;
  final bool? readOnly;
  final Widget? suffixIcon;
  final Widget? prefixIcon;
  final String? hintText;
  final String? labelText;
  final TextStyle? labelStyle;
  final VoidCallback? onTap;
  final AutovalidateMode? autovalidateMode;
  final TextInputType? keyboardType;
  final String? Function(String?)? validator;
  final Function(String)? onChange;
  final EdgeInsetsGeometry? padding;
  final Color? borderColor;
  final Color? focusedBorderColor;
  final Color? enabledBorderColor;
  final Color? cursorColor;
  final TextAlign? textAlign;
  final double? fontSize;

  final List<TextInputFormatter>? inputFormatters;
  final bool? autofocus;
  final double? borderRadius;
  final FontWeight? hintFontWeight;
  final Color? hintColor;
  final TextStyle? style;
  final String? errorText;
  final VoidCallback? onEditingComplete;
  final EdgeInsetsGeometry? margin;
  final double? marginBottom;
  final double? labelBottomGap;
  final int? maxLines;

  const CustomTextField({
    super.key,
    this.controller,
    this.obscureText,
    this.readOnly,
    this.suffixIcon,
    this.prefixIcon,
    this.hintText,
    this.labelStyle,
    this.onTap,
    this.autovalidateMode,
    this.keyboardType,
    this.validator,
    this.onChange,
    this.padding,
    this.borderColor,
    this.focusedBorderColor,
    this.enabledBorderColor,
    this.cursorColor,
    this.inputFormatters,
    this.autofocus,
    this.textAlign,
    this.fontSize,
    this.borderRadius,
    this.hintFontWeight,
    this.hintColor,
    this.style,
    this.errorText,
    this.onEditingComplete,
    this.margin,
    this.marginBottom,
    this.maxLines,
    this.labelText,
    this.labelBottomGap,
  });
  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        if (labelText != null)
          Padding(
            padding: EdgeInsets.only(bottom: labelBottomGap ?? 10),
            child: Text(
              labelText ?? '',
              style: labelStyle ?? kLabel,
            ),
          ),
        TextFormField(
          controller: controller,
          validator: validator,
          onChanged: onChange,
          obscureText: obscureText ?? false,
          readOnly: readOnly ?? false,
          autovalidateMode: autovalidateMode,
          cursorColor: cursorColor,
          maxLines: maxLines ?? 1,
          autofocus: autofocus ?? false,
          textAlign: textAlign ?? TextAlign.start,
          onTap: onTap,
          style: style ?? kBody,
          onEditingComplete: onEditingComplete,
          keyboardType: keyboardType,
          decoration: InputDecoration(
            errorStyle: kBody.copyWith(color:AppColor. kRed),
            // fillColor: const Color(0xff39383D),
            fillColor: AppColor.white,
            filled: true,
            errorText: errorText,
            contentPadding: padding ??
                const EdgeInsets.symmetric(vertical: 18, horizontal: 20),
            prefixIcon: prefixIcon,
            suffixIcon: suffixIcon,
            // border: InputBorder.none,
            disabledBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(borderRadius ?? 8),
                borderSide: BorderSide(color: borderColor ?? AppColor. kTextColor)),
            border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(borderRadius ?? 8),
                borderSide:
                    BorderSide(color: borderColor ?? AppColor.kWhite.withOpacity(.2))),
            focusedBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(borderRadius ?? 8),
                borderSide: BorderSide(
                    width: 1,
                    color: focusedBorderColor ?? AppColor.kWhite.withOpacity(.5))),
            enabledBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(borderRadius ?? 8),
                borderSide: BorderSide(
                    width: 1,
                    color: enabledBorderColor ?? AppColor.kWhite.withOpacity(.2))),

            errorBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(borderRadius ?? 8),
                borderSide: BorderSide(
                    width: 1,
                    color: enabledBorderColor ?? AppColor.kWhite.withOpacity(.2))),
            hintText: hintText,
            hintStyle: kBody.copyWith(color: const Color(0xff87898E)),
          ),
          inputFormatters: inputFormatters,
        ),
        if (marginBottom != null)
          SizedBox(
            height: marginBottom ?? 16,
          )
      ],
    );
  }
}


class TextFieldWithLabel extends StatelessWidget {
  const TextFieldWithLabel({super.key,
    required this.hint,
    required this.label,
    this.readOnly = false,

  });

  final String hint, label;
  final bool readOnly;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(label, style: kLabelSmall,),
        const SizedBox(height: 16,),
        SizedBox(
          height: 56,
          child: CustomTextField(
            hintText: hint,
            readOnly: readOnly,
          ),
        ),
        const SizedBox(height: 19,),
      ],
    );
  }
}


class CustomDropdownTextField extends StatelessWidget {
  const CustomDropdownTextField({
    super.key,
    this.label,
    required this.data,
    this.onChanged,
    this.hintText,
    this.marginBottom,
    this.contentPadding,
    this.width,
    this.value,
    this.labelBottomGap,
    this.labelStyle,
  });

  final String? label;
  final String? value;
  final double? marginBottom;
  final double? width;
  final double? labelBottomGap;
  final List data;
  final String? hintText;
  final Function(String?)? onChanged;
  final EdgeInsetsGeometry? contentPadding;
  final TextStyle? labelStyle;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        // label text
        if (label != null)
          Text(
            label ?? '',
            style: labelStyle ?? kBody,
          ),
        // gapping
        SizedBox(height: label == null ? 0 : labelBottomGap ?? 10),
        DropdownButtonFormField<String>(
          value: value,
          //hint Style
          hint: SizedBox(
            width: width,
            child: Text(
              hintText ?? 'Select',
              overflow: TextOverflow.ellipsis,
              style: kBody.copyWith(color: const Color(0xffB5B8C5)),
            ),
          ),
          // arrow icon
          // icon: SvgPicture.asset('assets/icons/arrow-down.svg'),
          dropdownColor: AppColor.kSecondaryColor,
          decoration: InputDecoration(
            errorStyle: kLabelError.copyWith(color: AppColor.kRed),
            fillColor: const Color(0xff39383D),
            filled: true,

            contentPadding:
                const EdgeInsets.symmetric(vertical: 15, horizontal: 20),

            // border: InputBorder.none,
            disabledBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(8),
                borderSide: const BorderSide(color: AppColor.kTextColor)),
            border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(8),
                borderSide: BorderSide(color: AppColor.kWhite.withOpacity(.2))),
            focusedBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(8),
                borderSide:
                    BorderSide(width: 1, color: AppColor.kWhite.withOpacity(.5))),
            enabledBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(8),
                borderSide:
                    BorderSide(width: 1, color: AppColor.kWhite.withOpacity(.2))),

            errorBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(8),
                borderSide:
                    BorderSide(width: 1, color: AppColor.kWhite.withOpacity(.2))),
            hintText: hintText,
            hintStyle: kBody.copyWith(color: const Color(0xffB5B8C5)),
          ),
          // generate select items
          items: List.generate(
              data.length,
              (index) => DropdownMenuItem<String>(
                    value: data[index],
                    child: SizedBox(
                      width: width,
                      child: Text(
                        data[index],
                        overflow: TextOverflow.ellipsis,
                        style: kBody.copyWith(color: AppColor.
                        kWhite),
                      ),
                    ),
                  )),
          onChanged: onChanged,
        ),
        // bottom gap
        SizedBox(height: marginBottom ?? 0),
      ],
    );
  }
}
