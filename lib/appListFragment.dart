import 'package:flutter/material.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'commonUi.dart';
import 'detailPage.dart';
import 'appdetail.dart';

class AppListWidget extends StatefulWidget {
  List<AppDetail> _appDetailList = new List();

  AppListWidget(this._appDetailList);

   @override
     State<StatefulWidget> createState() {
       return AppListWidgetState();
     }
 }

 class AppListWidgetState extends State<AppListWidget>{
   final  GlobalKey<ScaffoldState> _scaffoldKey = new GlobalKey<ScaffoldState>();

    @override
      Widget build(BuildContext context) {
        return new ListView.builder(
                physics: const AlwaysScrollableScrollPhysics(),
                itemCount: widget._appDetailList?.length,
                itemBuilder: (context, index){
                  print('get get get get');
                  AppDetail appDetail = widget._appDetailList[index];
                  return appDetail == null ? null : 
                  Column(
                      children: <Widget>[
                          ListTile(
                    leading: new CachedNetworkImage(
                        placeholder: const Icon(Icons.flight_land),
                        errorWidget: new Icon(Icons.error),
                        imageUrl: appDetail.avatarUrl,
                    ),
                    title: Text(appDetail.title == null ? "..." : appDetail.title),
                    subtitle: Text(appDetail.subtitle == null ? "..." : appDetail.subtitle),
                    trailing: RoundCornerText(
                      Text('预约', style: TextStyle(color: Colors.orangeAccent),),
                      borderColor: Colors.orangeAccent,
                    ),
                    enabled: true,
                    onTap: (){
                        jumpdetail(appDetail);
                    },
                    onLongPress: (){
                    },
                  ),

                  Divider(),
                      ],
                  );  
                  
                },
              );
      }

        //跳转详情页
  void jumpdetail(AppDetail appDetail){
    Navigator.push(context, new MaterialPageRoute<void>(
      builder: (BuildContext context) {
          return AppDetailPage(appDetail, widget._appDetailList);
        }     
      ) 
    );
  }
 }

