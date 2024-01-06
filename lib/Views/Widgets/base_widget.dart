import 'package:flutter/material.dart';
import 'package:school_management_system/Config/config.dart';

import '../../Config/styles/spacing.dart';

class BaseWidgetChild extends StatelessWidget {
  final Widget child;
  const BaseWidgetChild({super.key, required this.child});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(
          horizontal: AppSpacing.sm, vertical: AppSpacing.sm),
      child: child,
    );
  }
}

class BaseWidget extends StatelessWidget {
  final Widget child;
  final String title;
  const BaseWidget({
    super.key,
    required this.title,
    required this.child,
  });

  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: () async => true,
      child: SafeArea(
        child: Scaffold(
          appBar: AppBar(
            
            title: Text(
              title.toUpperCase(),
              style: TextStyle(color: Colors.white),
            ),
            elevation: 0,
            backgroundColor: AppColor.primaryColor,
          ),
          body: child,
        ),
      ),
    );
  }
}
