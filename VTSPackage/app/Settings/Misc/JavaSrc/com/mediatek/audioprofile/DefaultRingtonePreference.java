// Decompiled by Jad v1.5.8g. Copyright 2001 Pavel Kouznetsov.
// Jad home page: http://www.kpdus.com/jad.html
// Decompiler options: packimports(3) fieldsfirst noctor space 

package com.mediatek.audioprofile;

import android.content.Context;
import android.content.Intent;
import android.net.Uri;
import android.preference.RingtonePreference;
import android.util.AttributeSet;
import com.android.settings.Utils;
import com.mediatek.settings.ext.IAudioProfileExt;
import com.mediatek.xlog.Xlog;

// Referenced classes of package com.mediatek.audioprofile:
//            AudioProfileManager

public class DefaultRingtonePreference extends RingtonePreference
{

    public static final String NOTIFICATION_TYPE = "NOTIFICATION";
    public static final String RING_TYPE = "RING";
    private static final String TAG = "Settings/Rt_Pref";
    private IAudioProfileExt mExt;
    private String mKey;
    private final AudioProfileManager mProfileManager;
    private String mStreamType;

    public DefaultRingtonePreference(Context context, AttributeSet attributeset)
    {
        super(context, attributeset);
        mProfileManager = (AudioProfileManager)context.getSystemService("audioprofile");
        mExt = Utils.getAudioProfilePlgin(context);
    }

    protected void onPrepareRingtonePickerIntent(Intent intent)
    {
        super.onPrepareRingtonePickerIntent(intent);
        intent.putExtra("android.intent.extra.ringtone.SHOW_DEFAULT", false);
        if (mStreamType.equals("RING"))
            intent.putExtra("android.intent.extra.ringtone.SHOW_SILENT", false);
        mExt.setRingtonePickerParams(intent);
    }

    protected Uri onRestoreRingtone()
    {
        int i = getRingtoneType();
        Xlog.d("Settings/Rt_Pref", (new StringBuilder()).append("onRestoreRingtone: type = ").append(i).toString());
        Uri uri = mProfileManager.getRingtoneUri(mKey, i);
        StringBuilder stringbuilder = (new StringBuilder()).append("onRestoreRingtone: uri = ");
        String s;
        if (uri == null)
            s = "null";
        else
            s = uri.toString();
        Xlog.d("Settings/Rt_Pref", stringbuilder.append(s).toString());
        return uri;
    }

    protected void onSaveRingtone(Uri uri)
    {
        mProfileManager.setRingtoneUri(mKey, getRingtoneType(), uri);
    }

    public void setProfile(String s)
    {
        mKey = s;
    }

    public void setStreamType(String s)
    {
        mStreamType = s;
    }
}
