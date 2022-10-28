class HouseInfoModel {
  int? id;
  String? name;
  String? city;
  String? houseType;
  String? description;
  List<String>? imagesUrl;
  List<FeedBackList>? feedbacksList;

  HouseInfoModel({
    this.id,
    this.name,
    this.city,
    this.houseType,
    this.description,
    this.imagesUrl,
    this.feedbacksList,
  });
}

class FeedBackList {
  String? senderName;
  String? date;
  String? feedback;
  double? cleannessMark;
  double? foodMark;
  double? matchTheDescriptionMark;
  double? qualityOfServiceMark;
  double? locationMark;

  FeedBackList({
    this.senderName,
    this.date,
    this.feedback,
    this.cleannessMark,
    this.foodMark,
    this.matchTheDescriptionMark,
    this.qualityOfServiceMark,
    this.locationMark,
  });
}
