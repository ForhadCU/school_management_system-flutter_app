import 'package:flutter/material.dart';
import 'package:school_management_system/Views/Widgets/base_widget.dart';

class SearchSchool extends StatelessWidget {
  const SearchSchool({super.key});

  @override
  Widget build(BuildContext context) {
    return BaseWidget(
        child: Column(
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [Text("Search School")],
        )
      ],
    ));
  }
}
