package com.jeno.flutter_github;

import io.flutter.plugin.common.MethodCall;
import io.flutter.plugin.common.MethodChannel;
import io.flutter.plugin.common.PluginRegistry;

/**
 * author : 宋佳
 * time   : 2019/05/28
 * desc   :
 * version: 1.0.0
 */

public class BattlePowerPlugin implements MethodChannel.MethodCallHandler {
    /**
     * Plugin registration.
     */
    public static void registerWith(PluginRegistry.Registrar registrar) {
        final MethodChannel channel = new MethodChannel(registrar.messenger(), "battle_power"); //这里对应dart端的 MethodChannel
        channel.setMethodCallHandler(new BattlePowerPlugin());
    }

    @Override
    public void onMethodCall(MethodCall call, MethodChannel.Result result) {
        if (call.method.equals("getPlatformVersion")) { // 对应dart端 invoceMethod
            result.success("Android " + android.os.Build.VERSION.RELEASE);
        } else {
            result.notImplemented();
        }
    }
}