import 'package:flutter/material.dart';

class BuildTextField extends StatelessWidget {
  final String label;
  final initialValue;
  final TextInputAction textInputAction;
  final TextInputType textInputType;
  final FormFieldValidator formFieldValidator;
  final FormFieldSetter formFieldSetter;
  final bool obscureText;
  final TextEditingController? textEditingController;
  BuildTextField(
      this.label,
      this.initialValue,
      this.textInputAction,
      this.textInputType,
      this.formFieldValidator,
      this.formFieldSetter,
      this.obscureText,
      {TextEditingController? this.textEditingController});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.symmetric(vertical: 10),
      decoration: BoxDecoration(
        color: Color(0xfff6f7fa),
      ),
      child: TextFormField(
        controller: this.textEditingController,
        obscureText: this.obscureText,
        // initialValue: this.initialValue,
        textInputAction: this.textInputAction,
        keyboardType: this.textInputType,
        validator: this.formFieldValidator,
        onSaved: this.formFieldSetter,
        style: TextStyle(
          color: Color(0xff4058AE),
        ),
        cursorColor: Color(0xff4058AE),
        decoration: InputDecoration(
          // icon:IconButton(onPressed: (){}, icon: Icon(icon)) ,
          contentPadding: EdgeInsets.symmetric(
            horizontal: 15,
            vertical: 1,
          ),

          focusedErrorBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(8.0),
            borderSide: BorderSide(
              color: Colors.red,
              width: 1.0,
            ),
          ),
          errorBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(8.0),
            borderSide: BorderSide(
              color: Colors.red,
              width: 1.0,
            ),
          ),
          enabledBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(8.0),
            borderSide: BorderSide(
              color: Color(0xffC0C8E4),
              width: 1.0,
            ),
          ),
          focusedBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(8.0),
            borderSide: BorderSide(
              color: Color(0xff506EDA),
              width: 2.0,
            ),
          ),
          label: Text(label),
          labelStyle: TextStyle(
            color: Color(0xff7A93EB),
            height: 1,
          ),
        ),
        scrollPadding: EdgeInsets.all(10),
      ),
    );
  }
}
