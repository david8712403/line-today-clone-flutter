import 'package:dio/dio.dart';
import 'package:expandable_text/expandable_text.dart';
import 'package:flutter/material.dart';
import 'package:line_today_clone/model/news_service/response/response_base.dart';
import 'package:line_today_clone/util/constant.dart';

class MAlertDialog extends StatelessWidget {
  const MAlertDialog({Key? key, required this.error}) : super(key: key);
  final DioError error;

  @override
  Widget build(BuildContext context) {
    String errorDetail = "Unknown error";
    if (error.response != null) {
      // final status = error.response!.data;
      final detail = NewsResponseBase.fromMap(error.response!.data);
      errorDetail = detail.message;
    }
    return AlertDialog(
        content: SizedBox(
      width: 300,
      child: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(error.message, style: Font.HEADING_3),
            ExpandableText(
              errorDetail,
              expandText: 'more',
              collapseText: 'less',
              maxLines: 3,
              linkColor: Colors.blue,
            )
          ],
        ),
      ),
    ));
  }
}
