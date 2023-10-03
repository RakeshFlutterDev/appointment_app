import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:jazeera_paints/util/dimensions.dart';
import 'package:jazeera_paints/view/screens/order/widget/custom_stepper.dart';

class TrackingStepperWidget extends StatelessWidget {
  final String status;
  const TrackingStepperWidget({super.key, required this.status});

  @override
  Widget build(BuildContext context) {
    int _status = -1;

    return Container(
      padding: const EdgeInsets.all(Dimensions.PADDING_SIZE_SMALL),
      decoration: BoxDecoration(
        color: Theme.of(context).cardColor,
        borderRadius: BorderRadius.circular(Dimensions.RADIUS_SMALL),
      ),
      child: Row(children: [
        CustomStepper(
          title: 'First Visit'.tr, isActive: _status > -1, haveLeftBar: false, haveRightBar: true, rightActive: _status > 0,
        ),
        CustomStepper(
          title: 'Suggested Products'.tr, isActive: _status > 0, haveLeftBar: true, haveRightBar: true, rightActive: _status > 1,
        ),
        CustomStepper(
          title: 'Payment of extra products'.tr, isActive: _status > 1, haveLeftBar: true, haveRightBar: true, rightActive: _status > 2,
        ),
        CustomStepper(
          title: 'delivery'.tr, isActive: _status > 3, haveLeftBar: true, haveRightBar: false, rightActive: _status > 4,
        ),
        CustomStepper(
          title: 'Painting Appointment'.tr, isActive: _status > 3, haveLeftBar: true, haveRightBar: false, rightActive: _status > 4,
        ),
      ]),
    );
  }
}
