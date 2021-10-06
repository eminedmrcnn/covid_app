import 'package:covid_mobil/view/home/constants/constants.dart';
import 'package:flutter/material.dart';
import '../../../core/extension/context_extension.dart';

class RequirementCircles extends StatelessWidget {
  final Color? color;
  final Function? onPressed;
  final String? text;
  const RequirementCircles({Key? key, this.color, this.onPressed, this.text})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        RawMaterialButton(
          elevation: 5,
          shape: CircleBorder(),
          fillColor: color,
          child: Padding(
            padding: context.paddingNormal,
            child: Icon(Icons.ac_unit),
          ),
          onPressed: () => onPressed!(),
        ),
        SizedBox(height: context.height * .01),
        Text(
          text!,
          style: kTextStyleSmall.copyWith(fontWeight: FontWeight.w500),
        )
      ],
    );
  }
}
