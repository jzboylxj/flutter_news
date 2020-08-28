class SourceModel {
  final String name;
  final String description;
  final String url;
  final String category;
  final String language;
  final String country;

  SourceModel(this.name, this.description, this.url, this.category,
      this.language, this.country);

  SourceModel.fromJson(Map<String, dynamic> json)
      : name = json["name"],
        description = json["description"],
        url = json["url"],
        category = json["category"],
        language = json["language"],
        country = json["country"];
}
