import 'package:flutter/material.dart';
import 'package:school_management_system/Utils/utils.dart';

import '../../../Config/config.dart';

class ResultWidgets {
  // make this class singleton 
    ResultWidgets._internal();
    static final ResultWidgets _singleton = ResultWidgets._internal();
    factory ResultWidgets() {
      return _singleton;
    }
  // codes start from here
  // All methods should be static to maintain singleton instances
  static vTopbar() {
    return Container(
      decoration: BoxDecoration(
        color: AppColor.helpDeskTopbar,
        borderRadius: BorderRadius.circular(8.0),
      ),
      padding: const EdgeInsets.all(8.0),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              Expanded(
                flex: 1,
                child: Container(
                  padding:
                      const EdgeInsets.symmetric(horizontal: AppSpacing.sm),
                  color: AppColor.frenchSkyBlue100,
                  /*  decoration:
                      BoxDecoration(borderRadius: BorderRadius.circular(5)), */
                  child: DropdownButton<String>(
                    dropdownColor: AppColor
                        .frenchSkyBlue100, // Set dropdown fill color to white
                    underline: Container(),
                    isExpanded: true,
                    items: const [
                      DropdownMenuItem<String>(
                        value: 'Option 1',
                        child: Text('Option 1'),
                      ),
                      DropdownMenuItem<String>(
                        value: 'Option 2',
                        child: Text('Option 2'),
                      ),
                    ],
                    onChanged: (value) {},
                    hint: const Text('Select Class'),
                  ),
                ),
              ),
              AppSpacing.sm.width,
              Expanded(
                flex: 1,
                child: Container(
                  padding:
                      const EdgeInsets.symmetric(horizontal: AppSpacing.sm),
                  color: AppColor.frenchSkyBlue100,
                  /*    decoration:
                      BoxDecoration(borderRadius: BorderRadius.circular(5)), */
                  child: DropdownButton<String>(
                    dropdownColor: AppColor
                        .frenchSkyBlue100, // Set dropdown fill color to white

                    underline: Container(),
                    isExpanded: true,
                    items: const [
                      DropdownMenuItem<String>(
                        value: 'Option A',
                        child: Text('Option A'),
                      ),
                      DropdownMenuItem<String>(
                        value: 'Option B',
                        child: Text('Option B'),
                      ),
                    ],
                    onChanged: (value) {},
                    hint: const Text('Select Result Type'),
                  ),
                ),
              ),
            ],
          ),
         
        ],
      ),
    );
  }
}