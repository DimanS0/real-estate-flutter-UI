class Article {
  final String imageUrl;
  final String articleNumber;
  final String title;
  final List<String> description;  // Ensure this is a list of strings

  Article({
    required this.imageUrl,
    required this.articleNumber,
    required this.title,
    required this.description,
  });
}
