import 'package:flutter/material.dart';
import 'package:islami_app/app_theme.dart';

class LoadingIndecator extends StatelessWidget {
  Color? color;
  LoadingIndecator({this.color});
  @override
  Widget build(BuildContext context) {
    return Center(
      child: CircularProgressIndicator(color: color ?? AppTheme.primay),
    );
  }
}
