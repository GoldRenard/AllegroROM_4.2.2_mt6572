// Decompiled by Jad v1.5.8g. Copyright 2001 Pavel Kouznetsov.
// Jad home page: http://www.kpdus.com/jad.html
// Decompiler options: packimports(3) fieldsfirst noctor space 

package com.mtk.vtautoanswer;

import android.app.Activity;
import android.content.Context;
import android.content.SharedPreferences;
import android.os.Bundle;
import android.util.Log;
import android.view.Menu;
import android.view.MenuInflater;
import java.util.Timer;
import java.util.TimerTask;

public class VTAutoAnswerEnable extends Activity
{
    private class CustomTimerTask extends TimerTask
    {

        private Activity activity;
        final VTAutoAnswerEnable this$0;

        public void run()
        {
            activity.finish();
        }

        public CustomTimerTask(Activity activity1)
        {
            this$0 = VTAutoAnswerEnable.this;
            super();
            activity = activity1;
        }
    }


    private static final String AUTO_ANSWER_FLAG = "auto_answer";
    private static final String AUTO_ANSWER_TIMER_FLAG = "auto_answer_time";
    private static final String SHREDPRE_NAME = "engineermode_vt_preferences";
    private static final String TAG = "VTAutoAnswerEnable";


    protected void onCreate(Bundle bundle)
    {
        super.onCreate(bundle);
        setContentView(0x7f030000);
        try
        {
            android.content.SharedPreferences.Editor editor = createPackageContext("com.mediatek.engineermode", 2).getSharedPreferences("engineermode_vt_preferences", 0).edit();
            editor.putBoolean("auto_answer", true);
            editor.putString("auto_answer_time", "1000");
            editor.commit();
        }
        catch (Exception exception)
        {
            Log.e("VTAutoAnswerEnable", (new StringBuilder()).append("Exception object: ").append(exception).toString());
        }
        (new Timer()).schedule(new CustomTimerTask(this), 2000L);
    }

    public boolean onCreateOptionsMenu(Menu menu)
    {
        getMenuInflater().inflate(0x7f060000, menu);
        return true;
    }
}
