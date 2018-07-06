import 'package:flutter/material.dart';
import 'package:cached_network_image/cached_network_image.dart';


 class StarRank extends StatelessWidget{
   double _ranting = 5.0;

   StarRank(this._ranting);

  @override
  Widget build(BuildContext context) {
    int rantingInt = _ranting.round() ~/ 2;
    if(rantingInt > 5){
      rantingInt = 5;
    }
    return Row(
      children: <Widget>[
          Star(rantingInt >= 1),
          Star(rantingInt >= 2),
          Star(rantingInt >= 3),
          Star(rantingInt >= 4),
          Star(rantingInt >= 5),
      ],
    );
  }

 }

 class Star extends StatelessWidget {
  bool _selected;

  Star(this._selected);

  @override
  Widget build(BuildContext context) {
    return _selected ? new Image.asset('image/comment_reply_star_selected.png', width: 10.0)
                     : new Image.asset('image/comment_reply_star_normal.png', width: 10.0);
  }
 }

 class IconLeftText extends StatelessWidget{
   String _imageAssets;
   String _text;
   EdgeInsetsGeometry padding; 
   double imageWidth;
   double textSize;
   Color textColor;

   IconLeftText(
     this._imageAssets, 
     this._text, 
     {
       this.padding : const EdgeInsets.only(left: 6.0), 
       this.imageWidth, 
       this.textSize : 16.0, 
       this.textColor : Colors.black38
       }
   );

  @override
  Widget build(BuildContext context) {
    MediaQuery.of(context).padding.top;
    return Row(
      children: <Widget>[
          Image.asset(_imageAssets, width: imageWidth,),
          Padding(padding: padding),
          Text(_text, style: TextStyle(fontSize: textSize, color: textColor),),
      ],
         

    );
  }
 }

 class RoundCornerText extends StatelessWidget {
   double borderRadius;
   Color  borderColor;
   Color  color;
   EdgeInsets padding;
   Text content;
   EdgeInsets margin;

  RoundCornerText(
     this.content,
    {
      this.color : Colors.white, 
      this.borderRadius : 6.0, 
      this.borderColor : Colors.black54, 
      this.padding : const EdgeInsets.only(left: 10.0, top: 2.0, right: 10.0, bottom: 2.0),
      this.margin
    }
  );

  @override
  Widget build(BuildContext context) {
      return Container(        
        alignment: Alignment.center,
        margin: margin,
        padding: padding,
        child: content,
        decoration: new BoxDecoration(
                            color: color, 
                            border: Border(
                                      top: BorderSide(width: 1.0, color: borderColor),
                                      left: BorderSide(width: 1.0, color: borderColor),
                                      right: BorderSide(width: 1.0, color: borderColor),
                                      bottom: BorderSide(width: 1.0, color: borderColor),
                                    ),
        borderRadius: new BorderRadius.all(new Radius.circular(borderRadius)),
                    ),
      );
  }

 }

 class AppVerticalItem extends StatelessWidget {
   String imageUrl;
   double imageWidth;
   String name;
   IconLeftText iconLeftText;
   String tipRight;
   RoundCornerText button;

  AppVerticalItem(
    this.imageUrl,
    {
      this.imageWidth : 45.0,
      this.name,
      this.iconLeftText,
      this.tipRight,
      this.button
    }
  );

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.center,
      children: <Widget>[
          SizedBox(width: imageWidth, height: imageWidth, child: CachedNetworkImage(
                        imageUrl: imageUrl, 
                        width: imageWidth,
                        fit: BoxFit.contain,
                      ),),
          
          Padding(padding: const EdgeInsets.only(top: 3.0),),
          Text(name, style: TextStyle(fontSize: 12.0),),
          Padding(padding: const EdgeInsets.only(top: 3.0),),
          Row(
            children: <Widget>[
              iconLeftText,
              Padding(padding: const EdgeInsets.only(left: 5.0)),
              Text(tipRight, style: TextStyle(fontSize: 8.0),),
            ],
          ),
          Padding(padding: const EdgeInsets.only(top: 5.0),),
          button,
      ],
    );
  }

 }