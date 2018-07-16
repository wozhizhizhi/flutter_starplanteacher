class HomeVo {
  int listType; // 列表类型
  List<HomeListVo> listVoArr; // 首页列表

  HomeVo({this.listType , this.listVoArr});

  factory HomeVo.fromJson(Map<String, dynamic> json) {
    return new HomeVo(
        listType: json['listType'],
        listVoArr: json['listVoArr']);
  }
}

class HomeListVo {
  String coverUrl; // 封面URL

  String htmlUrl; // 广告页面


  String title; // 列表主标题

  String subTitle; // 子标题

  int unCommentNo;

  int unFinishNo;


  HomeListVo({
    this.coverUrl,
    this.htmlUrl,
    this.title,
    this.subTitle,
    this.unCommentNo,
    this.unFinishNo,
  });

  factory HomeListVo.fromJson(Map<String, dynamic> json) {
    return new HomeListVo(
        coverUrl: json['coverUrl'],
        htmlUrl: json['htmlUrl'],
        title: json['title'],
        subTitle: json['subTitle'],
        unCommentNo: json['unCommentNo'],
        unFinishNo: json['unFinishNo'],
        );
        
  }
}
