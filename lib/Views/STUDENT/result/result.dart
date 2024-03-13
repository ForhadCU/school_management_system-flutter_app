import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:school_management_system/Config/config.dart';
import 'package:school_management_system/Utils/int_extensions.dart';
import 'package:school_management_system/Views/Widgets/base_widget.dart';

import '../../../Controller/student_library.dart';
import '../../../Utils/utils.dart';
import 'package:flutter_pdfview/flutter_pdfview.dart';
import 'package:school_management_system/Model/STUDENT/result/history_model.dart';
import 'package:school_management_system/Model/STUDENT/result/result_type_model.dart';
import 'package:school_management_system/Views/Widgets/buttons.dart';

class Result extends GetView<StuResultController> {
  const Result({super.key});

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
      builder: (context, constraints) {
        M m = M(constraints);
        return BaseWidget(
            title: "My Result".toUpperCase(),
            child: BaseWidgetChild(
              child: SingleChildScrollView(
                child: Column(
                  children: [
                    vTopbar(m),
                    AppSpacing.xl.height,
                    vBody(),
                  ],
                ),
              ),
            ));
      },
    );
  }

  vTopbar(M m) {
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
          _vGetResultBtn(),
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
          child: Obx(() => Container(
                padding: const EdgeInsets.symmetric(
                    horizontal: AppSpacing.sm, vertical: AppSpacing.smh),
                color: AppColor.frenchSkyBlue100,
                /*  decoration:
                      BoxDecoration(borderRadius: BorderRadius.circular(5)), */
                child: DropdownButton<StuHistoryModel>(
                  // value: controller.academicGrpDropdownValue.value,
                  value: controller.selectedStudentHistory.value,
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
                  onChanged: (StuHistoryModel? selectedModel) {
                    controller.mUpdateSelectedStuHistory(selectedModel);
                  },
                  items: /* <String>["Recent", "Older"] */
                      controller.stuHistoryList.map((StuHistoryModel value) {
                    return DropdownMenuItem<StuHistoryModel>(
                      value: value,
                      child: Text(
                        value.stClass!.className!,
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
          flex: 2,
          child: Obx(() => Container(
                padding: const EdgeInsets.symmetric(
                    horizontal: AppSpacing.sm, vertical: AppSpacing.smh),
                color: AppColor.frenchSkyBlue100,
                /*  decoration:
                                      BoxDecoration(borderRadius: BorderRadius.circular(5)), */
                child: DropdownButton<StuResultTypeModel>(
                  // value: controller.academicGrpDropdownValue.value,

                  value: controller.selectedResultModel.value,
                  icon: const Icon(Icons.keyboard_arrow_down),
                  iconSize: 12,
                  elevation: 10,
                  // style: kBody.copyWith(fontWeight: FontWeight.w500),
                  focusColor: AppColor.white,
                  dropdownColor: AppColor.frenchSkyBlue100,
                  isDense: true,
                  isExpanded: true,
                  underline: Container(
                      /*        height: 1,
                                      color: AppColor.kGray700.withOpacity(.5), */
                      ),
                  // onChanged: (AcademicGroupModel? selectedModel) {
                  onChanged: (StuResultTypeModel? selectedModel) {
                    controller.mUpdateSelectedStuExam(selectedModel);
                  },
                  items: /* <String>["Recent", "Older"] */
                      controller.stuResultModelList
                          .map((StuResultTypeModel value) {
                    return DropdownMenuItem<StuResultTypeModel>(
                      value: value,
                      child: Text(
                        value.name!,
                        style: kBody.copyWith(fontWeight: FontWeight.w400),
                      ),
                    );
                  }).toList(),
                ),
              )),
        ),
      ],
    );
  }

  _vGetResultBtn() {
    return /* AppButtons.vPrimaryButtonWithGradient(
      onTap: () async {
        await controller.mGetResultPdf();
      },
      text: "Get Result",
    ) */
        SizedBox(
            width: AppScreenSize.mGetWidth(kGlobContext, 50),
            child: AppButtons.vPrimaryButtonWithGradient(
              onTap: () async {
                controller.isLoading.value = true;
                await controller.mGetResultPdf();
                controller.isLoading.value = false;
              },
              text: "Get",
            ));
  }

  vResultPdf() {
    return Container(
        alignment: Alignment.topCenter,
        height: AppScreenSize.mGetHeight(kGlobContext, 40),
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
        ));

    /* 
    return Obx(() => controller.isLoading.value
        ? Container()
        : !controller.isResultFound.value
            ? Container(
                alignment: Alignment.center,
                height: AppScreenSize.mGetHeight(kGlobContext, 50),
                child: Text(
                  "No Result Found.",
                  style: kBody.copyWith(
                    color: Colors.black45,
                  ),
                ),
              )
            : SizedBox(
                height: AppScreenSize.mGetHeight(kGlobContext, 65),
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
                )));
  */
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
                      controller.mDownloadPortraitResult();
                    },
                    text: "Portrait"),
                AppSpacing.md.width,
                AppButtons.vDownloadButton(
                    onTap: () {
                      controller.mDownloadLandscapeResult();
                    },
                    text: "Landscape"),
              ],
            )
          ],
        ); /* Visibility(
          visible: controller.isResultFound.value,
          child: Column(
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
                        controller.mDownloadPortraitResult();
                      },
                      text: "Portrait"),
                  AppSpacing.md.width,
                  AppButtons.vDownloadButton(
                      onTap: () {
                        controller.mDownloadLandscapeResult();
                      },
                      text: "Landscape"),
                ],
              )
            ],
          ),
        )) */
  }

  vBody() {
    return Obx(() => controller.isLoading.value
        ? Container(
            alignment: Alignment.center,
            height: AppScreenSize.mGetHeight(kGlobContext, 50),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                SizedBox(
                  width: 24,
                  height: 24,
                  child: CircularProgressIndicator(
                    color: AppColor.primaryColor.withOpacity(.5),
                    strokeWidth: 1.5,
                  ),
                ),
                AppSpacing.sm.height,
                const Text(
                  "Please wait...",
                  style: kLabel,
                ),
              ],
            ),
          )
        : !controller.isResultFound.value
            ? Container(
                alignment: Alignment.center,
                height: AppScreenSize.mGetHeight(kGlobContext, 50),
                child: Text(
                  "Not Found.",
                  style: kBody.copyWith(
                    color: Colors.black45,
                  ),
                ),
              )
            : Column(
                children: [
                  vDownloadBtns(),
                  AppSpacing.md.height,
                  vResultPdf(),
                ],
              ));
  }
}
