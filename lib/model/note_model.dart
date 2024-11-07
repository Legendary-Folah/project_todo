class Note {
  String? id;
  String? title;
  String? subTitle;
  String? time;
  bool isDone;
  Note({
    this.id,
    this.subTitle,
    this.time,
    this.title,
    required this.isDone,
  });
}
