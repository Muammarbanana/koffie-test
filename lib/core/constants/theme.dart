import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

// Button Style
final ButtonStyle btnMainStyle = ElevatedButton.styleFrom(
  backgroundColor: Colors.brown,
  padding: EdgeInsets.symmetric(vertical: 14.h, horizontal: 14.w),
  shape: const RoundedRectangleBorder(
    borderRadius: BorderRadius.all(
      Radius.circular(8),
    ),
  ),
);

// Text Form Style
final InputDecoration enabledTextFormStyle = InputDecoration(
  filled: true,
  fillColor: Colors.grey.shade100,
  focusColor: Colors.grey.shade100,
  disabledBorder: OutlineInputBorder(
    borderRadius: BorderRadius.circular(8),
    borderSide: const BorderSide(color: Colors.white),
  ),
  enabledBorder: OutlineInputBorder(
    borderRadius: BorderRadius.circular(8),
    borderSide: const BorderSide(color: Colors.white),
  ),
  focusedBorder: OutlineInputBorder(
    borderRadius: BorderRadius.circular(8),
    borderSide: const BorderSide(color: Colors.brown),
  ),
  hintStyle: TextStyle(
    color: Colors.grey,
    fontSize: 16.sp,
  ),
);
