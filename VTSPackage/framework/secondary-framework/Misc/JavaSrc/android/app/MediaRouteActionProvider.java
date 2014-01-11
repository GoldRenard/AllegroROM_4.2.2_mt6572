// Decompiled by Jad v1.5.8g. Copyright 2001 Pavel Kouznetsov.
// Jad home page: http://www.kpdus.com/jad.html
// Decompiler options: packimports(3) fieldsfirst noctor space 

package android.app;

import android.content.Context;
import android.content.ContextWrapper;
import android.media.MediaRouter;
import android.util.Log;
import android.view.*;
import com.android.internal.app.MediaRouteChooserDialogFragment;
import java.lang.ref.WeakReference;

// Referenced classes of package android.app:
//            Activity, MediaRouteButton, FragmentManager

public class MediaRouteActionProvider extends ActionProvider
{
    private static class RouterCallback extends android.media.MediaRouter.SimpleCallback
    {

        private WeakReference mAp;

        public void onRouteAdded(MediaRouter mediarouter, android.media.MediaRouter.RouteInfo routeinfo)
        {
            MediaRouteActionProvider mediarouteactionprovider = (MediaRouteActionProvider)mAp.get();
            if (mediarouteactionprovider == null)
            {
                mediarouter.removeCallback(this);
                return;
            } else
            {
                mediarouteactionprovider.refreshVisibility();
                return;
            }
        }

        public void onRouteRemoved(MediaRouter mediarouter, android.media.MediaRouter.RouteInfo routeinfo)
        {
            MediaRouteActionProvider mediarouteactionprovider = (MediaRouteActionProvider)mAp.get();
            if (mediarouteactionprovider == null)
            {
                mediarouter.removeCallback(this);
                return;
            } else
            {
                mediarouteactionprovider.refreshVisibility();
                return;
            }
        }

        RouterCallback(MediaRouteActionProvider mediarouteactionprovider)
        {
            mAp = new WeakReference(mediarouteactionprovider);
        }
    }


    private static final String TAG = "MediaRouteActionProvider";
    private RouterCallback mCallback;
    private Context mContext;
    private android.view.View.OnClickListener mExtendedSettingsListener;
    private MenuItem mMenuItem;
    private int mRouteTypes;
    private MediaRouter mRouter;
    private MediaRouteButton mView;

    public MediaRouteActionProvider(Context context)
    {
        super(context);
        mContext = context;
        mRouter = (MediaRouter)context.getSystemService("media_router");
        mCallback = new RouterCallback(this);
        setRouteTypes(1);
    }

    private Activity getActivity()
    {
        Context context;
        for (context = mContext; (context instanceof ContextWrapper) && !(context instanceof Activity); context = ((ContextWrapper)context).getBaseContext());
        if (!(context instanceof Activity))
            throw new IllegalStateException("The MediaRouteActionProvider's Context is not an Activity.");
        else
            return (Activity)context;
    }

    public boolean isVisible()
    {
        return mRouter.getRouteCount() > 1;
    }

    public View onCreateActionView()
    {
        throw new UnsupportedOperationException("Use onCreateActionView(MenuItem) instead.");
    }

    public View onCreateActionView(MenuItem menuitem)
    {
        if (mMenuItem != null || mView != null)
            Log.e("MediaRouteActionProvider", "onCreateActionView: this ActionProvider is already associated with a menu item. Don't reuse MediaRouteActionProvider instances! Abandoning the old one...");
        mMenuItem = menuitem;
        mView = new MediaRouteButton(mContext);
        mView.setCheatSheetEnabled(true);
        mView.setRouteTypes(mRouteTypes);
        mView.setExtendedSettingsClickListener(mExtendedSettingsListener);
        mView.setLayoutParams(new android.view.ViewGroup.LayoutParams(-2, -1));
        return mView;
    }

    public boolean onPerformDefaultAction()
    {
        FragmentManager fragmentmanager = getActivity().getFragmentManager();
        if ((MediaRouteChooserDialogFragment)fragmentmanager.findFragmentByTag("android:MediaRouteChooserDialogFragment") != null)
        {
            Log.w("MediaRouteActionProvider", "onPerformDefaultAction(): Chooser dialog already showing!");
            return false;
        } else
        {
            MediaRouteChooserDialogFragment mediaroutechooserdialogfragment = new MediaRouteChooserDialogFragment();
            mediaroutechooserdialogfragment.setExtendedSettingsClickListener(mExtendedSettingsListener);
            mediaroutechooserdialogfragment.setRouteTypes(mRouteTypes);
            mediaroutechooserdialogfragment.show(fragmentmanager, "android:MediaRouteChooserDialogFragment");
            return true;
        }
    }

    public boolean overridesItemVisibility()
    {
        return true;
    }

    public void setExtendedSettingsClickListener(android.view.View.OnClickListener onclicklistener)
    {
        mExtendedSettingsListener = onclicklistener;
        if (mView != null)
            mView.setExtendedSettingsClickListener(onclicklistener);
    }

    public void setRouteTypes(int i)
    {
        if (mRouteTypes != i)
        {
            if (mRouteTypes != 0)
                mRouter.removeCallback(mCallback);
            mRouteTypes = i;
            if (i != 0)
                mRouter.addCallback(i, mCallback);
            if (mView != null)
            {
                mView.setRouteTypes(mRouteTypes);
                return;
            }
        }
    }
}
