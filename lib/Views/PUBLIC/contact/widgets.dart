
import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

import '../../../Config/config.dart';
import '../../../Controller/contact.dart';
import '../../../Utils/utils.dart';
import '../../Widgets/custom_textfield.dart';

class ContactWidget {
  static final ContactWidget _singleton = ContactWidget._internal();
  ContactWidget._internal();
  factory ContactWidget() {
    return _singleton;
  }

  vMap(ContactController controller) {
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

  vInfo(ContactController controller) {
    return Container(
      padding: EdgeInsets.all(AppSpacing.sm),
      decoration: kContainerPrimaryWithGradientReverse,
      child: Column(
        children: [
          vTextFieldWithIcon(
            text: controller.adress.value.toString(),
            icon: Icon(
              Icons.location_pin,
              size: 24,
              color: AppColor.white.withOpacity(.8),
            ),
          ),
          vTextFieldWithIcon(
            text: controller.phone.value.toString(),
            icon: Icon(
              Icons.phone,
              size: 24,
              color: AppColor.white.withOpacity(.8),
            ),
          ),
          vTextFieldWithIcon(
            text: controller.email.value.toString(),
            icon: Icon(
              Icons.email,
              size: 24,
              color: AppColor.white.withOpacity(.8),
            ),
          ),
          vTextFieldWithIcon(
            text: controller.website.value.toString(),
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

  vSites(ContactController controller) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceAround,
      children: [
        _vSitebox(no_icon_img, Color(0xffD70065)),
        _vSitebox(no_icon_img, Color(0xff6FC556)),
        _vSitebox(no_icon_img, Color(0xff2463FF)),
        _vSitebox(no_icon_img, Color(0xff111111)),
        _vSitebox(no_icon_img, Color(0xffFE0000)),
        _vSitebox(no_icon_img, Color(0xff667FB5)),
      ],
    );
  }

  _vSitebox(String imageLoc, Color bgColor) {
    return Container(
      width: AppScreenSize.mGetWidth(kGlobContext, 14),
      padding: const EdgeInsets.symmetric(vertical: AppSpacing.smh),
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
