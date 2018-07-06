import 'package:json_annotation/json_annotation.dart';

part 'appdetail.g.dart';

@JsonSerializable()
class AppDetailWrap{
  String retcode;
  String appCode;
  String dataType;
  String pageToken;

  List<AppDetail> data;

  AppDetailWrap(){}

  factory AppDetailWrap.fromJson(Map<String, dynamic> json) => _$AppDetailWrapFromJson(json);

}

@JsonSerializable()
class AppDetail{

  //名称
  String title;

  //子标题
  String subtitle;

  //开发者ID
  dynamic devId;

  //开发商
  String propertyDev;

  //总的分类路径
  String catPathKey;

  //头像url
  String avatarUrl;

  //发布日期  时间戳格式
  dynamic publishDate;

  //发布日期
  String publishDateStr;

  //点赞数
  dynamic likeCount;

  //踩数
  dynamic dislikeCount;

  //comment count
  dynamic commentCount;

  //是否免费
  bool isFree;

  //评分次数
  dynamic ratingCount;

  //更新日期
  dynamic updateDate;

  //综合评分
  dynamic rating;

  //综合排名
  dynamic rank;

  //h5详情
  String url;

  //应用描述
  String description;

  //下载数量
  dynamic downloadCount;

  //应用ID
  dynamic id;

  //评分详情
  List<Dist> ratingDist;

  //应用截图
  List<String> imageUrls;

  //标记
  List<String> tags;

  //文件信息
  List<AppPackageInfo> fileOptions;

  //更新信息
  List<String> updateItems;

  //适用系统
  List<String> osTypes;

  //需要权限
  List<String> permissions;

  AppDetail(){}

  factory AppDetail.fromJson(Map<String, dynamic> json) => _$AppDetailFromJson(json);

  String get downloadCountFmt {
    if(downloadCount == null){
      return "";
    }
    double result;
    if((result = downloadCount / 100000000.0) >= 1){
        return result.toStringAsFixed(2)+"亿";
    }else if((result = downloadCount / 10000.0) >= 1){
        return result.toStringAsFixed(2)+"万";
    }else{
        return downloadCount.toString();
    }
  }
    
}


@JsonSerializable()
class Dist{
  dynamic value;
  String key;

  Dist(){}

  factory Dist.fromJson(Map<String, dynamic> json) => _$DistFromJson(json);
}

@JsonSerializable()
class AppPackageInfo{
  //适用操作系统
  String os;

  //包大小(单位: M)
  dynamic sizeM;

  //安装包下载地址
  String url;

  //id
  String id;

  //版本
  String version;

  //包格式
  String format;

  AppPackageInfo(){}

  factory AppPackageInfo.fromJson(Map<String, dynamic> json) => _$AppPackageInfoFromJson(json);
}