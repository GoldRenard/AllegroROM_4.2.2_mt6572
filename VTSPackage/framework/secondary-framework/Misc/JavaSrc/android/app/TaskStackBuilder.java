// Decompiled by Jad v1.5.8g. Copyright 2001 Pavel Kouznetsov.
// Jad home page: http://www.kpdus.com/jad.html
// Decompiler options: packimports(3) fieldsfirst noctor space 

package android.app;

import android.content.*;
import android.content.pm.*;
import android.os.Bundle;
import android.os.UserHandle;
import android.util.Log;
import java.util.ArrayList;

// Referenced classes of package android.app:
//            Activity, PendingIntent

public class TaskStackBuilder
{

    private static final String TAG = "TaskStackBuilder";
    private final ArrayList mIntents = new ArrayList();
    private final Context mSourceContext;

    private TaskStackBuilder(Context context)
    {
        mSourceContext = context;
    }

    public static TaskStackBuilder create(Context context)
    {
        return new TaskStackBuilder(context);
    }

    public TaskStackBuilder addNextIntent(Intent intent)
    {
        mIntents.add(intent);
        return this;
    }

    public TaskStackBuilder addNextIntentWithParentStack(Intent intent)
    {
        ComponentName componentname = intent.getComponent();
        if (componentname == null)
            componentname = intent.resolveActivity(mSourceContext.getPackageManager());
        if (componentname != null)
            addParentStack(componentname);
        addNextIntent(intent);
        return this;
    }

    public TaskStackBuilder addParentStack(Activity activity)
    {
        Intent intent = activity.getParentActivityIntent();
        if (intent != null)
        {
            ComponentName componentname = intent.getComponent();
            if (componentname == null)
                componentname = intent.resolveActivity(mSourceContext.getPackageManager());
            addParentStack(componentname);
            addNextIntent(intent);
        }
        return this;
    }

    public TaskStackBuilder addParentStack(ComponentName componentname)
    {
        ComponentName componentname1;
        Intent intent1;
        int i = mIntents.size();
        PackageManager packagemanager = mSourceContext.getPackageManager();
        ActivityInfo activityinfo;
        String s;
        try
        {
            activityinfo = packagemanager.getActivityInfo(componentname, 0);
            s = activityinfo.parentActivityName;
        }
        catch (android.content.pm.PackageManager.NameNotFoundException namenotfoundexception)
        {
            Log.e("TaskStackBuilder", "Bad ComponentName while traversing activity parent metadata");
            throw new IllegalArgumentException(namenotfoundexception);
        }
        if (s == null)
            break MISSING_BLOCK_LABEL_138;
        componentname1 = new ComponentName(activityinfo.packageName, s);
        activityinfo = packagemanager.getActivityInfo(componentname1, 0);
        s = activityinfo.parentActivityName;
        if (s != null || i != 0) goto _L2; else goto _L1
_L1:
        intent1 = Intent.makeMainActivity(componentname1);
_L4:
        mIntents.add(i, intent1);
        break MISSING_BLOCK_LABEL_31;
_L2:
        Intent intent = (new Intent()).setComponent(componentname1);
        intent1 = intent;
        if (true) goto _L4; else goto _L3
_L3:
        return this;
    }

    public TaskStackBuilder addParentStack(Class class1)
    {
        return addParentStack(new ComponentName(mSourceContext, class1));
    }

    public Intent editIntentAt(int i)
    {
        return (Intent)mIntents.get(i);
    }

    public int getIntentCount()
    {
        return mIntents.size();
    }

    public Intent[] getIntents()
    {
        Intent aintent[] = new Intent[mIntents.size()];
        if (aintent.length != 0)
        {
            aintent[0] = new Intent((Intent)mIntents.get(0));
            String s = mSourceContext.getApplicationInfo().processName;
            aintent[0].addFlags(0x10008000);
            if (!s.equals("com.android.mms"))
                aintent[0].addFlags(16384);
            for (int i = 1; i < aintent.length; i++)
                aintent[i] = new Intent((Intent)mIntents.get(i));

        }
        return aintent;
    }

    public PendingIntent getPendingIntent(int i, int j)
    {
        return getPendingIntent(i, j, null);
    }

    public PendingIntent getPendingIntent(int i, int j, Bundle bundle)
    {
        if (mIntents.isEmpty())
            throw new IllegalStateException("No intents added to TaskStackBuilder; cannot getPendingIntent");
        else
            return PendingIntent.getActivities(mSourceContext, i, getIntents(), j, bundle);
    }

    public PendingIntent getPendingIntent(int i, int j, Bundle bundle, UserHandle userhandle)
    {
        if (mIntents.isEmpty())
            throw new IllegalStateException("No intents added to TaskStackBuilder; cannot getPendingIntent");
        else
            return PendingIntent.getActivitiesAsUser(mSourceContext, i, getIntents(), j, bundle, userhandle);
    }

    public void startActivities()
    {
        startActivities(null);
    }

    public void startActivities(Bundle bundle)
    {
        startActivities(bundle, new UserHandle(UserHandle.myUserId()));
    }

    public void startActivities(Bundle bundle, UserHandle userhandle)
    {
        if (mIntents.isEmpty())
        {
            throw new IllegalStateException("No intents added to TaskStackBuilder; cannot startActivities");
        } else
        {
            mSourceContext.startActivitiesAsUser(getIntents(), bundle, userhandle);
            return;
        }
    }
}
