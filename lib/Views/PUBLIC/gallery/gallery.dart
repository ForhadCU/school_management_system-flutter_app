import 'package:flutter/material.dart';
import 'package:school_management_system/Config/config.dart';
import 'package:school_management_system/Utils/int_extensions.dart';
import 'package:school_management_system/Views/PUBLIC/gallery/widgets.dart';
import 'package:school_management_system/Views/Widgets/base_widget.dart';

import '../../../Controller/PUBLIC/gallery_controller.dart';

class Gallery extends StatelessWidget {
  const Gallery({super.key});

  @override
  Widget build(BuildContext context) {
    final controler = GalleryController.to;
    return BaseWidget(
        title: "Gallery",
        child: BaseWidgetChild(
          child: Column(
            children: [
              GalleryWidget.vTopBar(controler),
              AppSpacing.sm.height,
              GalleryWidget.vDividerAndFilter(controler),
              AppSpacing.md.height,
              GalleryWidget.vPhotos(controler),
            ],
          ),
        ));
  }
}
