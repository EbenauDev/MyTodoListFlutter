class TaskModel {
  bool? isCompleted;
  String? title;
  String? description;
  String? dueDate;

  TaskModel({
    this.isCompleted,
    this.title,
    this.description,
    this.dueDate,
  });

  TaskModel.fromJson(Map<String, dynamic> json) {
    isCompleted = json['isCompleted'];
    title = json['title'];
    description = json['description'];
    dueDate = json['dueDate'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['isCompleted'] = this.isCompleted;
    data['title'] = this.title;
    data['description'] = this.description;
    data['dueDate'] = this.dueDate;
    return data;
  }
}
