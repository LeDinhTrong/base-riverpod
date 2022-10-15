import 'dart:convert';

List<ItemModel> itemModelFromJson(String str) =>
    List<ItemModel>.from(json.decode(str).map((x) => ItemModel.fromJson(x)));

String itemModelToJson(List<ItemModel> data) => json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

String itemModelToJsonSearchAll(List<ItemModel> data) =>
    json.encode(List<dynamic>.from(data.map((x) => x.toJsonSearchAll())));

class ItemModel {
  ItemModel({
    this.itemId,
    this.typeId,
    this.categoryId,
    this.itemName,
    this.fileUrl,
    this.imageUrl,
    this.thumbUrl,
    this.authorName,
    this.version,
    this.size,
    this.descript,
    this.description,
    this.htmlDescription,
    this.shortDescription,
    this.hotPriority,
    this.downloadCount,
    this.videoCode,
    this.isVerify,
    this.createTime,
    this.price,
    this.reportCount,
    this.isV2,
    this.favorite = false,
  });

  String? itemId;
  String? typeId;
  String? categoryId;
  String? itemName;
  String? fileUrl;
  String? imageUrl;
  String? thumbUrl;
  String? authorName;
  String? version;
  String? size;
  String? descript;
  String? description;
  String? htmlDescription;
  String? shortDescription;
  String? hotPriority;
  String? downloadCount;
  String? videoCode;
  String? isVerify;
  DateTime? createTime;
  String? price;
  String? reportCount;
  String? isV2;
  bool favorite;
  
  ItemModel copyWith({
    String? itemId,
    String? typeId,
    String? categoryId,
    String? itemName,
    String? fileUrl,
    String? imageUrl,
    String? thumbUrl,
    String? authorName,
    String? version,
    String? size,
    String? descript,
    String? description,
    String? htmlDescription,
    String? shortDescription,
    String? hotPriority,
    String? downloadCount,
    String? videoCode,
    String? isVerify,
    DateTime? createTime,
    String? price,
    String? reportCount,
    String? isV2,
    bool? favorite,
  }) =>
      ItemModel(
        itemId: itemId ?? this.itemId,
        typeId: typeId ?? this.typeId,
        categoryId: categoryId ?? this.categoryId,
        itemName: itemName ?? this.itemName,
        fileUrl: fileUrl ?? this.fileUrl,
        imageUrl: imageUrl ?? this.imageUrl,
        thumbUrl: thumbUrl ?? this.thumbUrl,
        authorName: authorName ?? this.authorName,
        version: version ?? this.version,
        size: size ?? this.size,
        descript: descript ?? this.descript,
        description: description ?? this.description,
        htmlDescription: htmlDescription ?? this.htmlDescription,
        shortDescription: shortDescription ?? this.shortDescription,
        hotPriority: hotPriority ?? this.hotPriority,
        downloadCount: downloadCount ?? this.downloadCount,
        videoCode: videoCode ?? this.videoCode,
        isVerify: isVerify ?? this.isVerify,
        createTime: createTime ?? this.createTime,
        price: price ?? this.price,
        reportCount: reportCount ?? this.reportCount,
        isV2: isV2 ?? this.isV2,
        favorite: favorite ?? this.favorite,
      );

  factory ItemModel.fromJson(Map<String, dynamic> json) => ItemModel(
        itemId: json["item_id"],
        typeId: json["type_id"],
        categoryId: json["category_id"],
        itemName: json["item_name"],
        fileUrl: json["file_url"],
        imageUrl: json["image_url"],
        thumbUrl: json["thumb_url"],
        authorName: json["author_name"],
        version: json["version"],
        size: json["size"],
        descript: json["descript"],
        description: json["description"],
        htmlDescription: json["html_description"],
        shortDescription: json["short_description"],
        hotPriority: json["hot_priority"],
        downloadCount: json["download_count"],
        videoCode: json["video_code"],
        isVerify: json["is_verify"],
        createTime: json["create_time"] == null ? null : DateTime.parse(json["create_time"]),
        price: json["price"],
        reportCount: json["report_count"],
        isV2: json["is_v2"],
      );

  Map<String, dynamic> toJson() => {
        "item_id": itemId,
        "type_id": typeId,
        "category_id": categoryId,
        "item_name": itemName,
        "file_url": fileUrl,
        "image_url": imageUrl,
        "thumb_url": thumbUrl,
        "author_name": authorName,
        "version": version,
        "size": size,
        "descript": descript,
        "description": description,
        "html_description": htmlDescription,
        "short_description": shortDescription,
        "hot_priority": hotPriority,
        "download_count": downloadCount,
        "video_code": videoCode,
        "is_verify": isVerify,
        "create_time": createTime == null ? null : createTime!.toIso8601String(),
        "price": price,
        "report_count": reportCount,
        "is_v2": isV2,
      };

  Map<String, dynamic> toJsonSearchAll() => {
        "item_id": itemId,
        "type_id": typeId,
        "category_id": categoryId,
        "item_name": itemName,
        "file_url": fileUrl,
        "image_url": imageUrl,
        "thumb_url": thumbUrl,
        "author_name": authorName,
        "version": version,
        "size": size,
        "description": description,
        "short_description": shortDescription,
        "hot_priority": hotPriority,
        "download_count": downloadCount,
        "video_code": videoCode,
        "is_verify": isVerify,
        "create_time": createTime == null ? null : createTime!.toIso8601String(),
        "price": price,
      };
}
