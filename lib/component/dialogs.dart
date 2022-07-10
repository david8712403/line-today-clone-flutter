import 'package:dio/dio.dart';
import 'package:expandable_text/expandable_text.dart';
import 'package:flutter/material.dart';
import 'package:line_today_clone/model/news_service/response/response_base.dart';
import 'package:line_today_clone/util/constant.dart';

class MAlertDialog extends StatelessWidget {
  const MAlertDialog({
    Key? key,
    this.error,
    this.errorTitle,
    this.errorDetail,
  }) : super(key: key);
  final DioError? error;
  final String? errorTitle;
  final String? errorDetail;

  @override
  Widget build(BuildContext context) {
    String _errorTitle = "Unknown error";
    String _errorDetail = "Unknown error";
    if (error != null && error!.response != null) {
      // final status = error.response!.data;
      final detail = NewsResponseBase.fromMap(error?.response!.data);
      _errorDetail = detail.message;
    } else {
      _errorTitle = errorTitle ?? _errorTitle;
      _errorDetail = errorDetail ?? _errorDetail;
    }
    return AlertDialog(
        content: SizedBox(
      width: 300,
      child: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(_errorTitle, style: Font.HEADING_3),
            ExpandableText(
              _errorDetail,
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
