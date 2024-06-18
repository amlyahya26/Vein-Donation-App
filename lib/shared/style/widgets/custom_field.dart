import 'package:donation_app/shared/network/cache_helper.dart';
import 'package:donation_app/shared/style/colors.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';

class CustomTextFormField extends StatelessWidget {
  String? labelText;
  String? hintText;
  TextEditingController controller;
  BuildContext context;
  bool? obscureText;
  BorderRadius? borderRadius;
  IconData? suffix;
  IconData? prefix;
  var suffixPress;
  var style;
  var onTapFunction;
  var validator;
  bool enabled;
  int maxLines;
  var onChange;
  InputDecoration? inputDecoration;
  FocusNode? focusNode;

  CustomTextFormField(
      {Key? key,
      this.onChange,
      this.onTapFunction,
      this.validator,
      this.suffix,
      this.prefix,
      this.style,
      this.suffixPress,
      this.focusNode,
      this.inputDecoration,
      this.labelText,
      this.hintText,
      required this.controller,
      required this.context,
      this.obscureText = false,
      this.borderRadius,
      this.enabled = true,
      this.maxLines = 1})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      controller: controller,
      obscureText: obscureText!,
      enabled: enabled,
      maxLines: maxLines,
      focusNode: focusNode,
      textInputAction: TextInputAction.next,
      textAlign: TextAlign.center,
      style: style,
      onChanged: onChange,
      validator: validator,
      onTap: () => controller.selection = TextSelection(baseOffset: 0, extentOffset: controller.value.text.length),
      decoration: inputDecoration ??
          InputDecoration(
            suffixIcon: suffix != null
                ? IconButton(
                    icon: Icon(suffix),
                    onPressed: suffixPress,
                    color: CacheHelper.getData(key: 'theme') == 1 ? Colors.white : CustomColors.primaryColor,
                  )
                : null,
            prefixIcon: prefix != null
                ? Icon(
                    prefix,
                    size: 18,
                    color: CacheHelper.getData(key: 'theme') == 1 ? Colors.white : CustomColors.primaryColor,
                  )
                : null,
            contentPadding: const EdgeInsets.all(20),

            focusedBorder: OutlineInputBorder(
              borderRadius: borderRadius ?? BorderRadius.circular(5.0),
              borderSide: BorderSide(
                color: CustomColors.secondaryColor,
              ),
            ),
            enabledBorder: OutlineInputBorder(
              borderRadius: borderRadius ?? BorderRadius.circular(5.0),
              borderSide: BorderSide(
                color: Colors.grey.shade400,
                width: 1.0,
              ),
            ),
            disabledBorder: OutlineInputBorder(
              borderRadius: borderRadius ?? BorderRadius.circular(5.0),
              borderSide: BorderSide(
                color: Colors.grey.shade400,
                width: 1.0,
              ),
            ),
            errorBorder: OutlineInputBorder(
              borderRadius: borderRadius ?? BorderRadius.circular(5.0),
              borderSide: const BorderSide(
                color: Colors.red,
                width: 1.0,
              ),
            ),
            focusedErrorBorder: OutlineInputBorder(
              borderRadius: borderRadius ?? BorderRadius.circular(5.0),
              borderSide: const BorderSide(
                color: Colors.red,
                width: 1.0,
              ),
            ),
            floatingLabelBehavior: FloatingLabelBehavior.always,
            labelText: labelText != null ? labelText!.tr() : '',
            hintText: labelText != null ? hintText!.tr() : '',
            labelStyle: Theme.of(context).textTheme.caption!.copyWith(color: Colors.grey, fontSize: 20),
            hintStyle: Theme.of(context).textTheme.caption!.copyWith(color: Colors.grey, fontSize: 14),
          ),
    );
  }
}
