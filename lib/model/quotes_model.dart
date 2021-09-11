class QuotesModel {
  String quote;
  QuotesModel.fromJson(Map<String, dynamic> json) {
    quote = json['quote'];
  }
}
