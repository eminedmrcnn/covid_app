import 'package:covid_mobil/view/home/components/app_header.dart';
import 'package:covid_mobil/view/home/components/requirements_circles.dart';
import 'package:covid_mobil/view/home/view/mask_view.dart';
import 'package:covid_mobil/view/home/view/sanitizer_view.dart';
import 'package:covid_mobil/view/home/view/soap_view.dart';
import 'package:flutter/material.dart';

import '../../../constants/constants_init.dart';
import '../../../core/base/widget/base_widget.dart';
import '../../../core/extension/context_extension.dart';
import '../viewModel/home_view_model.dart';
import '../widgets/clipper_widget.dart';
import '../widgets/grid_card.dart';
import 'countries_view.dart';
import 'prevention_view.dart';
import 'statistic_view.dart';
import 'symptoms_view.dart';

class HomeView extends StatefulWidget {
  const HomeView({Key? key}) : super(key: key);

  @override
  _HomeViewState createState() => _HomeViewState();
}

class _HomeViewState extends State<HomeView> {
  @override
  Widget build(BuildContext context) {
    return BaseView<HomeViewModel>(
      viewModel: HomeViewModel(),
      onModelReady: (model) {
        model.setContext(context);
        model.init();
      },
      onPageBuilder: (BuildContext context, HomeViewModel viewModel) =>
          Scaffold(
        body: SingleChildScrollView(
            child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            AppHeader(image: customImages.appHeader,),
            Text(
              customStrings.prevent,
              style: TextStyle(fontSize: 25),
            ),
            SizedBox(height: context.height * .04),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                GridCard(
                  icon: Icons.sick,
                  color: Colors.blueGrey[300],
                  hedText: customStrings.symptons,
                  subHed: customStrings.symptonsSub,
                  onTap: () => {
                    Navigator.of(context).push(
                      MaterialPageRoute(
                        builder: (context) => SymptonsView(),
                      ),
                    )
                  },
                ),
                SizedBox(
                  width: context.width * .06,
                ),
                GridCard(
                  icon: Icons.coronavirus,
                  color: Colors.amberAccent[400],
                  hedText: customStrings.prevention,
                  subHed: customStrings.preventionSub,
                  onTap: () => {
                    Navigator.of(context).push(
                      MaterialPageRoute(
                        builder: (context) => PreventionView(),
                      ),
                    )
                  },
                ),
              ],
            ),
            SizedBox(
              height: context.height * .03,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                GridCard(
                  icon: Icons.report,
                  color: customColors.buttonColor,
                  hedText: customStrings.statistic,
                  subHed: customStrings.statisticSub,
                  onTap: () => {
                    Navigator.of(context).push(
                      MaterialPageRoute(
                        builder: (context) => StatisticView(),
                      ),
                    )
                  },
                ),
                SizedBox(
                  width: context.width * .06,
                ),
                GridCard(
                  icon: Icons.language,
                  color: Colors.brown[200],
                  hedText: customStrings.countries,
                  subHed: customStrings.countriesSub,
                  onTap: () => {
                    Navigator.of(context).push(
                      MaterialPageRoute(
                        builder: (context) => CountriesView(),
                      ),
                    )
                  },
                ),
              ],
            ),
            SizedBox(
              height: context.height * .04,
            ),
            Padding(
              padding: EdgeInsets.only(left: 30.0, right: 30.0),
              child: Divider(
                  color: Theme.of(context).dividerTheme.color, thickness: 1.0),
            ),
            Column(
              children: [
                Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Text(
                      customStrings.requirements,
                      style: TextStyle(
                        fontSize: 25,
                      ),
                    ),
                    SizedBox(
                      height: 5,
                    ),
                    Text(
                      customStrings.helpYo,
                      style: TextStyle(
                        fontSize: 10,
                        color: customColors.grey,
                      ),
                    ),
                    SizedBox(height: context.height * .03),
                  ],
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    RequirementCircles(
                      color: Colors.brown[200],
                      text: customStrings.mask,
                      onPressed: () => {
                        Navigator.of(context).push(
                            MaterialPageRoute(builder: (context) => MaskView()))
                      },
                    ),
                    RequirementCircles(
                      color: Colors.amberAccent[400],
                      text: customStrings.soap,
                      onPressed: () => {
                        Navigator.of(context).push(
                            MaterialPageRoute(builder: (context) => SoapView()))
                      },
                    ),
                    RequirementCircles(
                      color: Colors.blueGrey[300],
                      text: customStrings.sanitizers,
                      onPressed: () => Navigator.of(context).push(
                          MaterialPageRoute(
                              builder: (context) => SanitizerView())),
                    )
                  ],
                ),
                SizedBox(
                  height: context.height * .04,
                ),
              ],
            )
          ],
        )),
      ),
    );
  }

  ClipPath appHeader(BuildContext context) {
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
          image: DecorationImage(image: AssetImage(customImages.appHeader)),
        ),
      ),
    );
  }
}
