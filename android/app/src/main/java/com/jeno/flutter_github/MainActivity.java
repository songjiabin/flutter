package com.jeno.flutter_github;

import android.content.ContextWrapper;
import android.content.Intent;
import android.content.IntentFilter;
import android.os.BatteryManager;
import android.os.Build;
import android.os.Bundle;
import android.util.Log;

import io.flutter.app.FlutterActivity;
import io.flutter.plugin.common.MethodCall;
import io.flutter.plugin.common.MethodChannel;
import io.flutter.plugins.GeneratedPluginRegistrant;

public class MainActivity extends FlutterActivity {

  //channel的名称，由于app中可能会有多个channel，这个名称需要在app内是唯一的。
  private static  final String  CHANWEL = "com.jeno.flutter_github_sample_1";


  @Override
  protected void onCreate(Bundle savedInstanceState) {
    super.onCreate(savedInstanceState);
    GeneratedPluginRegistrant.registerWith(this);


    /**
     * onMethodCall有两个入参，
     * MethodCall里包含要调用的方法名称和参数。
     * Result是给Flutter的返回值。方法名是两端协商好的。通过if语句判断MethodCall.method来区分不同的方法，
     * 在我们的例子里面我们只会处理名为“getBatteryLevel”的调用。
     * 在调用本地方法获取到电量以后通过result.success(batteryLevel)调用把电量值返回给Flutter。
     */
    //等于是注册方法 ，用于 flutter 调用
    new MethodChannel(getFlutterView(),CHANWEL).setMethodCallHandler(new MethodChannel.MethodCallHandler() {
      @Override
      public void onMethodCall(MethodCall methodCall, MethodChannel.Result result) {
          ///这里来处理 flutter的请求
        if (methodCall.method.equals("getBatteryLevel")) {
          //如果flutter调用的是 getBatteryLevel的方法
            int batteryLevel = getBatteryLevel();
            if (batteryLevel!=-1) {
              //返回成功  告诉 flutter电量
              result.success(batteryLevel);
            }else {
              result.error("UNAVAILABLE", "Battery level not available.", null);
            }
        }else if (methodCall.method.equals("getName")){

            Log.i("》》》》","過來了");
            //flutter 调用 getName 的方法的时候
            new MethodChannel(getFlutterView(),CHANWEL).invokeMethod("getName", null, new MethodChannel.Result() {
              @Override
              public void success(Object o) {
                  //成功后返回参数：
                Log.i("调用flutter返回的参数是：",o.toString());
              }

              @Override
              public void error(String s, String s1, Object o) {

              }

              @Override
              public void notImplemented() {

              }
            });
        }else {
          //沒有方法实现
          Log.i("》》》》","沒有方法实现");
          result.notImplemented();
        }
      }
    });




  }


  /**
   *  获取 电量
   * @return
   */
  private int getBatteryLevel() {
    int batteryLevel = -1;
    if (Build.VERSION.SDK_INT >= Build.VERSION_CODES.LOLLIPOP) {
      BatteryManager batteryManager = (BatteryManager) getSystemService(BATTERY_SERVICE);
      batteryLevel = batteryManager.getIntProperty(BatteryManager.BATTERY_PROPERTY_CAPACITY);
    } else {
      Intent intent = new ContextWrapper(getApplicationContext()).
              registerReceiver(null, new IntentFilter(Intent.ACTION_BATTERY_CHANGED));
      batteryLevel = (intent.getIntExtra(BatteryManager.EXTRA_LEVEL, -1) * 100) /
              intent.getIntExtra(BatteryManager.EXTRA_SCALE, -1);
    }

    return batteryLevel;
  }


}
