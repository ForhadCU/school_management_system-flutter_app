import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

import '../../../Config/config.dart';
import '../../../Controller/PUBLIC/contact_controller.dart';
import '../../../Utils/utils.dart';
import '../../Widgets/custom_textfield.dart';

class ContactWidget {
  static final ContactWidget _singleton = ContactWidget._internal();
  ContactWidget._internal();
  factory ContactWidget() {
    return _singleton;
  }
  static final controller = ContactController.to;
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
            text: controller.siteListModel.value.address.toString(),
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
        _vSitebox(PublicAssetLocation.ic_whatsapp, Color(0xff6FC556), ""),
        _vSitebox(PublicAssetLocation.ic_google, Color.fromARGB(255, 179, 179, 179), ""),
      ],
    );
  }

  _vSitebox(String imageLoc, Color bgColor, String url) {
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
