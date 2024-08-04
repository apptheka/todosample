class TodoData {
  TodoData(
      {required this.id,
      required this.content,
      required this.title,
      required this.date,
      required this.time,
      required this.tag,
      required this.image,
      required this.isDone});
  late final int id;
  late final String content;
  late final String tag;
  late final String image;
  late bool isDone;
  late final String title;
  late final String date;
  late final String time;

  TodoData.fromJson(Map<String, dynamic> json) {
    title = json['title'];
    content = json['content'];
    date = json['date'];
    time = json['time'];
    id = json['id'];
    tag = json['tag'];
    image = json['image'];
    isDone = json['isDone'];
  }

  Map<String, dynamic> toJson() {
    final _data = <String, dynamic>{};
    _data['title'] = title;
    _data['content'] = content;
    _data['date'] = date;
    _data['time'] = time;
    _data['id'] = id;
    _data['tag'] = tag;
    _data['image'] = image;
    _data['isDone'] = isDone;
    return _data;
  }
}
