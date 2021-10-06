import 'package:covid_mobil/core/extension/context_extension.dart';
import 'package:covid_mobil/view/home/widgets/clipper_widget.dart';
import 'package:flutter/material.dart';

class AppHeader extends StatelessWidget {
  final String? image;
  const AppHeader({Key? key, this.image}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ClipPath(
      clipper: MyClipper(),
      child: Container(
        height: context.height * .35,
        width: double.infinity,
        decoration: BoxDecoration(
          gradient: const LinearGradient(
            begin: Alignment.topRight,
            end: Alignment.bottomLeft,
            colors: [Color(0xff403D58), Color(0xff666379)],
          ),
          image: DecorationImage(image: AssetImage(image!)),
        ),
      ),
    );
  }
}
