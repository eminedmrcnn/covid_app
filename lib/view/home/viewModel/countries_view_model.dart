import 'package:covid_mobil/core/base/model/base_view_model.dart';
import 'package:covid_mobil/view/home/model/country_model.dart';
import 'package:covid_mobil/view/home/services/country_services.dart';
import 'package:flutter/widgets.dart';
import 'package:mobx/mobx.dart';
part 'countries_view_model.g.dart';

class CountriesViewModel = _CountriesViewModelBase with _$CountriesViewModel;

abstract class _CountriesViewModelBase with Store, BaseViewModel {
  CountryServices? countryServices;
  List<CountryModel> countryList = [];
   Future<List<CountryModel>>? countryModel;
  @override
  void setContext(BuildContext context) => this.context = context;

 

  @override
  void init() {
    countryServices!.getCountries;
  }
}
