import 'package:flutter/material.dart';
import 'package:dio/dio.dart';
import 'dart:async';
import 'commonUi.dart';
import 'appdetail.dart';
import 'appListFragment.dart';

Dio dio;

class SearchPage extends StatefulWidget {
  
   @override
     State<StatefulWidget> createState() {
       return SearchPageState();
     }
}

class SearchPageState extends State<SearchPage>{

  bool _isSearching = false;

  String _searchKey;

  List<AppDetail> _appDetailList = new List();

  final  GlobalKey<ScaffoldState> _scaffoldKey = new GlobalKey<ScaffoldState>();

  void onInputChange(String keyword){
    this._searchKey = keyword;
  }

  @override
    void initState() {
      super.initState();
      dio = Dio();
      dio.options.connectTimeout = 5000; //5s
      dio.options.receiveTimeout=5000;
      dio.options.responseType = ResponseType.JSON;
    }

  //加载数据
   Future<Null> _searchApp(){
     String _url = "http://120.76.205.241:8000/mobileapp/mobile360?sort=0&kw=$_searchKey&apikey=mei0GCe7mQiUvt3pgChDEOnLSH9VuUkbBY0Wka7FR6QO2GCcfaxGboMwO6rNVqiF";
     _isSearching = true;
     setState(() {});
     return dio.get(_url)
      .then((response){
        if(200 == response.statusCode){
            AppDetailWrap appDetailWrap = AppDetailWrap.fromJson(response.data);
            _appDetailList = appDetailWrap.data;
            if(mounted){
               setState(() {});
            }
        }
        _isSearching = false;
        return "数据请求完成";
      }).then((value){
        _scaffoldKey.currentState?.showSnackBar(
          SnackBar(
            content: Text(value),
            backgroundColor: Colors.pinkAccent,
        ));
    });
  }

    @override
      Widget build(BuildContext context) {
        MediaQuery.of(context).padding.top;
        return Scaffold(
          key: _scaffoldKey,
          body: Column(
            children: <Widget>[
              Container(
                margin: EdgeInsets.only(top: MediaQuery.of(context).padding.top),
                color: Colors.white,
                padding: const EdgeInsets.only(left: 8.0, top: 6.0, bottom: 6.0),
                child: Row(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: <Widget>[
                    Icon(Icons.arrow_back, color: Colors.redAccent, size: 36.0,),
                    Padding(padding: const EdgeInsets.only(left: 8.0),),
                    Expanded(
                      flex: 1,
                      child: TextField(
                        autofocus: true,
                        onChanged: onInputChange,
                        textAlign: TextAlign.center,
                        decoration: InputDecoration(hintText: '去哪儿旅行', labelText: 'search'),
                      ),
                    ),
                    //Padding(padding: const EdgeInsets.only(left: 2.0),),
                    FlatButton(
                      child: RoundCornerText(
                                Text('Go', style: TextStyle(color: Colors.redAccent, fontSize: 22.0),),
                                color: Colors.transparent,
                                borderColor: Colors.redAccent,
                              ), 
                      onPressed: () {
                        _searchApp();
                      },
                    ),
                    
                    
                  ],
                ),
              ),  

              Expanded(
                flex: 1,
                child: Stack(
                    fit: StackFit.expand,
                    children: <Widget>[
                        _appDetailList == null || _appDetailList.length <= 0 ? getCenterWidget() : AppListWidget(_appDetailList),
                        _isSearching ? Center(child: CircularProgressIndicator(),) : Padding(padding: const EdgeInsets.all(0.0),),
                    ],
                ),
                //
              ),
            ],
          ),
          
        );
      }

    Widget getCenterWidget(){
      if((_appDetailList == null || _appDetailList.length <= 0) && !_isSearching){
          return Center(
            child: Text('没有您的应用, 请输入关键字查询'),
          );
      }else{
        return Center();
      }
    }
}

class Label extends StatelessWidget {
  @override
    Widget build(BuildContext context) {
      return Row(
        
      );
    }
}