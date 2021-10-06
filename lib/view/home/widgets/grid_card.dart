import 'package:flutter/material.dart';

import '../../../core/extension/context_extension.dart';
import '../components/boxDecoration_shadow.dart';
import '../constants/constants.dart';

class GridCard extends StatelessWidget {
  final Color? color;
  final IconData? icon;
  final String? hedText;
  final String? subHed;
  final Function? onTap;
  const GridCard({
    Key? key,
    this.color,
    this.icon,
    this.hedText,
    this.subHed,
    @required this.onTap,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: kBoxDecorationShadow,
      child: InkWell(
        child: ClipRRect(
          borderRadius: BorderRadius.circular(5.0),
          child: Container(
            color: color,
            width: context.width / 2.5,
            height: context.height / 4.0,
            child: Padding(
              padding: const EdgeInsets.all(10.0),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Icon(
                    icon,
                    size: 30.0,
                    color: Theme.of(context).iconTheme.color,
                  ),
                  const SizedBox(
                    height: 10.0,
                  ),
                  Text(hedText!, 
                  style: kTextStyleMainHeading),
                  const SizedBox(
                    height: 5.0,
                  ),
                  Text(subHed!, style: kTextStyleSmall),
                ],
              ),
            ),
          ),
        ),
        onTap: () => onTap!()
      ),
    );
  }
}
