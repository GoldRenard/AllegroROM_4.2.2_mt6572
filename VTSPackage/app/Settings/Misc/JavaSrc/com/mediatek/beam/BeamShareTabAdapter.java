// Decompiled by Jad v1.5.8g. Copyright 2001 Pavel Kouznetsov.
// Jad home page: http://www.kpdus.com/jad.html
// Decompiler options: packimports(3) fieldsfirst noctor space 

package com.mediatek.beam;

import android.content.Context;
import android.database.Cursor;
import android.text.format.DateFormat;
import android.text.format.DateUtils;
import android.text.format.Formatter;
import android.view.View;
import android.widget.ImageView;
import android.widget.ResourceCursorAdapter;
import android.widget.TextView;
import java.util.Date;

// Referenced classes of package com.mediatek.beam:
//            BeamShareTask

public class BeamShareTabAdapter extends ResourceCursorAdapter
{

    public BeamShareTabAdapter(Context context, int i, Cursor cursor)
    {
        super(context, i, cursor);
    }

    public void bindView(View view, Context context, Cursor cursor)
    {
        int i = 0x7f02004f;
        BeamShareTask beamsharetask = new BeamShareTask(cursor);
        ImageView imageview = (ImageView)view.findViewById(0x7f080017);
        if (beamsharetask.getDirection() == BeamShareTask.Direction.in)
        {
            if (beamsharetask.getState() == 1)
                i = 0x7f020050;
            imageview.setImageResource(i);
        } else
        {
            if (beamsharetask.getState() == 1)
                i = 0x7f020051;
            imageview.setImageResource(i);
        }
        TextView textview = (TextView)view.findViewById(0x7f080018);
        String s = beamsharetask.getData();
        if (s == null)
            s = "";
        textview.setText(s);
        TextView textview1 = (TextView)view.findViewById(0x7f080019);
        Date date = new Date(beamsharetask.getModifiedDate());
        String s1;
        if (DateUtils.isToday(beamsharetask.getModifiedDate()))
            s1 = DateFormat.getTimeFormat(context).format(date);
        else
            s1 = DateFormat.getDateFormat(context).format(date);
        textview1.setText(s1);
        ((TextView)view.findViewById(0x7f08001a)).setText(Formatter.formatFileSize(context, beamsharetask.getTotalBytes()));
    }
}
