// Decompiled by Jad v1.5.8g. Copyright 2001 Pavel Kouznetsov.
// Jad home page: http://www.kpdus.com/jad.html
// Decompiler options: packimports(3) fieldsfirst noctor space 

package com.android.settings.deviceinfo;

import android.app.Activity;
import android.app.ListActivity;
import android.content.Context;
import android.content.Intent;
import android.os.Bundle;
import android.os.storage.StorageVolume;
import android.text.format.Formatter;
import android.util.Log;
import android.util.SparseBooleanArray;
import android.view.*;
import android.widget.*;
import java.io.File;
import java.util.*;

// Referenced classes of package com.android.settings.deviceinfo:
//            StorageMeasurement, FileItemInfoLayout

public class MiscFilesHandler extends ListActivity
{
    class MemoryMearurementAdapter extends BaseAdapter
    {

        private Context mContext;
        private ArrayList mData;
        private long mDataSize;
        final MiscFilesHandler this$0;

        public int getCount()
        {
            if (mData == null)
                return 0;
            else
                return mData.size();
        }

        public long getDataSize()
        {
            return mDataSize;
        }

        public StorageMeasurement.FileInfo getItem(int i)
        {
            if (mData != null && mData.size() > i)
                return (StorageMeasurement.FileInfo)mData.get(i);
            else
                return null;
        }

        public volatile Object getItem(int i)
        {
            return getItem(i);
        }

        public long getItemId(int i)
        {
            if (mData != null && mData.size() > i)
                return ((StorageMeasurement.FileInfo)mData.get(i)).mId;
            else
                return 0L;
        }

        public View getView(final int listPosition, View view, ViewGroup viewgroup)
        {
            FileItemInfoLayout fileiteminfolayout;
            if (view == null)
                fileiteminfolayout = (FileItemInfoLayout)mInflater.inflate(0x7f040088, viewgroup, false);
            else
                fileiteminfolayout = (FileItemInfoLayout)view;
            StorageMeasurement.FileInfo fileinfo = getItem(listPosition);
            fileiteminfolayout.setFileName(fileinfo.mFileName);
            fileiteminfolayout.setFileSize(Formatter.formatFileSize(mContext, fileinfo.mSize));
            final ListView listView = (ListView)viewgroup;
            fileiteminfolayout.getCheckBox().setOnCheckedChangeListener(listPosition. new android.widget.CompoundButton.OnCheckedChangeListener() {

                final MemoryMearurementAdapter this$1;
                final int val$listPosition;
                final ListView val$listView;

                public void onCheckedChanged(CompoundButton compoundbutton, boolean flag)
                {
                    listView.setItemChecked(listPosition, flag);
                }

            
            {
                this$1 = final_memorymearurementadapter;
                listView = listview;
                listPosition = I.this;
                super();
            }
            }
);
            fileiteminfolayout.setOnLongClickListener(fileiteminfolayout. new android.view.View.OnLongClickListener() {

                final MemoryMearurementAdapter this$1;
                final int val$listPosition;
                final ListView val$listView;
                final FileItemInfoLayout val$view;

                public boolean onLongClick(View view1)
                {
                    if (listView.getCheckedItemCount() > 0)
                        return false;
                    ListView listview = listView;
                    int i = listPosition;
                    boolean flag = view.isChecked();
                    boolean flag1 = false;
                    if (!flag)
                        flag1 = true;
                    listview.setItemChecked(i, flag1);
                    return true;
                }

            
            {
                this$1 = final_memorymearurementadapter;
                listView = listview;
                listPosition = i;
                view = FileItemInfoLayout.this;
                super();
            }
            }
);
            fileiteminfolayout.setOnClickListener(fileiteminfolayout. new android.view.View.OnClickListener() {

                final MemoryMearurementAdapter this$1;
                final int val$listPosition;
                final ListView val$listView;
                final FileItemInfoLayout val$view;

                public void onClick(View view1)
                {
                    if (listView.getCheckedItemCount() > 0)
                    {
                        ListView listview = listView;
                        int i = listPosition;
                        boolean flag;
                        if (!view.isChecked())
                            flag = true;
                        else
                            flag = false;
                        listview.setItemChecked(i, flag);
                    }
                }

            
            {
                this$1 = final_memorymearurementadapter;
                listView = listview;
                listPosition = i;
                view = FileItemInfoLayout.this;
                super();
            }
            }
);
            return fileiteminfolayout;
        }

        public void notifyDataSetChanged()
        {
            super.notifyDataSetChanged();
        }

        public void removeAll(List list)
        {
            if (mData != null)
            {
                for (Iterator iterator = list.iterator(); iterator.hasNext();)
                {
                    Object obj = iterator.next();
                    mData.remove(obj);
                    mDataSize = mDataSize - ((StorageMeasurement.FileInfo)obj).mSize;
                }

            }
        }

        public MemoryMearurementAdapter(Activity activity)
        {
            this$0 = MiscFilesHandler.this;
            super();
            mData = null;
            mDataSize = 0L;
            mContext = activity;
            StorageMeasurement storagemeasurement = StorageMeasurement.getInstance(activity, (StorageVolume)activity.getIntent().getParcelableExtra("storage_volume"));
            if (storagemeasurement != null)
            {
                mData = (ArrayList)storagemeasurement.mFileInfoForMisc;
                if (mData != null)
                {
                    for (Iterator iterator = mData.iterator(); iterator.hasNext();)
                    {
                        StorageMeasurement.FileInfo fileinfo = (StorageMeasurement.FileInfo)iterator.next();
                        mDataSize = mDataSize + fileinfo.mSize;
                    }

                }
            }
        }
    }

    private class ModeCallback
        implements android.widget.AbsListView.MultiChoiceModeListener
    {

        private final Context mContext;
        private int mDataCount;
        final MiscFilesHandler this$0;

        private boolean deleteDir(File file)
        {
            if (file.isDirectory())
            {
                String as[] = file.list();
                for (int i = 0; i < as.length; i++)
                    if (!deleteDir(new File(file, as[i])))
                        return false;

            }
            return file.delete();
        }

        public boolean onActionItemClicked(ActionMode actionmode, MenuItem menuitem)
        {
            ListView listview = getListView();
            switch (menuitem.getItemId())
            {
            case 2131231341: 
                for (int k = 0; k < mDataCount; k++)
                    listview.setItemChecked(k, true);

                onItemCheckedStateChanged(actionmode, 1, 0L, true);
                return true;

            case 2131231345: 
                SparseBooleanArray sparsebooleanarray = listview.getCheckedItemPositions();
                int i = getListView().getCheckedItemCount();
                if (i > mDataCount)
                    throw new IllegalStateException((new StringBuilder()).append("checked item counts do not match. checkedCount: ").append(i).append(", dataSize: ").append(mDataCount).toString());
                if (mDataCount > 0)
                {
                    ArrayList arraylist = new ArrayList();
                    for (int j = 0; j < mDataCount; j++)
                    {
                        if (!sparsebooleanarray.get(j))
                            continue;
                        if (StorageMeasurement.LOGV)
                            Log.i("MemorySettings", (new StringBuilder()).append("deleting: ").append(mAdapter.getItem(j)).toString());
                        File file = new File(mAdapter.getItem(j).mFileName);
                        if (file.isDirectory())
                            deleteDir(file);
                        else
                            file.delete();
                        arraylist.add(mAdapter.getItem(j));
                    }

                    mAdapter.removeAll(arraylist);
                    mAdapter.notifyDataSetChanged();
                    mDataCount = mAdapter.getCount();
                }
                actionmode.finish();
                return true;
            }
            return true;
        }

        public boolean onCreateActionMode(ActionMode actionmode, Menu menu)
        {
            getMenuInflater().inflate(0x7f100002, menu);
            return true;
        }

        public void onDestroyActionMode(ActionMode actionmode)
        {
        }

        public void onItemCheckedStateChanged(ActionMode actionmode, int i, long l, boolean flag)
        {
            ListView listview = getListView();
            int j = listview.getCheckedItemCount();
            String s = mNumSelectedFormat;
            Object aobj[] = new Object[2];
            aobj[0] = Integer.valueOf(j);
            aobj[1] = Integer.valueOf(mAdapter.getCount());
            actionmode.setTitle(String.format(s, aobj));
            SparseBooleanArray sparsebooleanarray = listview.getCheckedItemPositions();
            long l1 = 0L;
            if (j > 0)
            {
                for (int k = 0; k < mDataCount; k++)
                    if (sparsebooleanarray.get(k))
                        l1 += mAdapter.getItem(k).mSize;

            }
            String s1 = mNumBytesSelectedFormat;
            Object aobj1[] = new Object[2];
            aobj1[0] = Formatter.formatFileSize(mContext, l1);
            aobj1[1] = Formatter.formatFileSize(mContext, mAdapter.getDataSize());
            actionmode.setSubtitle(String.format(s1, aobj1));
        }

        public boolean onPrepareActionMode(ActionMode actionmode, Menu menu)
        {
            return true;
        }

        public ModeCallback(Context context)
        {
            this$0 = MiscFilesHandler.this;
            super();
            mContext = context;
            mDataCount = mAdapter.getCount();
        }
    }


    private static final String TAG = "MemorySettings";
    private MemoryMearurementAdapter mAdapter;
    private LayoutInflater mInflater;
    private String mNumBytesSelectedFormat;
    private String mNumSelectedFormat;


    public void onCreate(Bundle bundle)
    {
        super.onCreate(bundle);
        setFinishOnTouchOutside(true);
        setTitle(0x7f0b0858);
        mNumSelectedFormat = getString(0x7f0b0859);
        mNumBytesSelectedFormat = getString(0x7f0b085a);
        mAdapter = new MemoryMearurementAdapter(this);
        mInflater = (LayoutInflater)getSystemService("layout_inflater");
        setContentView(0x7f040089);
        ListView listview = getListView();
        listview.setItemsCanFocus(true);
        listview.setChoiceMode(3);
        listview.setMultiChoiceModeListener(new ModeCallback(this));
        setListAdapter(mAdapter);
    }




}
