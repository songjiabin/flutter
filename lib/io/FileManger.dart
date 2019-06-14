import 'package:flutter/material.dart';
import 'dart:io';
import 'package:path_provider/path_provider.dart';
import 'package:simple_permissions/simple_permissions.dart';
import 'package:flutter_github/io/FileParse.dart';

//文件管理
class FileManager extends StatefulWidget {
  @override
  FileManagerState createState() => new FileManagerState();
}

class FileManagerState extends State<FileManager> {

  String sdCardPath;

  @override
  Widget build(BuildContext context) {
    return FileParse(sdpath: this.sdCardPath);
  }

  @override
  void initState() {
    super.initState();
    Future.wait([_getPermission()]).then((v) {
      setState(() {

      });
    });
  }


  //得到权限
  Future _getPermission() async {
    //如果是android的话
    if (Platform.isAndroid) {
      //读写sd的权限
      bool readPermission = await SimplePermissions.checkPermission(
          Permission.ReadExternalStorage);
      bool writePermission = await SimplePermissions.checkPermission(
          Permission.WriteExternalStorage);

      //如果没有读的权限的话 请求权限
      if (!readPermission) {
        await SimplePermissions.requestPermission(
            Permission.ReadExternalStorage);
      }

      //如果没有写的权限的话 请求权限
      if (!writePermission) {
        await SimplePermissions.requestPermission(
            Permission.WriteExternalStorage);
      }

      //获取路径
      await getSDCarsDir();
    }
  }

  ///得到 sd卡的路径
  Future getSDCarsDir() async {
    var sdDir = await getExternalStorageDirectory();
    sdCardPath = sdDir.path;
  }
}