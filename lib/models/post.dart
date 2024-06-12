class Post{
  late int category;
  late int id;
  late String title;
  late String text;
  late String fullText;
  late String imgUrl;
  late String date;

  Post(int category, int id,String title,String text,String fullText,String imgUrl,String date) {
    this.category = category;
    this.id = id;
    this.title = title;
    this.text = text;
    this.imgUrl = imgUrl;
    this.date = date;
    this.fullText = fullText;
  }
}