import 'package:flutter/material.dart';
import 'appdetail.dart';
import 'style.dart';
import 'commonUi.dart';
import 'package:cached_network_image/cached_network_image.dart';

class AppDetailPage extends StatefulWidget{
  List<AppDetail> _appDetailList = new List();
  AppDetail appDetail;

  AppDetailPage(this.appDetail, this._appDetailList);

  @override
  State<StatefulWidget> createState() {
    return new AppDetailPageState();
  }
 }

 class AppDetailPageState extends State<AppDetailPage> with SingleTickerProviderStateMixin{
  TabController controller;
  bool _showDetail = false;

  @override
  void initState() {
    super.initState();
    controller = new TabController(length: 3, vsync: this);
  }

  @override
  void dispose() {
    //controller.dispose();
    super.dispose();
  }

  //切换描述内容
  void switchDesc(){
    _showDetail = !_showDetail;
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    AppDetail _appDetail = widget.appDetail;
        var first = _appDetail == null ? null :
      ListView(
          padding: const EdgeInsets.only(top: 8.0),
          children: <Widget>[
            Row(
              children: <Widget>[
                Padding(padding: const EdgeInsets.only(left: 8.0),),
                CachedNetworkImage(imageUrl: _appDetail.avatarUrl, width: 50.0,),
                Container(padding: const EdgeInsets.only(left: 8.0),),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    Text(_appDetail.title, style: TextStyle(fontWeight: FontWeight.bold, fontSize: 17.0),
                          textAlign: TextAlign.left,),
                    Padding(padding: const EdgeInsets.only(top: 3.0),),
                    StarRank(_appDetail.rating),
                    Padding(padding: const EdgeInsets.only(top: 3.0),),
                    Row(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: <Widget>[
                        Text("${_appDetail.downloadCountFmt}人在用", style: subTitleStyle,),
                        Container(padding: const EdgeInsets.only(left: 12.0),),
                        Text("${_appDetail.fileOptions[0]?.sizeM?.toString()}M", style: subTitleStyle,),
                        Container(padding: const EdgeInsets.only(left: 8.0),),
                        Text('性能报告', style: TextStyle(color: Colors.blue, fontSize: 10.0),),
                      ],
                    ),
                  ],
                ),
              ],
            ),

            //间距设置
            Padding(padding: const EdgeInsets.only(top: 8.0),),

            //截图
            new LimitedBox(
              maxWidth: 1000.0,
              maxHeight: 212.0,
              child: new ListView.builder(
                scrollDirection: Axis.horizontal, 
                itemCount: _appDetail.imageUrls?.length,
                itemBuilder: (BuildContext context, int index) {

                    return CachedNetworkImage(
                        imageUrl: _appDetail.imageUrls[index], 
                        width: 128.0,
                        fit: BoxFit.contain,
                      );
                },
              ),
            ),
            
            //应用描述
            Container(
              padding: const EdgeInsets.only(left: 8.0, top: 16.0, right: 8.0),
              child: Text(
                _appDetail.description,
                maxLines: _showDetail ? 36 : 3,
                overflow: TextOverflow.ellipsis,
              )
            ),
            


            

            //官方标签
            Row(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: <Widget>[
                Padding(padding: const EdgeInsets.only(left: 8.0),),
                IconLeftText(
                  "image/safe_icon_safe.png", "免费", 
                  padding: const EdgeInsets.only(left: 3.0), 
                  imageWidth: 12.0, 
                  textSize: 12.0, 
                  textColor: Colors.black38,
                ),
                Padding(padding: const EdgeInsets.only(left: 12.0),),
                IconLeftText(
                  "image/safe_icon_safe.png", "无广告", 
                  padding: const EdgeInsets.only(left: 3.0), 
                  imageWidth: 12.0, 
                  textSize: 12.0, 
                  textColor: 
                  Colors.black38,
                ),

                Expanded(
                  flex: 1,
                  child: //展开隐藏箭头
            Align(
              alignment: Alignment(0.92, 0.0),
              child: IconButton(
                      icon: Icon(
                         _showDetail ? Icons.keyboard_arrow_up : Icons.keyboard_arrow_down,
                         color: Colors.black54,
                      ), 
                      onPressed: () {switchDesc();},
                    ),
            ),
                ),
              ],
            ),

           //灰色分割线
           Container(margin: const EdgeInsets.only(top: 16.0),
              color: Colors.black12, 
              child: Text('.', style: TextStyle(fontSize: 8.0, color: Colors.black12),),
           ),

           //应用标签
           Padding(
             padding: const EdgeInsets.only(left: 8.0, top: 8.0),
             child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                Text('标签', style: TextStyle(fontStyle: FontStyle.italic, fontWeight: FontWeight.bold),),
                Padding(padding: const EdgeInsets.only(top: 6.0),),

                LimitedBox(
                  maxWidth: 200.0,
                  maxHeight: 25.0,
                  child: new ListView.builder(
                    scrollDirection: Axis.horizontal,
                    itemCount: _appDetail.tags.length,
                    itemBuilder: (BuildContext context, int index)
                                 {
                                   return RoundCornerText(
                                      Text(_appDetail.tags[index], style: TextStyle(color: Colors.black45)),
                                      margin: const EdgeInsets.only(right: 8.0),
                                   );
                                 },
                    ),
                ),

                
              ],
           ),
           ),

           //灰色分割线
           Container(margin: const EdgeInsets.only(top: 16.0),
              color: Colors.black12, 
              child: Text('.', style: TextStyle(fontSize: 8.0, color: Colors.black12),),
           ),

        
           ListTile(
             //dense: true,
             leading: Icon(Icons.insert_comment),
             title: Text('${_appDetail.commentCount}人评分'),
             trailing: Icon(Icons.keyboard_arrow_right, color: Colors.black26,),
             onTap: (){
               //评论提示对话框
             },
           ),

           //灰色分割线
           Container(
              color: Colors.black12, 
              child: Text('.', style: TextStyle(fontSize: 8.0, color: Colors.black12),),
           ),

           Padding(
             padding: const EdgeInsets.only(left: 8.0, top: 6.0), 
             child: Text('您可能会喜欢', style: TextStyle(fontStyle: FontStyle.italic, fontWeight: FontWeight.bold),),
            ),
           
           Padding(padding: const EdgeInsets.only(top: 6.0),),
           LimitedBox(
                  maxWidth: 200.0,
                  maxHeight: 120.0,
                  child: new ListView.builder(
                    scrollDirection: Axis.horizontal,
                    //itemCount: widget._appDetailList.length > 0 ? widget._appDetailList.length - 1 : 0,
                    itemCount: 2,
                    itemBuilder: (BuildContext context, int index)
                                 {
                                   AppDetail appDetail = widget._appDetailList[index];
                                   return Padding(
                                     padding: const EdgeInsets.only(top: 6.0, left: 8.0, right: 8.0),
                                     child: AppVerticalItem(
                                     appDetail.avatarUrl,
                                     imageWidth: 45.0,
                                     name: appDetail.title,
                                     iconLeftText: IconLeftText(
                                       "image/comment_reply_star_selected.png",
                                       appDetail.rating.toString(),
                                       imageWidth: 8.0,
                                       textSize: 8.0,
                                       textColor: Colors.orange,
                                       padding: const EdgeInsets.only(left: 2.0),
                                     ),
                                     tipRight: appDetail.fileOptions[0].sizeM.toString()+"M",
                                     button: RoundCornerText(
                                       Text('安装', style: TextStyle(color: Colors.green)),
                                       borderColor: Colors.green,
                                     ),
                                   ),
                                   );
                                 },
                    ),
                ),


            //灰色分割线
           Container(
              color: Colors.black12, 
              child: Text('.', style: TextStyle(fontSize: 8.0, color: Colors.black12),),
           ),

           ListTile(
             dense: true,
             title: Text('开发者其他应用', style: TextStyle(fontSize: 15.0, color: Colors.black54)),
             trailing: Icon(Icons.keyboard_arrow_right, color: Colors.black26,),
             onTap: (){
               //评论提示对话框
             },
           ),

           Divider(height: 0.0,),

           ListTile(
             dense: true,
             title: Text('权限详情', style: TextStyle(fontSize: 15.0, color: Colors.black54)),
             trailing: Icon(Icons.keyboard_arrow_right, color: Colors.black26,),
             onTap: (){
               //评论提示对话框
             },
           ),

           Divider(height: 0.0,),

           ListTile(
             dense: true,
             title: Text('应用举报', style: TextStyle(fontSize: 15.0, color: Colors.black54)),
             trailing: Icon(Icons.keyboard_arrow_right, color: Colors.black26,),
             onTap: (){
               //评论提示对话框
             },
           ),

          //灰色分割线
           Container(
              color: Colors.black12, 
              child: Text('.', style: TextStyle(fontSize: 8.0, color: Colors.black12),),
           ),

          ],
      );


    return Scaffold(
        appBar: new AppBar(
          title: Text('详情'),
          bottom: TabBar(
                    controller: controller,
                    labelColor: Colors.white,
                    tabs: <Widget>[
                      Text('介绍'),
                      Text('评论(${_appDetail.commentCount})'),
                      Text('推荐'),
                     ]        ,
                  ),
        ),
        body: 
        TabBarView(
                    controller: controller,
                    children: <Widget>[
                        Stack(
                          fit: StackFit.expand,
                          children: <Widget>[
                            Column(
                              children: <Widget>[
                                Expanded(
                                  flex: 1,
                                  child: first,
                                ),
                                Container(
                                  padding: const EdgeInsets.only(left: 8.0, top: 6.0, right: 8.0, bottom: 6.0),
                                  decoration: BoxDecoration(color: Colors.white),
                                  child: Row(
                                  crossAxisAlignment: CrossAxisAlignment.center,
                                  children: <Widget>[
                                    IconButton(icon: Icon(Icons.star,), onPressed: () {},),
                                    Padding(padding: const EdgeInsets.only(left: 8.0),),
                                    Expanded(
                                      flex: 1, 
                                      child: RaisedButton(onPressed: () {}, color: Colors.blueAccent,
                                                         child: Text('下载 (${_appDetail.fileOptions[0].sizeM}M)'
                                                                    , style: TextStyle(color: Colors.white70),),),
                                    ),
                                    Padding(padding: const EdgeInsets.only(left: 8.0),),
                                    IconButton(icon: Icon(Icons.share), onPressed: () {},),
                                  ],
                                ),
                                ),
                                
                              ],
                            ),
                            
                          ],
                        ),
                        Text("second Tab!!!!!!!!!"),
                        Text("third Tab!!!!!!!!!"),
                    ],
                  ),
      );
     

  }

 }