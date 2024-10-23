import 'package:flutter/material.dart';
import 'package:attendance_and_departure/core/models/text_field_model.dart';
import 'package:attendance_and_departure/core/widget/svg_widget.dart';
import 'package:attendance_and_departure/core/widget/text_field.dart';
import 'package:sizer/sizer.dart';
import '../../config/app_color.dart';
import '../../config/text_style.dart';
import '../../features/language/presentation/provider/language_provider.dart';

class WrapTextFieldWidget extends StatelessWidget {
  const WrapTextFieldWidget({Key? key, required this.inputs}) : super(key: key);
  final List<TextFieldModel> inputs;
  @override
  Widget build(BuildContext context) {
    return Wrap(
      alignment: WrapAlignment.spaceBetween,
      children: List.generate(inputs.length, (index) {
        return TextFieldWidget(

          titleWidget: inputs[index].label!=null?Row(
            children: [
              if(inputs[index].image!=null)SvgWidget(svg: inputs[index].image!),
              if(inputs[index].image!=null)SizedBox(width: 2.w,),
              Text(LanguageProvider.translate('inputs', inputs[index].label!),
                style: TextStyleClass.normalStyle(),),
            ],
          ):null,
          controller: inputs[index].controller,
          keyboardType: inputs[index].textInputType,
          next: inputs[index].next,
          hintText: inputs[index].hint,
          onTextTap: inputs[index].onTap,
          validator: inputs[index].validator,
          suffix: inputs[index].key=='phone'?Padding(
            padding: EdgeInsets.symmetric(horizontal: 4.w),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Builder(
                    builder: (context) {
                      return Text('+966',style: TextStyleClass
                          .semiBoldStyle(color: AppColor.defaultColor),);
                    }
                ),
              ],
            ),
          )
              : inputs[index].suffix,
          prefix: inputs[index].prefix,
          readOnly: inputs[index].readOnly,
          width: inputs[index].width,
          contentPadding: inputs[index].contentPadding, isPassword: inputs[index].isPassword!,
        );
      },
      ),
    );
  }
}
