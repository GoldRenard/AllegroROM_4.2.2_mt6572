// Decompiled by Jad v1.5.8g. Copyright 2001 Pavel Kouznetsov.
// Jad home page: http://www.kpdus.com/jad.html
// Decompiler options: packimports(3) fieldsfirst noctor space 

package com.android.internal.policy.impl.keyguard;

import android.app.*;
import android.content.*;
import android.content.pm.*;
import android.os.*;
import android.util.Log;
import com.android.internal.widget.LockPatternUtils;
import java.util.List;

// Referenced classes of package com.android.internal.policy.impl.keyguard:
//            KeyguardHostView, KeyguardSecurityCallback

public abstract class KeyguardActivityLauncher
{
    public static class CameraWidgetInfo
    {

        public String contextPackage;
        public int layoutId;

    }


    private static final boolean DEBUG = false;
    private static final Intent INSECURE_CAMERA_INTENT = new Intent("android.media.action.STILL_IMAGE_CAMERA");
    private static final String META_DATA_KEYGUARD_LAYOUT = "com.android.keyguard.layout";
    private static final Intent SECURE_CAMERA_INTENT = (new Intent("android.media.action.STILL_IMAGE_CAMERA_SECURE")).addFlags(0x800000);
    private static final String TAG = com/android/internal/policy/impl/keyguard/KeyguardActivityLauncher.getSimpleName();


    private void dismissKeyguardOnNextActivity()
    {
        try
        {
            ActivityManagerNative.getDefault().dismissKeyguardOnNextActivity();
            return;
        }
        catch (RemoteException remoteexception)
        {
            Log.w(TAG, "can't dismiss keyguard on launch");
        }
    }

    private Intent getCameraIntent()
    {
        if (getLockPatternUtils().isSecure())
            return SECURE_CAMERA_INTENT;
        else
            return INSECURE_CAMERA_INTENT;
    }

    private void startActivityForCurrentUser(final Intent intent, final Bundle options, Handler handler, final Runnable onStarted)
    {
        final UserHandle user = new UserHandle(-2);
        if (handler != null && onStarted != null)
        {
            handler.post(new Runnable() {

                final KeyguardActivityLauncher this$0;
                final Intent val$intent;
                final Runnable val$onStarted;
                final Bundle val$options;
                final UserHandle val$user;

                public void run()
                {
                    try
                    {
                        android.app.IActivityManager.WaitResult waitresult = ActivityManagerNative.getDefault().startActivityAndWait(null, intent, intent.resolveTypeIfNeeded(getContext().getContentResolver()), null, null, 0, 0x10000000, null, null, options, user.getIdentifier());
                        if (KeyguardActivityLauncher.DEBUG)
                        {
                            String s = KeyguardActivityLauncher.TAG;
                            Object aobj[] = new Object[5];
                            aobj[0] = Integer.valueOf(waitresult.result);
                            aobj[1] = Long.valueOf(waitresult.thisTime);
                            aobj[2] = Long.valueOf(waitresult.totalTime);
                            aobj[3] = waitresult.who;
                            aobj[4] = Long.valueOf(SystemClock.uptimeMillis());
                            Log.d(s, String.format("waitResult[%s,%s,%s,%s] at %s", aobj));
                        }
                    }
                    catch (RemoteException remoteexception)
                    {
                        Log.w(KeyguardActivityLauncher.TAG, "Error starting activity", remoteexception);
                        return;
                    }
                    try
                    {
                        onStarted.run();
                        return;
                    }
                    catch (Throwable throwable)
                    {
                        Log.w(KeyguardActivityLauncher.TAG, "Error running onStarted callback", throwable);
                    }
                }

            
            {
                this$0 = KeyguardActivityLauncher.this;
                intent = intent1;
                options = bundle;
                user = userhandle;
                onStarted = runnable;
                super();
            }
            }
);
            return;
        } else
        {
            getContext().startActivityAsUser(intent, options, user);
            return;
        }
    }

    private boolean wouldLaunchResolverActivity(Intent intent)
    {
        PackageManager packagemanager = getContext().getPackageManager();
        return wouldLaunchResolverActivity(packagemanager.resolveActivityAsUser(intent, 0x10000, getLockPatternUtils().getCurrentUser()), packagemanager.queryIntentActivitiesAsUser(intent, 0x10000, getLockPatternUtils().getCurrentUser()));
    }

    private boolean wouldLaunchResolverActivity(ResolveInfo resolveinfo, List list)
    {
        for (int i = 0; i < list.size(); i++)
        {
            ResolveInfo resolveinfo1 = (ResolveInfo)list.get(i);
            if (resolveinfo1.activityInfo.name.equals(resolveinfo.activityInfo.name) && resolveinfo1.activityInfo.packageName.equals(resolveinfo.activityInfo.packageName))
                return false;
        }

        return true;
    }

    abstract KeyguardSecurityCallback getCallback();

    public CameraWidgetInfo getCameraWidgetInfo()
    {
label0:
        {
            CameraWidgetInfo camerawidgetinfo = new CameraWidgetInfo();
            Intent intent = getCameraIntent();
            PackageManager packagemanager = getContext().getPackageManager();
            List list = packagemanager.queryIntentActivitiesAsUser(intent, 0x10000, getLockPatternUtils().getCurrentUser());
            if (list.size() == 0)
            {
                if (DEBUG)
                    Log.d(TAG, "getCameraWidgetInfo(): Nothing found");
                camerawidgetinfo = null;
            } else
            {
                ResolveInfo resolveinfo = packagemanager.resolveActivityAsUser(intent, 0x10080, getLockPatternUtils().getCurrentUser());
                if (DEBUG)
                    Log.d(TAG, (new StringBuilder()).append("getCameraWidgetInfo(): resolved: ").append(resolveinfo).toString());
                if (wouldLaunchResolverActivity(resolveinfo, list))
                {
                    if (DEBUG)
                    {
                        Log.d(TAG, "getCameraWidgetInfo(): Would launch resolver");
                        return camerawidgetinfo;
                    }
                } else
                {
                    if (resolveinfo == null || resolveinfo.activityInfo == null)
                        break label0;
                    if (resolveinfo.activityInfo.metaData != null && !resolveinfo.activityInfo.metaData.isEmpty())
                    {
                        int i = resolveinfo.activityInfo.metaData.getInt("com.android.keyguard.layout");
                        if (i == 0)
                        {
                            if (DEBUG)
                            {
                                Log.d(TAG, "getCameraWidgetInfo(): no layout specified");
                                return camerawidgetinfo;
                            }
                        } else
                        {
                            camerawidgetinfo.contextPackage = resolveinfo.activityInfo.packageName;
                            camerawidgetinfo.layoutId = i;
                            return camerawidgetinfo;
                        }
                    } else
                    if (DEBUG)
                    {
                        Log.d(TAG, "getCameraWidgetInfo(): no metadata found");
                        return camerawidgetinfo;
                    }
                }
            }
            return camerawidgetinfo;
        }
        return null;
    }

    abstract Context getContext();

    abstract LockPatternUtils getLockPatternUtils();

    public void launchActivity(Intent intent, boolean flag, boolean flag1, Handler handler, Runnable runnable)
    {
        Context context = getContext();
        Bundle bundle;
        if (flag1)
            bundle = null;
        else
            bundle = ActivityOptions.makeCustomAnimation(context, 0, 0).toBundle();
        launchActivityWithAnimation(intent, flag, bundle, handler, runnable);
    }

    public void launchActivityWithAnimation(final Intent intent, boolean flag, final Bundle animation, final Handler worker, final Runnable onStarted)
    {
        LockPatternUtils lockpatternutils = getLockPatternUtils();
        intent.addFlags(0x34000000);
        boolean flag1 = lockpatternutils.isSecure();
        if (!flag1 || flag)
        {
            if (!flag1)
                dismissKeyguardOnNextActivity();
            try
            {
                if (DEBUG)
                {
                    String s = TAG;
                    Object aobj[] = new Object[2];
                    aobj[0] = intent;
                    aobj[1] = Long.valueOf(SystemClock.uptimeMillis());
                    Log.d(s, String.format("Starting activity for intent %s at %s", aobj));
                }
                startActivityForCurrentUser(intent, animation, worker, onStarted);
                return;
            }
            catch (ActivityNotFoundException activitynotfoundexception)
            {
                Log.w(TAG, (new StringBuilder()).append("Activity not found for intent + ").append(intent.getAction()).toString());
            }
            return;
        } else
        {
            KeyguardSecurityCallback keyguardsecuritycallback = getCallback();
            keyguardsecuritycallback.setOnDismissAction(new KeyguardHostView.OnDismissAction() {

                final KeyguardActivityLauncher this$0;
                final Bundle val$animation;
                final Intent val$intent;
                final Runnable val$onStarted;
                final Handler val$worker;

                public boolean onDismiss()
                {
                    dismissKeyguardOnNextActivity();
                    startActivityForCurrentUser(intent, animation, worker, onStarted);
                    return true;
                }

            
            {
                this$0 = KeyguardActivityLauncher.this;
                intent = intent1;
                animation = bundle;
                worker = handler;
                onStarted = runnable;
                super();
            }
            }
);
            keyguardsecuritycallback.dismiss(false);
            return;
        }
    }

    public void launchCamera(Handler handler, Runnable runnable)
    {
        if (getLockPatternUtils().isSecure())
        {
            if (wouldLaunchResolverActivity(SECURE_CAMERA_INTENT))
            {
                launchActivity(SECURE_CAMERA_INTENT, false, false, null, null);
                return;
            } else
            {
                launchActivity(SECURE_CAMERA_INTENT, true, false, handler, runnable);
                return;
            }
        } else
        {
            launchActivity(INSECURE_CAMERA_INTENT, false, false, null, null);
            return;
        }
    }

    public void launchWidgetPicker(int i)
    {
        Intent intent = new Intent("android.appwidget.action.KEYGUARD_APPWIDGET_PICK");
        intent.putExtra("appWidgetId", i);
        intent.putExtra("customSort", false);
        intent.putExtra("categoryFilter", 2);
        Bundle bundle = new Bundle();
        bundle.putInt("appWidgetCategory", 2);
        intent.putExtra("appWidgetOptions", bundle);
        intent.addFlags(0x34800000);
        launchActivity(intent, false, false, null, null);
    }

    static 
    {
        DEBUG = KeyguardHostView.DEBUG;
    }




}
