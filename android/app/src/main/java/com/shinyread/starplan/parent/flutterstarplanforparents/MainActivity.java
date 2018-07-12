package com.shinyread.starplan.parent.flutterstarplanforparents;

import android.os.Build;
import android.os.Bundle;

import com.shinyread.starplan.parent.flutterstarplanforparents.utils.GetIms;

import io.flutter.app.FlutterActivity;
import io.flutter.plugin.common.MethodCall;
import io.flutter.plugin.common.MethodChannel;
import io.flutter.plugins.GeneratedPluginRegistrant;

public class MainActivity extends FlutterActivity {
  private static final String CHANNEL = "com.shinyread.starplan.parent.flutterstarplanforparents/getDevice";
  @Override
  protected void onCreate(Bundle savedInstanceState) {
    super.onCreate(savedInstanceState);
    GeneratedPluginRegistrant.registerWith(this);

    new MethodChannel(getFlutterView(),CHANNEL).setMethodCallHandler(new MethodChannel.MethodCallHandler()
    {
      @Override
      public void onMethodCall(MethodCall methodCall, MethodChannel.Result result)
      {
          if (methodCall.method.equals("getUuid"))
          {
                String uid = getUuid();
                result.success(uid);
          }

          if (methodCall.method.equals("getVersion"))
          {
              int version = getVersion();
              result.success(version);
          }

          if (methodCall.method.equals("getsystemMark"))
          {
              String systemMark = getsystemMark();
              result.success(systemMark);
          }

          if (methodCall.method.equals("getphoneMark"))
          {
              String phoneMark = getphoneMark();
              result.success(phoneMark);
          }

      }
    });
  }

  private String getUuid()
  {
    return GetIms.getImei(this);
  }

  private int getVersion()
  {
    return GetIms.getVersion(this);
  }

  private String getsystemMark()
  {
    return Build.VERSION.SDK;
  }

  private String getphoneMark()
  {
     return Build.MODEL;
  }
}
