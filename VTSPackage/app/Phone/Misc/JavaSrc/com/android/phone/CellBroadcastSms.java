// Decompiled by Jad v1.5.8g. Copyright 2001 Pavel Kouznetsov.
// Jad home page: http://www.kpdus.com/jad.html
// Decompiler options: packimports(3) fieldsfirst noctor space 

package com.android.phone;

import android.content.Context;
import android.os.*;
import android.preference.*;
import android.util.Log;
import com.android.internal.telephony.Phone;

// Referenced classes of package com.android.phone:
//            PhoneGlobals

public class CellBroadcastSms extends PreferenceActivity
    implements android.preference.Preference.OnPreferenceChangeListener
{
    private static final class CellBroadcastSmsConfig
    {

        private static int mBSelected[] = new int[32];
        private static int mConfigDataComplete[] = new int[94];

        private static int[] getCbSmsAllValues()
        {
            return mConfigDataComplete;
        }

        private static int[] getCbSmsBselectedValues()
        {
            return mBSelected;
        }

        private static int getConfigDataLanguage()
        {
            int i = mConfigDataComplete[2];
            if (i < 1 || i > 7)
            {
                Log.e("CellBroadcastSms", "Error! Wrong language returned from RIL...defaulting to 1, english");
                i = 1;
            }
            return i;
        }

        private static void setCbSmsBSelectedValue(boolean flag, int i)
        {
            int j = 1;
            if (i < mBSelected.length)
            {
                int ai[] = mBSelected;
                if (flag != j)
                    j = 0;
                ai[i] = j;
                return;
            } else
            {
                Log.e("CellBroadcastSms", "Error! Invalid value position.");
                return;
            }
        }

        private static void setCbSmsConfig(int ai[])
        {
            if (ai == null)
            {
                Log.e("CellBroadcastSms", "Error! No cell broadcast service categories returned.");
                return;
            }
            if (ai[0] > 94)
            {
                Log.e("CellBroadcastSms", "Error! Wrong number of service categories returned from RIL");
                return;
            }
            for (int i = 1; i < ai.length; i += 3)
                mBSelected[ai[i]] = ai[i + 2];

            mConfigDataComplete = ai;
        }

        private static void setCbSmsNoOfStructs(int i)
        {
            mConfigDataComplete[0] = i;
        }

        private static void setConfigDataCompleteBSelected(boolean flag, int i)
        {
            int j = 1;
            int k = 1;
            do
            {
label0:
                {
                    if (k < mConfigDataComplete.length)
                    {
                        if (mConfigDataComplete[k] != i)
                            break label0;
                        int ai[] = mConfigDataComplete;
                        int l = k + 2;
                        if (flag != j)
                            j = 0;
                        ai[l] = j;
                    }
                    return;
                }
                k += 3;
            } while (true);
        }

        private static void setConfigDataCompleteLanguage(int i)
        {
            for (int j = 2; j < mConfigDataComplete.length; j += 3)
                mConfigDataComplete[j] = i;

        }










        private CellBroadcastSmsConfig()
        {
        }
    }

    private class MyHandler extends Handler
    {

        final CellBroadcastSms this$0;

        public void handleMessage(Message message)
        {
            switch (message.what)
            {
            case 2: // '\002'
                int ai[] = (int[])(int[])((AsyncResult)message.obj).result;
                if (ai[0] == 0)
                {
                    ai[0] = 31;
                    mButtonBcSms.setChecked(false);
                    mPhone.activateCellBroadcastSms(1, Message.obtain(mHandler, 1));
                    android.provider.Settings.Global.putInt(mPhone.getContext().getContentResolver(), "cdma_cell_broadcast_sms", 1);
                    enableDisableAllCbConfigButtons(false);
                }
                CellBroadcastSmsConfig.setCbSmsConfig(ai);
                setAllCbConfigButtons(CellBroadcastSmsConfig.getCbSmsBselectedValues());
                return;

            default:
                Log.e("CellBroadcastSms", (new StringBuilder()).append("Error! Unhandled message in CellBroadcastSms.java. Message: ").append(message.what).toString());
                // fall through

            case 1: // '\001'
            case 3: // '\003'
                return;
            }
        }

        private MyHandler()
        {
            this$0 = CellBroadcastSms.this;
            super();
        }

    }


    private static final String BUTTON_ADMINISTRATIVE_KEY = "button_administrative";
    private static final String BUTTON_ADVERTISEMENTS_KEY = "button_advertisements";
    private static final String BUTTON_ATR_KEY = "button_atr";
    private static final String BUTTON_EMERGENCY_BROADCAST_KEY = "button_emergency_broadcast";
    private static final String BUTTON_ENABLE_DISABLE_BC_SMS_KEY = "button_enable_disable_cell_bc_sms";
    private static final String BUTTON_EO_KEY = "button_eo";
    private static final String BUTTON_INTERNATIONAL_BF_NEWS_KEY = "button_international_bf_news";
    private static final String BUTTON_INTERNATIONAL_ENTERTAINMENT_NEWS_KEY = "button_international_entertainment_news";
    private static final String BUTTON_INTERNATIONAL_GENERAL_NEWS_KEY = "button_international_general_news";
    private static final String BUTTON_INTERNATIONAL_SPORTS_NEWS_KEY = "button_international_sports_news";
    private static final String BUTTON_LAFS_KEY = "button_lafs";
    private static final String BUTTON_LOCAL_BF_NEWS_KEY = "button_local_bf_news";
    private static final String BUTTON_LOCAL_ENTERTAINMENT_NEWS_KEY = "button_local_entertainment_news";
    private static final String BUTTON_LOCAL_GENERAL_NEWS_KEY = "button_local_general_news";
    private static final String BUTTON_LOCAL_SPORTS_NEWS_KEY = "button_local_sports_news";
    private static final String BUTTON_LOCAL_WEATHER_KEY = "button_local_weather";
    private static final String BUTTON_LODGINGS_KEY = "button_lodgings";
    private static final String BUTTON_MAINTENANCE_KEY = "button_maintenance";
    private static final String BUTTON_MHH_KEY = "button_mhh";
    private static final String BUTTON_MULTI_CATEGORY_KEY = "button_multi_category";
    private static final String BUTTON_NATIONAL_BF_NEWS_KEY = "button_national_bf_news";
    private static final String BUTTON_NATIONAL_ENTERTAINMENT_NEWS_KEY = "button_national_entertainment_news";
    private static final String BUTTON_NATIONAL_GENERAL_NEWS_KEY = "button_national_general_news";
    private static final String BUTTON_NATIONAL_SPORTS_NEWS_KEY = "button_national_sports_news";
    private static final String BUTTON_REGIONAL_BF_NEWS_KEY = "button_regional_bf_news";
    private static final String BUTTON_REGIONAL_ENTERTAINMENT_NEWS_KEY = "button_regional_entertainment_news";
    private static final String BUTTON_REGIONAL_GENERAL_NEWS_KEY = "button_regional_general_news";
    private static final String BUTTON_REGIONAL_SPORTS_NEWS_KEY = "button_regional_sports_news";
    private static final String BUTTON_RESTAURANTS_KEY = "button_restaurants";
    private static final String BUTTON_RETAIL_DIRECTORY_KEY = "button_retail_directory";
    private static final String BUTTON_STOCK_QUOTES_KEY = "button_stock_quotes";
    private static final String BUTTON_TECHNOLOGY_NEWS_KEY = "button_technology_news";
    private static final boolean DBG = false;
    private static final String LIST_LANGUAGE_KEY = "list_language";
    private static final String LOG_TAG = "CellBroadcastSms";
    private static final int MAX_LENGTH_RESULT = 94;
    private static final int MESSAGE_ACTIVATE_CB_SMS = 1;
    private static final int MESSAGE_GET_CB_SMS_CONFIG = 2;
    private static final int MESSAGE_SET_CB_SMS_CONFIG = 3;
    private static final int NO_OF_INTS_STRUCT_1 = 3;
    private static final int NO_OF_SERVICE_CATEGORIES = 31;
    private CheckBoxPreference mButtonAdministrative;
    private CheckBoxPreference mButtonAdvertisements;
    private CheckBoxPreference mButtonAtr;
    private CheckBoxPreference mButtonBcSms;
    private CheckBoxPreference mButtonEmergencyBroadcast;
    private CheckBoxPreference mButtonEo;
    private CheckBoxPreference mButtonInternational1;
    private CheckBoxPreference mButtonInternational2;
    private CheckBoxPreference mButtonInternational3;
    private CheckBoxPreference mButtonInternational4;
    private CheckBoxPreference mButtonLafs;
    private CheckBoxPreference mButtonLocal1;
    private CheckBoxPreference mButtonLocal2;
    private CheckBoxPreference mButtonLocal3;
    private CheckBoxPreference mButtonLocal4;
    private CheckBoxPreference mButtonLocalWeather;
    private CheckBoxPreference mButtonLodgings;
    private CheckBoxPreference mButtonMaintenance;
    private CheckBoxPreference mButtonMhh;
    private CheckBoxPreference mButtonMultiCategory;
    private CheckBoxPreference mButtonNational1;
    private CheckBoxPreference mButtonNational2;
    private CheckBoxPreference mButtonNational3;
    private CheckBoxPreference mButtonNational4;
    private CheckBoxPreference mButtonRegional1;
    private CheckBoxPreference mButtonRegional2;
    private CheckBoxPreference mButtonRegional3;
    private CheckBoxPreference mButtonRegional4;
    private CheckBoxPreference mButtonRestaurants;
    private CheckBoxPreference mButtonRetailDirectory;
    private CheckBoxPreference mButtonStockQuotes;
    private CheckBoxPreference mButtonTechnologyNews;
    private MyHandler mHandler;
    private ListPreference mListLanguage;
    private Phone mPhone;


    private void enableDisableAllCbConfigButtons(boolean flag)
    {
        mButtonEmergencyBroadcast.setEnabled(flag);
        mListLanguage.setEnabled(flag);
        mButtonAdministrative.setEnabled(flag);
        mButtonMaintenance.setEnabled(flag);
        mButtonLocalWeather.setEnabled(flag);
        mButtonAtr.setEnabled(flag);
        mButtonLafs.setEnabled(flag);
        mButtonRestaurants.setEnabled(flag);
        mButtonLodgings.setEnabled(flag);
        mButtonRetailDirectory.setEnabled(flag);
        mButtonAdvertisements.setEnabled(flag);
        mButtonStockQuotes.setEnabled(flag);
        mButtonEo.setEnabled(flag);
        mButtonMhh.setEnabled(flag);
        mButtonTechnologyNews.setEnabled(flag);
        mButtonMultiCategory.setEnabled(flag);
        mButtonLocal1.setEnabled(flag);
        mButtonRegional1.setEnabled(flag);
        mButtonNational1.setEnabled(flag);
        mButtonInternational1.setEnabled(flag);
        mButtonLocal2.setEnabled(flag);
        mButtonRegional2.setEnabled(flag);
        mButtonNational2.setEnabled(flag);
        mButtonInternational2.setEnabled(flag);
        mButtonLocal3.setEnabled(flag);
        mButtonRegional3.setEnabled(flag);
        mButtonNational3.setEnabled(flag);
        mButtonInternational3.setEnabled(flag);
        mButtonLocal4.setEnabled(flag);
        mButtonRegional4.setEnabled(flag);
        mButtonNational4.setEnabled(flag);
        mButtonInternational4.setEnabled(flag);
    }

    private void setAllCbConfigButtons(int ai[])
    {
        boolean flag = true;
        CheckBoxPreference checkboxpreference = mButtonEmergencyBroadcast;
        boolean flag1;
        if (ai[flag] != 0)
            flag1 = flag;
        else
            flag1 = false;
        checkboxpreference.setChecked(flag1);
        mListLanguage.setValueIndex(-1 + CellBroadcastSmsConfig.getConfigDataLanguage());
        CheckBoxPreference checkboxpreference1 = mButtonAdministrative;
        boolean flag2;
        if (ai[2] != 0)
            flag2 = flag;
        else
            flag2 = false;
        checkboxpreference1.setChecked(flag2);
        CheckBoxPreference checkboxpreference2 = mButtonMaintenance;
        boolean flag3;
        if (ai[3] != 0)
            flag3 = flag;
        else
            flag3 = false;
        checkboxpreference2.setChecked(flag3);
        CheckBoxPreference checkboxpreference3 = mButtonLocalWeather;
        boolean flag4;
        if (ai[20] != 0)
            flag4 = flag;
        else
            flag4 = false;
        checkboxpreference3.setChecked(flag4);
        CheckBoxPreference checkboxpreference4 = mButtonAtr;
        boolean flag5;
        if (ai[21] != 0)
            flag5 = flag;
        else
            flag5 = false;
        checkboxpreference4.setChecked(flag5);
        CheckBoxPreference checkboxpreference5 = mButtonLafs;
        boolean flag6;
        if (ai[22] != 0)
            flag6 = flag;
        else
            flag6 = false;
        checkboxpreference5.setChecked(flag6);
        CheckBoxPreference checkboxpreference6 = mButtonRestaurants;
        boolean flag7;
        if (ai[23] != 0)
            flag7 = flag;
        else
            flag7 = false;
        checkboxpreference6.setChecked(flag7);
        CheckBoxPreference checkboxpreference7 = mButtonLodgings;
        boolean flag8;
        if (ai[24] != 0)
            flag8 = flag;
        else
            flag8 = false;
        checkboxpreference7.setChecked(flag8);
        CheckBoxPreference checkboxpreference8 = mButtonRetailDirectory;
        boolean flag9;
        if (ai[25] != 0)
            flag9 = flag;
        else
            flag9 = false;
        checkboxpreference8.setChecked(flag9);
        CheckBoxPreference checkboxpreference9 = mButtonAdvertisements;
        boolean flag10;
        if (ai[26] != 0)
            flag10 = flag;
        else
            flag10 = false;
        checkboxpreference9.setChecked(flag10);
        CheckBoxPreference checkboxpreference10 = mButtonStockQuotes;
        boolean flag11;
        if (ai[27] != 0)
            flag11 = flag;
        else
            flag11 = false;
        checkboxpreference10.setChecked(flag11);
        CheckBoxPreference checkboxpreference11 = mButtonEo;
        boolean flag12;
        if (ai[28] != 0)
            flag12 = flag;
        else
            flag12 = false;
        checkboxpreference11.setChecked(flag12);
        CheckBoxPreference checkboxpreference12 = mButtonMhh;
        boolean flag13;
        if (ai[29] != 0)
            flag13 = flag;
        else
            flag13 = false;
        checkboxpreference12.setChecked(flag13);
        CheckBoxPreference checkboxpreference13 = mButtonTechnologyNews;
        boolean flag14;
        if (ai[30] != 0)
            flag14 = flag;
        else
            flag14 = false;
        checkboxpreference13.setChecked(flag14);
        CheckBoxPreference checkboxpreference14 = mButtonMultiCategory;
        boolean flag15;
        if (ai[31] != 0)
            flag15 = flag;
        else
            flag15 = false;
        checkboxpreference14.setChecked(flag15);
        CheckBoxPreference checkboxpreference15 = mButtonLocal1;
        boolean flag16;
        if (ai[4] != 0)
            flag16 = flag;
        else
            flag16 = false;
        checkboxpreference15.setChecked(flag16);
        CheckBoxPreference checkboxpreference16 = mButtonRegional1;
        boolean flag17;
        if (ai[5] != 0)
            flag17 = flag;
        else
            flag17 = false;
        checkboxpreference16.setChecked(flag17);
        CheckBoxPreference checkboxpreference17 = mButtonNational1;
        boolean flag18;
        if (ai[6] != 0)
            flag18 = flag;
        else
            flag18 = false;
        checkboxpreference17.setChecked(flag18);
        CheckBoxPreference checkboxpreference18 = mButtonInternational1;
        boolean flag19;
        if (ai[7] != 0)
            flag19 = flag;
        else
            flag19 = false;
        checkboxpreference18.setChecked(flag19);
        CheckBoxPreference checkboxpreference19 = mButtonLocal2;
        boolean flag20;
        if (ai[8] != 0)
            flag20 = flag;
        else
            flag20 = false;
        checkboxpreference19.setChecked(flag20);
        CheckBoxPreference checkboxpreference20 = mButtonRegional2;
        boolean flag21;
        if (ai[9] != 0)
            flag21 = flag;
        else
            flag21 = false;
        checkboxpreference20.setChecked(flag21);
        CheckBoxPreference checkboxpreference21 = mButtonNational2;
        boolean flag22;
        if (ai[10] != 0)
            flag22 = flag;
        else
            flag22 = false;
        checkboxpreference21.setChecked(flag22);
        CheckBoxPreference checkboxpreference22 = mButtonInternational2;
        boolean flag23;
        if (ai[11] != 0)
            flag23 = flag;
        else
            flag23 = false;
        checkboxpreference22.setChecked(flag23);
        CheckBoxPreference checkboxpreference23 = mButtonLocal3;
        boolean flag24;
        if (ai[12] != 0)
            flag24 = flag;
        else
            flag24 = false;
        checkboxpreference23.setChecked(flag24);
        CheckBoxPreference checkboxpreference24 = mButtonRegional3;
        boolean flag25;
        if (ai[13] != 0)
            flag25 = flag;
        else
            flag25 = false;
        checkboxpreference24.setChecked(flag25);
        CheckBoxPreference checkboxpreference25 = mButtonNational3;
        boolean flag26;
        if (ai[14] != 0)
            flag26 = flag;
        else
            flag26 = false;
        checkboxpreference25.setChecked(flag26);
        CheckBoxPreference checkboxpreference26 = mButtonInternational3;
        boolean flag27;
        if (ai[15] != 0)
            flag27 = flag;
        else
            flag27 = false;
        checkboxpreference26.setChecked(flag27);
        CheckBoxPreference checkboxpreference27 = mButtonLocal4;
        boolean flag28;
        if (ai[16] != 0)
            flag28 = flag;
        else
            flag28 = false;
        checkboxpreference27.setChecked(flag28);
        CheckBoxPreference checkboxpreference28 = mButtonRegional4;
        boolean flag29;
        if (ai[17] != 0)
            flag29 = flag;
        else
            flag29 = false;
        checkboxpreference28.setChecked(flag29);
        CheckBoxPreference checkboxpreference29 = mButtonNational4;
        boolean flag30;
        if (ai[18] != 0)
            flag30 = flag;
        else
            flag30 = false;
        checkboxpreference29.setChecked(flag30);
        CheckBoxPreference checkboxpreference30 = mButtonInternational4;
        if (ai[19] == 0)
            flag = false;
        checkboxpreference30.setChecked(flag);
    }

    public void onCreate(Bundle bundle)
    {
        super.onCreate(bundle);
        addPreferencesFromResource(0x7f06000c);
        mPhone = PhoneGlobals.getPhone();
        mHandler = new MyHandler();
        PreferenceScreen preferencescreen = getPreferenceScreen();
        mButtonBcSms = (CheckBoxPreference)preferencescreen.findPreference("button_enable_disable_cell_bc_sms");
        mListLanguage = (ListPreference)preferencescreen.findPreference("list_language");
        mListLanguage.setOnPreferenceChangeListener(this);
        mButtonEmergencyBroadcast = (CheckBoxPreference)preferencescreen.findPreference("button_emergency_broadcast");
        mButtonAdministrative = (CheckBoxPreference)preferencescreen.findPreference("button_administrative");
        mButtonMaintenance = (CheckBoxPreference)preferencescreen.findPreference("button_maintenance");
        mButtonLocalWeather = (CheckBoxPreference)preferencescreen.findPreference("button_local_weather");
        mButtonAtr = (CheckBoxPreference)preferencescreen.findPreference("button_atr");
        mButtonLafs = (CheckBoxPreference)preferencescreen.findPreference("button_lafs");
        mButtonRestaurants = (CheckBoxPreference)preferencescreen.findPreference("button_restaurants");
        mButtonLodgings = (CheckBoxPreference)preferencescreen.findPreference("button_lodgings");
        mButtonRetailDirectory = (CheckBoxPreference)preferencescreen.findPreference("button_retail_directory");
        mButtonAdvertisements = (CheckBoxPreference)preferencescreen.findPreference("button_advertisements");
        mButtonStockQuotes = (CheckBoxPreference)preferencescreen.findPreference("button_stock_quotes");
        mButtonEo = (CheckBoxPreference)preferencescreen.findPreference("button_eo");
        mButtonMhh = (CheckBoxPreference)preferencescreen.findPreference("button_mhh");
        mButtonTechnologyNews = (CheckBoxPreference)preferencescreen.findPreference("button_technology_news");
        mButtonMultiCategory = (CheckBoxPreference)preferencescreen.findPreference("button_multi_category");
        mButtonLocal1 = (CheckBoxPreference)preferencescreen.findPreference("button_local_general_news");
        mButtonRegional1 = (CheckBoxPreference)preferencescreen.findPreference("button_regional_general_news");
        mButtonNational1 = (CheckBoxPreference)preferencescreen.findPreference("button_national_general_news");
        mButtonInternational1 = (CheckBoxPreference)preferencescreen.findPreference("button_international_general_news");
        mButtonLocal2 = (CheckBoxPreference)preferencescreen.findPreference("button_local_bf_news");
        mButtonRegional2 = (CheckBoxPreference)preferencescreen.findPreference("button_regional_bf_news");
        mButtonNational2 = (CheckBoxPreference)preferencescreen.findPreference("button_national_bf_news");
        mButtonInternational2 = (CheckBoxPreference)preferencescreen.findPreference("button_international_bf_news");
        mButtonLocal3 = (CheckBoxPreference)preferencescreen.findPreference("button_local_sports_news");
        mButtonRegional3 = (CheckBoxPreference)preferencescreen.findPreference("button_regional_sports_news");
        mButtonNational3 = (CheckBoxPreference)preferencescreen.findPreference("button_national_sports_news");
        mButtonInternational3 = (CheckBoxPreference)preferencescreen.findPreference("button_international_sports_news");
        mButtonLocal4 = (CheckBoxPreference)preferencescreen.findPreference("button_local_entertainment_news");
        mButtonRegional4 = (CheckBoxPreference)preferencescreen.findPreference("button_regional_entertainment_news");
        mButtonNational4 = (CheckBoxPreference)preferencescreen.findPreference("button_national_entertainment_news");
        mButtonInternational4 = (CheckBoxPreference)preferencescreen.findPreference("button_international_entertainment_news");
    }

    protected void onPause()
    {
        super.onPause();
        CellBroadcastSmsConfig.setCbSmsNoOfStructs(31);
        mPhone.setCellBroadcastSmsConfig(CellBroadcastSmsConfig.getCbSmsAllValues(), Message.obtain(mHandler, 3));
    }

    public boolean onPreferenceChange(Preference preference, Object obj)
    {
        if (preference == mListLanguage)
            CellBroadcastSmsConfig.setConfigDataCompleteLanguage(1 + mListLanguage.findIndexOfValue((String)obj));
        return true;
    }

    public boolean onPreferenceTreeClick(PreferenceScreen preferencescreen, Preference preference)
    {
label0:
        {
            if (preference == mButtonBcSms)
            {
                if (mButtonBcSms.isChecked())
                {
                    mPhone.activateCellBroadcastSms(0, Message.obtain(mHandler, 1));
                    android.provider.Settings.Global.putInt(mPhone.getContext().getContentResolver(), "cdma_cell_broadcast_sms", 0);
                    enableDisableAllCbConfigButtons(true);
                } else
                {
                    mPhone.activateCellBroadcastSms(1, Message.obtain(mHandler, 1));
                    android.provider.Settings.Global.putInt(mPhone.getContext().getContentResolver(), "cdma_cell_broadcast_sms", 1);
                    enableDisableAllCbConfigButtons(false);
                }
            } else
            if (preference != mListLanguage)
                if (preference == mButtonEmergencyBroadcast)
                {
                    CellBroadcastSmsConfig.setConfigDataCompleteBSelected(mButtonEmergencyBroadcast.isChecked(), 1);
                    CellBroadcastSmsConfig.setCbSmsBSelectedValue(mButtonEmergencyBroadcast.isChecked(), 1);
                } else
                if (preference == mButtonAdministrative)
                {
                    CellBroadcastSmsConfig.setConfigDataCompleteBSelected(mButtonAdministrative.isChecked(), 2);
                    CellBroadcastSmsConfig.setCbSmsBSelectedValue(mButtonAdministrative.isChecked(), 2);
                } else
                if (preference == mButtonMaintenance)
                {
                    CellBroadcastSmsConfig.setConfigDataCompleteBSelected(mButtonMaintenance.isChecked(), 3);
                    CellBroadcastSmsConfig.setCbSmsBSelectedValue(mButtonMaintenance.isChecked(), 3);
                } else
                if (preference == mButtonLocalWeather)
                {
                    CellBroadcastSmsConfig.setConfigDataCompleteBSelected(mButtonLocalWeather.isChecked(), 20);
                    CellBroadcastSmsConfig.setCbSmsBSelectedValue(mButtonLocalWeather.isChecked(), 20);
                } else
                if (preference == mButtonAtr)
                {
                    CellBroadcastSmsConfig.setConfigDataCompleteBSelected(mButtonAtr.isChecked(), 21);
                    CellBroadcastSmsConfig.setCbSmsBSelectedValue(mButtonAtr.isChecked(), 21);
                } else
                if (preference == mButtonLafs)
                {
                    CellBroadcastSmsConfig.setConfigDataCompleteBSelected(mButtonLafs.isChecked(), 22);
                    CellBroadcastSmsConfig.setCbSmsBSelectedValue(mButtonLafs.isChecked(), 22);
                } else
                if (preference == mButtonRestaurants)
                {
                    CellBroadcastSmsConfig.setConfigDataCompleteBSelected(mButtonRestaurants.isChecked(), 23);
                    CellBroadcastSmsConfig.setCbSmsBSelectedValue(mButtonRestaurants.isChecked(), 23);
                } else
                if (preference == mButtonLodgings)
                {
                    CellBroadcastSmsConfig.setConfigDataCompleteBSelected(mButtonLodgings.isChecked(), 24);
                    CellBroadcastSmsConfig.setCbSmsBSelectedValue(mButtonLodgings.isChecked(), 24);
                } else
                if (preference == mButtonRetailDirectory)
                {
                    CellBroadcastSmsConfig.setConfigDataCompleteBSelected(mButtonRetailDirectory.isChecked(), 25);
                    CellBroadcastSmsConfig.setCbSmsBSelectedValue(mButtonRetailDirectory.isChecked(), 25);
                } else
                if (preference == mButtonAdvertisements)
                {
                    CellBroadcastSmsConfig.setConfigDataCompleteBSelected(mButtonAdvertisements.isChecked(), 26);
                    CellBroadcastSmsConfig.setCbSmsBSelectedValue(mButtonAdvertisements.isChecked(), 26);
                } else
                if (preference == mButtonStockQuotes)
                {
                    CellBroadcastSmsConfig.setConfigDataCompleteBSelected(mButtonStockQuotes.isChecked(), 27);
                    CellBroadcastSmsConfig.setCbSmsBSelectedValue(mButtonStockQuotes.isChecked(), 27);
                } else
                if (preference == mButtonEo)
                {
                    CellBroadcastSmsConfig.setConfigDataCompleteBSelected(mButtonEo.isChecked(), 28);
                    CellBroadcastSmsConfig.setCbSmsBSelectedValue(mButtonEo.isChecked(), 28);
                } else
                if (preference == mButtonMhh)
                {
                    CellBroadcastSmsConfig.setConfigDataCompleteBSelected(mButtonMhh.isChecked(), 29);
                    CellBroadcastSmsConfig.setCbSmsBSelectedValue(mButtonMhh.isChecked(), 29);
                } else
                if (preference == mButtonTechnologyNews)
                {
                    CellBroadcastSmsConfig.setConfigDataCompleteBSelected(mButtonTechnologyNews.isChecked(), 30);
                    CellBroadcastSmsConfig.setCbSmsBSelectedValue(mButtonTechnologyNews.isChecked(), 30);
                } else
                if (preference == mButtonMultiCategory)
                {
                    CellBroadcastSmsConfig.setConfigDataCompleteBSelected(mButtonMultiCategory.isChecked(), 31);
                    CellBroadcastSmsConfig.setCbSmsBSelectedValue(mButtonMultiCategory.isChecked(), 31);
                } else
                if (preference == mButtonLocal1)
                {
                    CellBroadcastSmsConfig.setConfigDataCompleteBSelected(mButtonLocal1.isChecked(), 4);
                    CellBroadcastSmsConfig.setCbSmsBSelectedValue(mButtonLocal1.isChecked(), 4);
                } else
                if (preference == mButtonRegional1)
                {
                    CellBroadcastSmsConfig.setConfigDataCompleteBSelected(mButtonRegional1.isChecked(), 5);
                    CellBroadcastSmsConfig.setCbSmsBSelectedValue(mButtonRegional1.isChecked(), 5);
                } else
                if (preference == mButtonNational1)
                {
                    CellBroadcastSmsConfig.setConfigDataCompleteBSelected(mButtonNational1.isChecked(), 6);
                    CellBroadcastSmsConfig.setCbSmsBSelectedValue(mButtonNational1.isChecked(), 6);
                } else
                if (preference == mButtonInternational1)
                {
                    CellBroadcastSmsConfig.setConfigDataCompleteBSelected(mButtonInternational1.isChecked(), 7);
                    CellBroadcastSmsConfig.setCbSmsBSelectedValue(mButtonInternational1.isChecked(), 7);
                } else
                if (preference == mButtonLocal2)
                {
                    CellBroadcastSmsConfig.setConfigDataCompleteBSelected(mButtonLocal2.isChecked(), 8);
                    CellBroadcastSmsConfig.setCbSmsBSelectedValue(mButtonLocal2.isChecked(), 8);
                } else
                if (preference == mButtonRegional2)
                {
                    CellBroadcastSmsConfig.setConfigDataCompleteBSelected(mButtonRegional2.isChecked(), 9);
                    CellBroadcastSmsConfig.setCbSmsBSelectedValue(mButtonRegional2.isChecked(), 9);
                } else
                if (preference == mButtonNational2)
                {
                    CellBroadcastSmsConfig.setConfigDataCompleteBSelected(mButtonNational2.isChecked(), 10);
                    CellBroadcastSmsConfig.setCbSmsBSelectedValue(mButtonNational2.isChecked(), 10);
                } else
                if (preference == mButtonInternational2)
                {
                    CellBroadcastSmsConfig.setConfigDataCompleteBSelected(mButtonInternational2.isChecked(), 11);
                    CellBroadcastSmsConfig.setCbSmsBSelectedValue(mButtonInternational2.isChecked(), 11);
                } else
                if (preference == mButtonLocal3)
                {
                    CellBroadcastSmsConfig.setConfigDataCompleteBSelected(mButtonLocal3.isChecked(), 12);
                    CellBroadcastSmsConfig.setCbSmsBSelectedValue(mButtonLocal3.isChecked(), 12);
                } else
                if (preference == mButtonRegional3)
                {
                    CellBroadcastSmsConfig.setConfigDataCompleteBSelected(mButtonRegional3.isChecked(), 13);
                    CellBroadcastSmsConfig.setCbSmsBSelectedValue(mButtonRegional3.isChecked(), 13);
                } else
                if (preference == mButtonNational3)
                {
                    CellBroadcastSmsConfig.setConfigDataCompleteBSelected(mButtonNational3.isChecked(), 14);
                    CellBroadcastSmsConfig.setCbSmsBSelectedValue(mButtonNational3.isChecked(), 14);
                } else
                if (preference == mButtonInternational3)
                {
                    CellBroadcastSmsConfig.setConfigDataCompleteBSelected(mButtonInternational3.isChecked(), 15);
                    CellBroadcastSmsConfig.setCbSmsBSelectedValue(mButtonInternational3.isChecked(), 15);
                } else
                if (preference == mButtonLocal4)
                {
                    CellBroadcastSmsConfig.setConfigDataCompleteBSelected(mButtonLocal4.isChecked(), 16);
                    CellBroadcastSmsConfig.setCbSmsBSelectedValue(mButtonLocal4.isChecked(), 16);
                } else
                if (preference == mButtonRegional4)
                {
                    CellBroadcastSmsConfig.setConfigDataCompleteBSelected(mButtonRegional4.isChecked(), 17);
                    CellBroadcastSmsConfig.setCbSmsBSelectedValue(mButtonRegional4.isChecked(), 17);
                } else
                if (preference == mButtonNational4)
                {
                    CellBroadcastSmsConfig.setConfigDataCompleteBSelected(mButtonNational4.isChecked(), 18);
                    CellBroadcastSmsConfig.setCbSmsBSelectedValue(mButtonNational4.isChecked(), 18);
                } else
                {
                    if (preference != mButtonInternational4)
                        break label0;
                    CellBroadcastSmsConfig.setConfigDataCompleteBSelected(mButtonInternational4.isChecked(), 19);
                    CellBroadcastSmsConfig.setCbSmsBSelectedValue(mButtonInternational4.isChecked(), 19);
                }
            return true;
        }
        preferencescreen.setEnabled(false);
        return false;
    }

    protected void onResume()
    {
        super.onResume();
        getPreferenceScreen().setEnabled(true);
        int i = android.provider.Settings.Global.getInt(mPhone.getContext().getContentResolver(), "cdma_cell_broadcast_sms", 1);
        CheckBoxPreference checkboxpreference = mButtonBcSms;
        boolean flag;
        if (i == 0)
            flag = true;
        else
            flag = false;
        checkboxpreference.setChecked(flag);
        if (mButtonBcSms.isChecked())
            enableDisableAllCbConfigButtons(true);
        else
            enableDisableAllCbConfigButtons(false);
        mPhone.getCellBroadcastSmsConfig(Message.obtain(mHandler, 2));
    }





}
