import 'package:flutter/material.dart';

/**
 * 实现一个小demo
 */
class MySelfDemoWidget extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return new Scaffold(

      body: new SingleChildScrollView(
        child: new Column(
          children: [
            //得到上面的图片部分
            getImageWidget(),
            //得到Start部分
            getStartWidget(),
            //得到下面的导航图标
            getNavigationIcon(),
            //获取底部Text
            getBottomText(),
          ],
        ),
      ),
    );
  }

  /**
   * 得到上面的图片部分
   */
  Widget getImageWidget() {
    return new Image.network(
      'https://cdn.pixabay.com/photo/2019/04/21/11/11/chess-board-flowers-4143937__340.jpg',
      fit: BoxFit.cover,
    );
  }


  /**
   * 得到中间的Start部分
   */
  Widget getStartWidget() {
    return new Container(
      padding: EdgeInsets.all(32.0),
      child: new Row(
        children: [
          Expanded(
              child:
              new Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  new Container(
                    padding: EdgeInsets.only(bottom: 8.0),
                    child: new Text(
                        '这个是小标题............', style: TextStyle(
                        color: Colors.black, fontWeight: FontWeight.bold)),
                  ),
                  new Text('这个是副标题............')
                ],
              )),
          new Icon(Icons.star, color: Colors.orange,),
          new Text('43')
        ],
      ),
      // 盒子样式
      decoration: new BoxDecoration(
        //设置Border属性给容器添加边框
        border: new Border.all(
          //为边框添加颜色
          color: Colors.transparent,
          width: 2.0, //边框宽度
        ),
      ),
    );
  }


  /**
   * 得到下面的导航图标部分
   */
  Widget getNavigationIcon() {
    return
      new Container(
          padding: EdgeInsets.all(32.0),
          // 盒子样式
          decoration: new BoxDecoration(
            //设置Border属性给容器添加边框
            border: new Border.all(
              //为边框添加颜色
              color: Colors.transparent,
              width: 2.0, //边框宽度
            ),
          ),
          child: new Row(
            children: [
              Expanded(
                child: new Column(
                  children: [
                    Padding(padding: EdgeInsets.only(bottom: 8.0),
                      child: Icon(Icons.phone, color: Colors.blue,),),
                    Text('CALL')
                  ],
                ),
              ),

              Expanded(
                child: new Column(
                  children: [
                    Padding(padding: EdgeInsets.only(bottom: 8.0),
                      child: Icon(Icons.router, color: Colors.blue,),),
                    Text('ROUTE')
                  ],
                ),
              ),

              Expanded(
                child: new Column(
                  children: [
                    Padding(padding: EdgeInsets.only(bottom: 8.0),
                        child: Icon(Icons.share, color: Colors.blue,)),
                    Text('SHARE')
                  ],
                ),
              ),
            ],
          )
      );
  }


  /**
   * 得到富文本
   */
  Widget getBottomText() {
    var _text = '特朗普周四（9日）在白宫表示，他收到了中国国家主席习近平“美丽的信件”，但并未透露信件的内容，只称两人可能会通电话。中美贸易谈判团队在华盛顿时间周四下午五时开始磋商，美方威胁上调关税的时间是周五（10日）凌晨零点零一分，留给两国谈判团队的时间不多了。我不知道会发生什么，”特朗普在谈判开始前对记者说，“我们今晚就会知道。目前未有迹象表明两国可以在短时间内修补所有分歧，达成最终的贸易协议。中国观察家利明璋（Bill Bishop）预期，本周谈判最积极的可能结果是，两国同意暂时不上调关税，继续朝达成最终协议迈进。';
    return
      new RichText(
        text: TextSpan(
            text: _text,
            style: TextStyle(color: Colors.black, fontSize: 18.0),
            children: <TextSpan>[
              new TextSpan(
                  text: _text.substring(0, _text.length - 10),
                  style: TextStyle(
                      fontWeight: FontWeight.bold, color: Colors.red)
              )
            ]
        ),
      );
  }
}






