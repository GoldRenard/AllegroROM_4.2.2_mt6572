// Decompiled by Jad v1.5.8g. Copyright 2001 Pavel Kouznetsov.
// Jad home page: http://www.kpdus.com/jad.html
// Decompiler options: packimports(3) fieldsfirst noctor space 

package com.android.systemui.screenshot;

import android.app.*;
import android.content.*;
import android.content.res.Resources;
import android.graphics.*;
import android.net.Uri;
import android.os.*;
import java.io.*;
import java.text.SimpleDateFormat;
import java.util.Date;

// Referenced classes of package com.android.systemui.screenshot:
//            SaveImageInBackgroundData, GlobalScreenshot

class SaveImageInBackgroundTask extends AsyncTask
{

    private static final String SCREENSHOTS_DIR_NAME = "Screenshots";
    private static final String SCREENSHOT_FILE_NAME_TEMPLATE = "Screenshot_%s.png";
    private static final String SCREENSHOT_FILE_PATH_TEMPLATE = "%s/%s/%s";
    private static boolean mTickerAddSpace;
    private String mImageFileName;
    private String mImageFilePath;
    private long mImageTime;
    private android.app.Notification.Builder mNotificationBuilder;
    private int mNotificationId;
    private NotificationManager mNotificationManager;
    private android.app.Notification.BigPictureStyle mNotificationStyle;

    SaveImageInBackgroundTask(Context context, SaveImageInBackgroundData saveimageinbackgrounddata, NotificationManager notificationmanager, int i)
    {
        Resources resources = context.getResources();
        mImageTime = System.currentTimeMillis();
        String s = (new SimpleDateFormat("yyyy-MM-dd-HH-mm-ss")).format(new Date(mImageTime));
        String s1 = Environment.getExternalStoragePublicDirectory(Environment.DIRECTORY_PICTURES).getAbsolutePath();
        mImageFileName = String.format("Screenshot_%s.png", new Object[] {
            s
        });
        Object aobj[] = new Object[3];
        aobj[0] = s1;
        aobj[1] = "Screenshots";
        aobj[2] = mImageFileName;
        mImageFilePath = String.format("%s/%s/%s", aobj);
        int j = saveimageinbackgrounddata.image.getWidth();
        int k = saveimageinbackgrounddata.image.getHeight();
        int l = saveimageinbackgrounddata.iconSize;
        int i1;
        if (j < k)
            i1 = j;
        else
            i1 = k;
        android.graphics.Bitmap.Config config = saveimageinbackgrounddata.image.getConfig();
        Bitmap bitmap = Bitmap.createBitmap(i1, i1, config);
        Canvas canvas = new Canvas(bitmap);
        Paint paint = new Paint();
        ColorMatrix colormatrix = new ColorMatrix();
        colormatrix.setSaturation(0.25F);
        ColorMatrixColorFilter colormatrixcolorfilter = new ColorMatrixColorFilter(colormatrix);
        paint.setColorFilter(colormatrixcolorfilter);
        Matrix matrix = new Matrix();
        matrix.postTranslate((i1 - j) / 2, (i1 - k) / 2);
        canvas.drawBitmap(saveimageinbackgrounddata.image, matrix, paint);
        canvas.drawColor(0x40ffffff);
        Bitmap bitmap1 = Bitmap.createScaledBitmap(bitmap, l, l, true);
        boolean flag;
        if (!mTickerAddSpace)
            flag = true;
        else
            flag = false;
        mTickerAddSpace = flag;
        mNotificationId = i;
        mNotificationManager = notificationmanager;
        android.app.Notification.Builder builder = new android.app.Notification.Builder(context);
        StringBuilder stringbuilder = (new StringBuilder()).append(resources.getString(0x7f0b0042));
        String s2;
        if (mTickerAddSpace)
            s2 = " ";
        else
            s2 = "";
        mNotificationBuilder = builder.setTicker(stringbuilder.append(s2).toString()).setContentTitle(resources.getString(0x7f0b0043)).setContentText(resources.getString(0x7f0b0044)).setSmallIcon(0x7f02015a).setWhen(System.currentTimeMillis());
        mNotificationStyle = (new android.app.Notification.BigPictureStyle()).bigPicture(bitmap);
        mNotificationBuilder.setStyle(mNotificationStyle);
        Notification notification = mNotificationBuilder.build();
        notification.flags = 0x20 | notification.flags;
        mNotificationManager.notify(i, notification);
        mNotificationBuilder.setLargeIcon(bitmap1);
        mNotificationStyle.bigLargeIcon(null);
    }

    protected transient SaveImageInBackgroundData doInBackground(SaveImageInBackgroundData asaveimageinbackgrounddata[])
    {
        if (asaveimageinbackgrounddata.length != 1)
            return null;
        Process.setThreadPriority(-2);
        Context context = asaveimageinbackgrounddata[0].context;
        Bitmap bitmap = asaveimageinbackgrounddata[0].image;
        Resources resources = context.getResources();
        try
        {
            ContentValues contentvalues = new ContentValues();
            ContentResolver contentresolver = context.getContentResolver();
            contentvalues.put("_data", mImageFilePath);
            contentvalues.put("title", mImageFileName);
            contentvalues.put("_display_name", mImageFileName);
            contentvalues.put("datetaken", Long.valueOf(mImageTime));
            contentvalues.put("date_added", Long.valueOf(mImageTime));
            contentvalues.put("date_modified", Long.valueOf(mImageTime));
            contentvalues.put("mime_type", "image/png");
            contentvalues.put("width", Integer.valueOf(bitmap.getWidth()));
            contentvalues.put("height", Integer.valueOf(bitmap.getHeight()));
            Uri uri = contentresolver.insert(android.provider.MediaStore.Images.Media.EXTERNAL_CONTENT_URI, contentvalues);
            Intent intent = new Intent("android.intent.action.SEND");
            intent.setType("image/png");
            intent.putExtra("android.intent.extra.STREAM", uri);
            Intent intent1 = Intent.createChooser(intent, null);
            intent1.addFlags(0x10008000);
            mNotificationBuilder.addAction(0x7f02001c, resources.getString(0x10404a9), PendingIntent.getActivity(context, 0, intent1, 0x10000000));
            OutputStream outputstream = contentresolver.openOutputStream(uri);
            bitmap.compress(android.graphics.Bitmap.CompressFormat.PNG, 100, outputstream);
            outputstream.flush();
            outputstream.close();
            contentvalues.clear();
            InputStream inputstream = contentresolver.openInputStream(uri);
            int i = inputstream.available();
            inputstream.close();
            contentvalues.put("_size", Integer.valueOf(i));
            Uri uri1 = uri.buildUpon().appendQueryParameter("notifyMtp", "1").build();
            contentresolver.update(uri1, contentvalues, null, null);
            asaveimageinbackgrounddata[0].imageUri = uri1;
            asaveimageinbackgrounddata[0].result = 0;
        }
        catch (Exception exception)
        {
            asaveimageinbackgrounddata[0].result = 1;
        }
        return asaveimageinbackgrounddata[0];
    }

    protected volatile Object doInBackground(Object aobj[])
    {
        return doInBackground((SaveImageInBackgroundData[])aobj);
    }

    protected void onPostExecute(SaveImageInBackgroundData saveimageinbackgrounddata)
    {
        if (saveimageinbackgrounddata.result > 0)
        {
            GlobalScreenshot.notifyScreenshotError(saveimageinbackgrounddata.context, mNotificationManager);
        } else
        {
            Resources resources = saveimageinbackgrounddata.context.getResources();
            Intent intent = new Intent("android.intent.action.VIEW");
            intent.setDataAndType(saveimageinbackgrounddata.imageUri, "image/png");
            intent.setFlags(0x10000000);
            mNotificationBuilder.setContentTitle(resources.getString(0x7f0b0045)).setContentText(resources.getString(0x7f0b0046)).setContentIntent(PendingIntent.getActivity(saveimageinbackgrounddata.context, 0, intent, 0)).setWhen(System.currentTimeMillis()).setAutoCancel(true);
            Notification notification = mNotificationBuilder.build();
            notification.flags = 0xffffffdf & notification.flags;
            mNotificationManager.notify(mNotificationId, notification);
        }
        saveimageinbackgrounddata.finisher.run();
    }

    protected volatile void onPostExecute(Object obj)
    {
        onPostExecute((SaveImageInBackgroundData)obj);
    }
}
