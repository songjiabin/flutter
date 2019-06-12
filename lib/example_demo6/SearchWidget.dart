import 'package:flutter/material.dart';
import 'package:flutter_github/asset.dart';


/***
 * 搜索条
 */
class SearchWidget extends StatefulWidget {
  @override
  SearchWidgetState createState() => new SearchWidgetState();
}

class SearchWidgetState extends State<SearchWidget> {
  @override
  Widget build(BuildContext context) {
    return new Scaffold(
        appBar: new AppBar(
          title: new Text('SearchBarDemo'),
          //右侧搜索的时候 用此
          actions: <Widget>[
            IconButton(icon: Icon(Icons.search), onPressed: () {
              return showSearch(
                  context: context, delegate: searchBarDelegate());
            })
          ],
        )
    );
  }

}


class searchBarDelegate extends SearchDelegate<String> {

  //返回的组件数组
  //右边的图标
  @override
  List<Widget> buildActions(BuildContext context) {
    return [
      IconButton(icon: Icon(Icons.clear), onPressed: () {
        query = "";
      })
    ];
  }

  //右边的箭头
  @override
  Widget buildLeading(BuildContext context) {
    return IconButton(
        icon: AnimatedIcon(
            icon: AnimatedIcons.menu_arrow,
            //过度
            progress: transitionAnimation),
        onPressed: () {
          //关闭上下文
          close(context, null);
        });
  }


  // 点击搜索后 出现的内容
  @override
  Widget buildResults(BuildContext context) {
    // TODO: implement buildResults
    return new Container(
      //宽度
      width: 100.0,
      //高度
      height: 100.0,
      child: new Card(
        color: Colors.red,
        child: new Center(
          child: Text(query),
        ),
      ),
    );;
  }

  /**
   * 搜索后出现的列表
   */
  @override
  Widget buildSuggestions(BuildContext context) {
    //查找集合中以query开头的数据
    final suggestionList = query.isEmpty ? recentSuggest : searchList.where((
        input) => input.startsWith(query)).toList();

    return ListView.builder(
        itemBuilder: (context, index) {
          return ListTile(
            //富文本
            title: RichText(text: TextSpan(
                text: suggestionList[index].substring(0, query.length),
                style: TextStyle(
                    color: Colors.black,
                    fontWeight: FontWeight.bold
                ),
                children: [
                  TextSpan(
                      text: suggestionList[index].substring(query.length),
                      style: TextStyle(
                          color: Colors.grey
                      )
                  ),
                ]
            )),
          );
        }, itemCount: suggestionList.length);
  }

}