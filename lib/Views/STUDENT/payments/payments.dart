import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:school_management_system/Config/config.dart';
import 'package:school_management_system/Controller/student_library.dart';
import 'package:school_management_system/Utils/int_extensions.dart';
import 'package:school_management_system/Utils/m.dart';
import 'package:school_management_system/Views/STUDENT/payments/widgets.dart';
import 'package:school_management_system/Views/Widgets/base_widget.dart';

class StuPayments extends StatelessWidget {
  const StuPayments({super.key});

  @override
  Widget build(BuildContext context) {
    final _controller = StuPaymentsController.to;
    return LayoutBuilder(builder: (context, constraints) {
      M m = M(constraints);
      return BaseWidget(
          title: "My Payments",
          child: BaseWidgetChild(
            child: Obx(() => _controller.isFeeDetails.value
                ? StuPaymentsWidgets.vFeeDetails()
                : Column(
                    children: [
                      StuPaymentsWidgets.vTopbar(m: m),
                      AppSpacing.smh.height,

                      /// tab1: Make Payment
                   Obx(() =>    _controller.isMakePaymentTabActive.value
                          ? StuPaymentsWidgets.vMakePayment(
                              child: Column(
                              children: [
                                _controller.isFeeDetailsActive.value
                                    ? StuPaymentsWidgets.vFeeDetails()
                                    : StuPaymentsWidgets.vPayableAmountBanner(
                                        m: m),
                                AppSpacing.md.height,
                                _controller.isPaymentByWalet.value
                                    ? StuPaymentsWidgets.vPaymentByWalet(m: m)
                                    : Container(),
                                _controller.isPaymentByTransactionId.value
                                    ? StuPaymentsWidgets.vPaymentByTransId(m: m)
                                    : Container(),
                              ],
                            ))
                          : Container()),

                      ///tab2: Payment History
                    Obx(() =>   _controller.isPaymentHistoryTabActive.value
                          ? StuPaymentsWidgets.vPaymentHistory(
                              child: StuPaymentsWidgets.vTransHistoryTable(),
                            )
                          : Container()),
                    ],
                  )),
          ));
    });
  }
}
