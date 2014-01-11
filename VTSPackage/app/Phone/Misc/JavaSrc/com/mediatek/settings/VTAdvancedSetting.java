// Decompiled by Jad v1.5.8g. Copyright 2001 Pavel Kouznetsov.
// Jad home page: http://www.kpdus.com/jad.html
// Decompiler options: packimports(3) fieldsfirst noctor space 

package com.mediatek.settings;

import android.app.ActionBar;
import android.app.AlertDialog;
import android.content.*;
import android.content.res.Resources;
import android.graphics.Bitmap;
import android.graphics.BitmapFactory;
import android.os.Bundle;
import android.preference.*;
import android.view.MenuItem;
import android.widget.ImageView;
import android.widget.LinearLayout;
import com.android.phone.GsmUmtsAdditionalCallOptions;
import com.android.phone.GsmUmtsCallForwardOptions;
import com.mediatek.phone.vt.VTCallUtils;
import com.mediatek.xlog.Xlog;
import java.io.IOException;
import java.util.List;

// Referenced classes of package com.mediatek.settings:
//            CallSettings, PreCheckForRunning, CallBarring

public class VTAdvancedSetting extends PreferenceActivity
    implements android.preference.Preference.OnPreferenceChangeListener
{

    private static final String BUTTON_VT_AUTO_DROPBACK_KEY = "button_vt_auto_dropback_key";
    private static final String BUTTON_VT_CB_KEY = "button_cb_expand_key";
    private static final String BUTTON_VT_CF_KEY = "button_cf_expand_key";
    private static final String BUTTON_VT_ENABLE_BACK_CAMERA_KEY = "button_vt_enable_back_camera_key";
    private static final String BUTTON_VT_ENABLE_PEER_REPLACE_KEY = "button_vt_enable_peer_replace_key";
    private static final String BUTTON_VT_MORE_KEY = "button_more_expand_key";
    private static final String BUTTON_VT_MO_LOCAL_VIDEO_DISPLAY_KEY = "button_vt_mo_local_video_display_key";
    private static final String BUTTON_VT_MT_LOCAL_VIDEO_DISPLAY_KEY = "button_vt_mt_local_video_display_key";
    private static final String BUTTON_VT_PEER_BIGGER_KEY = "button_vt_peer_bigger_key";
    private static final String BUTTON_VT_PEER_REPLACE_KEY = "button_vt_replace_peer_expand_key";
    private static final String BUTTON_VT_REPLACE_KEY = "button_vt_replace_expand_key";
    private static final String CHECKBOX_RING_ONLY_ONCE = "ring_only_once";
    private static final boolean DBG = true;
    private static final String LOG_TAG = "Settings/VTAdvancedSetting";
    public static final String NAME_PIC_TO_REPLACE_LOCAL_VIDEO_DEFAULT = "pic_to_replace_local_video_default";
    public static final String NAME_PIC_TO_REPLACE_LOCAL_VIDEO_USERSELECT = "pic_to_replace_local_video_userselect";
    public static final String NAME_PIC_TO_REPLACE_PEER_VIDEO_DEFAULT = "pic_to_replace_peer_video_default";
    public static final String NAME_PIC_TO_REPLACE_PEER_VIDEO_USERSELECT = "pic_to_replace_peer_video_userselect";
    public static final int REQUESTCODE_PICTRUE_PICKED_WITH_DATA = 3021;
    private static final String SELECT_DEFAULT_PICTURE = "0";
    public static final String SELECT_DEFAULT_PICTURE2 = "0";
    private static final String SELECT_MY_PICTURE = "2";
    public static final String SELECT_MY_PICTURE2 = "1";
    private Preference mButtonCb;
    private Preference mButtonCf;
    private Preference mButtonMore;
    private CheckBoxPreference mButtonVTAutoDropBack;
    private CheckBoxPreference mButtonVTEnablePeerReplace;
    private CheckBoxPreference mButtonVTEnablebackCamer;
    private CheckBoxPreference mButtonVTMoVideo;
    private ListPreference mButtonVTMtVideo;
    private CheckBoxPreference mButtonVTPeerBigger;
    private ListPreference mButtonVTPeerReplace;
    private ListPreference mButtonVTReplace;
    private CheckBoxPreference mCheckBoxRingOnlyOnce;
    private PreCheckForRunning mPreCfr;
    private final BroadcastReceiver mReceiver = new BroadcastReceiver() {

        final VTAdvancedSetting this$0;

        public void onReceive(Context context, Intent intent)
        {
            Xlog.d("Settings/VTAdvancedSetting", (new StringBuilder()).append("[action = ").append(intent.getAction()).append("]").toString());
            String s = intent.getAction();
            Xlog.d("Settings/VTAdvancedSetting", (new StringBuilder()).append("[action = ").append(s).append("]").toString());
            if ("android.intent.action.AIRPLANE_MODE".equals(s))
            {
                setScreenEnabled();
            } else
            {
                if ("android.intent.action.SIM_INDICATOR_STATE_CHANGED".equals(s))
                {
                    setScreenEnabled();
                    return;
                }
                if ("android.intent.action.SIM_INFO_UPDATE".equals(s))
                {
                    findSimId();
                    setScreenEnabled();
                    return;
                }
            }
        }

            
            {
                this$0 = VTAdvancedSetting.this;
                super();
            }
    }
;
    private int mSimId;
    private int mWhichToSave;

    public VTAdvancedSetting()
    {
        mWhichToSave = 0;
        mSimId = -1;
        mButtonCf = null;
        mButtonCb = null;
        mButtonMore = null;
        mPreCfr = null;
    }

    private void findSimId()
    {
        int ai[] = CallSettings.get3GSimCardSlots(this);
        if (ai.length == 0)
        {
            mSimId = -1;
            return;
        }
        if (ai.length == 1)
        {
            mSimId = ai[0];
            return;
        } else
        {
            finish();
            return;
        }
    }

    public static String getPicPathDefault()
    {
        return "/data/data/com.android.phone/pic_to_replace_local_video_default.vt";
    }

    public static String getPicPathDefault2()
    {
        return "/data/data/com.android.phone/pic_to_replace_peer_video_default.vt";
    }

    public static String getPicPathUserselect(int i)
    {
        return (new StringBuilder()).append("/data/data/com.android.phone/pic_to_replace_local_video_userselect_").append(i).append(".vt").toString();
    }

    public static String getPicPathUserselect2(int i)
    {
        return (new StringBuilder()).append("/data/data/com.android.phone/pic_to_replace_peer_video_userselect_").append(i).append(".vt").toString();
    }

    private void initVTSettings()
    {
        SharedPreferences sharedpreferences = PreferenceManager.getDefaultSharedPreferences(getApplicationContext());
        if (mButtonVTEnablePeerReplace != null)
        {
            String s7 = (new StringBuilder()).append(mButtonVTEnablePeerReplace.getKey()).append("_").append(mSimId).toString();
            mButtonVTEnablePeerReplace.setKey(s7);
            mButtonVTEnablePeerReplace.setChecked(sharedpreferences.getBoolean(s7, true));
        }
        if (mButtonVTMoVideo != null)
        {
            String s6 = (new StringBuilder()).append(mButtonVTMoVideo.getKey()).append("_").append(mSimId).toString();
            mButtonVTMoVideo.setKey(s6);
            mButtonVTMoVideo.setChecked(sharedpreferences.getBoolean(s6, true));
        }
        if (mButtonVTMtVideo != null)
        {
            String s5 = (new StringBuilder()).append(mButtonVTMtVideo.getKey()).append("_").append(mSimId).toString();
            mButtonVTMtVideo.setKey(s5);
            mButtonVTMtVideo.setValue(sharedpreferences.getString(s5, "0"));
        }
        if (mButtonVTEnablebackCamer != null)
        {
            String s4 = (new StringBuilder()).append(mButtonVTEnablebackCamer.getKey()).append("_").append(mSimId).toString();
            mButtonVTEnablebackCamer.setKey(s4);
            mButtonVTEnablebackCamer.setChecked(sharedpreferences.getBoolean(s4, true));
        }
        if (mButtonVTPeerBigger != null)
        {
            String s3 = (new StringBuilder()).append(mButtonVTPeerBigger.getKey()).append("_").append(mSimId).toString();
            mButtonVTPeerBigger.setKey(s3);
            mButtonVTPeerBigger.setChecked(sharedpreferences.getBoolean(s3, true));
        }
        if (mButtonVTAutoDropBack != null)
        {
            String s2 = (new StringBuilder()).append(mButtonVTAutoDropBack.getKey()).append("_").append(mSimId).toString();
            mButtonVTAutoDropBack.setKey(s2);
            mButtonVTAutoDropBack.setChecked(sharedpreferences.getBoolean(s2, false));
        }
        if (mButtonVTReplace != null)
        {
            String s1 = (new StringBuilder()).append(mButtonVTReplace.getKey()).append("_").append(mSimId).toString();
            mButtonVTReplace.setKey(s1);
            mButtonVTReplace.setValue(sharedpreferences.getString(s1, "0"));
        }
        if (mButtonVTPeerReplace != null)
        {
            String s = (new StringBuilder()).append(mButtonVTPeerReplace.getKey()).append("_").append(mSimId).toString();
            mButtonVTPeerReplace.setKey(s);
            mButtonVTPeerReplace.setValue(sharedpreferences.getString(s, "0"));
        }
    }

    private static void log(String s)
    {
        Xlog.d("Settings/VTAdvancedSetting", s);
    }

    private void setScreenEnabled()
    {
        boolean flag = true;
        int i;
        if (android.provider.Settings.System.getInt(getContentResolver(), "airplane_mode_on", -1) == flag)
            i = ((flag) ? 1 : 0);
        else
            i = 0;
        List list = android.provider.Telephony.SIMInfo.getInsertedSIMList(this);
        if (list.size() == 0)
        {
            CallSettings.goUpToTopLevelSetting(this);
            return;
        }
        if (list.size() == flag)
        {
            int j;
            if (i == 0 && CallSettings.isRadioOn(mSimId))
                j = ((flag) ? 1 : 0);
            else
                j = 0;
            boolean flag1;
            if (mSimId >= 0)
                flag1 = flag;
            else
                flag1 = false;
            mButtonVTReplace.setEnabled(flag1);
            mButtonVTPeerReplace.setEnabled(flag1);
            mButtonVTEnablePeerReplace.setEnabled(flag1);
            mButtonVTMoVideo.setEnabled(flag1);
            mButtonVTMtVideo.setEnabled(flag1);
            mButtonVTEnablebackCamer.setEnabled(flag1);
            mButtonVTPeerBigger.setEnabled(flag1);
            mButtonVTAutoDropBack.setEnabled(flag1);
            Preference preference = mButtonCf;
            boolean flag2;
            if (j != 0 && flag1)
                flag2 = flag;
            else
                flag2 = false;
            preference.setEnabled(flag2);
            Preference preference1 = mButtonCb;
            boolean flag3;
            if (j != 0 && flag1)
                flag3 = flag;
            else
                flag3 = false;
            preference1.setEnabled(flag3);
            Preference preference2 = mButtonMore;
            if (j == 0 || !flag1)
                flag = false;
            preference2.setEnabled(flag);
            return;
        } else
        {
            CallSettings.goUpToTopLevelSetting(this);
            return;
        }
    }

    private void showDialogDefaultPic(String s)
    {
        final ImageView mImg = new ImageView(this);
        final Bitmap mBitmap = BitmapFactory.decodeFile(s);
        mImg.setImageBitmap(mBitmap);
        LinearLayout linearlayout = new LinearLayout(this);
        linearlayout.addView(mImg, new android.view.ViewGroup.LayoutParams(-2, -2));
        linearlayout.setGravity(17);
        android.app.AlertDialog.Builder builder = new android.app.AlertDialog.Builder(this);
        builder.setView(linearlayout);
        builder.setTitle(0x7f0d002f);
        builder.setPositiveButton(0x104000a, new android.content.DialogInterface.OnClickListener() {

            final VTAdvancedSetting this$0;

            public void onClick(DialogInterface dialoginterface, int i)
            {
            }

            
            {
                this$0 = VTAdvancedSetting.this;
                super();
            }
        }
);
        AlertDialog alertdialog = builder.create();
        alertdialog.setOnDismissListener(new android.content.DialogInterface.OnDismissListener() {

            final VTAdvancedSetting this$0;
            final Bitmap val$mBitmap;
            final ImageView val$mImg;

            public void onDismiss(DialogInterface dialoginterface)
            {
                mImg.setImageBitmap(null);
                if (!mBitmap.isRecycled())
                    mBitmap.recycle();
            }

            
            {
                this$0 = VTAdvancedSetting.this;
                mImg = imageview;
                mBitmap = bitmap;
                super();
            }
        }
);
        alertdialog.show();
    }

    private void showDialogMyPic(String s)
    {
        final ImageView mImg2 = new ImageView(this);
        final Bitmap mBitmap2 = BitmapFactory.decodeFile(s);
        mImg2.setImageBitmap(mBitmap2);
        LinearLayout linearlayout = new LinearLayout(this);
        linearlayout.addView(mImg2, new android.view.ViewGroup.LayoutParams(-2, -2));
        linearlayout.setGravity(17);
        android.app.AlertDialog.Builder builder = new android.app.AlertDialog.Builder(this);
        builder.setView(linearlayout);
        builder.setTitle(0x7f0d0031);
        builder.setPositiveButton(0x7f0d003a, new android.content.DialogInterface.OnClickListener() {

            final VTAdvancedSetting this$0;

            public void onClick(DialogInterface dialoginterface, int i)
            {
                try
                {
                    Intent intent = new Intent("android.intent.action.GET_CONTENT", null);
                    intent.setType("image/*");
                    intent.putExtra("crop", "true");
                    intent.putExtra("aspectX", 1);
                    intent.putExtra("aspectY", 1);
                    intent.putExtra("outputX", getResources().getInteger(0x7f0b0004));
                    intent.putExtra("outputY", getResources().getInteger(0x7f0b0005));
                    intent.putExtra("return-data", true);
                    intent.putExtra("scaleUpIfNeeded", true);
                    startActivityForResult(intent, 3021);
                    return;
                }
                catch (ActivityNotFoundException activitynotfoundexception)
                {
                    VTAdvancedSetting.log("Pictrue not found , Gallery ActivityNotFoundException !");
                }
            }

            
            {
                this$0 = VTAdvancedSetting.this;
                super();
            }
        }
);
        builder.setNegativeButton(0x104000a, new android.content.DialogInterface.OnClickListener() {

            final VTAdvancedSetting this$0;

            public void onClick(DialogInterface dialoginterface, int i)
            {
            }

            
            {
                this$0 = VTAdvancedSetting.this;
                super();
            }
        }
);
        AlertDialog alertdialog = builder.create();
        alertdialog.setOnDismissListener(new android.content.DialogInterface.OnDismissListener() {

            final VTAdvancedSetting this$0;
            final Bitmap val$mBitmap2;
            final ImageView val$mImg2;

            public void onDismiss(DialogInterface dialoginterface)
            {
                mImg2.setImageBitmap(null);
                if (!mBitmap2.isRecycled())
                    mBitmap2.recycle();
            }

            
            {
                this$0 = VTAdvancedSetting.this;
                mImg2 = imageview;
                mBitmap2 = bitmap;
                super();
            }
        }
);
        alertdialog.show();
    }

    protected void onActivityResult(int i, int j, Intent intent)
    {
        log((new StringBuilder()).append("onActivityResult: requestCode = ").append(i).append(", resultCode = ").append(j).toString());
        if (j != -1)
            return;
        switch (i)
        {
        default:
            return;

        case 3021: 
            break;
        }
        Bitmap bitmap = (Bitmap)intent.getParcelableExtra("data");
        if (bitmap == null) goto _L2; else goto _L1
_L1:
        if (mWhichToSave != 0) goto _L4; else goto _L3
_L3:
        VTCallUtils.saveMyBitmap(getPicPathUserselect(mSimId), bitmap);
_L5:
        bitmap.recycle();
        log((new StringBuilder()).append(" - Bitmap.isRecycled() : ").append(bitmap.isRecycled()).toString());
_L2:
        IOException ioexception;
        if (mWhichToSave == 0)
        {
            showDialogMyPic(getPicPathUserselect(mSimId));
            return;
        } else
        {
            showDialogMyPic(getPicPathUserselect2(mSimId));
            return;
        }
_L4:
        VTCallUtils.saveMyBitmap(getPicPathUserselect2(mSimId), bitmap);
          goto _L5
        ioexception;
        ioexception.printStackTrace();
          goto _L2
    }

    protected void onCreate(Bundle bundle)
    {
        super.onCreate(bundle);
        addPreferencesFromResource(0x7f060023);
        mPreCfr = new PreCheckForRunning(this);
        mButtonVTReplace = (ListPreference)findPreference("button_vt_replace_expand_key");
        mButtonVTReplace.setOnPreferenceChangeListener(this);
        mButtonVTPeerReplace = (ListPreference)findPreference("button_vt_replace_peer_expand_key");
        mButtonVTPeerReplace.setOnPreferenceChangeListener(this);
        mButtonCf = findPreference("button_cf_expand_key");
        mButtonCb = findPreference("button_cb_expand_key");
        mButtonMore = findPreference("button_more_expand_key");
        mButtonVTEnablePeerReplace = (CheckBoxPreference)findPreference("button_vt_enable_peer_replace_key");
        mButtonVTEnablePeerReplace.setOnPreferenceChangeListener(this);
        mButtonVTMoVideo = (CheckBoxPreference)findPreference("button_vt_mo_local_video_display_key");
        mButtonVTMoVideo.setOnPreferenceChangeListener(this);
        mButtonVTMtVideo = (ListPreference)findPreference("button_vt_mt_local_video_display_key");
        mButtonVTMtVideo.setOnPreferenceChangeListener(this);
        mButtonVTEnablebackCamer = (CheckBoxPreference)findPreference("button_vt_enable_back_camera_key");
        mButtonVTEnablebackCamer.setOnPreferenceChangeListener(this);
        mButtonVTPeerBigger = (CheckBoxPreference)findPreference("button_vt_peer_bigger_key");
        mButtonVTPeerBigger.setOnPreferenceChangeListener(this);
        mButtonVTAutoDropBack = (CheckBoxPreference)findPreference("button_vt_auto_dropback_key");
        mButtonVTAutoDropBack.setOnPreferenceChangeListener(this);
        mCheckBoxRingOnlyOnce = (CheckBoxPreference)findPreference("ring_only_once");
        Xlog.d("Settings/VTAdvancedSetting", "FeatureOption.MTK_VT3G324M_SUPPORT=falseFeatureOption.MTK_PHONE_VT_VOICE_ANSWER=false");
        getPreferenceScreen().removePreference(mCheckBoxRingOnlyOnce);
        findSimId();
        initVTSettings();
        ActionBar actionbar = getActionBar();
        if (actionbar != null)
            actionbar.setDisplayHomeAsUpEnabled(true);
        IntentFilter intentfilter = new IntentFilter("android.intent.action.AIRPLANE_MODE");
        intentfilter.addAction("android.intent.action.SIM_INDICATOR_STATE_CHANGED");
        intentfilter.addAction("android.intent.action.SIM_INFO_UPDATE");
        registerReceiver(mReceiver, intentfilter);
    }

    protected void onDestroy()
    {
        super.onDestroy();
        if (mPreCfr != null)
            mPreCfr.deRegister();
        unregisterReceiver(mReceiver);
    }

    public boolean onOptionsItemSelected(MenuItem menuitem)
    {
        switch (menuitem.getItemId())
        {
        case 16908332: 
            finish();
            return true;
        }
        return super.onOptionsItemSelected(menuitem);
    }

    public boolean onPreferenceChange(Preference preference, Object obj)
    {
        Xlog.d("Settings/VTAdvancedSetting", (new StringBuilder()).append("[mSimId = ").append(mSimId).append("]").toString());
        Xlog.d("Settings/VTAdvancedSetting", (new StringBuilder()).append("[objValue = ").append(obj).append("]").toString());
        Xlog.d("Settings/VTAdvancedSetting", (new StringBuilder()).append("[key = ").append(preference.getKey()).append("]").toString());
        if (preference == mButtonVTReplace)
        {
            VTCallUtils.checkVTFile(mSimId);
            mWhichToSave = 0;
            if (obj.toString().equals("0"))
            {
                log(" Picture for replacing local video -- selected DEFAULT PICTURE");
                showDialogDefaultPic(getPicPathDefault());
            } else
            if (obj.toString().equals("2"))
            {
                log(" Picture for replacing local video -- selected MY PICTURE");
                showDialogMyPic(getPicPathUserselect(mSimId));
                return true;
            }
        } else
        if (preference == mButtonVTPeerReplace)
        {
            VTCallUtils.checkVTFile(mSimId);
            mWhichToSave = 1;
            if (obj.toString().equals("0"))
            {
                log(" Picture for replacing peer video -- selected DEFAULT PICTURE");
                showDialogDefaultPic(getPicPathDefault2());
                return true;
            }
            if (obj.toString().equals("1"))
            {
                log(" Picture for replacing peer video -- selected MY PICTURE");
                showDialogMyPic(getPicPathUserselect2(mSimId));
                return true;
            }
        }
        return true;
    }

    public boolean onPreferenceTreeClick(PreferenceScreen preferencescreen, Preference preference)
    {
        if (preference == mButtonCf)
        {
            Intent intent2 = new Intent(this, com/android/phone/GsmUmtsCallForwardOptions);
            intent2.putExtra("simId", mSimId);
            intent2.putExtra("ISVT", true);
            mPreCfr.checkToRun(intent2, mSimId, 302);
            return true;
        }
        if (preference == mButtonCb)
        {
            Intent intent1 = new Intent(this, com/mediatek/settings/CallBarring);
            intent1.putExtra("simId", mSimId);
            intent1.putExtra("ISVT", true);
            mPreCfr.checkToRun(intent1, mSimId, 302);
            return true;
        }
        if (preference == mButtonMore)
        {
            Intent intent = new Intent(this, com/android/phone/GsmUmtsAdditionalCallOptions);
            intent.putExtra("simId", mSimId);
            intent.putExtra("ISVT", true);
            mPreCfr.checkToRun(intent, mSimId, 302);
            return true;
        } else
        {
            return false;
        }
    }

    public void onResume()
    {
        super.onResume();
        setScreenEnabled();
    }



}
