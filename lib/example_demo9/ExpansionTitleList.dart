import 'package:flutter/material.dart';


/**
 * 可展开闭合的List
 */
class ExpansionTitleList extends StatefulWidget {
  @override
  ExpansionTitleListState createState() => new ExpansionTitleListState();
}

class ExpansionTitleListState extends State<ExpansionTitleList> {

  List<int> list;
  List<ExpandStateBean> listExpandStateBean;


  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    list = new List();
    listExpandStateBean = new List();
    for (int i = 0; i < 100; i++) {
      list.add(i);
      listExpandStateBean.add(new ExpandStateBean(false, i));
    }
  }


  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      appBar: new AppBar(
        title: new Text('可展开闭合的List'),
      ),
      body:
      //可滚动的控件
      new SingleChildScrollView(
        //ExpansionTitleList 必须放到可以滑动的控件里面
          child: new ExpansionPanelList(
            //当点击右边的箭头的时候触发
            expansionCallback: (index, bool) {
              _setCurrentIndex(index, bool);
            },
            children: this.list.map((index) {
              //list.map 是遍历里面的元素 并返回list格式的数据
              return
                ExpansionPanel(
                  //头部的意思  isExpand 是否打开
                  headerBuilder: (context, isExpand) {
                    return ListTile(
                      title: Text('This is NO.$index'),
                    );
                  },
                  //身体部分 其实就是展开的部分
                  body:
                  ListTile(
                      title: Text('expansion No.$index'),
                      leading: Icon(Icons.data_usage,color: Colors.red,)
                  ),
                  //是否展开
                  isExpanded: listExpandStateBean[index].isOpen,
                );
            }).toList(),
          )),
    );
  }

  /**
   * 设置当前的索引
   */
  _setCurrentIndex(int index, bool isExpan) {
    setState(() {
      //遍历
      listExpandStateBean.forEach((item) {
        if (item.index == index) {
          //证明点击的这个
          item.isOpen = !isExpan;
        }
      });
    });
  }
}


/**
 * 展开 闭合 的状态 bean
 */
class ExpandStateBean {

  //是否打开
  var isOpen;

  //索引是啥
  var index;

  ExpandStateBean(this.isOpen, this.index);


}
