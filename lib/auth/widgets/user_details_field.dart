import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class UserDetailsField extends StatelessWidget {
  const UserDetailsField({
    Key? key,
    required this.hintText,
    required this.controller,
    required this.validator,
    required this.action,
  }) : super(key: key);
  final String hintText;
  final TextEditingController controller;
  final String? Function(String?) validator;
  final TextInputAction action;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(
        horizontal: 15.w,
        vertical: 10.h,
      ),
      child: Container(
        height: 45.h,
        alignment: Alignment.center,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(
            10.r,
          ),
          gradient: const LinearGradient(
            begin: Alignment.centerLeft,
            end: Alignment.centerRight,
            colors: [
              Colors.white,
              Color.fromARGB(255, 241, 220, 247),
            ],
          ),
        ),
        child: Padding(
          padding: EdgeInsets.symmetric(
            horizontal: 8.w,
          ),
          child: TextFormField(
            controller: controller,
            style: Theme.of(context).textTheme.headline2!.copyWith(
                  fontSize: 14.sp,
                  color: Colors.black,
                  fontWeight: FontWeight.w600,
                ),
            autofocus: false,
            keyboardType: TextInputType.text,
            textInputAction: action,
            decoration: InputDecoration(
              isDense: true,
              hintText: hintText,
              hintStyle: Theme.of(context).textTheme.headline6!.copyWith(
                    fontSize: 13.sp,
                    color: Colors.grey,
                    fontWeight: FontWeight.w600,
                  ),
              border: InputBorder.none,
            ),
            validator: validator,
          ),
        ),
      ),
    );
  }
}
