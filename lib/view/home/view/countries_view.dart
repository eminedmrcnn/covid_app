import 'dart:ui';

import 'package:covid_mobil/constants/constants_init.dart';
import 'package:covid_mobil/core/base/widget/base_widget.dart';
import 'package:covid_mobil/view/home/components/app_header.dart';
import 'package:covid_mobil/view/home/components/boxDecoration_shadow.dart';
import 'package:covid_mobil/view/home/constants/constants.dart';
import 'package:covid_mobil/view/home/model/country_model.dart';
import 'package:covid_mobil/view/home/services/country_services.dart';
import 'package:covid_mobil/view/home/viewModel/countries_view_model.dart';
import '../../../core/extension/context_extension.dart';

import 'package:flutter/material.dart';

class CountriesView extends StatelessWidget {
  CountriesView({Key? key}) : super(key: key);
  CountryServices countryServices = CountryServices();

  @override
  Widget build(BuildContext context) {
    return BaseView<CountriesViewModel>(
      viewModel: CountriesViewModel(),
      onModelReady: (model) {
        model.setContext(context);
      },
      onPageBuilder: (BuildContext context, CountriesViewModel viewModel) =>
          Scaffold(
        body: SingleChildScrollView(
          child: Column(
            children: [
              AppHeader(
                image: customImages.doctorTeam,
              ),
              FutureBuilder<List<CountryModel>>(
                  future: countryServices.getCountries(),
                  builder:
                      (_, AsyncSnapshot<List<CountryModel>> countryModelList) {
                    if (countryModelList.hasError) {
                      return Text(countryModelList.error.toString());
                    } else if (!countryModelList.hasData) {
                      return CircularProgressIndicator();
                    }
                    return SizedBox(
                      height: context.height,
                      width: context.width / 1.1,
                      child: ListView.builder(
                          itemCount: countryModelList.data!.length,
                          itemBuilder: (context, index) {
                            return Container(
                              decoration: kBoxDecorationShadow.copyWith(
                                color: Colors.grey.shade50,
                                borderRadius: BorderRadius.circular(5.0),
                              ),
                              margin: const EdgeInsets.only(bottom: 15.0),
                              child: ListTile(
                                contentPadding: const EdgeInsets.all(0.0),
                                title: Text(
                                  countryModelList.data![index].country!,
                                ),
                                leading: SizedBox(
                                  width: context.width * .3,
                                  child: ClipRRect(
                                    borderRadius: BorderRadius.circular(5.0),
                                    child: Hero(
                                      tag: 'HeroCountryFlag',
                                      child: Image.network(
                                        countryModelList
                                            .data![index].countryInfo!.flag,
                                        fit: BoxFit.cover,
                                      ),
                                    ),
                                  ),
                                ),
                                trailing: Icon(Icons.keyboard_arrow_right),
                                onTap: () => showDialog(
                                  context: context,
                                  builder: (context) {
                                    return BackdropFilter(
                                      filter: ImageFilter.blur(
                                          sigmaX: 10, sigmaY: 10),
                                      child: Dialog(
                                        shape: RoundedRectangleBorder(
                                          borderRadius:
                                              BorderRadius.circular(10),
                                        ),
                                        elevation: 0,
                                        backgroundColor: Colors.transparent,
                                        child: Stack(
                                          children: [
                                            Container(
                                              width: MediaQuery.of(context)
                                                      .size
                                                      .width /
                                                  1,
                                              padding: const EdgeInsets.only(
                                                left: 20.0,
                                                top: 100,
                                                right: 20.0,
                                                bottom: 20.0,
                                              ),
                                              margin: const EdgeInsets.only(
                                                  top: 60.0),
                                              decoration: BoxDecoration(
                                                  shape: BoxShape.rectangle,
                                                  color: Colors.white,
                                                  borderRadius:
                                                      BorderRadius.circular(
                                                          10.0),
                                                  boxShadow: [
                                                    BoxShadow(
                                                      color: Colors.grey
                                                          .withOpacity(0.5),
                                                      offset:
                                                          const Offset(0, 3),
                                                      blurRadius: 5.0,
                                                    )
                                                  ]),
                                              child: Column(
                                                mainAxisSize: MainAxisSize.min,
                                                children: [
                                                  RichText(
                                                    text: TextSpan(children: <
                                                        TextSpan>[
                                                      TextSpan(
                                                        text: 'Country: ',
                                                        style: kTextStyleSmall
                                                            .copyWith(
                                                                fontWeight:
                                                                    FontWeight
                                                                        .w600),
                                                      ),
                                                      TextSpan(
                                                        text: countryModelList
                                                            .data![index]
                                                            .country,
                                                        style: kTextStyleSmall,
                                                      )
                                                    ]),
                                                  ),
                                                  const SizedBox(
                                                    height: 10.0,
                                                  ),
                                                  RichText(
                                                    text: TextSpan(children: <
                                                        TextSpan>[
                                                      TextSpan(
                                                        text: 'Total cases: ',
                                                        style: kTextStyleSmall
                                                            .copyWith(
                                                                fontWeight:
                                                                    FontWeight
                                                                        .w600),
                                                      ),
                                                      TextSpan(
                                                        text: countryModelList
                                                            .data![index].cases
                                                            .toString(),
                                                        style: kTextStyleSmall,
                                                      )
                                                    ]),
                                                  ),
                                                  const SizedBox(
                                                    height: 10.0,
                                                  ),
                                                  RichText(
                                                    text: TextSpan(children: <
                                                        TextSpan>[
                                                      TextSpan(
                                                        text: 'Total deaths: ',
                                                        style: kTextStyleSmall
                                                            .copyWith(
                                                          fontWeight:
                                                              FontWeight.w600,
                                                        ),
                                                      ),
                                                      TextSpan(
                                                        text: countryModelList
                                                            .data![index].deaths
                                                            .toString(),
                                                        style: kTextStyleSmall,
                                                      )
                                                    ]),
                                                  ),
                                                  const SizedBox(
                                                    height: 10.0,
                                                  ),
                                                  RichText(
                                                    text: TextSpan(children: <
                                                        TextSpan>[
                                                      TextSpan(
                                                        text: 'Today cases: ',
                                                        style: kTextStyleSmall
                                                            .copyWith(
                                                                fontWeight:
                                                                    FontWeight
                                                                        .w600),
                                                      ),
                                                      TextSpan(
                                                        text: countryModelList
                                                            .data![index]
                                                            .todayCases
                                                            .toString(),
                                                        style: kTextStyleSmall,
                                                      )
                                                    ]),
                                                  ),
                                                  const SizedBox(
                                                    height: 10.0,
                                                  ),
                                                  RichText(
                                                    text: TextSpan(children: <
                                                        TextSpan>[
                                                      TextSpan(
                                                        text: 'Recovered: ',
                                                        style: kTextStyleSmall
                                                            .copyWith(
                                                          fontWeight:
                                                              FontWeight.w600,
                                                        ),
                                                      ),
                                                      TextSpan(
                                                        text: countryModelList
                                                            .data![index]
                                                            .recovered
                                                            .toString(),
                                                        style: kTextStyleSmall,
                                                      )
                                                    ]),
                                                  ),
                                                  const SizedBox(
                                                    height: 20.0,
                                                  ),
                                                ],
                                              ),
                                            ),
                                            Positioned(
                                              top: 20,
                                              left: 20,
                                              right: 20,
                                              child: CircleAvatar(
                                                radius: 45,
                                                backgroundColor:
                                                    Colors.transparent,
                                                child: ClipRRect(
                                                  borderRadius:
                                                      const BorderRadius.all(
                                                    Radius.circular(5.0),
                                                  ),
                                                  child: SizedBox(
                                                    width:
                                                        MediaQuery.of(context)
                                                                .size
                                                                .width /
                                                            2,
                                                    height:
                                                        MediaQuery.of(context)
                                                                .size
                                                                .height /
                                                            2,
                                                    child: Hero(
                                                      tag: 'HeroCountryFlag',
                                                      child: Image.network(
                                                        countryModelList
                                                            .data![index]
                                                            .countryInfo!
                                                            .flag,
                                                        fit: BoxFit.cover,
                                                      ),
                                                    ),
                                                  ),
                                                ),
                                              ),
                                            ),
                                          ],
                                        ),
                                      ),
                                    );
                                  },
                                ),
                              ),
                            );
                          }),
                    );
                  })
            ],
          ),
        ),
      ),
    );
  }
}
