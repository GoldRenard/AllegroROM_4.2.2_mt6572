// Decompiled by Jad v1.5.8g. Copyright 2001 Pavel Kouznetsov.
// Jad home page: http://www.kpdus.com/jad.html
// Decompiler options: packimports(3) fieldsfirst noctor space 

package android.widget;

import android.app.ActivityOptions;
import android.app.PendingIntent;
import android.appwidget.AppWidgetContext;
import android.appwidget.AppWidgetHostView;
import android.content.Context;
import android.content.Intent;
import android.content.pm.ApplicationInfo;
import android.content.res.*;
import android.graphics.Bitmap;
import android.graphics.Rect;
import android.graphics.drawable.Drawable;
import android.net.Uri;
import android.os.*;
import android.text.TextUtils;
import android.util.Log;
import android.view.*;
import java.lang.annotation.Annotation;
import java.lang.reflect.Method;
import java.util.ArrayList;
import java.util.HashMap;

// Referenced classes of package android.widget:
//            ImageView, AdapterView, AdapterViewAnimator, AbsListView, 
//            TextView

public class RemoteViews
    implements Parcelable, android.view.LayoutInflater.Filter
{
    private static abstract class Action
        implements Parcelable
    {

        public static final int MERGE_APPEND = 1;
        public static final int MERGE_IGNORE = 2;
        public static final int MERGE_REPLACE;
        int viewId;

        public abstract void apply(View view, ViewGroup viewgroup, OnClickHandler onclickhandler)
            throws ActionException;

        public int describeContents()
        {
            return 0;
        }

        public abstract String getActionName();

        public String getUniqueKey()
        {
            return (new StringBuilder()).append(getActionName()).append(viewId).toString();
        }

        public int mergeBehavior()
        {
            return 0;
        }

        public void setBitmapCache(BitmapCache bitmapcache)
        {
        }

        public void updateMemoryUsageEstimate(MemoryUsageCounter memoryusagecounter)
        {
        }

        private Action()
        {
        }

    }

    public static class ActionException extends RuntimeException
    {

        public ActionException(Exception exception)
        {
            RuntimeException(exception);
        }

        public ActionException(String s)
        {
            RuntimeException(s);
        }
    }

    private static class BitmapCache
    {

        ArrayList mBitmaps;

        public void addBitmapMemory(MemoryUsageCounter memoryusagecounter)
        {
            for (int i = 0; i < mBitmaps.size(); i++)
                memoryusagecounter.addBitmapMemory((Bitmap)mBitmaps.get(i));

        }

        public void assimilate(BitmapCache bitmapcache)
        {
            ArrayList arraylist = bitmapcache.mBitmaps;
            int i = arraylist.size();
            for (int j = 0; j < i; j++)
            {
                Bitmap bitmap = (Bitmap)arraylist.get(j);
                if (!mBitmaps.contains(bitmap))
                    mBitmaps.add(bitmap);
            }

        }

        public Bitmap getBitmapForId(int i)
        {
            if (i != -1 && i < mBitmaps.size())
                return (Bitmap)mBitmaps.get(i);
            else
                return null;
        }

        public int getBitmapId(Bitmap bitmap)
        {
            if (bitmap == null)
                return -1;
            if (mBitmaps.contains(bitmap))
            {
                return mBitmaps.indexOf(bitmap);
            } else
            {
                mBitmaps.add(bitmap);
                return -1 + mBitmaps.size();
            }
        }

        public void writeBitmapsToParcel(Parcel parcel, int i)
        {
            int j = mBitmaps.size();
            parcel.writeInt(j);
            for (int k = 0; k < j; k++)
                ((Bitmap)mBitmaps.get(k)).writeToParcel(parcel, i);

        }

        public BitmapCache()
        {
            mBitmaps = new ArrayList();
        }

        public BitmapCache(Parcel parcel)
        {
            int i = parcel.readInt();
            mBitmaps = new ArrayList();
            for (int j = 0; j < i; j++)
            {
                Bitmap bitmap = (Bitmap)Bitmap.CREATOR.createFromParcel(parcel);
                mBitmaps.add(bitmap);
            }

        }
    }

    private class BitmapReflectionAction extends Action
    {

        public static final int TAG = 12;
        Bitmap bitmap;
        int bitmapId;
        String methodName;
        final RemoteViews this$0;

        public void apply(View view, ViewGroup viewgroup, OnClickHandler onclickhandler)
            throws ActionException
        {
            (new ReflectionAction(super.viewId, methodName, 12, bitmap)).apply(view, viewgroup, onclickhandler);
        }

        public String getActionName()
        {
            return "BitmapReflectionAction";
        }

        public void setBitmapCache(BitmapCache bitmapcache)
        {
            bitmapId = bitmapcache.getBitmapId(bitmap);
        }

        public void writeToParcel(Parcel parcel, int i)
        {
            parcel.writeInt(12);
            parcel.writeInt(super.viewId);
            parcel.writeString(methodName);
            parcel.writeInt(bitmapId);
        }

        BitmapReflectionAction(int i, String s, Bitmap bitmap1)
        {
            this$0 = RemoteViews.this;
            Action();
            bitmap = bitmap1;
            super.viewId = i;
            methodName = s;
            bitmapId = mBitmapCache.getBitmapId(bitmap1);
        }

        BitmapReflectionAction(Parcel parcel)
        {
            this$0 = RemoteViews.this;
            Action();
            super.viewId = parcel.readInt();
            methodName = parcel.readString();
            bitmapId = parcel.readInt();
            bitmap = mBitmapCache.getBitmapForId(bitmapId);
        }
    }

    private class MemoryUsageCounter
    {

        int mMemoryUsage;
        final RemoteViews this$0;

        public void addBitmapMemory(Bitmap bitmap)
        {
            android.graphics.Bitmap.Config config = bitmap.getConfig();
            byte byte0 = 4;
            static class _cls2
            {

                static final int $SwitchMap$android$graphics$Bitmap$Config[];

                static 
                {
                    $SwitchMap$android$graphics$Bitmap$Config = new int[android.graphics.Bitmap.Config.values().length];
                    try
                    {
                        $SwitchMap$android$graphics$Bitmap$Config[android.graphics.Bitmap.Config.ALPHA_8.ordinal()] = 1;
                    }
                    catch (NoSuchFieldError nosuchfielderror) { }
                    try
                    {
                        $SwitchMap$android$graphics$Bitmap$Config[android.graphics.Bitmap.Config.RGB_565.ordinal()] = 2;
                    }
                    catch (NoSuchFieldError nosuchfielderror1) { }
                    try
                    {
                        $SwitchMap$android$graphics$Bitmap$Config[android.graphics.Bitmap.Config.ARGB_4444.ordinal()] = 3;
                    }
                    catch (NoSuchFieldError nosuchfielderror2) { }
                    try
                    {
                        $SwitchMap$android$graphics$Bitmap$Config[android.graphics.Bitmap.Config.ARGB_8888.ordinal()] = 4;
                    }
                    catch (NoSuchFieldError nosuchfielderror3)
                    {
                        return;
                    }
                }
            }

            if (config != null)
                switch (_cls2..SwitchMap.android.graphics.Bitmap.Config[config.ordinal()])
                {
                case 4: // '\004'
                    byte0 = 4;
                    break;

                case 2: // '\002'
                case 3: // '\003'
                    byte0 = 2;
                    break;

                case 1: // '\001'
                    byte0 = 1;
                    break;
                }
            increment(byte0 * (bitmap.getWidth() * bitmap.getHeight()));
        }

        public void clear()
        {
            mMemoryUsage = 0;
        }

        public int getMemoryUsage()
        {
            return mMemoryUsage;
        }

        public void increment(int i)
        {
            mMemoryUsage = i + mMemoryUsage;
        }

        private MemoryUsageCounter()
        {
            this$0 = RemoteViews.this;
            Object();
        }

    }

    public static class OnClickHandler
    {

        public boolean onClickHandler(View view, PendingIntent pendingintent, Intent intent)
        {
            try
            {
                Context context = view.getContext();
                ActivityOptions activityoptions = ActivityOptions.makeScaleUpAnimation(view, 0, 0, view.getMeasuredWidth(), view.getMeasuredHeight());
                context.startIntentSender(pendingintent.getIntentSender(), intent, 0x10000000, 0x10000000, 0, activityoptions.toBundle());
            }
            catch (android.content.IntentSender.SendIntentException sendintentexception)
            {
                Log.e("RemoteViews", "Cannot send pending intent: ", sendintentexception);
                return false;
            }
            catch (Exception exception)
            {
                Log.e("RemoteViews", "Cannot send pending intent due to unknown exception: ", exception);
                return false;
            }
            return true;
        }

    }

    private class ReflectionAction extends Action
    {

        static final int BITMAP = 12;
        static final int BOOLEAN = 1;
        static final int BUNDLE = 13;
        static final int BYTE = 2;
        static final int CHAR = 8;
        static final int CHAR_SEQUENCE = 10;
        static final int DOUBLE = 7;
        static final int FLOAT = 6;
        static final int INT = 4;
        static final int INTENT = 14;
        static final int LONG = 5;
        static final int SHORT = 3;
        static final int STRING = 9;
        static final int TAG = 2;
        static final int URI = 11;
        String methodName;
        final RemoteViews this$0;
        int type;
        Object value;

        private Class getParameterType()
        {
            switch (type)
            {
            case 14: // '\016'
                return android/content/Intent;

            case 13: // '\r'
                return android/os/Bundle;

            case 12: // '\f'
                return android/graphics/Bitmap;

            case 11: // '\013'
                return android/net/Uri;

            case 10: // '\n'
                return java/lang/CharSequence;

            case 9: // '\t'
                return java/lang/String;

            case 8: // '\b'
                return Character.TYPE;

            case 7: // '\007'
                return Double.TYPE;

            case 6: // '\006'
                return Float.TYPE;

            case 5: // '\005'
                return Long.TYPE;

            case 4: // '\004'
                return Integer.TYPE;

            case 3: // '\003'
                return Short.TYPE;

            case 2: // '\002'
                return Byte.TYPE;

            case 1: // '\001'
                return Boolean.TYPE;
            }
            return null;
        }

        public void apply(View view, ViewGroup viewgroup, OnClickHandler onclickhandler)
        {
            View view1 = view.findViewById(super.viewId);
            if (view1 == null)
                return;
            Class class1 = getParameterType();
            if (class1 == null)
                throw new ActionException((new StringBuilder()).append("bad type: ").append(type).toString());
            Class class2 = view1.getClass();
            Method method;
            try
            {
                String s = methodName;
                Class aclass[] = new Class[1];
                aclass[0] = getParameterType();
                method = class2.getMethod(s, aclass);
            }
            catch (NoSuchMethodException nosuchmethodexception)
            {
                throw new ActionException((new StringBuilder()).append("view: ").append(class2.getName()).append(" doesn't have method: ").append(methodName).append("(").append(class1.getName()).append(")").toString());
            }
            if (!method.isAnnotationPresent(android/view/RemotableViewMethod))
                throw new ActionException((new StringBuilder()).append("view: ").append(class2.getName()).append(" can't use method with RemoteViews: ").append(methodName).append("(").append(class1.getName()).append(")").toString());
            try
            {
                Object aobj[] = new Object[1];
                aobj[0] = value;
                method.invoke(view1, aobj);
                return;
            }
            catch (Exception exception)
            {
                throw new ActionException(exception);
            }
        }

        public String getActionName()
        {
            return (new StringBuilder()).append("ReflectionAction").append(methodName).append(type).toString();
        }

        public int mergeBehavior()
        {
            return !methodName.equals("smoothScrollBy") ? 0 : 1;
        }

        public void writeToParcel(Parcel parcel, int i)
        {
            int j;
label0:
            {
label1:
                {
label2:
                    {
label3:
                        {
label4:
                            {
label5:
                                {
label6:
                                    {
label7:
                                        {
label8:
                                            {
label9:
                                                {
                                                    j = 1;
                                                    parcel.writeInt(2);
                                                    parcel.writeInt(super.viewId);
                                                    parcel.writeString(methodName);
                                                    parcel.writeInt(type);
                                                    switch (type)
                                                    {
                                                    default:
                                                        break;

                                                    case 1: // '\001'
                                                        break label0;

                                                    case 2: // '\002'
                                                        break label1;

                                                    case 3: // '\003'
                                                        break label2;

                                                    case 4: // '\004'
                                                        break label3;

                                                    case 5: // '\005'
                                                        break label4;

                                                    case 6: // '\006'
                                                        break label5;

                                                    case 7: // '\007'
                                                        break label6;

                                                    case 8: // '\b'
                                                        break label7;

                                                    case 9: // '\t'
                                                        break label8;

                                                    case 10: // '\n'
                                                        break label9;

                                                    case 14: // '\016'
                                                        if (value == null)
                                                            j = 0;
                                                        parcel.writeInt(j);
                                                        if (value != null)
                                                        {
                                                            ((Intent)value).writeToParcel(parcel, i);
                                                            return;
                                                        }
                                                        break;

                                                    case 13: // '\r'
                                                        parcel.writeBundle((Bundle)value);
                                                        return;

                                                    case 12: // '\f'
                                                        if (value == null)
                                                            j = 0;
                                                        parcel.writeInt(j);
                                                        if (value != null)
                                                        {
                                                            ((Bitmap)value).writeToParcel(parcel, i);
                                                            return;
                                                        }
                                                        break;

                                                    case 11: // '\013'
                                                        if (value == null)
                                                            j = 0;
                                                        parcel.writeInt(j);
                                                        if (value != null)
                                                        {
                                                            ((Uri)value).writeToParcel(parcel, i);
                                                            return;
                                                        }
                                                        break;
                                                    }
                                                    return;
                                                }
                                                TextUtils.writeToParcel((CharSequence)value, parcel, i);
                                                return;
                                            }
                                            parcel.writeString((String)value);
                                            return;
                                        }
                                        parcel.writeInt(((Character)value).charValue());
                                        return;
                                    }
                                    parcel.writeDouble(((Double)value).doubleValue());
                                    return;
                                }
                                parcel.writeFloat(((Float)value).floatValue());
                                return;
                            }
                            parcel.writeLong(((Long)value).longValue());
                            return;
                        }
                        parcel.writeInt(((Integer)value).intValue());
                        return;
                    }
                    parcel.writeInt(((Short)value).shortValue());
                    return;
                }
                parcel.writeByte(((Byte)value).byteValue());
                return;
            }
            int k;
            if (((Boolean)value).booleanValue())
                k = j;
            else
                k = 0;
            parcel.writeInt(k);
        }

        ReflectionAction(int i, String s, int j, Object obj)
        {
            this$0 = RemoteViews.this;
            Action();
            super.viewId = i;
            methodName = s;
            type = j;
            value = obj;
        }

        ReflectionAction(Parcel parcel)
        {
label0:
            {
label1:
                {
label2:
                    {
label3:
                        {
label4:
                            {
label5:
                                {
label6:
                                    {
label7:
                                        {
label8:
                                            {
label9:
                                                {
                                                    this$0 = RemoteViews.this;
                                                    Action();
                                                    super.viewId = parcel.readInt();
                                                    methodName = parcel.readString();
                                                    type = parcel.readInt();
                                                    switch (type)
                                                    {
                                                    default:
                                                        break;

                                                    case 1: // '\001'
                                                        break label0;

                                                    case 2: // '\002'
                                                        break label1;

                                                    case 3: // '\003'
                                                        break label2;

                                                    case 4: // '\004'
                                                        break label3;

                                                    case 5: // '\005'
                                                        break label4;

                                                    case 6: // '\006'
                                                        break label5;

                                                    case 7: // '\007'
                                                        break label6;

                                                    case 8: // '\b'
                                                        break label7;

                                                    case 9: // '\t'
                                                        break label8;

                                                    case 10: // '\n'
                                                        break label9;

                                                    case 14: // '\016'
                                                        if (parcel.readInt() != 0)
                                                        {
                                                            value = Intent.CREATOR.createFromParcel(parcel);
                                                            return;
                                                        }
                                                        break;

                                                    case 13: // '\r'
                                                        value = parcel.readBundle();
                                                        return;

                                                    case 12: // '\f'
                                                        if (parcel.readInt() != 0)
                                                        {
                                                            value = Bitmap.CREATOR.createFromParcel(parcel);
                                                            return;
                                                        }
                                                        break;

                                                    case 11: // '\013'
                                                        if (parcel.readInt() != 0)
                                                        {
                                                            value = Uri.CREATOR.createFromParcel(parcel);
                                                            return;
                                                        }
                                                        break;
                                                    }
                                                    return;
                                                }
                                                value = TextUtils.CHAR_SEQUENCE_CREATOR.createFromParcel(parcel);
                                                return;
                                            }
                                            value = parcel.readString();
                                            return;
                                        }
                                        value = Character.valueOf((char)parcel.readInt());
                                        return;
                                    }
                                    value = Double.valueOf(parcel.readDouble());
                                    return;
                                }
                                value = Float.valueOf(parcel.readFloat());
                                return;
                            }
                            value = Long.valueOf(parcel.readLong());
                            return;
                        }
                        value = Integer.valueOf(parcel.readInt());
                        return;
                    }
                    value = Short.valueOf((short)parcel.readInt());
                    return;
                }
                value = Byte.valueOf(parcel.readByte());
                return;
            }
            boolean flag;
            if (parcel.readInt() != 0)
                flag = true;
            else
                flag = false;
            value = Boolean.valueOf(flag);
        }
    }

    private class ReflectionActionWithoutParams extends Action
    {

        public static final int TAG = 5;
        String methodName;
        final RemoteViews this$0;

        public void apply(View view, ViewGroup viewgroup, OnClickHandler onclickhandler)
        {
            View view1 = view.findViewById(super.viewId);
            if (view1 == null)
                return;
            Class class1 = view1.getClass();
            Method method;
            try
            {
                method = class1.getMethod(methodName, new Class[0]);
            }
            catch (NoSuchMethodException nosuchmethodexception)
            {
                throw new ActionException((new StringBuilder()).append("view: ").append(class1.getName()).append(" doesn't have method: ").append(methodName).append("()").toString());
            }
            if (!method.isAnnotationPresent(android/view/RemotableViewMethod))
                throw new ActionException((new StringBuilder()).append("view: ").append(class1.getName()).append(" can't use method with RemoteViews: ").append(methodName).append("()").toString());
            try
            {
                method.invoke(view1, new Object[0]);
                return;
            }
            catch (Exception exception)
            {
                throw new ActionException(exception);
            }
        }

        public String getActionName()
        {
            return "ReflectionActionWithoutParams";
        }

        public int mergeBehavior()
        {
            return methodName.equals("showNext") || methodName.equals("showPrevious") ? 2 : 0;
        }

        public void writeToParcel(Parcel parcel, int i)
        {
            parcel.writeInt(5);
            parcel.writeInt(super.viewId);
            parcel.writeString(methodName);
        }

        ReflectionActionWithoutParams(int i, String s)
        {
            this$0 = RemoteViews.this;
            Action();
            super.viewId = i;
            methodName = s;
        }

        ReflectionActionWithoutParams(Parcel parcel)
        {
            this$0 = RemoteViews.this;
            Action();
            super.viewId = parcel.readInt();
            methodName = parcel.readString();
        }
    }

    public static interface RemoteView
        extends Annotation
    {
    }

    private class SetDrawableParameters extends Action
    {

        public static final int TAG = 3;
        int alpha;
        int colorFilter;
        android.graphics.PorterDuff.Mode filterMode;
        int level;
        boolean targetBackground;
        final RemoteViews this$0;

        public void apply(View view, ViewGroup viewgroup, OnClickHandler onclickhandler)
        {
            View view1 = view.findViewById(super.viewId);
            if (view1 != null)
            {
                Drawable drawable;
                if (targetBackground)
                {
                    drawable = view1.getBackground();
                } else
                {
                    boolean flag = view1 instanceof ImageView;
                    drawable = null;
                    if (flag)
                        drawable = ((ImageView)view1).getDrawable();
                }
                if (drawable != null)
                {
                    if (alpha != -1)
                        drawable.setAlpha(alpha);
                    if (colorFilter != -1 && filterMode != null)
                        drawable.setColorFilter(colorFilter, filterMode);
                    if (level != -1)
                    {
                        drawable.setLevel(level);
                        return;
                    }
                }
            }
        }

        public String getActionName()
        {
            return "SetDrawableParameters";
        }

        public void writeToParcel(Parcel parcel, int i)
        {
            parcel.writeInt(3);
            parcel.writeInt(super.viewId);
            int j;
            if (targetBackground)
                j = 1;
            else
                j = 0;
            parcel.writeInt(j);
            parcel.writeInt(alpha);
            parcel.writeInt(colorFilter);
            if (filterMode != null)
            {
                parcel.writeInt(1);
                parcel.writeString(filterMode.toString());
            } else
            {
                parcel.writeInt(0);
            }
            parcel.writeInt(level);
        }

        public SetDrawableParameters(int i, boolean flag, int j, int k, android.graphics.PorterDuff.Mode mode, int l)
        {
            this$0 = RemoteViews.this;
            Action();
            super.viewId = i;
            targetBackground = flag;
            alpha = j;
            colorFilter = k;
            filterMode = mode;
            level = l;
        }

        public SetDrawableParameters(Parcel parcel)
        {
            this$0 = RemoteViews.this;
            Action();
            super.viewId = parcel.readInt();
            boolean flag;
            if (parcel.readInt() != 0)
                flag = true;
            else
                flag = false;
            targetBackground = flag;
            alpha = parcel.readInt();
            colorFilter = parcel.readInt();
            boolean flag1;
            if (parcel.readInt() != 0)
                flag1 = true;
            else
                flag1 = false;
            if (flag1)
                filterMode = android.graphics.PorterDuff.Mode.valueOf(parcel.readString());
            else
                filterMode = null;
            level = parcel.readInt();
        }
    }

    private class SetEmptyView extends Action
    {

        public static final int TAG = 6;
        int emptyViewId;
        final RemoteViews this$0;
        int viewId;

        public void apply(View view, ViewGroup viewgroup, OnClickHandler onclickhandler)
        {
            View view1 = view.findViewById(viewId);
            if (view1 instanceof AdapterView)
            {
                AdapterView adapterview = (AdapterView)view1;
                View view2 = view.findViewById(emptyViewId);
                if (view2 != null)
                {
                    adapterview.setEmptyView(view2);
                    return;
                }
            }
        }

        public String getActionName()
        {
            return "SetEmptyView";
        }

        public void writeToParcel(Parcel parcel, int i)
        {
            parcel.writeInt(6);
            parcel.writeInt(viewId);
            parcel.writeInt(emptyViewId);
        }

        SetEmptyView(int i, int j)
        {
            this$0 = RemoteViews.this;
            Action();
            viewId = i;
            emptyViewId = j;
        }

        SetEmptyView(Parcel parcel)
        {
            this$0 = RemoteViews.this;
            Action();
            viewId = parcel.readInt();
            emptyViewId = parcel.readInt();
        }
    }

    private class SetOnClickFillInIntent extends Action
    {

        public static final int TAG = 9;
        Intent fillInIntent;
        final RemoteViews this$0;

        public void apply(View view, ViewGroup viewgroup, OnClickHandler onclickhandler)
        {
            View view1 = view.findViewById(super.viewId);
            if (view1 != null)
            {
                if (!mIsWidgetCollectionChild)
                {
                    Log.e("RemoteViews", "The method setOnClickFillInIntent is available only from RemoteViewsFactory (ie. on collection items).");
                    return;
                }
                if (view1 == view)
                {
                    view1.setTagInternal(0x1020247, fillInIntent);
                    return;
                }
                if (view1 != null && fillInIntent != null)
                {
                    view1.setOnClickListener(onclickhandler. new android.view.View.OnClickListener() {

                        final SetOnClickFillInIntent this$1;
                        final OnClickHandler val$handler;

                        public void onClick(View view)
                        {
                            View view1;
                            for (view1 = (View)view.getParent(); view1 != null && !(view1 instanceof AdapterView) && !(view1 instanceof AppWidgetHostView); view1 = (View)view1.getParent());
                            if (!(view1 instanceof AppWidgetHostView) && view1 != null)
                            {
                                if (!(view1.getTag() instanceof PendingIntent))
                                {
                                    Log.e("RemoteViews", "Attempting setOnClickFillInIntent without calling setPendingIntentTemplate on parent.");
                                    return;
                                } else
                                {
                                    PendingIntent pendingintent = (PendingIntent)view1.getTag();
                                    float f = view.getContext().getResources().getCompatibilityInfo().applicationScale;
                                    int ai[] = new int[2];
                                    view.getLocationOnScreen(ai);
                                    Rect rect = new Rect();
                                    rect.left = (int)(0.5F + f * (float)ai[0]);
                                    rect.top = (int)(0.5F + f * (float)ai[1]);
                                    rect.right = (int)(0.5F + f * (float)(ai[0] + view.getWidth()));
                                    rect.bottom = (int)(0.5F + f * (float)(ai[1] + view.getHeight()));
                                    fillInIntent.setSourceBounds(rect);
                                    handler.onClickHandler(view, pendingintent, fillInIntent);
                                    return;
                                }
                            } else
                            {
                                Log.e("RemoteViews", "Collection item doesn't have AdapterView parent");
                                return;
                            }
                        }

            
            {
                this$1 = final_setonclickfillinintent;
                handler = OnClickHandler.this;
                Object();
            }
                    }
);
                    return;
                }
            }
        }

        public String getActionName()
        {
            return "SetOnClickFillInIntent";
        }

        public void writeToParcel(Parcel parcel, int i)
        {
            parcel.writeInt(9);
            parcel.writeInt(super.viewId);
            fillInIntent.writeToParcel(parcel, 0);
        }

        public SetOnClickFillInIntent(int i, Intent intent)
        {
            this$0 = RemoteViews.this;
            Action();
            super.viewId = i;
            fillInIntent = intent;
        }

        public SetOnClickFillInIntent(Parcel parcel)
        {
            this$0 = RemoteViews.this;
            Action();
            super.viewId = parcel.readInt();
            fillInIntent = (Intent)Intent.CREATOR.createFromParcel(parcel);
        }
    }

    private class SetOnClickPendingIntent extends Action
    {

        public static final int TAG = 1;
        PendingIntent pendingIntent;
        final RemoteViews this$0;

        public void apply(View view, ViewGroup viewgroup, OnClickHandler onclickhandler)
        {
label0:
            {
                View view1 = view.findViewById(super.viewId);
                if (view1 == null)
                    break label0;
                if (mIsWidgetCollectionChild)
                {
                    Log.w("RemoteViews", (new StringBuilder()).append("Cannot setOnClickPendingIntent for collection item (id: ").append(super.viewId).append(")").toString());
                    ApplicationInfo applicationinfo = view.getContext().getApplicationInfo();
                    if (applicationinfo != null && applicationinfo.targetSdkVersion >= 16)
                        break label0;
                }
                if (view1 != null)
                {
                    PendingIntent pendingintent = pendingIntent;
                    android.view.View.OnClickListener onclicklistener = null;
                    if (pendingintent != null)
                        onclicklistener = onclickhandler. new android.view.View.OnClickListener() {

                            final SetOnClickPendingIntent this$1;
                            final OnClickHandler val$handler;

                            public void onClick(View view)
                            {
                                float f = view.getContext().getResources().getCompatibilityInfo().applicationScale;
                                int ai[] = new int[2];
                                view.getLocationOnScreen(ai);
                                Rect rect = new Rect();
                                rect.left = (int)(0.5F + f * (float)ai[0]);
                                rect.top = (int)(0.5F + f * (float)ai[1]);
                                rect.right = (int)(0.5F + f * (float)(ai[0] + view.getWidth()));
                                rect.bottom = (int)(0.5F + f * (float)(ai[1] + view.getHeight()));
                                Intent intent = new Intent();
                                intent.setSourceBounds(rect);
                                handler.onClickHandler(view, pendingIntent, intent);
                            }

            
            {
                this$1 = final_setonclickpendingintent;
                handler = OnClickHandler.this;
                Object();
            }
                        }
;
                    view1.setOnClickListener(onclicklistener);
                    return;
                }
            }
        }

        public String getActionName()
        {
            return "SetOnClickPendingIntent";
        }

        public void writeToParcel(Parcel parcel, int i)
        {
            int j = 1;
            parcel.writeInt(j);
            parcel.writeInt(super.viewId);
            if (pendingIntent == null)
                j = 0;
            parcel.writeInt(j);
            if (pendingIntent != null)
                pendingIntent.writeToParcel(parcel, 0);
        }

        public SetOnClickPendingIntent(int i, PendingIntent pendingintent)
        {
            this$0 = RemoteViews.this;
            Action();
            super.viewId = i;
            pendingIntent = pendingintent;
        }

        public SetOnClickPendingIntent(Parcel parcel)
        {
            this$0 = RemoteViews.this;
            Action();
            super.viewId = parcel.readInt();
            if (parcel.readInt() != 0)
                pendingIntent = PendingIntent.readPendingIntentOrNullFromParcel(parcel);
        }
    }

    private class SetPendingIntentTemplate extends Action
    {

        public static final int TAG = 8;
        PendingIntent pendingIntentTemplate;
        final RemoteViews this$0;

        public void apply(View view, ViewGroup viewgroup, OnClickHandler onclickhandler)
        {
            View view1 = view.findViewById(super.viewId);
            if (view1 == null)
                return;
            if (view1 instanceof AdapterView)
            {
                AdapterView adapterview = (AdapterView)view1;
                adapterview.setOnItemClickListener(onclickhandler. new AdapterView.OnItemClickListener() {

                    final SetPendingIntentTemplate this$1;
                    final OnClickHandler val$handler;

                    public void onItemClick(AdapterView adapterview, View view, int i, long l)
                    {
                        if (!(view instanceof ViewGroup)) goto _L2; else goto _L1
_L1:
                        ViewGroup viewgroup;
                        viewgroup = (ViewGroup)view;
                        if (adapterview instanceof AdapterViewAnimator)
                            viewgroup = (ViewGroup)viewgroup.getChildAt(0);
                        if (viewgroup == null) goto _L2; else goto _L3
_L3:
                        int j;
                        int k;
                        j = viewgroup.getChildCount();
                        k = 0;
_L9:
                        Intent intent = null;
                        if (k >= j) goto _L5; else goto _L4
_L4:
                        Object obj = viewgroup.getChildAt(k).getTag(0x1020247);
                        if (!(obj instanceof Intent)) goto _L7; else goto _L6
_L6:
                        intent = (Intent)obj;
_L5:
                        if (intent != null)
                        {
                            float f = view.getContext().getResources().getCompatibilityInfo().applicationScale;
                            int ai[] = new int[2];
                            view.getLocationOnScreen(ai);
                            Rect rect = new Rect();
                            rect.left = (int)(0.5F + f * (float)ai[0]);
                            rect.top = (int)(0.5F + f * (float)ai[1]);
                            rect.right = (int)(0.5F + f * (float)(ai[0] + view.getWidth()));
                            rect.bottom = (int)(0.5F + f * (float)(ai[1] + view.getHeight()));
                            (new Intent()).setSourceBounds(rect);
                            handler.onClickHandler(view, pendingIntentTemplate, intent);
                            return;
                        }
_L2:
                        return;
_L7:
                        k++;
                        if (true) goto _L9; else goto _L8
_L8:
                    }

            
            {
                this$1 = final_setpendingintenttemplate;
                handler = OnClickHandler.this;
                Object();
            }
                }
);
                adapterview.setTag(pendingIntentTemplate);
                return;
            } else
            {
                Log.e("RemoteViews", (new StringBuilder()).append("Cannot setPendingIntentTemplate on a view which is notan AdapterView (id: ").append(super.viewId).append(")").toString());
                return;
            }
        }

        public String getActionName()
        {
            return "SetPendingIntentTemplate";
        }

        public void writeToParcel(Parcel parcel, int i)
        {
            parcel.writeInt(8);
            parcel.writeInt(super.viewId);
            pendingIntentTemplate.writeToParcel(parcel, 0);
        }

        public SetPendingIntentTemplate(int i, PendingIntent pendingintent)
        {
            this$0 = RemoteViews.this;
            Action();
            super.viewId = i;
            pendingIntentTemplate = pendingintent;
        }

        public SetPendingIntentTemplate(Parcel parcel)
        {
            this$0 = RemoteViews.this;
            Action();
            super.viewId = parcel.readInt();
            pendingIntentTemplate = PendingIntent.readPendingIntentOrNullFromParcel(parcel);
        }
    }

    private class SetRemoteViewsAdapterIntent extends Action
    {

        public static final int TAG = 10;
        Intent intent;
        final RemoteViews this$0;

        public void apply(View view, ViewGroup viewgroup, OnClickHandler onclickhandler)
        {
            View view1 = view.findViewById(super.viewId);
            if (view1 != null)
            {
                if (!(viewgroup instanceof AppWidgetHostView))
                {
                    Log.e("RemoteViews", (new StringBuilder()).append("SetRemoteViewsAdapterIntent action can only be used for AppWidgets (root id: ").append(super.viewId).append(")").toString());
                    return;
                }
                if (!(view1 instanceof AbsListView) && !(view1 instanceof AdapterViewAnimator))
                {
                    Log.e("RemoteViews", (new StringBuilder()).append("Cannot setRemoteViewsAdapter on a view which is not an AbsListView or AdapterViewAnimator (id: ").append(super.viewId).append(")").toString());
                    return;
                }
                AppWidgetHostView appwidgethostview = (AppWidgetHostView)viewgroup;
                intent.putExtra("remoteAdapterAppWidgetId", appwidgethostview.getAppWidgetId());
                if (view1 instanceof AbsListView)
                {
                    AbsListView abslistview = (AbsListView)view1;
                    abslistview.setRemoteViewsAdapter(intent);
                    abslistview.setRemoteViewsOnClickHandler(onclickhandler);
                    return;
                }
                if (view1 instanceof AdapterViewAnimator)
                {
                    AdapterViewAnimator adapterviewanimator = (AdapterViewAnimator)view1;
                    adapterviewanimator.setRemoteViewsAdapter(intent);
                    adapterviewanimator.setRemoteViewsOnClickHandler(onclickhandler);
                    return;
                }
            }
        }

        public String getActionName()
        {
            return "SetRemoteViewsAdapterIntent";
        }

        public void writeToParcel(Parcel parcel, int i)
        {
            parcel.writeInt(10);
            parcel.writeInt(super.viewId);
            intent.writeToParcel(parcel, i);
        }

        public SetRemoteViewsAdapterIntent(int i, Intent intent1)
        {
            this$0 = RemoteViews.this;
            Action();
            super.viewId = i;
            intent = intent1;
        }

        public SetRemoteViewsAdapterIntent(Parcel parcel)
        {
            this$0 = RemoteViews.this;
            Action();
            super.viewId = parcel.readInt();
            intent = (Intent)Intent.CREATOR.createFromParcel(parcel);
        }
    }

    private class TextViewDrawableAction extends Action
    {

        public static final int TAG = 11;
        int d1;
        int d2;
        int d3;
        int d4;
        boolean isRelative;
        final RemoteViews this$0;

        public void apply(View view, ViewGroup viewgroup, OnClickHandler onclickhandler)
        {
            view.getContext();
            TextView textview = (TextView)view.findViewById(super.viewId);
            if (textview == null)
                return;
            if (isRelative)
            {
                textview.setCompoundDrawablesRelativeWithIntrinsicBounds(d1, d2, d3, d4);
                return;
            } else
            {
                textview.setCompoundDrawablesWithIntrinsicBounds(d1, d2, d3, d4);
                return;
            }
        }

        public String getActionName()
        {
            return "TextViewDrawableAction";
        }

        public void writeToParcel(Parcel parcel, int i)
        {
            parcel.writeInt(11);
            parcel.writeInt(super.viewId);
            int j;
            if (isRelative)
                j = 1;
            else
                j = 0;
            parcel.writeInt(j);
            parcel.writeInt(d1);
            parcel.writeInt(d2);
            parcel.writeInt(d3);
            parcel.writeInt(d4);
        }

        public TextViewDrawableAction(int i, boolean flag, int j, int k, int l, int i1)
        {
            this$0 = RemoteViews.this;
            Action();
            isRelative = false;
            super.viewId = i;
            isRelative = flag;
            d1 = j;
            d2 = k;
            d3 = l;
            d4 = i1;
        }

        public TextViewDrawableAction(Parcel parcel)
        {
            this$0 = RemoteViews.this;
            Action();
            isRelative = false;
            super.viewId = parcel.readInt();
            int i = parcel.readInt();
            boolean flag = false;
            if (i != 0)
                flag = true;
            isRelative = flag;
            d1 = parcel.readInt();
            d2 = parcel.readInt();
            d3 = parcel.readInt();
            d4 = parcel.readInt();
        }
    }

    private class TextViewSizeAction extends Action
    {

        public static final int TAG = 13;
        float size;
        final RemoteViews this$0;
        int units;

        public void apply(View view, ViewGroup viewgroup, OnClickHandler onclickhandler)
        {
            view.getContext();
            TextView textview = (TextView)view.findViewById(super.viewId);
            if (textview == null)
            {
                return;
            } else
            {
                textview.setTextSize(units, size);
                return;
            }
        }

        public String getActionName()
        {
            return "TextViewSizeAction";
        }

        public void writeToParcel(Parcel parcel, int i)
        {
            parcel.writeInt(13);
            parcel.writeInt(super.viewId);
            parcel.writeInt(units);
            parcel.writeFloat(size);
        }

        public TextViewSizeAction(int i, int j, float f)
        {
            this$0 = RemoteViews.this;
            Action();
            super.viewId = i;
            units = j;
            size = f;
        }

        public TextViewSizeAction(Parcel parcel)
        {
            this$0 = RemoteViews.this;
            Action();
            super.viewId = parcel.readInt();
            units = parcel.readInt();
            size = parcel.readFloat();
        }
    }

    private class ViewGroupAction extends Action
    {

        public static final int TAG = 4;
        RemoteViews nestedViews;
        final RemoteViews this$0;

        public void apply(View view, ViewGroup viewgroup, OnClickHandler onclickhandler)
        {
            Context context = view.getContext();
            ViewGroup viewgroup1 = (ViewGroup)view.findViewById(super.viewId);
            if (viewgroup1 == null)
                return;
            if (nestedViews != null)
            {
                viewgroup1.addView(nestedViews.apply(context, viewgroup1, onclickhandler));
                return;
            } else
            {
                viewgroup1.removeAllViews();
                return;
            }
        }

        public String getActionName()
        {
            if ((new StringBuilder()).append("ViewGroupAction").append(nestedViews).toString() == null)
                return "Remove";
            else
                return "Add";
        }

        public int mergeBehavior()
        {
            return 1;
        }

        public void setBitmapCache(BitmapCache bitmapcache)
        {
            if (nestedViews != null)
                nestedViews.setBitmapCache(bitmapcache);
        }

        public void updateMemoryUsageEstimate(MemoryUsageCounter memoryusagecounter)
        {
            if (nestedViews != null)
                memoryusagecounter.increment(nestedViews.estimateMemoryUsage());
        }

        public void writeToParcel(Parcel parcel, int i)
        {
            parcel.writeInt(4);
            parcel.writeInt(super.viewId);
            if (nestedViews != null)
            {
                parcel.writeInt(1);
                nestedViews.writeToParcel(parcel, i);
                return;
            } else
            {
                parcel.writeInt(0);
                return;
            }
        }

        public ViewGroupAction(int i, RemoteViews remoteviews1)
        {
            this$0 = RemoteViews.this;
            Action();
            super.viewId = i;
            nestedViews = remoteviews1;
            if (remoteviews1 != null)
                configureRemoteViewsAsChild(remoteviews1);
        }

        public ViewGroupAction(Parcel parcel, BitmapCache bitmapcache)
        {
            this$0 = RemoteViews.this;
            super();
            super.viewId = parcel.readInt();
            boolean flag;
            if (parcel.readInt() == 0)
                flag = true;
            else
                flag = false;
            if (!flag)
            {
                nestedViews = new RemoteViews(parcel, bitmapcache);
                return;
            } else
            {
                nestedViews = null;
                return;
            }
        }
    }

    private class ViewPaddingAction extends Action
    {

        public static final int TAG = 14;
        int bottom;
        int left;
        int right;
        final RemoteViews this$0;
        int top;

        public void apply(View view, ViewGroup viewgroup, OnClickHandler onclickhandler)
        {
            view.getContext();
            View view1 = view.findViewById(super.viewId);
            if (view1 == null)
            {
                return;
            } else
            {
                view1.setPadding(left, top, right, bottom);
                return;
            }
        }

        public String getActionName()
        {
            return "ViewPaddingAction";
        }

        public void writeToParcel(Parcel parcel, int i)
        {
            parcel.writeInt(14);
            parcel.writeInt(super.viewId);
            parcel.writeInt(left);
            parcel.writeInt(top);
            parcel.writeInt(right);
            parcel.writeInt(bottom);
        }

        public ViewPaddingAction(int i, int j, int k, int l, int i1)
        {
            this$0 = RemoteViews.this;
            super();
            super.viewId = i;
            left = j;
            top = k;
            right = l;
            bottom = i1;
        }

        public ViewPaddingAction(Parcel parcel)
        {
            this$0 = RemoteViews.this;
            super();
            super.viewId = parcel.readInt();
            left = parcel.readInt();
            top = parcel.readInt();
            right = parcel.readInt();
            bottom = parcel.readInt();
        }
    }


    public static final android.os.Parcelable.Creator CREATOR = new android.os.Parcelable.Creator() {

        public RemoteViews createFromParcel(Parcel parcel)
        {
            return new RemoteViews(parcel);
        }

        public volatile Object createFromParcel(Parcel parcel)
        {
            return createFromParcel(parcel);
        }

        public RemoteViews[] newArray(int i)
        {
            return new RemoteViews[i];
        }

        public volatile Object[] newArray(int i)
        {
            return newArray(i);
        }

    }
;
    private static final OnClickHandler DEFAULT_ON_CLICK_HANDLER = new OnClickHandler();
    static final String EXTRA_REMOTEADAPTER_APPWIDGET_ID = "remoteAdapterAppWidgetId";
    private static final String LOG_TAG = "RemoteViews";
    private static final int MODE_HAS_LANDSCAPE_AND_PORTRAIT = 1;
    private static final int MODE_NORMAL;
    private ArrayList mActions;
    private BitmapCache mBitmapCache;
    private boolean mHasUsedCustomerView;
    private boolean mIsRoot;
    private boolean mIsWidgetCollectionChild;
    private RemoteViews mLandscape;
    private final int mLayoutId;
    private MemoryUsageCounter mMemoryUsageCounter;
    private final String mPackage;
    private RemoteViews mPortrait;
    private UserHandle mUser;

    public RemoteViews(Parcel parcel)
    {
        this(parcel, ((BitmapCache) (null)));
    }

    private RemoteViews(Parcel parcel, BitmapCache bitmapcache)
    {
label0:
        {
            boolean flag = true;
            super();
            mUser = Process.myUserHandle();
            mIsRoot = flag;
            mLandscape = null;
            mPortrait = null;
            mIsWidgetCollectionChild = false;
            int i = parcel.readInt();
            if (bitmapcache == null)
            {
                mBitmapCache = new BitmapCache(parcel);
            } else
            {
                setBitmapCache(bitmapcache);
                setNotRoot();
            }
            if (i == 0)
            {
                mPackage = parcel.readString();
                mLayoutId = parcel.readInt();
                if (parcel.readInt() != flag)
                    flag = false;
                mIsWidgetCollectionChild = flag;
                int j = parcel.readInt();
                if (j <= 0)
                    break label0;
                mActions = new ArrayList(j);
                int k = 0;
                int l;
label1:
                do
                {
                    if (k >= j)
                        break label0;
                    l = parcel.readInt();
                    switch (l)
                    {
                    case 7: // '\007'
                    default:
                        break label1;

                    case 12: // '\f'
                        mActions.add(new BitmapReflectionAction(parcel));
                        break;

                    case 14: // '\016'
                        mActions.add(new ViewPaddingAction(parcel));
                        break;

                    case 13: // '\r'
                        mActions.add(new TextViewSizeAction(parcel));
                        break;

                    case 11: // '\013'
                        mActions.add(new TextViewDrawableAction(parcel));
                        break;

                    case 10: // '\n'
                        mActions.add(new SetRemoteViewsAdapterIntent(parcel));
                        break;

                    case 9: // '\t'
                        mActions.add(new SetOnClickFillInIntent(parcel));
                        break;

                    case 8: // '\b'
                        mActions.add(new SetPendingIntentTemplate(parcel));
                        break;

                    case 6: // '\006'
                        mActions.add(new SetEmptyView(parcel));
                        break;

                    case 5: // '\005'
                        mActions.add(new ReflectionActionWithoutParams(parcel));
                        break;

                    case 4: // '\004'
                        mActions.add(new ViewGroupAction(parcel, mBitmapCache));
                        break;

                    case 2: // '\002'
                        mActions.add(new ReflectionAction(parcel));
                        break;

                    case 3: // '\003'
                        mActions.add(new SetDrawableParameters(parcel));
                        break;

                    case 1: // '\001'
                        mActions.add(new SetOnClickPendingIntent(parcel));
                        break;
                    }
                    k++;
                } while (true);
                throw new ActionException((new StringBuilder()).append("Tag ").append(l).append(" not found").toString());
            }
            mLandscape = new RemoteViews(parcel, mBitmapCache);
            mPortrait = new RemoteViews(parcel, mBitmapCache);
            mPackage = mPortrait.getPackage();
            mLayoutId = mPortrait.getLayoutId();
        }
        mMemoryUsageCounter = new MemoryUsageCounter();
        recalculateMemoryUsage();
    }


    public RemoteViews(RemoteViews remoteviews, RemoteViews remoteviews1)
    {
        mUser = Process.myUserHandle();
        mIsRoot = true;
        mLandscape = null;
        mPortrait = null;
        mIsWidgetCollectionChild = false;
        if (remoteviews != null && remoteviews1 != null)
        {
            if (remoteviews.getPackage().compareTo(remoteviews1.getPackage()) != 0)
            {
                throw new RuntimeException("Both RemoteViews must share the same package");
            } else
            {
                mPackage = remoteviews1.getPackage();
                mLayoutId = remoteviews1.getLayoutId();
                mLandscape = remoteviews;
                mPortrait = remoteviews1;
                mMemoryUsageCounter = new MemoryUsageCounter();
                mBitmapCache = new BitmapCache();
                configureRemoteViewsAsChild(remoteviews);
                configureRemoteViewsAsChild(remoteviews1);
                recalculateMemoryUsage();
                return;
            }
        } else
        {
            throw new RuntimeException("Both RemoteViews must be non-null");
        }
    }

    public RemoteViews(String s, int i)
    {
        mUser = Process.myUserHandle();
        mIsRoot = true;
        mLandscape = null;
        mPortrait = null;
        mIsWidgetCollectionChild = false;
        mPackage = s;
        mLayoutId = i;
        mBitmapCache = new BitmapCache();
        mMemoryUsageCounter = new MemoryUsageCounter();
        recalculateMemoryUsage();
    }

    private void addAction(Action action)
    {
        if (hasLandscapeAndPortraitLayouts())
            throw new RuntimeException("RemoteViews specifying separate landscape and portrait layouts cannot be modified. Instead, fully configure the landscape and portrait layouts individually before constructing the combined layout.");
        if (mActions == null)
            mActions = new ArrayList();
        mActions.add(action);
        action.updateMemoryUsageEstimate(mMemoryUsageCounter);
    }

    private void configureRemoteViewsAsChild(RemoteViews remoteviews)
    {
        mBitmapCache.assimilate(remoteviews.mBitmapCache);
        remoteviews.setBitmapCache(mBitmapCache);
        remoteviews.setNotRoot();
    }

    private RemoteViews getRemoteViewsToApply(Context context)
    {
label0:
        {
            if (hasLandscapeAndPortraitLayouts())
            {
                if (context.getResources().getConfiguration().orientation != 2)
                    break label0;
                this = mLandscape;
            }
            return this;
        }
        return mPortrait;
    }

    private boolean hasLandscapeAndPortraitLayouts()
    {
        return mLandscape != null && mPortrait != null;
    }

    private void performApply(View view, ViewGroup viewgroup, OnClickHandler onclickhandler)
    {
        if (mActions != null)
        {
            if (onclickhandler == null)
                onclickhandler = DEFAULT_ON_CLICK_HANDLER;
            int i = mActions.size();
            for (int j = 0; j < i; j++)
                ((Action)mActions.get(j)).apply(view, viewgroup, onclickhandler);

        }
    }

    private Context prepareContext(Context context)
    {
        String s = mPackage;
        if (s != null)
        {
            Context context1;
            try
            {
                context1 = AppWidgetContext.newWidgetContextAsUser(context, s, mHasUsedCustomerView, mUser);
            }
            catch (android.content.pm.PackageManager.NameNotFoundException namenotfoundexception)
            {
                Log.e("RemoteViews", (new StringBuilder()).append("Package name ").append(s).append(" not found").toString());
                return context;
            }
            return context1;
        } else
        {
            return context;
        }
    }

    private void recalculateMemoryUsage()
    {
        mMemoryUsageCounter.clear();
        if (!hasLandscapeAndPortraitLayouts())
        {
            if (mActions != null)
            {
                int i = mActions.size();
                for (int j = 0; j < i; j++)
                    ((Action)mActions.get(j)).updateMemoryUsageEstimate(mMemoryUsageCounter);

            }
            if (mIsRoot)
                mBitmapCache.addBitmapMemory(mMemoryUsageCounter);
            return;
        } else
        {
            mMemoryUsageCounter.increment(mLandscape.estimateMemoryUsage());
            mMemoryUsageCounter.increment(mPortrait.estimateMemoryUsage());
            mBitmapCache.addBitmapMemory(mMemoryUsageCounter);
            return;
        }
    }

    private void setBitmapCache(BitmapCache bitmapcache)
    {
        mBitmapCache = bitmapcache;
        if (!hasLandscapeAndPortraitLayouts())
        {
            if (mActions != null)
            {
                int i = mActions.size();
                for (int j = 0; j < i; j++)
                    ((Action)mActions.get(j)).setBitmapCache(bitmapcache);

            }
        } else
        {
            mLandscape.setBitmapCache(bitmapcache);
            mPortrait.setBitmapCache(bitmapcache);
        }
    }

    public void addView(int i, RemoteViews remoteviews)
    {
        addAction(new ViewGroupAction(i, remoteviews));
    }

    public View apply(Context context, ViewGroup viewgroup)
    {
        return apply(context, viewgroup, null);
    }

    public View apply(Context context, ViewGroup viewgroup, OnClickHandler onclickhandler)
    {
        RemoteViews remoteviews = getRemoteViewsToApply(context);
        Context context1 = prepareContext(context);
        LayoutInflater layoutinflater = ((LayoutInflater)context1.getSystemService("layout_inflater")).cloneInContext(context1);
        layoutinflater.setFilter(this);
        View view = layoutinflater.inflate(remoteviews.getLayoutId(), viewgroup, false);
        remoteviews.performApply(view, viewgroup, onclickhandler);
        return view;
    }

    public RemoteViews clone()
    {
        Parcel parcel = Parcel.obtain();
        writeToParcel(parcel, 0);
        parcel.setDataPosition(0);
        return new RemoteViews(parcel);
    }

    public volatile Object clone()
        throws CloneNotSupportedException
    {
        return clone();
    }

    public int describeContents()
    {
        return 0;
    }

    public int estimateMemoryUsage()
    {
        return mMemoryUsageCounter.getMemoryUsage();
    }

    public int getLayoutId()
    {
        return mLayoutId;
    }

    public String getPackage()
    {
        return mPackage;
    }

    public void mergeRemoteViews(RemoteViews remoteviews)
    {
        if (remoteviews != null)
        {
            RemoteViews remoteviews1 = remoteviews.clone();
            HashMap hashmap = new HashMap();
            if (mActions == null)
                mActions = new ArrayList();
            int i = mActions.size();
            for (int j = 0; j < i; j++)
            {
                Action action1 = (Action)mActions.get(j);
                hashmap.put(action1.getUniqueKey(), action1);
            }

            ArrayList arraylist = remoteviews1.mActions;
            if (arraylist != null)
            {
                int k = arraylist.size();
                for (int l = 0; l < k; l++)
                {
                    Action action = (Action)arraylist.get(l);
                    String s = ((Action)arraylist.get(l)).getUniqueKey();
                    int i1 = ((Action)arraylist.get(l)).mergeBehavior();
                    if (hashmap.containsKey(s) && i1 == 0)
                    {
                        mActions.remove(hashmap.get(s));
                        hashmap.remove(s);
                    }
                    if (i1 == 0 || i1 == 1)
                        mActions.add(action);
                }

                mBitmapCache = new BitmapCache();
                setBitmapCache(mBitmapCache);
                return;
            }
        }
    }

    public boolean onLoadClass(Class class1)
    {
        return class1.isAnnotationPresent(android/widget/RemoteViews$RemoteView);
    }

    public void reapply(Context context, View view)
    {
        reapply(context, view, null);
    }

    public void reapply(Context context, View view, OnClickHandler onclickhandler)
    {
        RemoteViews remoteviews = getRemoteViewsToApply(context);
        if (hasLandscapeAndPortraitLayouts() && view.getId() != remoteviews.getLayoutId())
        {
            throw new RuntimeException("Attempting to re-apply RemoteViews to a view that that does not share the same root layout id.");
        } else
        {
            prepareContext(context);
            remoteviews.performApply(view, (ViewGroup)view.getParent(), onclickhandler);
            return;
        }
    }

    public void removeAllViews(int i)
    {
        addAction(new ViewGroupAction(i, null));
    }

    public void setBitmap(int i, String s, Bitmap bitmap)
    {
        addAction(new BitmapReflectionAction(i, s, bitmap));
    }

    public void setBoolean(int i, String s, boolean flag)
    {
        addAction(new ReflectionAction(i, s, 1, Boolean.valueOf(flag)));
    }

    public void setBundle(int i, String s, Bundle bundle)
    {
        addAction(new ReflectionAction(i, s, 13, bundle));
    }

    public void setByte(int i, String s, byte byte0)
    {
        addAction(new ReflectionAction(i, s, 2, Byte.valueOf(byte0)));
    }

    public void setChar(int i, String s, char c)
    {
        addAction(new ReflectionAction(i, s, 8, Character.valueOf(c)));
    }

    public void setCharSequence(int i, String s, CharSequence charsequence)
    {
        addAction(new ReflectionAction(i, s, 10, charsequence));
    }

    public void setChronometer(int i, long l, String s, boolean flag)
    {
        setLong(i, "setBase", l);
        setString(i, "setFormat", s);
        setBoolean(i, "setStarted", flag);
    }

    public void setContentDescription(int i, CharSequence charsequence)
    {
        setCharSequence(i, "setContentDescription", charsequence);
    }

    public void setDisplayedChild(int i, int j)
    {
        setInt(i, "setDisplayedChild", j);
    }

    public void setDouble(int i, String s, double d)
    {
        addAction(new ReflectionAction(i, s, 7, Double.valueOf(d)));
    }

    public void setDrawableParameters(int i, boolean flag, int j, int k, android.graphics.PorterDuff.Mode mode, int l)
    {
        addAction(new SetDrawableParameters(i, flag, j, k, mode, l));
    }

    public void setEmptyView(int i, int j)
    {
        addAction(new SetEmptyView(i, j));
    }

    public void setFloat(int i, String s, float f)
    {
        addAction(new ReflectionAction(i, s, 6, Float.valueOf(f)));
    }

    public void setHasUsedCustomerView(boolean flag)
    {
        mHasUsedCustomerView = flag;
    }

    public void setImageViewBitmap(int i, Bitmap bitmap)
    {
        setBitmap(i, "setImageBitmap", bitmap);
    }

    public void setImageViewResource(int i, int j)
    {
        setInt(i, "setImageResource", j);
    }

    public void setImageViewUri(int i, Uri uri)
    {
        setUri(i, "setImageURI", uri);
    }

    public void setInt(int i, String s, int j)
    {
        addAction(new ReflectionAction(i, s, 4, Integer.valueOf(j)));
    }

    public void setIntent(int i, String s, Intent intent)
    {
        addAction(new ReflectionAction(i, s, 14, intent));
    }

    void setIsWidgetCollectionChild(boolean flag)
    {
        mIsWidgetCollectionChild = flag;
    }

    public void setLabelFor(int i, int j)
    {
        setInt(i, "setLabelFor", j);
    }

    public void setLong(int i, String s, long l)
    {
        addAction(new ReflectionAction(i, s, 5, Long.valueOf(l)));
    }

    void setNotRoot()
    {
        mIsRoot = false;
    }

    public void setOnClickFillInIntent(int i, Intent intent)
    {
        addAction(new SetOnClickFillInIntent(i, intent));
    }

    public void setOnClickPendingIntent(int i, PendingIntent pendingintent)
    {
        addAction(new SetOnClickPendingIntent(i, pendingintent));
    }

    public void setPendingIntentTemplate(int i, PendingIntent pendingintent)
    {
        addAction(new SetPendingIntentTemplate(i, pendingintent));
    }

    public void setProgressBar(int i, int j, int k, boolean flag)
    {
        setBoolean(i, "setIndeterminate", flag);
        if (!flag)
        {
            setInt(i, "setMax", j);
            setInt(i, "setProgress", k);
        }
    }

    public void setRelativeScrollPosition(int i, int j)
    {
        setInt(i, "smoothScrollByOffset", j);
    }

    public void setRemoteAdapter(int i, int j, Intent intent)
    {
        setRemoteAdapter(j, intent);
    }

    public void setRemoteAdapter(int i, Intent intent)
    {
        addAction(new SetRemoteViewsAdapterIntent(i, intent));
    }

    public void setScrollPosition(int i, int j)
    {
        setInt(i, "smoothScrollToPosition", j);
    }

    public void setShort(int i, String s, short word0)
    {
        addAction(new ReflectionAction(i, s, 3, Short.valueOf(word0)));
    }

    public void setString(int i, String s, String s1)
    {
        addAction(new ReflectionAction(i, s, 9, s1));
    }

    public void setTextColor(int i, int j)
    {
        setInt(i, "setTextColor", j);
    }

    public void setTextViewCompoundDrawables(int i, int j, int k, int l, int i1)
    {
        addAction(new TextViewDrawableAction(i, false, j, k, l, i1));
    }

    public void setTextViewCompoundDrawablesRelative(int i, int j, int k, int l, int i1)
    {
        addAction(new TextViewDrawableAction(i, true, j, k, l, i1));
    }

    public void setTextViewText(int i, CharSequence charsequence)
    {
        setCharSequence(i, "setText", charsequence);
    }

    public void setTextViewTextSize(int i, int j, float f)
    {
        addAction(new TextViewSizeAction(i, j, f));
    }

    public void setUri(int i, String s, Uri uri)
    {
        addAction(new ReflectionAction(i, s, 11, uri.getCanonicalUri()));
    }

    public void setUser(UserHandle userhandle)
    {
        mUser = userhandle;
    }

    public void setViewPadding(int i, int j, int k, int l, int i1)
    {
        addAction(new ViewPaddingAction(i, j, k, l, i1));
    }

    public void setViewVisibility(int i, int j)
    {
        setInt(i, "setVisibility", j);
    }

    public void showNext(int i)
    {
        addAction(new ReflectionActionWithoutParams(i, "showNext"));
    }

    public void showPrevious(int i)
    {
        addAction(new ReflectionActionWithoutParams(i, "showPrevious"));
    }

    public void writeToParcel(Parcel parcel, int i)
    {
        int j = 1;
        if (!hasLandscapeAndPortraitLayouts())
        {
            parcel.writeInt(0);
            if (mIsRoot)
                mBitmapCache.writeBitmapsToParcel(parcel, i);
            parcel.writeString(mPackage);
            parcel.writeInt(mLayoutId);
            if (!mIsWidgetCollectionChild)
                j = 0;
            parcel.writeInt(j);
            int k;
            if (mActions != null)
                k = mActions.size();
            else
                k = 0;
            parcel.writeInt(k);
            for (int l = 0; l < k; l++)
                ((Action)mActions.get(l)).writeToParcel(parcel, 0);

        } else
        {
            parcel.writeInt(j);
            if (mIsRoot)
                mBitmapCache.writeBitmapsToParcel(parcel, i);
            mLandscape.writeToParcel(parcel, i);
            mPortrait.writeToParcel(parcel, i);
        }
    }





}
