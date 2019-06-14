import 'package:flutter/material.dart';
import 'dart:io';
import 'package:path_provider/path_provider.dart';
import 'package:simple_permissions/simple_permissions.dart';
import 'selection_icon.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:flutter/services.dart';

/**
 * 文件路径解析
 */
class FileParse extends StatefulWidget {

  String sdpath;
  Directory parentDir;

  List<FileSystemEntity> files = [];

  //记录当前的点击的位置
  List<double> position = [];

  @override
  FileParseState createState() => new FileParseState();

  FileParse({this.sdpath});
}

class FileParseState extends State<FileParse> {

  //滑动控制器
  ScrollController controller = ScrollController();
  bool isLoad = false;


  @override
  void initState() {
    super.initState();
  }


  @override
  Widget build(BuildContext context) {
    if (this.widget.sdpath != null && !isLoad) {
      initDirectory(this.widget.sdpath);
      this.isLoad = true;
    }

    return

      new WillPopScope(
          child:
          new Scaffold(
              appBar: _initAppbar(),
              body: getBody()
          ),
          onWillPop: () {
            //当点击回退的时候
            if (this.widget.parentDir.path != this.widget.sdpath) {
              //跳转到父路径
              initDirectory(this.widget.parentDir.parent.path);
              jumpToPosition(false);
            } else {
              //结束此app
              SystemNavigator.pop();
            }
          }

      );
  }


  //加载路径
  initDirectory(String path) async {
    setState(() {
      var directory = Directory(path);
      this.widget.files.clear();

      this.widget.parentDir = Directory(path);
      //遍历路径 得到下面所有的文件集合
      this.widget.files = directory.listSync();
    });
  }

  //加载appbar
  Widget _initAppbar() {
    return AppBar(
      title: Text(
        // parentDir是否为null? 如果为null 那么 this.widget.parentDir?.path就为null
          this.widget.parentDir?.path == this.widget.sdpath ? 'sdcard' :
          this
              .widget
              .parentDir
              .path.substring(this.widget.parentDir.parent.path.length + 1),
          style: TextStyle(color: Colors.black)),
      centerTitle: true,
      leading: this.widget.parentDir?.path == this.widget.sdpath
          ? Container()
          : IconButton(
          icon: Icon(
            Icons.chevron_left,
            color: Colors.black,
          ),
          onPressed: () {
            if (this.widget.parentDir.path != this.widget.sdpath) {
              initDirectory(this.widget.parentDir.parent.path);
              jumpToPosition(false);
            } else {
              Navigator.pop(context);
            }
          }),
    );
  }


  Widget getBody() {
    return Scrollbar(
      child: ListView.builder(

        itemCount: this.widget.files.length == 0 ? 1 : this.widget.files.length,
        physics: BouncingScrollPhysics(),
        controller: controller,
        itemBuilder: (context, index) {
          if (this.widget.files.length == 0) {
            return Padding(
              padding: EdgeInsets.only(top: MediaQuery
                  .of(context)
                  .size
                  .height / 2 - MediaQuery
                  .of(context)
                  .padding
                  .top - 56.0),
              child: Center(
                child: Text('数据为空'),
              ),
            );
          } else {
            return buildListViewItem(this.widget.files[index]);
          }
        },
      ),
    );
  }

  /**
   * 构建item
   */
  Widget buildListViewItem(FileSystemEntity file) {
    //判断是否是文件
    bool isFile = FileSystemEntity.isFileSync(file.path);

    //去除开头是 . 的文件或者文件夹
    String name = file.path.substring(file.parent.path.length + 1).substring(
        0, 1);
    if (name == '.') {
      return Container();
    }


    //计算数量
    int length = 0;
    if (!isFile) length = removePointBegin(file);


    return InkWell(
      onTap: () {
        //如果不是文件的话
        if (!isFile) {
          //像List<double> 插入最新的位置
          this.widget.position.insert(
              this.widget.position.length, controller.offset);
          //解析新数据
          initDirectory(file.path);
          //跳转到最上面
          jumpToPosition(true);
        } else
          //打开文件
          Fluttertoast.showToast(msg: '打开文件');
      },
      child: new Column(
        children: [
          ListTile(
            //根据后缀名字选择图标
            leading: Image.asset(selectIcon(isFile, file)),
            title: Row(
              children: <Widget>[
                Expanded(child: Text(
                    file.path.substring(file.parent.path.length + 1))),
                isFile
                    ? Container()
                    : Text(
                  '$length项',
                  style: TextStyle(color: Colors.grey),
                )
              ],
            ),
            subtitle: isFile
                ? Text(
              '${getFileLastModifiedTime(file)}  ${getFileSize(file)}',
              style: TextStyle(fontSize: 12.0),
            )
                : null,
          )
        ],
      ),
    );
  }


  // 计算文件夹内 文件、文件夹的数量，以 . 开头的除外
  removePointBegin(Directory path) {
    var dir = Directory(path.path).listSync();
    int num = dir.length;

    for (int i = 0; i < dir.length; i++) {
      if (dir[i].path.substring(dir[i].parent.path.length + 1).substring(
          0, 1) == '.') num--;
    }
    return num;
  }

  //如果是文件的话 显示年与日
  getFileLastModifiedTime(FileSystemEntity file) {
    DateTime dateTime = File(file.resolveSymbolicLinksSync())
        .lastModifiedSync();

    String time =
        '${dateTime.year}-${dateTime.month < 10 ? 0 : ''}${dateTime
        .month}-${dateTime.day < 10 ? 0 : ''}${dateTime.day} ${dateTime.hour <
        10 ? 0 : ''}${dateTime.hour}:${dateTime.minute < 10 ? 0 : ''}${dateTime
        .minute}';
    return time;
  }

  //得到文件大小
  getFileSize(FileSystemEntity file) {
    int fileSize = File(file.resolveSymbolicLinksSync()).lengthSync();
    if (fileSize < 1024) {
      // b
      return '${fileSize.toStringAsFixed(2)}B';
    } else if (1024 <= fileSize && fileSize < 1048576) {
      // kb
      return '${(fileSize / 1024).toStringAsFixed(2)}KB';
    } else if (1048576 <= fileSize && fileSize < 1073741824) {
      // mb
      return '${(fileSize / 1024 / 1024).toStringAsFixed(2)}MB';
    }
  }

  //listView 跳转到指定的位置去
  void jumpToPosition(bool isEnter) {
    if (isEnter)
      controller.jumpTo(0.0);
    else {
      //跳转到指定的位置
      controller.jumpTo(this.widget.position[this.widget.position.length - 1]);
      this.widget.position.removeLast();
    }
  }


}