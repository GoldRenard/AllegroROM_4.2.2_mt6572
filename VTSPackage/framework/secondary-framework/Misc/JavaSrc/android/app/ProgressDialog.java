// Decompiled by Jad v1.5.8g. Copyright 2001 Pavel Kouznetsov.
// Jad home page: http://www.kpdus.com/jad.html
// Decompiler options: packimports(3) fieldsfirst noctor space 

package android.app;

import android.content.Context;
import android.content.res.TypedArray;
import android.graphics.drawable.Drawable;
import android.os.*;
import android.text.SpannableString;
import android.text.style.StyleSpan;
import android.view.LayoutInflater;
import android.view.View;
import android.widget.ProgressBar;
import android.widget.TextView;
import java.text.NumberFormat;

// Referenced classes of package android.app:
//            AlertDialog, Dialog

public class ProgressDialog extends AlertDialog
{

    public static final int STYLE_HORIZONTAL = 1;
    public static final int STYLE_SPINNER;
    private boolean mHasStarted;
    private int mIncrementBy;
    private int mIncrementSecondaryBy;
    private boolean mIndeterminate;
    private Drawable mIndeterminateDrawable;
    private int mMax;
    private CharSequence mMessage;
    private TextView mMessageView;
    private ProgressBar mProgress;
    private Drawable mProgressDrawable;
    private TextView mProgressNumber;
    private String mProgressNumberFormat;
    private TextView mProgressPercent;
    private NumberFormat mProgressPercentFormat;
    private int mProgressStyle;
    private int mProgressVal;
    private int mSecondaryProgressVal;
    private Handler mViewUpdateHandler;

    public ProgressDialog(Context context)
    {
        super(context);
        mProgressStyle = 0;
        initFormats();
    }

    public ProgressDialog(Context context, int i)
    {
        super(context, i);
        mProgressStyle = 0;
        initFormats();
    }

    private void initFormats()
    {
        mProgressNumberFormat = "%1d/%2d";
        mProgressPercentFormat = NumberFormat.getPercentInstance();
        mProgressPercentFormat.setMaximumFractionDigits(0);
    }

    private void onProgressChanged()
    {
        if (mProgressStyle == 1 && mViewUpdateHandler != null && !mViewUpdateHandler.hasMessages(0))
            mViewUpdateHandler.sendEmptyMessage(0);
    }

    public static ProgressDialog show(Context context, CharSequence charsequence, CharSequence charsequence1)
    {
        return show(context, charsequence, charsequence1, false);
    }

    public static ProgressDialog show(Context context, CharSequence charsequence, CharSequence charsequence1, boolean flag)
    {
        return show(context, charsequence, charsequence1, flag, false, null);
    }

    public static ProgressDialog show(Context context, CharSequence charsequence, CharSequence charsequence1, boolean flag, boolean flag1)
    {
        return show(context, charsequence, charsequence1, flag, flag1, null);
    }

    public static ProgressDialog show(Context context, CharSequence charsequence, CharSequence charsequence1, boolean flag, boolean flag1, android.content.DialogInterface.OnCancelListener oncancellistener)
    {
        ProgressDialog progressdialog = new ProgressDialog(context);
        progressdialog.setTitle(charsequence);
        progressdialog.setMessage(charsequence1);
        progressdialog.setIndeterminate(flag);
        progressdialog.setCancelable(flag1);
        progressdialog.setOnCancelListener(oncancellistener);
        progressdialog.show();
        return progressdialog;
    }

    public int getMax()
    {
        if (mProgress != null)
            return mProgress.getMax();
        else
            return mMax;
    }

    public int getProgress()
    {
        if (mProgress != null)
            return mProgress.getProgress();
        else
            return mProgressVal;
    }

    public int getSecondaryProgress()
    {
        if (mProgress != null)
            return mProgress.getSecondaryProgress();
        else
            return mSecondaryProgressVal;
    }

    public void incrementProgressBy(int i)
    {
        if (mProgress != null)
        {
            mProgress.incrementProgressBy(i);
            onProgressChanged();
            return;
        } else
        {
            mIncrementBy = i + mIncrementBy;
            return;
        }
    }

    public void incrementSecondaryProgressBy(int i)
    {
        if (mProgress != null)
        {
            mProgress.incrementSecondaryProgressBy(i);
            onProgressChanged();
            return;
        } else
        {
            mIncrementSecondaryBy = i + mIncrementSecondaryBy;
            return;
        }
    }

    public boolean isIndeterminate()
    {
        if (mProgress != null)
            return mProgress.isIndeterminate();
        else
            return mIndeterminate;
    }

    protected void onCreate(Bundle bundle)
    {
        LayoutInflater layoutinflater = LayoutInflater.from(super.mContext);
        TypedArray typedarray = super.mContext.obtainStyledAttributes(null, com.android.internal.R.styleable.AlertDialog, 0x101005d, 0);
        if (mProgressStyle == 1)
        {
            mViewUpdateHandler = new Handler() {

                final ProgressDialog this$0;

                public void handleMessage(Message message)
                {
                    super.handleMessage(message);
                    int i = mProgress.getProgress();
                    int j = mProgress.getMax();
                    if (mProgressNumberFormat != null)
                    {
                        String s = mProgressNumberFormat;
                        TextView textview = mProgressNumber;
                        Object aobj[] = new Object[2];
                        aobj[0] = Integer.valueOf(i);
                        aobj[1] = Integer.valueOf(j);
                        textview.setText(String.format(s, aobj));
                    } else
                    {
                        mProgressNumber.setText("");
                    }
                    if (mProgressPercentFormat != null)
                    {
                        double d = (double)i / (double)j;
                        SpannableString spannablestring = new SpannableString(mProgressPercentFormat.format(d));
                        spannablestring.setSpan(new StyleSpan(1), 0, spannablestring.length(), 33);
                        mProgressPercent.setText(spannablestring);
                        return;
                    } else
                    {
                        mProgressPercent.setText("");
                        return;
                    }
                }

            
            {
                this$0 = ProgressDialog.this;
                super();
            }
            }
;
            View view1 = layoutinflater.inflate(typedarray.getResourceId(16, 0x1090026), null);
            mProgress = (ProgressBar)view1.findViewById(0x102000d);
            mProgressNumber = (TextView)view1.findViewById(0x1020265);
            mProgressPercent = (TextView)view1.findViewById(0x1020264);
            setView(view1);
        } else
        {
            View view = layoutinflater.inflate(typedarray.getResourceId(15, 0x10900ad), null);
            mProgress = (ProgressBar)view.findViewById(0x102000d);
            mMessageView = (TextView)view.findViewById(0x102000b);
            setView(view);
        }
        typedarray.recycle();
        if (mMax > 0)
            setMax(mMax);
        if (mProgressVal > 0)
            setProgress(mProgressVal);
        if (mSecondaryProgressVal > 0)
            setSecondaryProgress(mSecondaryProgressVal);
        if (mIncrementBy > 0)
            incrementProgressBy(mIncrementBy);
        if (mIncrementSecondaryBy > 0)
            incrementSecondaryProgressBy(mIncrementSecondaryBy);
        if (mProgressDrawable != null)
            setProgressDrawable(mProgressDrawable);
        if (mIndeterminateDrawable != null)
            setIndeterminateDrawable(mIndeterminateDrawable);
        if (mMessage != null)
            setMessage(mMessage);
        setIndeterminate(mIndeterminate);
        onProgressChanged();
        super.onCreate(bundle);
    }

    public void onStart()
    {
        super.onStart();
        mHasStarted = true;
    }

    protected void onStop()
    {
        super.onStop();
        mHasStarted = false;
    }

    public void setIndeterminate(boolean flag)
    {
        if (mProgress != null)
        {
            mProgress.setIndeterminate(flag);
            return;
        } else
        {
            mIndeterminate = flag;
            return;
        }
    }

    public void setIndeterminateDrawable(Drawable drawable)
    {
        if (mProgress != null)
        {
            mProgress.setIndeterminateDrawable(drawable);
            return;
        } else
        {
            mIndeterminateDrawable = drawable;
            return;
        }
    }

    public void setMax(int i)
    {
        if (mProgress != null)
        {
            mProgress.setMax(i);
            onProgressChanged();
            return;
        } else
        {
            mMax = i;
            return;
        }
    }

    public void setMessage(CharSequence charsequence)
    {
        if (mProgress != null)
        {
            if (mProgressStyle == 1)
            {
                super.setMessage(charsequence);
                return;
            } else
            {
                mMessageView.setText(charsequence);
                return;
            }
        } else
        {
            mMessage = charsequence;
            return;
        }
    }

    public void setProgress(int i)
    {
        if (mHasStarted)
        {
            mProgress.setProgress(i);
            onProgressChanged();
            return;
        } else
        {
            mProgressVal = i;
            return;
        }
    }

    public void setProgressDrawable(Drawable drawable)
    {
        if (mProgress != null)
        {
            mProgress.setProgressDrawable(drawable);
            return;
        } else
        {
            mProgressDrawable = drawable;
            return;
        }
    }

    public void setProgressNumberFormat(String s)
    {
        mProgressNumberFormat = s;
        onProgressChanged();
    }

    public void setProgressPercentFormat(NumberFormat numberformat)
    {
        mProgressPercentFormat = numberformat;
        onProgressChanged();
    }

    public void setProgressStyle(int i)
    {
        mProgressStyle = i;
    }

    public void setSecondaryProgress(int i)
    {
        if (mProgress != null)
        {
            mProgress.setSecondaryProgress(i);
            onProgressChanged();
            return;
        } else
        {
            mSecondaryProgressVal = i;
            return;
        }
    }





}
