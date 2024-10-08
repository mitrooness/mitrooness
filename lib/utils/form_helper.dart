import 'package:flutter/material.dart';

class FormHelper {
  static Widget textInput(
      BuildContext context,
      Object initialValue,
      Function(String) onChanged, {
        bool isTextArea = false,
        bool isNumberInput = false,
        bool obscureText = false,
        required String Function(String?) onValidate,
        Widget? prefixIcon,
        Widget? suffixIcon,
      }) {
    return TextFormField(
      initialValue: initialValue != 'true' ? initialValue.toString() : "",
      decoration: fieldDecoration(
        context,
        "",
        "",
        suffixIcon: suffixIcon,
        prefixIcon: prefixIcon,
      ),
      obscureText: obscureText,
      maxLines: !isTextArea ? 1 : 3,
      keyboardType: isNumberInput ? TextInputType.number : TextInputType.text,
      onChanged: (String value) {
        return onChanged(value);
      },
      validator: (value) {
        return onValidate(value);
      },
    );
  }

  static InputDecoration fieldDecoration(
      BuildContext context,
      String hintText,
      String helperText, {
        Widget? prefixIcon,
        Widget? suffixIcon,
      }) {
    return InputDecoration(
      contentPadding: EdgeInsets.all(6),
      hintText: hintText,
      helperText: helperText,
      prefixIcon: prefixIcon,
      suffixIcon: suffixIcon,
      enabledBorder: OutlineInputBorder(
        borderSide: BorderSide(
          color: Theme.of(context).primaryColor,
          width: 1,
        ),
      ),
      border: OutlineInputBorder(
        borderSide: BorderSide(
          color: Theme.of(context).primaryColor,
          width: 1,
        ),
      ),
    );
  }

  static Widget fieldLabel(String labelName) {
    return Padding(
      padding: EdgeInsets.fromLTRB(0, 5, 0, 10),
      child: Text(
        labelName,
        style: TextStyle(
          fontWeight: FontWeight.bold,
          fontSize: 15.0,
        ),
      ),
    );
  }

  static Widget saveButton(String buttonText, Function() onTap,
      {Color? color, Color? textColor, bool fullWidth = false}) {
    return Container(
      height: 50.0,
      width: fullWidth ? double.infinity : 150,
      child: GestureDetector(
        onTap: onTap,
        child: Container(
          decoration: BoxDecoration(
            border: Border.all(
              color: color ?? Colors.redAccent,
              style: BorderStyle.solid,
              width: 1.0,
            ),
            color: color ?? Colors.redAccent,
            borderRadius: BorderRadius.circular(30.0),
          ),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              Center(
                child: Text(
                  buttonText,
                  style: TextStyle(
                    color: textColor ?? Colors.white,
                    fontSize: 16,
                    fontWeight: FontWeight.w600,
                    letterSpacing: 1,
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  static void showMessage(
      BuildContext context,
      String title,
      String message,
      String buttonText,
      Function() onPressed,
      ) {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: Text(title),
          content: Text(message),
          actions: [
            TextButton(
              onPressed: onPressed,
              child: Text(buttonText),
            ),
          ],
        );
      },
    );
  }
}
