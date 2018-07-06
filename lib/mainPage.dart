import 'package:flutter/material.dart';
import 'package:dio/dio.dart';
import 'appdetail.dart';
import 'dart:async';
import 'dart:math';
import 'searchPage.dart';
import 'appListFragment.dart';

Dio dio;
String content = "加载中";
List<AppDetail> _appDetailList = new List();
List<String> keywords = ['QQ', '块钱', '钱包', '音乐', '视频', '抖音', '养生', '王者', '壁纸', '游戏', '投资', '旅行'];

class MainPage extends StatefulWidget{
  @override
  State<StatefulWidget> createState() {
    return MainPageState();
  }

 }

 class MainPageState extends State{
   final GlobalKey<ScaffoldState> _scaffoldKey = new GlobalKey<ScaffoldState>();

   @override
     void initState() {
       super.initState();
        dio = Dio();
        dio.options.connectTimeout = 5000; //5s
        dio.options.receiveTimeout=5000;
        dio.options.responseType = ResponseType.JSON;
        _loadData();
     }

  //搜索页面
  void search(){
    Navigator.push(context, new MaterialPageRoute<void>(
      builder: (BuildContext context) {
        return SearchPage();
      }
    ));
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
            key: _scaffoldKey,
            appBar: new AppBar(
              title: Center(child: new Text('应用列表')),
              actions: <Widget>[
                new IconButton(
                    icon: new Icon(Icons.search),
                    tooltip: 'Search App',
                    onPressed: search,
                ),
               Icon(Icons.more),
              ],
            ),
            drawer: Container(
              color: Colors.white,
              margin: const EdgeInsets.only(right: 100.0),
              child: Column(
              children: <Widget>[
                UserAccountsDrawerHeader(
                  accountEmail: Text('1002674163@qq.com'), 
                  accountName: Text('chao.wang'),
                  currentAccountPicture: CircleAvatar(
                    backgroundImage:  ExactAssetImage(
                      'image/ic_drawer_yunyun.png'
                    ),
                  ),
                  otherAccountsPictures: <Widget>[
                    Text('gsy', style: TextStyle(color: Colors.white),),
                    Text('UU', style: TextStyle(color: Colors.white),)
                  ],
                ),

                Expanded(
                  flex: 1,
                  child: ListView(
                            children: <Widget>[
                              Text('查找应用', textAlign: TextAlign.center, style: TextStyle(fontSize: 17.0,),),
                              Divider(),
                              Text('各种UI', textAlign: TextAlign.center, style: TextStyle(fontSize: 17.0),),
                              Divider(),
                              GestureDetector(
                                onTap: showAbout,
                                child: Text('关于我们', textAlign: TextAlign.center, style: TextStyle(fontSize: 17.0),),
                              ),
                            ],
                          ),
                ),  

              ],
            ),
            ),
            body: Center(
              child: RefreshIndicator(
                onRefresh: _loadData,
                child: _appDetailList.length <= 0 ? CircularProgressIndicator() : AppListWidget(_appDetailList) 
              ),
              
            ),
          ));
  }

  showAbout(){
    showDialog(
      context: context,
      builder: (BuildContext buildContext){
        return AlertDialog(
          title: Text('I\'m title', textAlign: TextAlign.center,),
          content: Text('I\'m content'),
          semanticLabel: 'asdasdasdasdasdadasdasdas',
          actions: <Widget>[
            FlatButton(
              child: Text('I know!'), 
              onPressed: () {
                Navigator.pop(context);
              },
            ),
          ],
        );
      }

    );
  }

  //加载数据
   Future<Null> _loadData(){
     int keyIndex = Random().nextInt(keywords.length);
     String _url = "http://120.76.205.241:8000/mobileapp/mobile360?sort=0&kw=${keywords[keyIndex]}&apikey=mei0GCe7mQiUvt3pgChDEOnLSH9VuUkbBY0Wka7FR6QO2GCcfaxGboMwO6rNVqiF";
     return dio.get(_url)
      .then((response){
        if(200 == response.statusCode){
            AppDetailWrap appDetailWrap = AppDetailWrap.fromJson(response.data);
            content = appDetailWrap.data[0].propertyDev;
            _appDetailList = appDetailWrap.data;
            if(mounted){
               setState(() {});
            }
        }
        return "数据请求完成";
      }).then((value){
        _scaffoldKey.currentState?.showSnackBar(
          SnackBar(
            content: Text(value),
            backgroundColor: Colors.pinkAccent,
        ));
    });
  }
 }

 