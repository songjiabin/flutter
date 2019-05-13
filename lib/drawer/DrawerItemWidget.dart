import 'package:flutter/material.dart';


/**
 * 侧滑菜单的ListView
 */
class DrawerItemWidget extends StatefulWidget {


  final String title;
  final int position;
  final onItemClickListeners onItemClickListener;


  DrawerItemWidget(this.title, this.position, this.onItemClickListener);

  @override
  DrawerItemWidgetState createState() => new DrawerItemWidgetState();
}

class DrawerItemWidgetState extends State<DrawerItemWidget> {
  @override
  Widget build(BuildContext context) {
    var column = new Column(
      children: [
        getWidget()
      ],
    );


    var inkWell = InkWell(
      child: column,
      onTap: () {
        this.widget.onItemClickListener(this.widget.position);
        Navigator.of(context).pop();
      },
    );

    return inkWell;
  }


  Widget getWidget() {
    if (this.widget.position == 0) {
      return new Column(
        children: [
          Image.network(
            'https://images.unsplash.com/photo-1557562440-b67d58679232?ixlib=rb-1.2.1&ixid=eyJhcHBfaWQiOjEyMDd9&auto=format&fit=crop&w=500&q=60',
            fit: BoxFit.cover,
          ),
          Padding(
              padding: EdgeInsets.all(8.0), child: Text(this.widget.title))
        ],
      );
    } else {
      return Padding(
        padding: EdgeInsets.all(8.0), child: Text(this.widget.title),);
    }
  }


}


/**
 * 定义一个接口  回调方法
 */
typedef onItemClickListeners = void Function(int position);




