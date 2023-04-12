import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class ShowDialogResponse extends StatefulWidget {
  final String message;
  final bool isFail;
  const ShowDialogResponse({
    required this.message,
    this.isFail = false,
    Key? key,
  }) : super(key: key);

  @override
  State<ShowDialogResponse> createState() => _ShowDialogResponseState();
}

class _ShowDialogResponseState extends State<ShowDialogResponse> {
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: MediaQuery.of(context).size.width - 40,
      child: AlertDialog(
        contentPadding: EdgeInsets.symmetric(horizontal: 25.w, vertical: 42.h),
        backgroundColor: Colors.white,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(21),
        ),
        content: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            (widget.isFail)
                ? const Icon(
                    Icons.dangerous,
                    size: 70,
                    color: Colors.red,
                  )
                : const Icon(
                    Icons.check,
                    size: 70,
                    color: Colors.green,
                  ),
            SizedBox(height: 20.h),
            Text(
              widget.message,
              textAlign: TextAlign.center,
              style: TextStyle(
                color: Colors.black,
                fontSize: 16.sp,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
