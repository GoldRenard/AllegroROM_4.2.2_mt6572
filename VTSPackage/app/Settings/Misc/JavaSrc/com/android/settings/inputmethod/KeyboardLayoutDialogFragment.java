// Decompiled by Jad v1.5.8g. Copyright 2001 Pavel Kouznetsov.
// Jad home page: http://www.kpdus.com/jad.html
// Decompiler options: packimports(3) fieldsfirst noctor space 

package com.android.settings.inputmethod;

import android.app.*;
import android.content.*;
import android.hardware.input.InputManager;
import android.hardware.input.KeyboardLayout;
import android.os.Bundle;
import android.view.*;
import android.widget.*;
import java.util.ArrayList;
import java.util.Collections;

public class KeyboardLayoutDialogFragment extends DialogFragment
    implements android.hardware.input.InputManager.InputDeviceListener, android.app.LoaderManager.LoaderCallbacks
{
    private static final class KeyboardLayoutAdapter extends ArrayAdapter
    {

        private int mCheckedItem;
        private final LayoutInflater mInflater;

        private View inflateOneLine(View view, ViewGroup viewgroup, String s, boolean flag)
        {
            View view1 = view;
            if (view1 == null || isTwoLine(view1))
            {
                view1 = mInflater.inflate(0x109000f, viewgroup, false);
                setTwoLine(view1, false);
            }
            CheckedTextView checkedtextview = (CheckedTextView)view1.findViewById(0x1020014);
            checkedtextview.setText(s);
            checkedtextview.setChecked(flag);
            return view1;
        }

        private View inflateTwoLine(View view, ViewGroup viewgroup, String s, String s1, boolean flag)
        {
            View view1 = view;
            if (view1 == null || !isTwoLine(view1))
            {
                view1 = mInflater.inflate(0x10900ca, viewgroup, false);
                setTwoLine(view1, true);
            }
            TextView textview = (TextView)view1.findViewById(0x1020014);
            TextView textview1 = (TextView)view1.findViewById(0x1020015);
            RadioButton radiobutton = (RadioButton)view1.findViewById(0x1020318);
            textview.setText(s);
            textview1.setText(s1);
            radiobutton.setChecked(flag);
            return view1;
        }

        private static boolean isTwoLine(View view)
        {
            return view.getTag() == Boolean.TRUE;
        }

        private static void setTwoLine(View view, boolean flag)
        {
            view.setTag(Boolean.valueOf(flag));
        }

        public View getView(int i, View view, ViewGroup viewgroup)
        {
            KeyboardLayout keyboardlayout = (KeyboardLayout)getItem(i);
            String s;
            String s1;
            if (keyboardlayout != null)
            {
                s = keyboardlayout.getLabel();
                s1 = keyboardlayout.getCollection();
            } else
            {
                s = getContext().getString(0x7f0b06d2);
                s1 = "";
            }
            boolean flag;
            if (i == mCheckedItem)
                flag = true;
            else
                flag = false;
            if (s1.isEmpty())
                return inflateOneLine(view, viewgroup, s, flag);
            else
                return inflateTwoLine(view, viewgroup, s, s1, flag);
        }

        public void setCheckedItem(int i)
        {
            mCheckedItem = i;
        }

        public KeyboardLayoutAdapter(Context context)
        {
            super(context, 0x10900ca);
            mCheckedItem = -1;
            mInflater = (LayoutInflater)context.getSystemService("layout_inflater");
        }
    }

    private static final class KeyboardLayoutLoader extends AsyncTaskLoader
    {

        private final String mInputDeviceDescriptor;

        public Keyboards loadInBackground()
        {
            Keyboards keyboards;
            String s;
            keyboards = new Keyboards();
            InputManager inputmanager = (InputManager)getContext().getSystemService("input");
            String as[] = inputmanager.getKeyboardLayoutsForInputDevice(mInputDeviceDescriptor);
            int i = as.length;
            for (int j = 0; j < i; j++)
            {
                KeyboardLayout keyboardlayout = inputmanager.getKeyboardLayout(as[j]);
                if (keyboardlayout != null)
                    keyboards.keyboardLayouts.add(keyboardlayout);
            }

            Collections.sort(keyboards.keyboardLayouts);
            s = inputmanager.getCurrentKeyboardLayoutForInputDevice(mInputDeviceDescriptor);
            if (s == null) goto _L2; else goto _L1
_L1:
            int k;
            int l;
            k = keyboards.keyboardLayouts.size();
            l = 0;
_L7:
            if (l >= k) goto _L2; else goto _L3
_L3:
            if (!((KeyboardLayout)keyboards.keyboardLayouts.get(l)).getDescriptor().equals(s)) goto _L5; else goto _L4
_L4:
            keyboards.current = l;
_L2:
            if (keyboards.keyboardLayouts.isEmpty())
            {
                keyboards.keyboardLayouts.add(null);
                keyboards.current = 0;
            }
            return keyboards;
_L5:
            l++;
            if (true) goto _L7; else goto _L6
_L6:
        }

        public volatile Object loadInBackground()
        {
            return loadInBackground();
        }

        protected void onStartLoading()
        {
            super.onStartLoading();
            forceLoad();
        }

        protected void onStopLoading()
        {
            super.onStopLoading();
            cancelLoad();
        }

        public KeyboardLayoutLoader(Context context, String s)
        {
            super(context);
            mInputDeviceDescriptor = s;
        }
    }

    public static final class Keyboards
    {

        public int current;
        public final ArrayList keyboardLayouts = new ArrayList();

        public Keyboards()
        {
            current = -1;
        }
    }

    public static interface OnSetupKeyboardLayoutsListener
    {

        public abstract void onSetupKeyboardLayouts(String s);
    }


    private static final String KEY_INPUT_DEVICE_DESCRIPTOR = "inputDeviceDescriptor";
    private KeyboardLayoutAdapter mAdapter;
    private InputManager mIm;
    private String mInputDeviceDescriptor;
    private int mInputDeviceId;

    public KeyboardLayoutDialogFragment()
    {
        mInputDeviceId = -1;
    }

    public KeyboardLayoutDialogFragment(String s)
    {
        mInputDeviceId = -1;
        mInputDeviceDescriptor = s;
    }

    private void onKeyboardLayoutClicked(int i)
    {
        if (i >= 0 && i < mAdapter.getCount())
        {
            KeyboardLayout keyboardlayout = (KeyboardLayout)mAdapter.getItem(i);
            if (keyboardlayout != null)
                mIm.setCurrentKeyboardLayoutForInputDevice(mInputDeviceDescriptor, keyboardlayout.getDescriptor());
            dismiss();
        }
    }

    private void onSetupLayoutsButtonClicked()
    {
        ((OnSetupKeyboardLayoutsListener)getTargetFragment()).onSetupKeyboardLayouts(mInputDeviceDescriptor);
    }

    private void updateSwitchHintVisibility()
    {
        AlertDialog alertdialog = (AlertDialog)getDialog();
        if (alertdialog != null)
        {
            View view = alertdialog.findViewById(0x1020262);
            byte byte0;
            if (mAdapter.getCount() > 1)
                byte0 = 0;
            else
                byte0 = 8;
            view.setVisibility(byte0);
        }
    }

    public void onActivityResult(int i, int j, Intent intent)
    {
        super.onActivityResult(i, j, intent);
        show(getActivity().getFragmentManager(), "layout");
    }

    public void onAttach(Activity activity)
    {
        super.onAttach(activity);
        Context context = activity.getBaseContext();
        mIm = (InputManager)context.getSystemService("input");
        mAdapter = new KeyboardLayoutAdapter(context);
    }

    public void onCancel(DialogInterface dialoginterface)
    {
        super.onCancel(dialoginterface);
        dismiss();
    }

    public void onCreate(Bundle bundle)
    {
        super.onCreate(bundle);
        if (bundle != null)
            mInputDeviceDescriptor = bundle.getString("inputDeviceDescriptor");
        getLoaderManager().initLoader(0, null, this);
    }

    public Dialog onCreateDialog(Bundle bundle)
    {
        Activity activity = getActivity();
        LayoutInflater layoutinflater = LayoutInflater.from(activity);
        android.app.AlertDialog.Builder builder = (new android.app.AlertDialog.Builder(activity)).setTitle(0x7f0b06cf).setPositiveButton(0x7f0b06d0, new android.content.DialogInterface.OnClickListener() {

            final KeyboardLayoutDialogFragment this$0;

            public void onClick(DialogInterface dialoginterface, int i)
            {
                onSetupLayoutsButtonClicked();
            }

            
            {
                this$0 = KeyboardLayoutDialogFragment.this;
                super();
            }
        }
).setSingleChoiceItems(mAdapter, -1, new android.content.DialogInterface.OnClickListener() {

            final KeyboardLayoutDialogFragment this$0;

            public void onClick(DialogInterface dialoginterface, int i)
            {
                onKeyboardLayoutClicked(i);
            }

            
            {
                this$0 = KeyboardLayoutDialogFragment.this;
                super();
            }
        }
).setView(layoutinflater.inflate(0x7f04003d, null));
        updateSwitchHintVisibility();
        return builder.create();
    }

    public Loader onCreateLoader(int i, Bundle bundle)
    {
        return new KeyboardLayoutLoader(getActivity().getBaseContext(), mInputDeviceDescriptor);
    }

    public void onInputDeviceAdded(int i)
    {
    }

    public void onInputDeviceChanged(int i)
    {
        if (mInputDeviceId >= 0 && i == mInputDeviceId)
            getLoaderManager().restartLoader(0, null, this);
    }

    public void onInputDeviceRemoved(int i)
    {
        if (mInputDeviceId >= 0 && i == mInputDeviceId)
            dismiss();
    }

    public void onLoadFinished(Loader loader, Keyboards keyboards)
    {
        mAdapter.clear();
        mAdapter.addAll(keyboards.keyboardLayouts);
        mAdapter.setCheckedItem(keyboards.current);
        AlertDialog alertdialog = (AlertDialog)getDialog();
        if (alertdialog != null)
            alertdialog.getListView().setItemChecked(keyboards.current, true);
        updateSwitchHintVisibility();
    }

    public volatile void onLoadFinished(Loader loader, Object obj)
    {
        onLoadFinished(loader, (Keyboards)obj);
    }

    public void onLoaderReset(Loader loader)
    {
        mAdapter.clear();
        updateSwitchHintVisibility();
    }

    public void onPause()
    {
        mIm.unregisterInputDeviceListener(this);
        mInputDeviceId = -1;
        super.onPause();
    }

    public void onResume()
    {
        super.onResume();
        mIm.registerInputDeviceListener(this, null);
        InputDevice inputdevice = mIm.getInputDeviceByDescriptor(mInputDeviceDescriptor);
        if (inputdevice == null)
        {
            dismiss();
            return;
        } else
        {
            mInputDeviceId = inputdevice.getId();
            return;
        }
    }

    public void onSaveInstanceState(Bundle bundle)
    {
        super.onSaveInstanceState(bundle);
        bundle.putString("inputDeviceDescriptor", mInputDeviceDescriptor);
    }


}
