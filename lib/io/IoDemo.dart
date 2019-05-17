import 'package:flutter/material.dart';
import 'dart:io';
import 'package:path_provider/path_provider.dart';


/**
 * Id操作
 */
class IoWidget extends StatefulWidget {
  @override
  IoWidgetState createState() => new IoWidgetState();
}

class IoWidgetState extends State<IoWidget> {


  @override
  Widget build(BuildContext context) {
    return new Scaffold(

    );
  }

  @override
  void initState() {
    super.initState();
    localPath();
  }

  @override
  void dispose() {
    super.dispose();
  }


  /**
   * 加载目录
   * async 异步
   */
  localPath() async {
    try {
      //得到临时目录
      var tempDir = await getTemporaryDirectory();
      String tempPath = tempDir.path;

      //文档目录
      var appDorDir = await getApplicationDocumentsDirectory();
      String appDocPath = appDorDir.path;

      //sd卡目录
      var sdDir = await getExternalStorageDirectory();
      String sdPaht = sdDir.path;


      print('临时目录' + tempPath);
      print('文档目录' + appDocPath);
      print('sd卡目录' + sdPaht);


      //文件的读写操作
      Directory(appDocPath + "/我的文件1/" + "txt文件").create(
          recursive: true).then((Directory d) {
        return new File(d.path + "/" + "1.txt").create(recursive: true).then((
            File file) {
          file.writeAsString('往缓存文件中加入数据2').then((File file) {
            //当写完数据后才能读取
            file.readAsString().then((String data) {
              print('数据是:$data');
            });
          });
        });
      });


      //文件的删除操作
      Directory(appDocPath + "/我的文件1/" + "txt文件").delete(recursive: true).then((
          FileSystemEntity fileSystemEntity) {
        print('删除path' + fileSystemEntity.path);
      });
    } catch (e) {
      print(e);
    }
  }

  /**
   * 协数据
   */
  Future<File> writeContent(String content) async {
    try {
      final path = await localPath();


//      Directory directory = new Directory("$path/songjiabin");

//
//      if (!await directory.exists()) {
//        await directory.create();
//      }


      new Directory(path + '/' + 'songjiabin1').create(recursive: true)
      // The created directory is returned as a Future.
          .then((Directory directory) {
        print('Path of New Dir: ' + directory.path);
      });

      new Directory(path + '/' + 'songjiabin').delete(recursive: true)
          .then((FileSystemEntity f) {
        print(f.path);
      });


      return null;

      Directory directory = new Directory(path + '/' + 'songjiabin');
      if (!await directory.exists()) {
        await directory.create(recursive: true);
      }


      File file = await new File('${directory.path}/songjiab.txt');


//      //如果文件不存在的话
//      bool exists = await file.exists();
//      if (!exists) {
//        await file.create();
//      }
      file.writeAsString('宋佳宾');
    } catch (e) {
      print(e.toString());
    }
  }


}








