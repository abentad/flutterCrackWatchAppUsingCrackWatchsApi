class Game {
  String sId;
  bool isAAA;
  int nFOsCount;
  int commentsCount;
  int followersCount;
  List<String> protections;
  List<String> groups;
  String updatedAt;
  String releaseDate;
  String slug;
  String title;
  String image;
  String imagePoster;
  String crackDate;
  String url;

  Game(
      {this.sId,
      this.isAAA,
      this.nFOsCount,
      this.commentsCount,
      this.followersCount,
      this.protections,
      this.groups,
      this.updatedAt,
      this.releaseDate,
      this.slug,
      this.title,
      this.image,
      this.imagePoster,
      this.crackDate,
      this.url});

  Game.fromJson(Map<String, dynamic> json) {
    sId = json['_id'];
    isAAA = json['isAAA'];
    nFOsCount = json['NFOsCount'];
    commentsCount = json['commentsCount'];
    followersCount = json['followersCount'];
    protections = json['protections'].cast<String>();
    groups = json['groups'].cast<String>();
    updatedAt = json['updatedAt'];
    releaseDate = json['releaseDate'];
    slug = json['slug'];
    title = json['title'];
    image = json['image'];
    imagePoster = json['imagePoster'];
    crackDate = json['crackDate'];
    url = json['url'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['_id'] = this.sId;
    data['isAAA'] = this.isAAA;
    data['NFOsCount'] = this.nFOsCount;
    data['commentsCount'] = this.commentsCount;
    data['followersCount'] = this.followersCount;
    data['protections'] = this.protections;
    data['groups'] = this.groups;
    data['updatedAt'] = this.updatedAt;
    data['releaseDate'] = this.releaseDate;
    data['slug'] = this.slug;
    data['title'] = this.title;
    data['image'] = this.image;
    data['imagePoster'] = this.imagePoster;
    data['crackDate'] = this.crackDate;
    data['url'] = this.url;
    return data;
  }
}
