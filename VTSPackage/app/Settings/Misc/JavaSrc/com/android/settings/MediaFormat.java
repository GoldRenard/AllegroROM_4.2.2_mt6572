// Decompiled by Jad v1.5.8g. Copyright 2001 Pavel Kouznetsov.
// Jad home page: http://www.kpdus.com/jad.html
// Decompiler options: packimports(3) fieldsfirst noctor space 

package com.android.settings;

import android.app.Activity;
import android.content.ContentResolver;
import android.content.Intent;
import android.database.Cursor;
import android.os.Bundle;
import android.os.storage.StorageVolume;
import android.provider.MediaStore;
import android.util.Log;
import android.view.LayoutInflater;
import android.view.View;
import android.widget.*;
import com.android.internal.os.storage.ExternalStorageFormatter;
import com.mediatek.xlog.Xlog;
import java.util.Locale;

// Referenced classes of package com.android.settings:
//            ChooseLockSettingsHelper, Utils

public class MediaFormat extends Activity
{

    private static final int KEYGUARD_REQUEST = 55;
    private static final String MTP_PROJECTION[] = {
        "mtp_transfer_file_path"
    };
    private static final String TAG = "MediaFormat";
    private ContentResolver mContentResolver;
    private Button mFinalButton;
    private android.view.View.OnClickListener mFinalClickListener;
    private View mFinalView;
    private LayoutInflater mInflater;
    private View mInitialView;
    private Button mInitiateButton;
    private android.view.View.OnClickListener mInitiateListener;
    private boolean mIsInternalSD;
    private boolean mIsUsbStorage;
    private StorageVolume mStorageVolume;
    private String mVolumeDescription;
    private String mVolumePath;

    public MediaFormat()
    {
        mFinalClickListener = new android.view.View.OnClickListener() {

            final MediaFormat this$0;

            public void onClick(View view)
            {
                if (Utils.isMonkeyRunning())
                    return;
                if (getMtpStatus())
                {
                    Toast.makeText(MediaFormat.this, getVolumeString(0x7f0b000c), 0).show();
                    finish();
                    return;
                } else
                {
                    Intent intent = new Intent("com.android.internal.os.storage.FORMAT_ONLY");
                    intent.setComponent(ExternalStorageFormatter.COMPONENT_NAME);
                    intent.putExtra("storage_volume", mStorageVolume);
                    startService(intent);
                    finish();
                    return;
                }
            }

            
            {
                this$0 = MediaFormat.this;
                super();
            }
        }
;
        mInitiateListener = new android.view.View.OnClickListener() {

            final MediaFormat this$0;

            public void onClick(View view)
            {
                if (getMtpStatus())
                {
                    Toast.makeText(MediaFormat.this, getVolumeString(0x7f0b000c), 0).show();
                    finish();
                } else
                if (!runKeyguardConfirmation(55))
                {
                    establishFinalConfirmationState();
                    return;
                }
            }

            
            {
                this$0 = MediaFormat.this;
                super();
            }
        }
;
    }

    private void establishFinalConfirmationState()
    {
        if (mFinalView == null)
        {
            mFinalView = mInflater.inflate(0x7f04004c, null);
            ((TextView)mFinalView.findViewById(0x7f0800d7)).setText(getVolumeString(0x7f0b05c6));
            mFinalButton = (Button)mFinalView.findViewById(0x7f0800d8);
            mFinalButton.setText(0x7f0b05c7);
            mFinalButton.setOnClickListener(mFinalClickListener);
        }
        setContentView(mFinalView);
    }

    private void establishInitialState()
    {
        if (mInitialView == null)
        {
            mInitialView = mInflater.inflate(0x7f04004d, null);
            ((TextView)mInitialView.findViewById(0x7f0800d9)).setText(getVolumeString(0x7f0b05c4));
            mInitiateButton = (Button)mInitialView.findViewById(0x7f0800da);
            mInitiateButton.setText(getVolumeString(0x7f0b05c5));
            mInitiateButton.setOnClickListener(mInitiateListener);
        }
        setContentView(mInitialView);
    }

    private String getMtpPath()
    {
        Cursor cursor = null;
        cursor = mContentResolver.query(MediaStore.getMtpTransferFileUri(), MTP_PROJECTION, null, null, null);
        String s = null;
        if (cursor == null) goto _L2; else goto _L1
_L1:
        if (cursor.getCount() != 0 && cursor.getCount() <= 1) goto _L4; else goto _L3
_L3:
        Log.w("MediaFormat", "no record or more than one record");
        s = "ERROR";
_L2:
        if (cursor != null)
            cursor.close();
        return s;
_L4:
        String s1;
        cursor.moveToFirst();
        s1 = cursor.getString(0);
        s = s1;
          goto _L2
        Exception exception;
        exception;
        if (cursor != null)
            cursor.close();
        throw exception;
    }

    private boolean getMtpStatus()
    {
        String s = getMtpPath();
        Log.d("MediaFormat", (new StringBuilder()).append("Mtp transfer path").append(s).toString());
        return s != null && !s.equals("ERROR") && s.contains((new StringBuilder()).append(mVolumePath).append("/").toString());
    }

    private String getVolumeString(int i)
    {
        String s;
        if (mVolumeDescription != null && (mIsInternalSD || mIsUsbStorage))
        {
            String s1 = getString(0x7f0b029a);
            Xlog.d("MediaFormat", (new StringBuilder()).append("sdCardString=").append(s1).toString());
            s = getString(i).replace(s1, mVolumeDescription);
            if (s != null && s.equals(getString(i)))
            {
                String s2 = s1.toLowerCase().replace("sd", "SD");
                Xlog.d("MediaFormat", (new StringBuilder()).append("sdCardString").append(s2).toString());
                s = getString(i).replace(s2, mVolumeDescription);
                Xlog.d("MediaFormat", (new StringBuilder()).append("str").append(s).toString());
            }
            if (s != null && s.equals(getString(i)))
            {
                s = getString(i).replace("SD", mVolumeDescription);
                Xlog.d("MediaFormat", (new StringBuilder()).append("Can not replace SD card, Replace SD, str is ").append(s).toString());
            }
            Locale locale = Locale.getDefault();
            if (locale.getCountry().equals(Locale.CHINA.getCountry()) || locale.getCountry().equals(Locale.TAIWAN.getCountry()))
                return s.replace((new StringBuilder()).append(" ").append(mVolumeDescription).toString(), mVolumeDescription);
        } else
        {
            Xlog.d("MediaFormat", "+mVolumeDescription is null or external sd card, use default string");
            s = getString(i);
        }
        return s;
    }

    private boolean runKeyguardConfirmation(int i)
    {
        return (new ChooseLockSettingsHelper(this)).launchConfirmationActivity(i, getText(0x7f0b05c8), getVolumeString(0x7f0b05c9));
    }

    protected void onActivityResult(int i, int j, Intent intent)
    {
        super.onActivityResult(i, j, intent);
        if (i != 55)
            return;
        if (j == -1)
        {
            establishFinalConfirmationState();
            return;
        }
        if (j == 0)
        {
            finish();
            return;
        } else
        {
            establishInitialState();
            return;
        }
    }

    protected void onCreate(Bundle bundle)
    {
        super.onCreate(bundle);
        mInitialView = null;
        mFinalView = null;
        mInflater = LayoutInflater.from(this);
        new Bundle();
        Bundle bundle1 = getIntent().getExtras();
        if (bundle1 != null)
        {
            mStorageVolume = (StorageVolume)bundle1.getParcelable("volume");
            mIsUsbStorage = bundle1.getBoolean("IsUsbStorage");
        }
        if (mStorageVolume != null)
        {
            mVolumeDescription = mStorageVolume.getDescription(this);
            mVolumePath = mStorageVolume.getPath();
            boolean flag;
            if (!mStorageVolume.isRemovable())
                flag = true;
            else
                flag = false;
            mIsInternalSD = flag;
        }
        mContentResolver = getContentResolver();
        setTitle(getVolumeString(0x7f0b05c2));
        establishInitialState();
    }

    public void onPause()
    {
        super.onPause();
        if (!isFinishing())
            establishInitialState();
    }






}
