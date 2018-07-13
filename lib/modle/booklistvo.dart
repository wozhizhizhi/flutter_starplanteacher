class BookListVo {
  num id; // 书目id

  int difficultyIndex; //难度指数

  String name; // 书目名

  String coverUrl; // 封面URL

  String locationTags; // 定位标签

  int recommend; // 推荐指数(满分100)

  String author; //作者

  String introduction = ""; //简介
  bool choosed = false;

  BookListVo({
    this.id,
    this.name,
    this.coverUrl,
    this.locationTags,
    this.recommend,
    this.author,
    this.difficultyIndex,
    this.introduction,
    this.choosed,
  });

  factory BookListVo.fromJson(Map<String , dynamic> json){
    return new BookListVo(
      id: json['id'],
      name: json['name'],
      coverUrl: json['coverUrl'],
      locationTags: json['locationTags'],
      recommend: json['recommend'],
      author: json['author'],
      difficultyIndex: json['difficultyIndex'],
      introduction: json['introduction'],
      choosed: json['choosed']);
  }
}
