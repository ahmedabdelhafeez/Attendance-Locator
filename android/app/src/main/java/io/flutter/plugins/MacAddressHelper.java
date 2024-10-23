package com.example.attendance_and_departure.mac_address;

import android.content.Context;
import android.net.wifi.WifiInfo;
import android.net.wifi.WifiManager;
import android.os.Build;

import io.flutter.embedding.engine.plugins.FlutterPlugin;
import io.flutter.plugin.common.MethodCall;
import io.flutter.plugin.common.MethodChannel;
import io.flutter.plugin.common.MethodChannel.MethodCallHandler;
import io.flutter.plugin.common.MethodChannel.Result;
import io.flutter.plugin.common.PluginRegistry.Registrar;

public class MacAddressHelper implements MethodCallHandler {
  private Context context;

  public MacAddressHelper(Context context) {
    this.context = context;
  }

  @Override
  public void onMethodCall(MethodCall call, Result result) {
    if (call.method.equals("getMacAddress")) {
      String macAddress = getMacAddress();
      result.success(macAddress);
    } else {
      result.notImplemented();
    }
  }

  private String getMacAddress() {
    WifiManager wifiManager = (WifiManager) context.getSystemService(Context.WIFI_SERVICE);
    WifiInfo wifiInfo = wifiManager.getConnectionInfo();
    String macAddress = wifiInfo.getMacAddress();
    return macAddress;
  }
}