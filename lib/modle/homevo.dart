class HomeVo {
  int listType; // 列表类型
  bool isCheck; // 是否可以点击
  String remark; // 备注名
  List<HomeListVo> listVoArr; // 首页列表

  HomeVo({this.listType, this.isCheck, this.remark, this.listVoArr});

  factory HomeVo.fromJson(Map<String, dynamic> json) {
    return new HomeVo(
        listType: json['listType'],
        isCheck: json['isCheck'],
        remark: json['remark'],
        listVoArr: json['listVoArr']);
  }
}

class HomeListVo {
  String coverUrl; // 封面URL

  String htmlUrl; // 广告页面

  int id; // 列表id

  String title; // 列表主标题

  String subTitle; // 子标题

  int num; //列表具体值

  String nickname; //教师昵称

  int activityNo; //活动数

  int todoTaskNo; //未完成任务数

  int insistDays; //坚持天数

  int targetStatus; //目标状态

  int activityRecordId; //活动记录ID

  String content; //黄页显示内容

  String endInfo; //结束信息

  HomeListVo({
    this.coverUrl,
    this.htmlUrl,
    this.id,
    this.title,
    this.subTitle,
    this.num,
    this.nickname,
    this.activityNo,
    this.todoTaskNo,
    this.insistDays,
    this.targetStatus,
    this.activityRecordId,
    this.content,
    this.endInfo,
  });

  factory HomeListVo.fromJson(Map<String, dynamic> json) {
    return new HomeListVo(
        coverUrl: json['coverUrl'],
        htmlUrl: json['htmlUrl'],
        id: json['id'],
        title: json['title'],
        subTitle: json['subTitle'],
        num: json['num'],
        nickname: json['nickname'],
        activityNo: json['activityNo'],
        todoTaskNo: json['todoTaskNo'],
        insistDays: json['insistDays'],
        targetStatus: json['targetStatus'],
        activityRecordId: json['activityRecordId'],
        content: json['content'],
        endInfo: json['endInfo'],);
        
  }
}
