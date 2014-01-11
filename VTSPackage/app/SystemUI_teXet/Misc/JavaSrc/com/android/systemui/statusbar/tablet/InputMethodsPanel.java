// Decompiled by Jad v1.5.8g. Copyright 2001 Pavel Kouznetsov.
// Jad home page: http://www.kpdus.com/jad.html
// Decompiler options: packimports(3) fieldsfirst noctor space 

package com.android.systemui.statusbar.tablet;

import android.content.*;
import android.content.pm.*;
import android.content.res.Configuration;
import android.content.res.Resources;
import android.graphics.drawable.Drawable;
import android.os.IBinder;
import android.text.TextUtils;
import android.util.*;
import android.view.MotionEvent;
import android.view.View;
import android.view.inputmethod.*;
import android.widget.*;
import java.util.*;

// Referenced classes of package com.android.systemui.statusbar.tablet:
//            StatusBarPanel, InputMethodButton

public class InputMethodsPanel extends LinearLayout
    implements StatusBarPanel, android.view.View.OnClickListener
{
    private class InputMethodComparator
        implements Comparator
    {

        final InputMethodsPanel this$0;

        public int compare(InputMethodInfo inputmethodinfo, InputMethodInfo inputmethodinfo1)
        {
            if (inputmethodinfo1 == null)
                return 0;
            if (inputmethodinfo == null)
                return 1;
            if (mPackageManager == null)
            {
                return inputmethodinfo.getId().compareTo(inputmethodinfo1.getId());
            } else
            {
                String s = (new StringBuilder()).append(inputmethodinfo.loadLabel(mPackageManager)).append("/").append(inputmethodinfo.getId()).toString();
                String s1 = (new StringBuilder()).append(inputmethodinfo1.loadLabel(mPackageManager)).append("/").append(inputmethodinfo1.getId()).toString();
                return s.toString().compareTo(s1.toString());
            }
        }

        public volatile int compare(Object obj, Object obj1)
        {
            return compare((InputMethodInfo)obj, (InputMethodInfo)obj1);
        }

        private InputMethodComparator()
        {
            this$0 = InputMethodsPanel.this;
            super();
        }

    }

    public static interface OnHardKeyboardEnabledChangeListener
    {

        public abstract void onHardKeyboardEnabledChange(boolean flag);
    }


    private static final boolean DEBUG = false;
    private static final String TAG = "InputMethodsPanel";
    private boolean mAttached;
    private final BroadcastReceiver mBroadcastReceiver;
    private View mConfigureImeShortcut;
    private Context mContext;
    private final TreeMap mEnabledInputMethodAndSubtypesCache;
    private String mEnabledInputMethodAndSubtypesCacheStr;
    private boolean mHardKeyboardAvailable;
    private boolean mHardKeyboardEnabled;
    private OnHardKeyboardEnabledChangeListener mHardKeyboardEnabledChangeListener;
    private LinearLayout mHardKeyboardSection;
    private Switch mHardKeyboardSwitch;
    private final InputMethodManager mImm;
    private LinearLayout mInputMethodMenuList;
    private InputMethodButton mInputMethodSwitchButton;
    private final IntentFilter mIntentFilter;
    private String mLastSystemLocaleString;
    private boolean mPackageChanged;
    private PackageManager mPackageManager;
    private final HashMap mRadioViewAndImiMap;
    private IBinder mToken;

    public InputMethodsPanel(Context context, AttributeSet attributeset)
    {
        this(context, attributeset, 0);
    }

    public InputMethodsPanel(Context context, AttributeSet attributeset, int i)
    {
        super(context, attributeset, i);
        mBroadcastReceiver = new BroadcastReceiver() {

            final InputMethodsPanel this$0;

            public void onReceive(Context context1, Intent intent)
            {
                onPackageChanged();
            }

            
            {
                this$0 = InputMethodsPanel.this;
                super();
            }
        }
;
        mIntentFilter = new IntentFilter();
        mRadioViewAndImiMap = new HashMap();
        mEnabledInputMethodAndSubtypesCache = new TreeMap(new InputMethodComparator());
        mAttached = false;
        mPackageChanged = false;
        mContext = context;
        mImm = (InputMethodManager)context.getSystemService("input_method");
        mIntentFilter.addAction("android.intent.action.PACKAGE_REPLACED");
        mIntentFilter.addAction("android.intent.action.PACKAGE_ADDED");
        mIntentFilter.addAction("android.intent.action.PACKAGE_REMOVED");
        mIntentFilter.addDataScheme("package");
    }

    private View createInputMethodItem(final InputMethodInfo imi, InputMethodSubtype inputmethodsubtype)
    {
        CharSequence charsequence;
        if (inputmethodsubtype != null && !inputmethodsubtype.overridesImplicitlyEnabledSubtype())
            charsequence = getSubtypeName(imi, inputmethodsubtype);
        else
            charsequence = null;
        CharSequence charsequence1 = getIMIName(imi);
        Drawable drawable = getSubtypeIcon(imi, inputmethodsubtype);
        View view = View.inflate(mContext, 0x7f040035, null);
        ImageView imageview = (ImageView)view.findViewById(0x7f0800da);
        TextView textview = (TextView)view.findViewById(0x7f0800db);
        TextView textview1 = (TextView)view.findViewById(0x7f0800dc);
        ImageView imageview1 = (ImageView)view.findViewById(0x7f0800de);
        View view1 = view.findViewById(0x7f0800d8);
        if (charsequence == null)
        {
            textview.setText(charsequence1);
            textview1.setVisibility(8);
        } else
        {
            textview.setText(charsequence);
            textview1.setVisibility(0);
            textview1.setText(charsequence1);
        }
        imageview.setImageDrawable(drawable);
        imageview.setContentDescription(textview.getText());
        final String settingsActivity = imi.getSettingsActivity();
        if (!TextUtils.isEmpty(settingsActivity))
        {
            imageview1.setOnClickListener(new android.view.View.OnClickListener() {

                final InputMethodsPanel this$0;
                final InputMethodInfo val$imi;
                final String val$settingsActivity;

                public void onClick(View view2)
                {
                    Intent intent = new Intent("android.intent.action.MAIN");
                    intent.setClassName(imi.getPackageName(), settingsActivity);
                    intent.setFlags(0x14200000);
                    startActivity(intent);
                    closePanel(true);
                }

            
            {
                this$0 = InputMethodsPanel.this;
                imi = inputmethodinfo;
                settingsActivity = s;
                super();
            }
            }
);
        } else
        {
            view.findViewById(0x7f0800dd).setVisibility(8);
            imageview1.setVisibility(8);
        }
        mRadioViewAndImiMap.put(view1, new Pair(imi, inputmethodsubtype));
        view1.setOnClickListener(new android.view.View.OnClickListener() {

            final InputMethodsPanel this$0;

            public void onClick(View view2)
            {
                Pair pair = updateRadioButtonsByView(view2);
                closePanel(false);
                setInputMethodAndSubtype((InputMethodInfo)pair.first, (InputMethodSubtype)pair.second);
            }

            
            {
                this$0 = InputMethodsPanel.this;
                super();
            }
        }
);
        return view;
    }

    private InputMethodInfo getCurrentInputMethodInfo()
    {
        String s = android.provider.Settings.Secure.getString(getContext().getContentResolver(), "default_input_method");
        for (Iterator iterator = mEnabledInputMethodAndSubtypesCache.keySet().iterator(); iterator.hasNext();)
        {
            InputMethodInfo inputmethodinfo1 = (InputMethodInfo)iterator.next();
            if (inputmethodinfo1.getId().equals(s))
                return inputmethodinfo1;
        }

        for (Iterator iterator1 = getEnabledInputMethodAndSubtypeList().keySet().iterator(); iterator1.hasNext();)
        {
            InputMethodInfo inputmethodinfo = (InputMethodInfo)iterator1.next();
            if (inputmethodinfo.getId().equals(s))
                return inputmethodinfo;
        }

        return null;
    }

    private TreeMap getEnabledInputMethodAndSubtypeList()
    {
        String s = android.provider.Settings.Secure.getString(mContext.getContentResolver(), "enabled_input_methods");
        String s1 = mContext.getResources().getConfiguration().locale.toString();
        if (!TextUtils.equals(mEnabledInputMethodAndSubtypesCacheStr, s) || !TextUtils.equals(mLastSystemLocaleString, s1) || mPackageChanged)
        {
            mEnabledInputMethodAndSubtypesCache.clear();
            InputMethodInfo inputmethodinfo;
            for (Iterator iterator = mImm.getEnabledInputMethodList().iterator(); iterator.hasNext(); mEnabledInputMethodAndSubtypesCache.put(inputmethodinfo, mImm.getEnabledInputMethodSubtypeList(inputmethodinfo, true)))
                inputmethodinfo = (InputMethodInfo)iterator.next();

            mEnabledInputMethodAndSubtypesCacheStr = s;
            mPackageChanged = false;
            mLastSystemLocaleString = s1;
        }
        return mEnabledInputMethodAndSubtypesCache;
    }

    private CharSequence getIMIName(InputMethodInfo inputmethodinfo)
    {
        if (inputmethodinfo == null)
            return null;
        else
            return inputmethodinfo.loadLabel(mPackageManager);
    }

    private Drawable getSubtypeIcon(InputMethodInfo inputmethodinfo, InputMethodSubtype inputmethodsubtype)
    {
        if (inputmethodinfo == null)
            break MISSING_BLOCK_LABEL_119;
        if (inputmethodsubtype != null)
            return mPackageManager.getDrawable(inputmethodinfo.getPackageName(), inputmethodsubtype.getIconResId(), inputmethodinfo.getServiceInfo().applicationInfo);
        if (inputmethodinfo.getSubtypeCount() > 0)
            return mPackageManager.getDrawable(inputmethodinfo.getPackageName(), inputmethodinfo.getSubtypeAt(0).getIconResId(), inputmethodinfo.getServiceInfo().applicationInfo);
        Drawable drawable = mPackageManager.getApplicationInfo(inputmethodinfo.getPackageName(), 0).loadIcon(mPackageManager);
        return drawable;
        android.content.pm.PackageManager.NameNotFoundException namenotfoundexception;
        namenotfoundexception;
        Log.w("InputMethodsPanel", (new StringBuilder()).append("IME can't be found: ").append(inputmethodinfo.getPackageName()).toString());
        return null;
    }

    private CharSequence getSubtypeName(InputMethodInfo inputmethodinfo, InputMethodSubtype inputmethodsubtype)
    {
        if (inputmethodinfo != null && inputmethodsubtype != null)
            return inputmethodsubtype.getDisplayName(mContext, inputmethodinfo.getPackageName(), inputmethodinfo.getServiceInfo().applicationInfo);
        else
            return null;
    }

    private void onPackageChanged()
    {
        mPackageChanged = true;
    }

    private void setInputMethodAndSubtype(InputMethodInfo inputmethodinfo, InputMethodSubtype inputmethodsubtype)
    {
        if (mToken != null)
        {
            mImm.setInputMethodAndSubtype(mToken, inputmethodinfo.getId(), inputmethodsubtype);
            return;
        } else
        {
            Log.w("InputMethodsPanel", "IME Token is not set yet.");
            return;
        }
    }

    private void showConfigureInputMethods()
    {
        Intent intent = new Intent("android.settings.INPUT_METHOD_SETTINGS");
        intent.setFlags(0x14200000);
        startActivity(intent);
    }

    private void startActivity(Intent intent)
    {
        mContext.startActivity(intent);
    }

    private void updateHardKeyboardEnabled()
    {
        if (mHardKeyboardAvailable)
        {
            boolean flag = mHardKeyboardSwitch.isChecked();
            if (mHardKeyboardEnabled != flag)
            {
                mHardKeyboardEnabled = flag;
                if (mHardKeyboardEnabledChangeListener != null)
                    mHardKeyboardEnabledChangeListener.onHardKeyboardEnabledChange(flag);
            }
        }
    }

    private void updateHardKeyboardSection()
    {
        if (mHardKeyboardAvailable)
        {
            mHardKeyboardSection.setVisibility(0);
            if (mHardKeyboardSwitch.isChecked() != mHardKeyboardEnabled)
            {
                mHardKeyboardSwitch.setChecked(mHardKeyboardEnabled);
                updateHardKeyboardEnabled();
            }
            return;
        } else
        {
            mHardKeyboardSection.setVisibility(8);
            return;
        }
    }

    private void updateRadioButtons()
    {
        updateRadioButtonsByImiAndSubtype(getCurrentInputMethodInfo(), mImm.getCurrentInputMethodSubtype());
    }

    private void updateRadioButtonsByImiAndSubtype(InputMethodInfo inputmethodinfo, InputMethodSubtype inputmethodsubtype)
    {
        if (inputmethodinfo != null)
        {
            for (Iterator iterator = mRadioViewAndImiMap.keySet().iterator(); iterator.hasNext();)
            {
                View view = (View)iterator.next();
                RadioButton radiobutton = (RadioButton)view.findViewById(0x7f0800d9);
                if (radiobutton == null)
                {
                    Log.w("InputMethodsPanel", "RadioButton was not found in the selected subtype view");
                    return;
                }
                Pair pair = (Pair)mRadioViewAndImiMap.get(view);
                if (!((InputMethodInfo)pair.first).getId().equals(inputmethodinfo.getId()) || pair.second != null && !((InputMethodSubtype)pair.second).equals(inputmethodsubtype))
                    radiobutton.setChecked(false);
                else
                    radiobutton.setChecked(true);
            }

        }
    }

    private Pair updateRadioButtonsByView(View view)
    {
        boolean flag = mRadioViewAndImiMap.containsKey(view);
        Pair pair = null;
        if (flag)
        {
            for (Iterator iterator = mRadioViewAndImiMap.keySet().iterator(); iterator.hasNext();)
            {
                View view1 = (View)iterator.next();
                RadioButton radiobutton = (RadioButton)view1.findViewById(0x7f0800d9);
                if (radiobutton == null)
                {
                    Log.w("InputMethodsPanel", "RadioButton was not found in the selected subtype view");
                    return null;
                }
                if (view1 == view)
                {
                    pair = (Pair)mRadioViewAndImiMap.get(view1);
                    radiobutton.setChecked(true);
                } else
                {
                    radiobutton.setChecked(false);
                }
            }

        }
        return pair;
    }

    private void updateUiElements()
    {
        updateHardKeyboardSection();
        mInputMethodMenuList.removeAllViews();
        mRadioViewAndImiMap.clear();
        mPackageManager = mContext.getPackageManager();
        TreeMap treemap = getEnabledInputMethodAndSubtypeList();
        for (Iterator iterator = treemap.keySet().iterator(); iterator.hasNext();)
        {
            InputMethodInfo inputmethodinfo = (InputMethodInfo)iterator.next();
            List list = (List)treemap.get(inputmethodinfo);
            if (list != null && list.size() != 0)
            {
                Iterator iterator1 = list.iterator();
                while (iterator1.hasNext()) 
                {
                    InputMethodSubtype inputmethodsubtype = (InputMethodSubtype)iterator1.next();
                    mInputMethodMenuList.addView(createInputMethodItem(inputmethodinfo, inputmethodsubtype));
                }
            } else
            {
                mInputMethodMenuList.addView(createInputMethodItem(inputmethodinfo, null));
            }
        }

        updateRadioButtons();
    }

    public void closePanel(boolean flag)
    {
        setVisibility(8);
        if (mInputMethodSwitchButton != null)
            mInputMethodSwitchButton.setIconImage(0x7f0200e8);
        if (flag)
            mImm.hideSoftInputFromWindow(getWindowToken(), 0);
    }

    public boolean dispatchHoverEvent(MotionEvent motionevent)
    {
        int i = (int)motionevent.getX();
        int j = (int)motionevent.getY();
        if (i >= 0 && i < getWidth() && j >= 0 && j < getHeight())
            return super.dispatchHoverEvent(motionevent);
        else
            return true;
    }

    public boolean isInContentArea(int i, int j)
    {
        return false;
    }

    protected void onAttachedToWindow()
    {
        super.onAttachedToWindow();
        if (!mAttached)
        {
            getContext().registerReceiver(mBroadcastReceiver, mIntentFilter);
            mAttached = true;
        }
    }

    public void onClick(View view)
    {
        if (view == mConfigureImeShortcut)
        {
            showConfigureInputMethods();
            closePanel(true);
        }
    }

    protected void onDetachedFromWindow()
    {
        super.onDetachedFromWindow();
        if (mAttached)
        {
            getContext().unregisterReceiver(mBroadcastReceiver);
            mAttached = false;
        }
    }

    public void onFinishInflate()
    {
        mInputMethodMenuList = (LinearLayout)findViewById(0x7f0800e3);
        mHardKeyboardSection = (LinearLayout)findViewById(0x7f0800e0);
        mHardKeyboardSwitch = (Switch)findViewById(0x7f0800e2);
        mConfigureImeShortcut = findViewById(0x7f0800e4);
        mConfigureImeShortcut.setOnClickListener(this);
        updateUiElements();
    }

    public void openPanel()
    {
        setVisibility(0);
        updateUiElements();
        if (mInputMethodSwitchButton != null)
            mInputMethodSwitchButton.setIconImage(0x7f0200ea);
    }

    public void setHardKeyboardEnabledChangeListener(OnHardKeyboardEnabledChangeListener onhardkeyboardenabledchangelistener)
    {
        mHardKeyboardEnabledChangeListener = onhardkeyboardenabledchangelistener;
    }

    public void setHardKeyboardStatus(boolean flag, boolean flag1)
    {
        if (mHardKeyboardAvailable != flag || mHardKeyboardEnabled != flag1)
        {
            mHardKeyboardAvailable = flag;
            mHardKeyboardEnabled = flag1;
            updateHardKeyboardSection();
        }
    }

    public void setImeSwitchButton(InputMethodButton inputmethodbutton)
    {
        mInputMethodSwitchButton = inputmethodbutton;
    }

    public void setImeToken(IBinder ibinder)
    {
        mToken = ibinder;
    }





}
