import 'package:flutter/widgets.dart';
import 'package:school_management_system/Utils/utils.dart';

import '../../Config/config.dart';

class InstitueBanaer extends StatelessWidget {
  final String iconUrl;
  final String title;
  const InstitueBanaer({super.key, required this.iconUrl, required this.title});

  @override
  Widget build(BuildContext context) {
    return   Column(
      children: [
         Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Image(
              image: AssetImage(iconUrl),
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
         Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              // "Nasirabad Govt. High School",
              title,
              style: kHeading,
            ),
          ],
        ),
      ],
    );
  
  }
}
