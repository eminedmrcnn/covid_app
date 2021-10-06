import 'dart:convert';
import 'package:covid_mobil/view/home/model/country_model.dart';
import 'package:http/http.dart' as http;

class CountryServices {
  Future<List<CountryModel>> getCountries() async {
    var url = 'https://disease.sh/v3/covid-19/countries';
    var response = await http.get(Uri.parse(url));
    print(response.body);
    if (response.statusCode == 200) {
      final data = jsonDecode(response.body);

      return List.generate(
          data.length, (index) => CountryModel.fromJson(data[index]));
    }
    return [];
  }
}
