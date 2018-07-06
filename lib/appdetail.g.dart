// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'appdetail.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

AppDetailWrap _$AppDetailWrapFromJson(Map<String, dynamic> json) =>
    new AppDetailWrap()
      ..retcode = json['retcode'] as String
      ..appCode = json['appCode'] as String
      ..dataType = json['dataType'] as String
      ..pageToken = json['pageToken'] as String
      ..data = (json['data'] as List)
          ?.map((e) => e == null
              ? null
              : new AppDetail.fromJson(e as Map<String, dynamic>))
          ?.toList();

abstract class _$AppDetailWrapSerializerMixin {
  String get retcode;
  String get appCode;
  String get dataType;
  String get pageToken;
  List<AppDetail> get data;
  Map<String, dynamic> toJson() => <String, dynamic>{
        'retcode': retcode,
        'appCode': appCode,
        'dataType': dataType,
        'pageToken': pageToken,
        'data': data
      };
}

AppDetail _$AppDetailFromJson(Map<String, dynamic> json) => new AppDetail()
  ..title = json['title'] as String
  ..subtitle = json['subtitle'] as String
  ..devId = json['devId']
  ..propertyDev = json['propertyDev'] as String
  ..catPathKey = json['catPathKey'] as String
  ..avatarUrl = json['avatarUrl'] as String
  ..publishDate = json['publishDate']
  ..publishDateStr = json['publishDateStr'] as String
  ..likeCount = json['likeCount']
  ..dislikeCount = json['dislikeCount']
  ..commentCount = json['commentCount']
  ..isFree = json['isFree'] as bool
  ..ratingCount = json['ratingCount']
  ..updateDate = json['updateDate']
  ..rating = json['rating']
  ..rank = json['rank']
  ..url = json['url'] as String
  ..description = json['description'] as String
  ..downloadCount = json['downloadCount']
  ..id = json['id']
  ..ratingDist = (json['ratingDist'] as List)
      ?.map((e) =>
          e == null ? null : new Dist.fromJson(e as Map<String, dynamic>))
      ?.toList()
  ..imageUrls = (json['imageUrls'] as List)?.map((e) => e as String)?.toList()
  ..tags = (json['tags'] as List)?.map((e) => e as String)?.toList()
  ..fileOptions = (json['fileOptions'] as List)
      ?.map((e) => e == null
          ? null
          : new AppPackageInfo.fromJson(e as Map<String, dynamic>))
      ?.toList()
  ..updateItems =
      (json['updateItems'] as List)?.map((e) => e as String)?.toList()
  ..osTypes = (json['osTypes'] as List)?.map((e) => e as String)?.toList()
  ..permissions =
      (json['permissions'] as List)?.map((e) => e as String)?.toList();

abstract class _$AppDetailSerializerMixin {
  String get title;
  String get subtitle;
  dynamic get devId;
  String get propertyDev;
  String get catPathKey;
  String get avatarUrl;
  dynamic get publishDate;
  String get publishDateStr;
  dynamic get likeCount;
  dynamic get dislikeCount;
  dynamic get commentCount;
  bool get isFree;
  dynamic get ratingCount;
  dynamic get updateDate;
  dynamic get rating;
  dynamic get rank;
  String get url;
  String get description;
  dynamic get downloadCount;
  dynamic get id;
  List<Dist> get ratingDist;
  List<String> get imageUrls;
  List<String> get tags;
  List<AppPackageInfo> get fileOptions;
  List<String> get updateItems;
  List<String> get osTypes;
  List<String> get permissions;
  Map<String, dynamic> toJson() => <String, dynamic>{
        'title': title,
        'subtitle': subtitle,
        'devId': devId,
        'propertyDev': propertyDev,
        'catPathKey': catPathKey,
        'avatarUrl': avatarUrl,
        'publishDate': publishDate,
        'publishDateStr': publishDateStr,
        'likeCount': likeCount,
        'dislikeCount': dislikeCount,
        'commentCount': commentCount,
        'isFree': isFree,
        'ratingCount': ratingCount,
        'updateDate': updateDate,
        'rating': rating,
        'rank': rank,
        'url': url,
        'description': description,
        'downloadCount': downloadCount,
        'id': id,
        'ratingDist': ratingDist,
        'imageUrls': imageUrls,
        'tags': tags,
        'fileOptions': fileOptions,
        'updateItems': updateItems,
        'osTypes': osTypes,
        'permissions': permissions
      };
}

Dist _$DistFromJson(Map<String, dynamic> json) => new Dist()
  ..value = json['value']
  ..key = json['key'] as String;

abstract class _$DistSerializerMixin {
  dynamic get value;
  String get key;
  Map<String, dynamic> toJson() =>
      <String, dynamic>{'value': value, 'key': key};
}

AppPackageInfo _$AppPackageInfoFromJson(Map<String, dynamic> json) =>
    new AppPackageInfo()
      ..os = json['os'] as String
      ..sizeM = json['sizeM']
      ..url = json['url'] as String
      ..id = json['id'] as String
      ..version = json['version'] as String
      ..format = json['format'] as String;

abstract class _$AppPackageInfoSerializerMixin {
  String get os;
  dynamic get sizeM;
  String get url;
  String get id;
  String get version;
  String get format;
  Map<String, dynamic> toJson() => <String, dynamic>{
        'os': os,
        'sizeM': sizeM,
        'url': url,
        'id': id,
        'version': version,
        'format': format
      };
}
