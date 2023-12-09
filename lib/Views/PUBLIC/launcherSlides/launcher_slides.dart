import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:school_management_system/Config/config.dart';
import 'package:school_management_system/Routes/app_pages.dart';
import 'package:school_management_system/Views/Widgets/buttons.dart';
import 'package:school_management_system/Views/PUBLIC/launcherSlides/pages/scr.slidetile_4.dart';

import '../../../Model/launcher_slides.dart';
import 'pages/scr.slidetile_0.dart';
import 'pages/scr.slidetile_1.dart';
import 'pages/scr.slidetile_2.dart';
import 'pages/scr.slidetile_3.dart';

class LauncherSlidesScreen extends StatefulWidget {
  const LauncherSlidesScreen({
    Key? key,
  }) : super(key: key);

  @override
  State<LauncherSlidesScreen> createState() => _LauncherSlidesScreenState();
}

class _LauncherSlidesScreenState extends State<LauncherSlidesScreen> {
  late List<SliderModel> mySLides;
  int slideIndex = 0;
  late PageController controller;

  Widget _buildPageIndicator(bool isCurrentPage) {
    return Container(
      margin: const EdgeInsets.symmetric(horizontal: 2.0),
      height: isCurrentPage ? 10.0 : 6.0,
      width: isCurrentPage ? 10.0 : 6.0,
      decoration: BoxDecoration(
        color: isCurrentPage ? AppColor.orange800 : AppColor.orange300,
        borderRadius: BorderRadius.circular(12),
      ),
    );
  }

  @override
  void initState() {
    super.initState();
    // if (!widget.isSignedIn) {
    //   mShowDialog();
    // }
    mySLides = [];
    mySLides = getSlides();
    controller = PageController();
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      child: Scaffold(
        // appBar: AppBar(systemOverlayStyle: SystemUiOverlayStyle()),
        body: Scaffold(
            backgroundColor: Colors.white,
            body: SizedBox(
              height: MediaQuery.of(context).size.height,
              child: PageView(
                controller: controller,
                onPageChanged: (index) {
                  setState(() {
                    slideIndex = index;
                  });
                },
                children: const <Widget>[
                  // SlideTile1(scrNo: mySLides[0].scrNo),
                  SlideTile0(),
                  SlideTile1(),
                  SlideTile2(),
                  SlideTile3(),
                  SlideTile4(),
                ],
              ),
            ),
            bottomSheet: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                const Divider(height: 1, thickness: 1, color: Colors.grey),
                Container(
                  padding: const EdgeInsets.symmetric(
                    vertical: AppSpacing.sm,
                    horizontal: AppSpacing.xl,
                  ),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: <Widget>[
                      AppButtons.vPrimaryButtonUnderlined(
                          onTap: () {
                            /* controller.animateToPage(slideIndex - 1,
                                duration: const Duration(milliseconds: 100),
                                curve: Curves.linear); */
                            Get.toNamed(AppRoutes.searchSchool);
                          },
                          text: "Skip"),
                      Row(
                        children: [
                          for (int i = 0; i <= 4; i++)
                            i == slideIndex
                                ? _buildPageIndicator(true)
                                : _buildPageIndicator(false),
                        ],
                      ),
                      AppButtons.vPrimaryButton(
                          onTap: () {
                            slideIndex == 4
                                ? {
                                    /* AwesomeDialog(
                                            context: context,
                                            dialogType: DialogType.warning,
                                            title: 'Saving..')
                                        .show(), */
                                    Get.toNamed(AppRoutes.searchSchool),
                                  }
                                : controller.animateToPage(slideIndex + 1,
                                    duration: const Duration(milliseconds: 100),
                                    curve: Curves.linear);
                          },
                          text: slideIndex == 4 ? "Finish" : "Next"),
                    ],
                  ),
                ),
              ],
            )),
      ),
    );
  }

  _mRouteToMain() async {
    /* 
    SharedPreferences pref = await SharedPreferences.getInstance();
    bool quesDataExisted;

    String sessionStart = pref.getString(MyKeywords.sessionStart)!;
    String email = pref.getString(MyKeywords.email)!;
    String uid = pref.getString(MyKeywords.uid)!;
    String expectedSessionEnd = pref.getString(MyKeywords.expectedSessionEnd)!;
    String? phone = pref.getString(MyKeywords.phone);

    await MySqfliteServices.mIsDbTableEmpty(
      
            tableName: MyKeywords.momprimaryColorTable)
        .then((value) async => {
              await MySqfliteServices.mAddMomprimaryColorDetails(

                sessionStart: sessionStart,
                expectedSessionEnd: expectedSessionEnd,
                email: email,
                uid: uid,
                phone: phone,
              ).then((value) async => {
                    // logger.d('Data inserted into BabyDetails Table: $value'),
                    if (value != null)
                      {
                        _momId = value,
                        // logger.d("Current momId: $value"),
                        /*  _babyId =
                                await MySqfliteServices.mFetchActiveBabyId(
                                    email: email, momId: value),
                            logger.d('\x1b[33m Baby id: $_babyId \x1b[0m'), */

                        quesDataExisted = await MySqfliteServices
                            .mCheckExistedQuesDataOfBabyGrowth(),
                        quesDataExisted
                            ? null
                            : {
                                for (var babyGrowthModel in MyServices
                                    .mGetInitialQuesDataOfBabyGrowth())
                                  {
                                    await MySqfliteServices
                                        .mAddInitialQuesDataOfBabyGrowth(
                                            babyGrowthModel: babyGrowthModel),
                                  },
                              },

                        // add dummy mom-weights
                        for (var i = 0; i <= 40; i++)
                          {
                            await MySqfliteServices.mAddInitialMomWeights(
                                momWeight: MomWeight.weight(
                                    email: email,
                                    momId: /* momId */ value,
                                    weekNo: i,
                                    weight: 0.00,
                                    timestamp:
                                        DateTime.now().millisecondsSinceEpoch))
                          },

                        Navigator.pop(context),

                        // c: Save current status and momId
                        pref.setString(MyKeywords.loggedin, 'y'),
                        pref.setInt(MyKeywords.momId, value),

                        // c: Clear previous SharedPreference data
                        pref.remove(MyKeywords.sessionStart),
                        pref.remove(MyKeywords.expectedSessionEnd),

                        //Go to Shagotom Screen
                        Navigator.pushReplacement(
                            context,
                            PageTransition(
                                child: ShagotomScreen(
                                  momInfo: MomInfo(
                                      momId: value,
                                      email: email,
                                      phone: phone,
                                      expectedSessionEnd: expectedSessionEnd,
                                      sessionStart: sessionStart),
                                ),
                                type: PageTransitionType.rightToLeft))
                      }
                  })
            });
  */
  }

  void mShowDialog() {
    /* AwesomeDialog(
            context: context,
            animType: AnimType.scale,
            dialogType: DialogType.info,
            body: const Center(child: Text(
                    'If the body is specified, then title and description will be ignored, this allows to further customize the dialogue.',
                    style: TextStyle(fontStyle: FontStyle.italic),
                  ),),
            title: 'This is Ignored',
            desc:   'This is also Ignored',
            btnOkOnPress: () {},
            ).show(); */
  }
}
