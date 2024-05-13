class Quotes {
  String AuthorName;
  String Thumbnail;

  Quotes({
    required this.AuthorName,
    required this.Thumbnail,
  });

  factory Quotes.frommap({required Map<String, dynamic> data}) {
    return Quotes(
      AuthorName: data["author"],
      Thumbnail: data["thumbnail"],
    );
  }
}
