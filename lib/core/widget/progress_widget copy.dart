import 'package:flutter/material.dart';
import 'package:sizer/sizer.dart';
import 'package:attendance_and_departure/config/text_style.dart';
import 'package:attendance_and_departure/core/models/abstract_model.dart';
import 'package:attendance_and_departure/core/widget/svg_widget.dart';
import 'package:attendance_and_departure/features/language/presentation/provider/language_provider.dart';

class ProgressWidget extends StatelessWidget {
  const ProgressWidget({super.key,
   required this.progressAbstract,
    required this.superProgressAbstract, 
    required this.index});
  final ProgressAbstract progressAbstract;
  final SuperProgressAbstract superProgressAbstract;
  final int index;
  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Column(
          children: [
            Container(
              width: 20.w,
              height: 10.h,
              decoration: BoxDecoration(
                border: Border.all(color: superProgressAbstract.getStepColor(progressAbstract.index)),
                shape: BoxShape.circle,
              ),
              child: SvgWidget(svg: progressAbstract.svg, color: superProgressAbstract.getStepColor(progressAbstract.index)),
            ),
            SizedBox(height: 0.5.h,),
            Text(LanguageProvider.translate('titles', progressAbstract.title), style: TextStyleClass.normalStyle())
          ],
        ),
        index < superProgressAbstract.superList()!.length - 1
            ? SizedBox(
                width: 10.w,
                child: Divider(     
                  thickness: 2, color:superProgressAbstract.getStepColor(progressAbstract.index)
                    // auth.getStepColor(1)
                    ),
              )
            : SizedBox.shrink()
      ],
    );
  }
}
