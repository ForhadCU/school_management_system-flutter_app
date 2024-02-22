import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:school_management_system/Config/config.dart';
import 'package:school_management_system/Controller/PUBLIC/contact_controller.dart';
import 'package:school_management_system/Utils/int_extensions.dart';
import 'package:school_management_system/Utils/utils.dart';
import 'package:school_management_system/Views/Widgets/base_widget.dart';
import 'package:school_management_system/Views/Widgets/top_bar_banner.dart';

import '../../Widgets/custom_textfield.dart';

class Contact extends GetView<ContactController> {
  const Contact({super.key});

  @override
  Widget build(BuildContext context) {
    
    return WillPopScope(
      onWillPop: () async {
        return true;
      },
      child: BaseWidget(
        title: "Contact Us",
        child: BaseWidgetChild(
            child: SingleChildScrollView(
          child: Column(
            children: [
              InstitueBanaer(
                  iconUrl: controller.siteListModel.value.siteLogo,
                  title: controller.siteListModel.value.siteName!),
              AppSpacing.xl.height,
              vInfo(),
              AppSpacing.md.height,
              vMap(),
              AppSpacing.md.height,
              vSites(),
              // _vSites(controller),
            ],
          ),
        )),
      ),
    );
  }

  vMap() {
    return SizedBox(
      height: AppScreenSize.mGetHeight(kGlobContext, 30),
      child: GoogleMap(
        mapType: MapType.terrain,
        initialCameraPosition: controller.kMapCameraPosition.value!,
        markers: {
          Marker(
              markerId: MarkerId("Current Position"),
              position: LatLng(
                  controller.lattitude.value!, controller.longitude.value!))
        },
        onMapCreated: (GoogleMapController mapController) {
          controller.controllerGoogleMap.complete(mapController);
        },
      ),
    );
  }

  vInfo() {
    return Container(
      padding: EdgeInsets.all(AppSpacing.sm),
      decoration: kContainerPrimaryWithGradientReverse,
      child: Column(
        children: [
          vTextFieldWithIcon(
            text:  controller.siteListModel.value.address.toString(),
            icon: Icon(
              Icons.location_pin,
              size: 24,
              color: AppColor.white.withOpacity(.8),
            ),
          ),
          vTextFieldWithIcon(
            text: controller.siteListModel.value.sitePhone.toString(),
            icon: Icon(
              Icons.phone,
              size: 24,
              color: AppColor.white.withOpacity(.8),
            ),
          ),
          vTextFieldWithIcon(
            text: controller.siteListModel.value.siteEmail.toString(),
            icon: Icon(
              Icons.email,
              size: 24,
              color: AppColor.white.withOpacity(.8),
            ),
          ),
          vTextFieldWithIcon(
            text: controller.siteListModel.value.googleLink.toString(),
            icon: Icon(
              Icons.public,
              size: 24,
              color: AppColor.white.withOpacity(.8),
            ),
          ),
        ],
      ),
    );
  }

  vSites() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceAround,
      children: [
        // _vSitebox(no_icon_img, Color(0xffD70065)),
        _vSitebox(PublicAssetLocation.ic_fb, Color(0xff2463FF),
            controller.siteListModel.value.facebookLink),
        _vSitebox(PublicAssetLocation.ic_youtube, Color(0xffFE0000),
            controller.siteListModel.value.youtubeLink),
        _vSitebox(PublicAssetLocation.ic_web, Color(0xff667FB5),
            controller.siteListModel.value.googleLink),
        _vSitebox(PublicAssetLocation.ic_whatsapp, Color(0xff6FC556), null),
        _vSitebox(PublicAssetLocation.ic_google, Color.fromARGB(255, 179, 179, 179), null),
      ],
    );
  }

  _vSitebox(String imageLoc, Color bgColor, String? url) {
    return Container(
      width: AppScreenSize.mGetWidth(kGlobContext, 14),
      padding: const EdgeInsets.symmetric(vertical: AppSpacing.sm),
      alignment: Alignment.center,
      decoration:
          BoxDecoration(color: bgColor, borderRadius: BorderRadius.circular(4)),
      child: Image(
        image: AssetImage(imageLoc),
        width: 24,
        height: 24,
        color: AppColor.white,
      ),
    );
  }

}
