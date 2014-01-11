// Decompiled by Jad v1.5.8g. Copyright 2001 Pavel Kouznetsov.
// Jad home page: http://www.kpdus.com/jad.html
// Decompiler options: packimports(3) fieldsfirst noctor space 

package com.mediatek.phone;

import android.app.Activity;
import android.content.Context;
import android.content.Intent;
import android.content.res.Resources;
import android.graphics.Color;
import android.net.Uri;
import android.os.Bundle;
import android.text.SpannableStringBuilder;
import android.text.TextUtils;
import android.text.style.ForegroundColorSpan;
import android.text.style.StyleSpan;
import android.util.Log;
import android.view.View;
import android.view.Window;
import android.widget.*;
import com.android.phone.PhoneGlobals;
import com.mediatek.text.style.BackgroundImageSpan;

public class VoicemailDialog extends Activity
    implements android.view.View.OnClickListener
{

    private static final int SLEEPTIME = 1500;
    private static final String TAG = "VoicemailDialog";
    private Intent mIntent;


    private long getSimId(int i)
    {
        android.provider.Telephony.SIMInfo siminfo = android.provider.Telephony.SIMInfo.getSIMInfoBySlot(PhoneGlobals.getInstance().getApplicationContext(), i);
        if (siminfo != null)
            return siminfo.mSimId;
        else
            return -1L;
    }

    public CharSequence getSimInfo(Context context, long l)
    {
        Log.d("VoicemailDialog", (new StringBuilder()).append("getSimInfo simId = ").append(l).toString());
        android.provider.Telephony.SIMInfo siminfo = android.provider.Telephony.SIMInfo.getSIMInfoById(context, l);
        if (siminfo != null)
        {
            String s = siminfo.mDisplayName;
            Log.d("VoicemailDialog", (new StringBuilder()).append("== SIMInfo simId=").append(siminfo.mSimId).append(" mDisplayName=").append(s).toString());
            String s1 = String.format(getBaseContext().getString(0x7f0d00a8), new Object[] {
                s
            });
            if (s == null)
            {
                return s1;
            } else
            {
                SpannableStringBuilder spannablestringbuilder = new SpannableStringBuilder(s1);
                int i = s1.indexOf(s);
                int j = i + s.length();
                int _tmp = siminfo.mSimBackgroundRes;
                android.graphics.drawable.Drawable drawable = context.getResources().getDrawable(siminfo.mSimBackgroundRes);
                spannablestringbuilder.setSpan(new BackgroundImageSpan(siminfo.mSimBackgroundRes, drawable), i, j, 33);
                spannablestringbuilder.setSpan(new ForegroundColorSpan(Color.parseColor("#ffffffff")), i, j, 33);
                spannablestringbuilder.setSpan(new StyleSpan(1), i, j, 33);
                return spannablestringbuilder;
            }
        } else
        {
            return String.format(getBaseContext().getString(0x7f0d00a8), new Object[] {
                ""
            });
        }
    }

    public void onClick(View view)
    {
        switch (view.getId())
        {
        default:
            return;

        case 2131230985: 
            Log.d("VoicemailDialog", (new StringBuilder()).append("onClick() intent").append(mIntent).toString());
            String s = mIntent.getStringExtra("voicemail_number");
            Log.d("VoicemailDialog", (new StringBuilder()).append("onClick() number").append(s).toString());
            startActivity(new Intent("android.intent.action.DIAL", Uri.fromParts("voicemail", s, null)));
            try
            {
                Thread.sleep(1500L);
            }
            catch (InterruptedException interruptedexception)
            {
                Log.d("VoicemailDialog", "onClick() InterruptedException");
            }
            if (TextUtils.isEmpty(s))
            {
                String s1 = getResources().getString(0x7f0d02ce);
                Toast.makeText(PhoneGlobals.getInstance(), s1, 1).show();
            }
            finish();
            return;

        case 2131230986: 
            finish();
            return;
        }
    }

    protected void onCreate(Bundle bundle)
    {
        super.onCreate(bundle);
        requestWindowFeature(1);
        setContentView(0x7f04003e);
        ((ImageView)findViewById(0x7f0800b2)).setImageResource(0x7f0200b3);
        ((TextView)findViewById(0x7f0800ae)).setText(0x7f0d001a);
        TextView textview = (TextView)getWindow().findViewById(0x7f080107);
        Button button = (Button)findViewById(0x7f080109);
        Button button1 = (Button)findViewById(0x7f08010a);
        mIntent = getIntent();
        int i = mIntent.getIntExtra("simId", -1);
        Log.d("VoicemailDialog", (new StringBuilder()).append("==============================================get slotId = ").append(i).toString());
        CharSequence charsequence = null;
        if (i > -1)
        {
            long l = getSimId(i);
            Log.d("VoicemailDialog", (new StringBuilder()).append("==============================================get simId = ").append(l).toString());
            charsequence = getSimInfo(PhoneGlobals.getInstance().getApplicationContext(), l);
            Log.d("VoicemailDialog", (new StringBuilder()).append("==============================================get simName = ").append(charsequence).toString());
        }
        textview.setText(charsequence);
        button.setOnClickListener(this);
        button1.setOnClickListener(this);
    }
}
