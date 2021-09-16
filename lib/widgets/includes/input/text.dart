import 'package:flutter/material.dart';
import './../../../config/config.dart';

class InputText extends StatelessWidget {
  final String initialValue;
  final IconData icon;
  final double iconSize;
  final String? label;
  final String hintText;
  final double hintTextSize;
  final double borderRadius;
  final String? Function(String?)? validator;
  final void Function()? seePassword;
  final void Function(String?)? onSaved;
  final Function(String)? onChanged;
  final bool isPassword;
  final bool suffix;
  final bool isEmail;
  final bool hasBorder;
  final String keyWord;

  InputText({
    this.initialValue = '',
    required this.icon,
    this.iconSize = 15.0,
    this.label,
    required this.hintText,
    this.hintTextSize = 12.0,
    this.borderRadius = 5.0,
    required this.validator,
    this.seePassword,
    this.onSaved,
    this.onChanged,
    this.isPassword = false,
    this.suffix = false,
    this.isEmail = false,
    this.keyWord = '',
    this.hasBorder = true,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.all(10.0),
      child: TextFormField(
        key: ValueKey(keyWord),
        initialValue: initialValue,
        decoration: InputDecoration(
          border: hasBorder
              ? OutlineInputBorder(
                  borderRadius: BorderRadius.all(
                    Radius.circular(borderRadius),
                  ),
                  borderSide: BorderSide(
                    width: 0,
                    style: BorderStyle.none,
                  ))
              : InputBorder.none,
          prefixIcon: Icon(
            this.icon,
            size: iconSize,
          ),
          suffixIcon: suffix == true
              ? IconButton(
                  onPressed: seePassword,
                  icon: Icon(Icons.visibility),
                )
              : null,
          labelText: this.label,
          hintText: this.hintText,
          hintStyle: TextStyle(
            fontSize: hintTextSize,
          ),
          contentPadding: EdgeInsets.only(
            top: 15.0,
            right: 15.0,
            bottom: 15.0,
          ),
          filled: true,
          fillColor: Palette.greyColour,
        ),
        obscureText: isPassword ? true : false,
        validator: validator,
        onSaved: onSaved,
        onChanged: onChanged,
        keyboardType: isEmail ? TextInputType.emailAddress : TextInputType.text,
      ),
    );
  }
}
