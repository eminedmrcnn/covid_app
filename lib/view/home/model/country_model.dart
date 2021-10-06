class CountryModel {
  final String? country;
  final int? cases;
  final int? deaths;
  final int? recovered;
  final int? todayCases;
  final CountryInfo? countryInfo;

  CountryModel(
      { this.country,
       this.cases,
       this.deaths,
       this.recovered,
       this.todayCases,
       this.countryInfo});

  factory CountryModel.fromJson(Map<String, dynamic> json) {
    return CountryModel(
      country: json['country'],
      cases: json['cases'],
      deaths: json['deaths'],
      recovered: json['recovered'],
      todayCases: json['todayCases'],
      countryInfo: CountryInfo.fromJson(json['countryInfo']),
    );
  }
}

class CountryInfo {
  final String flag;

  CountryInfo({required this.flag});

  factory CountryInfo.fromJson(Map<String, dynamic> json) {
    return CountryInfo(flag: json['flag']);
  }
}