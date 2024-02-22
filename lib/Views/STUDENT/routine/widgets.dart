/* import 'package:flutter/material.dart';
import 'package:flutter_pdfview/flutter_pdfview.dart';
import 'package:get/get.dart';
import 'package:school_management_system/Controller/student_library.dart';
import 'package:school_management_system/Model/STUDENT/routine/period_type_model.dart';
import 'package:school_management_system/Model/STUDENT/routine/routine_model.dart';
import 'package:school_management_system/Utils/utils.dart';

import '../../../Config/config.dart';
import '../../Widgets/buttons.dart';

class RoutineWidgets {

  // make this class singleton
  RoutineWidgets._internal();
  static final RoutineWidgets _singleton = RoutineWidgets._internal();
  factory RoutineWidgets() {
    return _singleton;
  }
  // codes start from here
  // All methods should be static to maintain singleton instances
  static final _controller = StuRoutineController.to;

  static vTopbar() {
    return Container(
      decoration: BoxDecoration(
        // color: AppColor.helpDeskTopbar,
        color: AppColor.activeTab,
        borderRadius: BorderRadius.circular(5.0),
      ),
      padding:
          const EdgeInsets.symmetric(horizontal: 8.0, vertical: AppSpacing.md),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          _vDropdowns(),
          AppSpacing.xl.height,
          _vGetRoutineBtn(),
        ],
      ),
    );
  }

  static _vDropdowns() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceAround,
      children: [
        Expanded(
            flex: 1,
            child: Obx(() => Container(
                  padding: const EdgeInsets.symmetric(
                      horizontal: AppSpacing.sm, vertical: AppSpacing.smh),
                  color: AppColor.frenchSkyBlue100,
                  /*  decoration:
                      BoxDecoration(borderRadius: BorderRadius.circular(5)), */
                  child: DropdownButton<PeriodicTypeModel>(
                    // value: controller.academicGrpDropdownValue.value,
                    value: _controller.selectedPeriodicTypeModel.value,
                    icon: const Icon(Icons.keyboard_arrow_down),
                    iconSize: 12,
                    elevation: 10,
                    // style: kBody.copyWith(fontWeight: FontWeight.w500),
                    focusColor: AppColor.white,
                    dropdownColor: AppColor.frenchSkyBlue100,
                    isDense: true,
                    isExpanded: true,
                    underline: Container(),
                    // onChanged: (AcademicGroupModel? selectedModel) {
                    onChanged: (PeriodicTypeModel? selectedModel) {
                      _controller.mUpdateSelectedPeriodicType(selectedModel);
                    },
                    items: /* <String>["Recent", "Older"] */
                        _controller.periodicTypeList
                            .map((PeriodicTypeModel value) {
                      return DropdownMenuItem<PeriodicTypeModel>(
                        value: value,
                        child: Text(
                          value.typeName!,
                          style: kBody.copyWith(
                            fontWeight: FontWeight.w400,
                          ),
                        ),
                      );
                    }).toList(),
                  ),
                ))),
      ],
    );
  }

  static _vGetRoutineBtn() {
    return AppButtons.vPrimaryButtonWithGradient(
      onTap: () async {
        await _controller.mGetRoutinePdf();
      },
      text: "Get Routine",
    );
  }

  static vRoutinePdf() {
    return Obx(() => _controller.isRoutineFound.value
        ? _controller.pdfFilePath.isEmpty
            ? Container(
                /* 
                alignment: Alignment.center,
                height: AppScreenSize.mGetHeight(kGlobContext, 50),
                child: Text(
                  "No Routine Found!",
                  style: kBody.copyWith(color: Colors.amber),
                ),
               */
                )
            : SizedBox(
                height: AppScreenSize.mGetHeight(kGlobContext, 50),
                width: double.infinity,
                child: PDFView(
                  filePath: _controller.pdfFilePath.value,
                  enableSwipe: true,
                  swipeHorizontal: true,
                  autoSpacing: false,
                  pageFling: false,
                  pageSnap: true,
                  onError: (error) {
                    print(error);
                  },
                  onRender: (pages) {
                    // _controller.obs;
                    kLog("Called");
                  },
                  onPageError: (page, error) {
                    print(': ${error.toString()}');
                  },
                  onViewCreated: (PDFViewController vc) async {
                    // _controller.pdfController.value = vc;
                    // pdfViewController = vc;
                    kLog("Ready Pdf View");
                    // _controller.obs;
                  },
                  onPageChanged: (int? page, int? total) {
                    print('page change: /');
                  },
                ))
        : Expanded(
            child: Center(
                child: Text(
              "No Result Found.",
              style: kBody.copyWith(
                color: AppColor.red,
              ),
            )),
          ));
  }

  static vDownloadBtns() {
    return Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        /// heading
        Row(
          children: [
            const Expanded(
                child: Divider(
              thickness: 1,
              color: Colors.black12,
              height: 1,
            )),
            AppSpacing.smh.width,
            const Text(
              "Dowload",
              style: kLabel,
            ),
            AppSpacing.smh.width,
            const Expanded(
                child: Divider(
              thickness: 1,
              color: Colors.black12,
              height: 1,
            )),
          ],
        ),
        AppSpacing.sm.height,
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            AppButtons.vDownloadButton(
                onTap: () {
                  _controller.mDownload();
                },
                text: "Save as PDF"),
            /*   AppButtons.vDownloadButton(
                onTap: () {
                  // _controller.mDownloadLandscapeResult();
                },
                text: "Landscape"), */
          ],
        )
      ],
    );
  }
}
 */