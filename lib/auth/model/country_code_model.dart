class CountryCodeModel {
  final int id;
  final String ma;
  final String tenVung;
  final String code;
  final String icon;

  CountryCodeModel({
    required this.id,
    required this.ma,
    required this.tenVung,
    required this.code,
    required this.icon,
  });

  static CountryCodeModel fromJson(Map<String, dynamic> json) {
    return CountryCodeModel(
        id: json['id'],
        ma: json['ma'],
        tenVung: json['tenVung'],
        code: json['code'],
        icon: json['icon']);
  }
}
