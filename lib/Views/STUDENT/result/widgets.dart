import 'package:flutter/material.dart';
import 'package:flutter_pdfview/flutter_pdfview.dart';
import 'package:get/get.dart';
import 'package:school_management_system/Controller/student_library.dart';
import 'package:school_management_system/Model/STUDENT/result/history_model.dart';
import 'package:school_management_system/Model/STUDENT/result/result_type_model.dart';
import 'package:school_management_system/Utils/utils.dart';
import 'package:school_management_system/Views/Widgets/buttons.dart';

import '../../../Config/config.dart';
import '../../../Model/STUDENT/exam/exam_model.dart';

class ResultWidgets {
  // make this class singleton
  ResultWidgets._internal();
  static final ResultWidgets _singleton = ResultWidgets._internal();
  factory ResultWidgets() {
    return _singleton;
  }
  // codes start from here
  // All methods should be static to maintain singleton instances
  static final _controller = StuResultController.to;

  static vTopbar(M m) {
    return Container(
      decoration: BoxDecoration(
          // color: AppColor.helpDeskTopbar,
          color: AppColor.secondaryColor.withOpacity(.2),
          borderRadius: BorderRadius.circular(5.0),
          border: Border.all(color: AppColor.helpDeskTopbar, width: .5)),
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
                child: DropdownButton<StuHistoryModel>(
                  // value: controller.academicGrpDropdownValue.value,
                  value: _controller.selectedStudentHistory.value,
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
                    _controller.mUpdateSelectedStuHistory(selectedModel);
                  },
                  items: /* <String>["Recent", "Older"] */
                      _controller.stuHistoryList.map((StuHistoryModel value) {
                    return DropdownMenuItem<StuHistoryModel>(
                      value: value,
                      child: Text(
                        value.stClass!.className!,
                        style: kBody.copyWith(
                          fontWeight: FontWeight.w500,
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

                  value: _controller.selectedResultModel.value,
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
                    _controller.mUpdateSelectedStuExam(selectedModel);
                  },
                  items: /* <String>["Recent", "Older"] */
                      _controller.stuResultModelList
                          .map((StuResultTypeModel value) {
                    return DropdownMenuItem<StuResultTypeModel>(
                      value: value,
                      child: Text(
                        value.name!,
                        style: kBody.copyWith(fontWeight: FontWeight.w500),
                      ),
                    );
                  }).toList(),
                ),
              )),
        ),
      ],
    );
  }

  static _vGetResultBtn() {
    return AppButtons.vPrimaryButton(
      onTap: () async {
        await _controller.mGetResultPdf();
      },
      text: "Get Result",
    );
  }

  static vResultPdf() {
    return Obx(() => _controller.isResultFound.value
        ? _controller.pdfFilePath.isEmpty
            ? Container()
            : Container(
                height: AppScreenSize.mGetHeight(kGlobContext, 65),
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
                  _controller.mDownloadPortraitResult();
                },
                text: "Portrait"),
            AppSpacing.md.width,
            AppButtons.vDownloadButton(
                onTap: () {
                  _controller.mDownloadLandscapeResult();
                },
                text: "Landscape"),
          ],
        )
      ],
    );
  }
}
