class Quotes {
  String AuthorName;
  String Thumbnail;
  String About;
  String History;
  String Significance;
  String Culture;
  String Traditions;
  String Location;
  String Date;
  String quote;

  Quotes({
    required this.AuthorName,
    required this.Thumbnail,
    required this.About,
    required this.History,
    required this.Significance,
    required this.Culture,
    required this.Traditions,
    required this.Location,
    required this.Date,
    required this.quote,
  });

  factory Quotes.frommap({required Map<String, dynamic> data}) {
    return Quotes(
      AuthorName: data["festivalname"],
      Thumbnail: data["thumbnail"],
      About: data["About"],
      History: data["History"],
      Significance: data["Significance"],
      Culture: data["Culture"],
      Traditions: data["Traditions"],
      Location: data["Location"],
      Date: data["Date"],
      quote: data["quote"],
    );
  }
}
