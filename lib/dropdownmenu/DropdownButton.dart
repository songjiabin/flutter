import 'package:flutter/material.dart';

class LearnDropdownButton extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return _LearnDropdownButton();
  }
}

class _LearnDropdownButton extends State<LearnDropdownButton> {
  var _selectType;

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return new Container(
        height: 35,
        width: MediaQuery.of(context).size.width - 140,
        decoration: BoxDecoration(
            border:
                Border(bottom: BorderSide(width: 1, color: Color(0xffabdeae)))),
        child: new DropdownButtonHideUnderline(
            child: new DropdownButton(
          items: [
            new DropdownMenuItem(
              child: new Text('同意'),
              value: '同意',
            ),
            new DropdownMenuItem(
              child: new Text('拒绝'),
              value: '拒绝',
            ),
          ],
          hint: new Text('请选择'),
          onChanged: (value) {
            setState(() {
              _selectType = value;
              print(value);
            });
          },
//              isExpanded: true,
          value: _selectType,
          elevation: 24,
          //设置阴影的高度
          style: new TextStyle(
            //设置文本框里面文字的样式
            color: Color(0xff4a4a4a),
            fontSize: 12,
          ),
//              isDense: false,//减少按钮的高度。默认情况下，此按钮的高度与其菜单项的高度相同。如果isDense为true，则按钮的高度减少约一半。 这个当按钮嵌入添加的容器中时，非常有用
          iconSize: 40.0,
        )));
  }
}
