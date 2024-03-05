import 'package:flutter/material.dart';
import 'package:flutter_pdfview/flutter_pdfview.dart';
import 'package:get/get.dart';
import 'package:school_management_system/Utils/utils.dart';
import 'package:school_management_system/Views/Widgets/base_widget.dart';

import '../../../Config/config.dart';
import '../../../Controller/TEACHER/routine/routine_controller.dart';
import '../../../Controller/common/common_controller.dart';
import '../../../Model/STUDENT/routine/period_type_model.dart';
import '../../../Model/TEACHER/version_year_shift_model.dart';
import '../../Widgets/buttons.dart';

class TeachRoutine extends GetView<TeachRoutineController> {
   TeachRoutine({super.key});
    final _commonController = CommonController.to;

  @override
  Widget build(BuildContext context) {

    return BaseWidget(
        title: "Routine",
        child: BaseWidgetChild(
          child: SingleChildScrollView(
            child: Column(
              children: [
                vTopbar(),
                AppSpacing.xl.height,
                vDownloadBtns(),
                AppSpacing.md.height,
                vRoutinePdf(),
              ],
            ),
          ),
        ));
  }


   vTopbar() {
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

   _vDropdowns() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceAround,
      children: [
        Expanded(
          flex: 1,
          child: Container(
              padding: const EdgeInsets.symmetric(
                  horizontal: AppSpacing.sm, vertical: AppSpacing.smh),
              color: AppColor.frenchSkyBlue100,
              /*  decoration:
                          BoxDecoration(borderRadius: BorderRadius.circular(5)), */
              child: Obx(
                () => DropdownButton<AcademicYear>(
                  // child: DropdownButton<String>(
                  value: _commonController.selectedAcademicYear.value,
                  hint: Text(
                    _commonController.canContinue.value
                        ? "Select Year"
                        : "No Year",
                    style: kBody.copyWith(color: Colors.black),
                  ),
                  icon: const Icon(Icons.keyboard_arrow_down),
                  iconSize: 12,
                  elevation: 10,
                  // style: kBody.copyWith(fontWeight: FontWeight.w500),
                  focusColor: AppColor.white,
                  dropdownColor: AppColor.frenchSkyBlue100,
                  isDense: true,
                  isExpanded: true,
                  underline: Container(),
                  onChanged: (AcademicYear? selectedModel) {
                    controller.mUpdateSelectedAcademicYear(selectedModel);
                  },
                  /*  onChanged: (String? selectedModel) {
                                    // controller.mUpdateSelectedStuHistory(selectedModel);
                                  }, */
                  items: _commonController.academicYearList
                      .map((AcademicYear value) {
                    return DropdownMenuItem<AcademicYear>(
                      value: value,
                      child: Text(
                        value.yearName ?? "",
                        style: kBody.copyWith(
                          fontWeight: FontWeight.w400,
                        ),
                      ),
                    );
                  }).toList(),
                ),
              )),
        ),
        AppSpacing.sm.width,
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
                    value: controller.selectedPeriodicTypeModel.value,
                    hint: Text(
                      controller.periodicTypeList.isNotEmpty
                          ? "Select Period"
                          : "No Period",
                      style: kBody.copyWith(color: Colors.black),
                    ),

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
                      controller.mUpdateSelectedPeriodicType(selectedModel);
                    },
                    items: /* <String>["Recent", "Older"] */
                        controller.periodicTypeList
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

   _vGetRoutineBtn() {
    return AppButtons.vPrimaryButtonWithGradient(
      onTap: () async {
        await controller.mGetRoutinePdf();
      },
      text: "Get Routine",
    );
  }

   vRoutinePdf() {
    return Obx(() {
      kLog("Updated");
      return controller.isRoutineFound.value
          ? controller.pdfFilePath.isEmpty
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
                  height: AppScreenSize.mGetHeight(kGlobContext, 60),
                  width: double.infinity,
                  child: PDFView(
                    filePath: controller.pdfFilePath.value,
                    enableSwipe: true,
                    swipeHorizontal: true,
                    autoSpacing: false,
                    pageFling: false,
                    pageSnap: true,
                    onError: (error) {
                      print(error);
                    },
                    onRender: (pages) {
                      // controller.obs;
                      kLog("Called");
                    },
                    onPageError: (page, error) {
                      print(': ${error.toString()}');
                    },
                    onViewCreated: (PDFViewController vc) async {
                      // controller.pdfController.value = vc;
                      // pdfViewController = vc;
                      kLog("Ready Pdf View");
                      // controller.obs;
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
            );
    });
  }

   vDownloadBtns() {
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
                  controller.mDownload();
                },
                text: "Save as PDF"),
            /*   AppButtons.vDownloadButton(
                onTap: () {
                  // controller.mDownloadLandscapeResult();
                },
                text: "Landscape"), */
          ],
        )
      ],
    );
  }
}
