import 'package:flutter/material.dart';

import '../../Config/styles/spacing.dart';


class BaseWidget extends StatelessWidget {
  final Widget child;
  const BaseWidget({super.key, required this.child});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(
          horizontal: AppSpacing.sm, vertical: AppSpacing.md),
      child: child,
    );
  }
}
