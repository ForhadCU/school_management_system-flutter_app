import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:school_management_system/Utils/utils.dart';
import 'package:school_management_system/Views/Widgets/common_cached_network_image.dart';
import 'package:school_management_system/Views/Widgets/user_cached_network_image.dart';

import '../../Config/config.dart';
import '../../Singletones/app_data.dart';
import 'site_cached_network_image.dart';

class InstitueBanaer extends StatelessWidget {
  final String? iconUrl;
  final String title;
  const InstitueBanaer({super.key, required this.iconUrl, required this.title});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            iconUrl != null
                ? siteCachedNetworkImage(AppData.hostNameFull + iconUrl!,
                    width: 48 * 2, fit: BoxFit.contain)
                : Image(
                    image: AssetImage(edu_world_logo),
                    width: 48 * 2,
                    height: 48 * 2,
                    fit: BoxFit.fill,
                  ),
            /*  IconButton(
                onPressed: () => scafoldKey.currentState?.openEndDrawer(),
                icon: Image(
                  image: AssetImage(menu),
                  width: 24,
                  height: 24,
                  fit: BoxFit.fill,
                )), */
          ],
        ),
        AppSpacing.sm.height,
        TextFormField(
          readOnly: true,
          controller: TextEditingController(text: title),
          style: kHeading,
          maxLines: 2,
          textAlignVertical: TextAlignVertical.center,
          textAlign: TextAlign.center,
          decoration: InputDecoration(
              border: InputBorder.none,
              contentPadding: EdgeInsets.zero,
              isDense: true),
        ),
      ],
    );
  }
}
