import 'package:flutter/material.dart';
import 'package:sizer/sizer.dart';
import 'package:attendance_and_departure/config/text_style.dart';
import 'package:attendance_and_departure/core/models/abstract_model.dart';
import 'package:attendance_and_departure/core/widget/progress_widget%20copy.dart';
import 'package:attendance_and_departure/features/language/presentation/provider/language_provider.dart';

class ProgressGroupWidget extends StatelessWidget {
  const ProgressGroupWidget({super.key, required this.superProgressAbstract});
  final SuperProgressAbstract superProgressAbstract;
  @override
  Widget build(BuildContext context) {
    return Container(
      width: 100.w,
      child: Column(
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              ...List.generate(superProgressAbstract.superList()!.length, (index) {
                return Row(
                  children: [
                    ProgressWidget(
                      progressAbstract: superProgressAbstract.superList()![index],
                      superProgressAbstract: superProgressAbstract,
                      index: index,
                    ),
                  ],
                );
              }),
            ],
          ),
          // Container(
          //   width: 75.w,
          //   child: Row(
          //     mainAxisAlignment: MainAxisAlignment.spaceBetween,
          //     children: [
          //       ...List.generate(superProgressAbstract.superList()!.length, (index) {
          //         return Text(LanguageProvider.translate('titles', superProgressAbstract.superList()![index].title), style: TextStyleClass.normalStyle());
          //       })
          //     ],
          //   ),
          // )
        ],
      ),
    );
  }
}
