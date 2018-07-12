package com.shinyread.starplan.parent.flutterstarplanforparents.utils;

import android.content.Context;
import android.content.pm.PackageManager;
import android.telephony.TelephonyManager;

/**
 * Created by Administrator on 2018/7/11.
 */

public class GetIms
{
    // 获取UUID
    public static String getImei(Context context)
    {
        TelephonyManager tm = (TelephonyManager) context.getSystemService(Context.TELEPHONY_SERVICE);
        return tm.getDeviceId();
    }

    // 获取版本号
    public static int getVersion(Context context)
    {
        int version = 0;
        try
        {
            version =  context.getPackageManager().getPackageInfo(context.getPackageName() , PackageManager.GET_CONFIGURATIONS).versionCode;
        }
        catch (PackageManager.NameNotFoundException e)
        {
            e.printStackTrace();
        }
        return version;
    }
}
