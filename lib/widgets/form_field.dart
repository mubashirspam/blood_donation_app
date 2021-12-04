 import 'package:flutter/material.dart';

Widget BuildTextField(
    String label,
    var initialValue,
    TextInputAction textInputAction,
    TextInputType textInputType,
    FormFieldValidator formFieldValidator,
    FormFieldSetter formFieldSetter,
    bool obscureText,
    // TextEditingController? textEditingController,
    
    
  

  ) =>
      Container(
        margin: EdgeInsets.symmetric(vertical: 10),
        decoration: BoxDecoration(
          //   borderRadius: BorderRadius.circular(8),
          //   //   border: Border.all(
          //   //     color: Color(0xffc0c8e4),
          //   //     width: 1,
          //   //   ),
          color: Color(0xfff6f7fa),
        ),
        child: TextFormField(
          // controller:textEditingController,
          
          obscureText: obscureText,
          initialValue: initialValue,
          textInputAction: textInputAction,
          keyboardType: textInputType,
          validator: formFieldValidator,
          onSaved: formFieldSetter,
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

          // validator:  (value) {
          //   if (value!.isEmpty) {
          //     return 'Required';
          //   }
          //   return null;
          // },
        ),
      );