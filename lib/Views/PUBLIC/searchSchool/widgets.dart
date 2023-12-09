import 'package:flutter/material.dart';

import '../../../Config/config.dart';

class SchoolResultListItem extends StatelessWidget {
  const SchoolResultListItem(
      {super.key,
      required this.schoolName,
      required this.schoolAdress,
      this.imageUri, required this.onTap});

  final String schoolName;
  final String schoolAdress;
  final String? imageUri;
  final Function onTap;

  @override
  Widget build(BuildContext context) {
    return ListTile(
      onTap:()=> onTap(),
      leading: const CircleAvatar(
          radius: AppSpacing.logoSizeDemoSchool,
          backgroundImage: AssetImage(logoDemoSchool)),
      title: Text(
        schoolName,
        style: kTitleLite,
      ),
      // subtitle: Text("This will be address of this school"),
      subtitle: Text(schoolAdress),
    );
  }
}
