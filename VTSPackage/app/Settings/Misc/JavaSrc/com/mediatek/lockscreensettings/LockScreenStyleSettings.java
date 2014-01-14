// Decompiled by Jad v1.5.8g. Copyright 2001 Pavel Kouznetsov.
// Jad home page: http://www.kpdus.com/jad.html
// Decompiler options: packimports(3) fieldsfirst noctor space 

package com.mediatek.lockscreensettings;

import android.app.Activity;
import android.content.*;
import android.content.pm.PackageManager;
import android.content.pm.Signature;
import android.content.res.Resources;
import android.graphics.Bitmap;
import android.graphics.BitmapFactory;
import android.net.Uri;
import android.os.Bundle;
import android.view.*;
import android.widget.*;
import com.mediatek.common.policy.IKeyguardLayer;
import com.mediatek.common.policy.KeyguardLayerInfo;
import com.mediatek.pluginmanager.Plugin;
import com.mediatek.pluginmanager.PluginManager;
import com.mediatek.xlog.Xlog;
import java.util.*;

// Referenced classes of package com.mediatek.lockscreensettings:
//            ReflectionDecorAdapter

public class LockScreenStyleSettings extends Activity
    implements android.view.View.OnClickListener, android.widget.AdapterView.OnItemSelectedListener
{
    private class KeyguardLayerAdapter extends ReflectionDecorAdapter
    {

        private ArrayList mLayerList;
        private LayoutInflater mLayoutInflater;
        final LockScreenStyleSettings this$0;

        public int getContainerId()
        {
            return 0x7f0800bb;
        }

        public Bitmap getContentAt(int i)
        {
            return getBitmapFromPackage(((KeyguardLayerInfo)mLayerList.get(i)).layerPackage, ((KeyguardLayerInfo)mLayerList.get(i)).previewResId);
        }

        public int getCount()
        {
            return mLayerList.size();
        }

        public Object getItem(int i)
        {
            return mLayerList.get(i);
        }

        public long getItemId(int i)
        {
            return (long)i;
        }

        public View getViewInner(int i, View view, ViewGroup viewgroup)
        {
            if (view == null)
            {
                ViewHolder viewholder = new ViewHolder();
                View view1 = mLayoutInflater.inflate(0x7f040042, viewgroup, false);
                viewholder.mPreviewView = (ImageView)view1.findViewById(0x7f0800bb);
                view1.setTag(viewholder);
                return view1;
            } else
            {
                ViewHolder _tmp = (ViewHolder)view.getTag();
                return view;
            }
        }

        KeyguardLayerAdapter(Context context, ArrayList arraylist)
        {
            this$0 = LockScreenStyleSettings.this;
            super(context);
            mLayoutInflater = LayoutInflater.from(context);
            mLayerList = arraylist;
        }
    }

    private static class ViewHolder
    {

        ImageView mPreviewView;

        private ViewHolder()
        {
        }

    }


    private static final String CONTACT_STRING = "&";
    public static final String CURRENT_KEYGURAD_LAYER_KEY = "mtk_current_keyguard_layer";
    private static final boolean DBG = true;
    private static final int MAX_ZOOM_OUT = 120;
    private static final int REQUEST_CONFIG_KEYGUARD_LAYER = 1;
    private static final String TAG = "LockScreenStyleSettings";
    private Button mBtnApply;
    private BounceCoverFlow mCoverFlow;
    private TextView mCurrentLayerDesc;
    private int mCurrentLayerIndex;
    private TextView mCurrentLayerName;
    private String mCurrentSuffix;
    private KeyguardLayerInfo mDefaultKeyguardLayer;
    private KeyguardLayerAdapter mKeyguardLayerAdapter;
    private ArrayList mKeyguardLayers;
    private final BroadcastReceiver mPackageActionReceiver = new BroadcastReceiver() {

        final LockScreenStyleSettings this$0;

        public void onReceive(Context context, Intent intent)
        {
            String s = intent.getAction();
            if ("android.intent.action.PACKAGE_CHANGED".equals(s) || "android.intent.action.PACKAGE_REMOVED".equals(s))
            {
                String s1 = intent.getData().getSchemeSpecificPart();
                boolean flag = intent.getBooleanExtra("android.intent.extra.REPLACING", false);
                Xlog.d("LockScreenStyleSettings", (new StringBuilder()).append("onReceive: action = ").append(s).append(",packageName = ").append(s1).append(",replacing = ").append(flag).toString());
                if (isKeyguardLayerProvider(s1))
                    loadKeyguardLayers();
            }
        }

            
            {
                this$0 = LockScreenStyleSettings.this;
                super();
            }
    }
;
    private PackageManager mPackageManager;
    private int mPreviewHeight;
    private int mPreviewWidth;
    private ContentResolver mResolver;
    private int mSelectedPosition;

    public LockScreenStyleSettings()
    {
        mKeyguardLayers = new ArrayList();
    }

    private void addPluginKeyguardLayers()
    {
        PluginManager pluginmanager;
        int i;
        pluginmanager = PluginManager.create(this, com/mediatek/common/policy/IKeyguardLayer.getName(), new Signature[0]);
        i = pluginmanager.getPluginCount();
        Xlog.d("LockScreenStyleSettings", (new StringBuilder()).append("getKeyguardLayers: pluginCount = ").append(i).toString());
        if (i == 0) goto _L2; else goto _L1
_L1:
        int j = 0;
_L3:
        if (j >= i)
            break; /* Loop/switch isn't completed */
        KeyguardLayerInfo keyguardlayerinfo;
        IKeyguardLayer ikeyguardlayer = (IKeyguardLayer)pluginmanager.getPlugin(j).createObject();
        keyguardlayerinfo = ikeyguardlayer.getKeyguardLayerInfo();
        Xlog.d("LockScreenStyleSettings", (new StringBuilder()).append("getKeyguardLayers: i = ").append(j).append(",keyguardLayer = ").append(ikeyguardlayer).append(",info = ").append(keyguardlayerinfo).toString());
        if (keyguardlayerinfo == null)
            break MISSING_BLOCK_LABEL_145;
        mKeyguardLayers.add(keyguardlayerinfo);
        j++;
        if (true) goto _L3; else goto _L2
        Exception exception;
        exception;
        Xlog.e("LockScreenStyleSettings", (new StringBuilder()).append("getPluginKeyguardLayers exception happens: e = ").append(exception.getMessage()).toString());
_L2:
    }

    private String generateCombinedIdentString(int i)
    {
        return (new StringBuilder()).append(((KeyguardLayerInfo)mKeyguardLayers.get(i)).layerPackage).append("&").append(String.valueOf(((KeyguardLayerInfo)mKeyguardLayers.get(i)).nameResId)).toString();
    }

    private KeyguardLayerInfo generateDefaultLayer()
    {
        KeyguardLayerInfo keyguardlayerinfo = new KeyguardLayerInfo();
        keyguardlayerinfo.layerPackage = getPackageName();
        keyguardlayerinfo.nameResId = 0x7f0b00c3;
        keyguardlayerinfo.descResId = 0x7f0b01c0;
        keyguardlayerinfo.previewResId = 0x7f0200ca;
        return keyguardlayerinfo;
    }

    private Bitmap getBitmapFromPackage(String s, int i)
    {
        Resources resources1 = mPackageManager.getResourcesForApplication(s);
        Resources resources = resources1;
_L2:
        Bitmap bitmap = null;
        if (resources != null)
            bitmap = BitmapFactory.decodeResource(resources, i);
        return bitmap;
        android.content.pm.PackageManager.NameNotFoundException namenotfoundexception;
        namenotfoundexception;
        Xlog.w("LockScreenStyleSettings", (new StringBuilder()).append("getBitmapFromPackage can not find pakcage: ").append(s).toString());
        resources = null;
        if (true) goto _L2; else goto _L1
_L1:
    }

    private int getCurrentLayerIndex()
    {
        String s;
        int i;
        s = android.provider.Settings.System.getString(mResolver, "mtk_current_keyguard_layer");
        Xlog.d("LockScreenStyleSettings", (new StringBuilder()).append("getCurrentLayer: combinedLayerStr = ").append(s).append(",mCurrentLayerPosition = ").append(mCurrentLayerIndex).toString());
        i = -1;
        if (s == null) goto _L2; else goto _L1
_L1:
        String s1 = (new StringTokenizer(s, "&")).nextToken();
        if (s1 == null) goto _L2; else goto _L3
_L3:
        int j;
        int k;
        j = 0;
        k = mKeyguardLayers.size();
_L8:
        if (j >= k) goto _L2; else goto _L4
_L4:
        Xlog.d("LockScreenStyleSettings", (new StringBuilder()).append("getCurrentLayer: i = ").append(j).append(", packageName = ").append(s1).append(",layerPackage = ").append(((KeyguardLayerInfo)mKeyguardLayers.get(j)).layerPackage).toString());
        if (!s1.equals(((KeyguardLayerInfo)mKeyguardLayers.get(j)).layerPackage)) goto _L6; else goto _L5
_L5:
        i = j;
_L2:
        return i;
_L6:
        j++;
        if (true) goto _L8; else goto _L7
_L7:
    }

    private String getStringFromPackage(String s, int i)
    {
        Resources resources1 = mPackageManager.getResourcesForApplication(s);
        Resources resources = resources1;
_L2:
        String s1 = null;
        if (resources != null)
            s1 = resources.getString(i);
        return s1;
        android.content.pm.PackageManager.NameNotFoundException namenotfoundexception;
        namenotfoundexception;
        Xlog.w("LockScreenStyleSettings", (new StringBuilder()).append("getStringFromPackage can not find pakcage: ").append(s).toString());
        resources = null;
        if (true) goto _L2; else goto _L1
_L1:
    }

    private void initViews()
    {
        mCurrentLayerName = (TextView)findViewById(0x7f0800bc);
        mCurrentLayerDesc = (TextView)findViewById(0x7f0800be);
        mBtnApply = (Button)findViewById(0x7f0800bf);
        mBtnApply.setOnClickListener(this);
        mCoverFlow = (BounceCoverFlow)findViewById(0x7f0800bd);
        mCoverFlow.setCallbackDuringFling(false);
        mCoverFlow.setMaxZoomOut(120F);
        mCoverFlow.setSelection(mCurrentLayerIndex);
        mCoverFlow.setOnItemSelectedListener(this);
    }

    private boolean isKeyguardLayerProvider(String s)
    {
        for (Iterator iterator = mKeyguardLayers.iterator(); iterator.hasNext();)
            if (s.equals(((KeyguardLayerInfo)iterator.next()).layerPackage))
                return true;

        return false;
    }

    private void loadKeyguardLayers()
    {
        mKeyguardLayers.clear();
        mDefaultKeyguardLayer = generateDefaultLayer();
        mKeyguardLayers.add(mDefaultKeyguardLayer);
        addPluginKeyguardLayers();
        int i = getCurrentLayerIndex();
        if (i < 0)
            saveCurrentLayer(0);
        else
            mCurrentLayerIndex = i;
        if (mKeyguardLayerAdapter != null)
            mKeyguardLayerAdapter.clearBitmapCache();
        mKeyguardLayerAdapter = new KeyguardLayerAdapter(this, mKeyguardLayers);
        mKeyguardLayerAdapter.setImageDispSize(mPreviewWidth, mPreviewHeight);
        mKeyguardLayerAdapter.setIndicatorBitmapResource(0x7f02005e);
        mKeyguardLayerAdapter.setChosenItem(mCurrentLayerIndex);
        mCoverFlow.setAdapter(mKeyguardLayerAdapter);
        mCoverFlow.setSelection(mCurrentLayerIndex);
    }

    private void saveCurrentLayer(int i)
    {
        Xlog.d("LockScreenStyleSettings", (new StringBuilder()).append("saveCurrentLayer: mCurrentLayerIndex = ").append(mCurrentLayerIndex).append(",index = ").append(i).toString());
        if (mCurrentLayerIndex != i)
        {
            mCurrentLayerIndex = i;
            String s = generateCombinedIdentString(i);
            android.provider.Settings.System.putString(mResolver, "mtk_current_keyguard_layer", s);
        }
    }

    private void setLockScreen(int i)
    {
        Intent intent = ((KeyguardLayerInfo)mKeyguardLayers.get(i)).configIntent;
        if (intent != null)
        {
            startActivityForResult(intent, 1);
            return;
        } else
        {
            saveCurrentLayer(i);
            finish();
            return;
        }
    }

    protected void onActivityResult(int i, int j, Intent intent)
    {
        Xlog.d("LockScreenStyleSettings", (new StringBuilder()).append("onActivityResult: requestCode = ").append(i).append(",resultCode = ").append(j).append(",data = ").append(intent).append(",mSelectedPosition = ").append(mSelectedPosition).toString());
        if (j == -1 && i == 1)
        {
            saveCurrentLayer(mSelectedPosition);
            finish();
        }
    }

    public void onClick(View view)
    {
        if (view.getId() == mBtnApply.getId())
            setLockScreen(mSelectedPosition);
    }

    public void onCreate(Bundle bundle)
    {
        super.onCreate(bundle);
        setContentView(0x7f040043);
        mPackageManager = getPackageManager();
        mResolver = getContentResolver();
        mPreviewWidth = (int)getResources().getDimension(0x7f0d0022);
        mPreviewHeight = (int)getResources().getDimension(0x7f0d0023);
        mCurrentSuffix = getResources().getString(0x7f0b01be);
        Xlog.d("LockScreenStyleSettings", (new StringBuilder()).append("onCreate: mPreviewWidth = ").append(mPreviewWidth).append(",mPreviewHeight = ").append(mPreviewHeight).append(",mCurrentSuffix = ").append(mCurrentSuffix).toString());
        initViews();
        loadKeyguardLayers();
        IntentFilter intentfilter = new IntentFilter();
        intentfilter.addAction("android.intent.action.PACKAGE_CHANGED");
        intentfilter.addAction("android.intent.action.PACKAGE_REMOVED");
        registerReceiver(mPackageActionReceiver, intentfilter);
    }

    public void onDestroy()
    {
        if (mKeyguardLayerAdapter != null)
        {
            mKeyguardLayerAdapter.clearBitmapCache();
            mKeyguardLayerAdapter = null;
        }
        unregisterReceiver(mPackageActionReceiver);
        super.onDestroy();
    }

    public void onItemSelected(AdapterView adapterview, View view, int i, long l)
    {
        Xlog.d("LockScreenStyleSettings", (new StringBuilder()).append("onItemSelected: position = ").append(i).append(",mSelectedPosition = ").append(mSelectedPosition).append(",mCurrentSuffix = ").append(mCurrentSuffix).toString());
        mSelectedPosition = i;
        KeyguardLayerInfo keyguardlayerinfo = (KeyguardLayerInfo)mKeyguardLayers.get(i);
        if (mSelectedPosition == mCurrentLayerIndex)
            mCurrentLayerName.setText((new StringBuilder()).append(getStringFromPackage(keyguardlayerinfo.layerPackage, keyguardlayerinfo.nameResId)).append(mCurrentSuffix).toString());
        else
            mCurrentLayerName.setText(getStringFromPackage(keyguardlayerinfo.layerPackage, keyguardlayerinfo.nameResId));
        mCurrentLayerDesc.setText(getStringFromPackage(keyguardlayerinfo.layerPackage, keyguardlayerinfo.descResId));
    }

    public void onNothingSelected(AdapterView adapterview)
    {
    }



}
