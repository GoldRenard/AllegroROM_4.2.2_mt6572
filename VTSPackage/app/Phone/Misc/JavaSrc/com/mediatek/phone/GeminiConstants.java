// Decompiled by Jad v1.5.8g. Copyright 2001 Pavel Kouznetsov.
// Jad home page: http://www.kpdus.com/jad.html
// Decompiler options: packimports(3) fieldsfirst noctor space 

package com.mediatek.phone;

import com.android.internal.telephony.PhoneConstants;

public class GeminiConstants
{

    public static final String FDN_CONTENT = "content://icc/fdn";
    public static final String FDN_CONTENT_GEMINI[];
    public static final String FDN_CONTENT_SIM1 = "content://icc/fdn1";
    public static final String FDN_CONTENT_SIM2 = "content://icc/fdn2";
    public static final String FDN_CONTENT_SIM3 = "content://icc/fdn3";
    public static final String FDN_CONTENT_SIM4 = "content://icc/fdn4";
    public static final String GSM_ROAMING_INDICATOR_NEEDED = "gsm.roaming.indicator.needed";
    public static final String GSM_ROAMING_INDICATOR_NEEDED_2 = "gsm.roaming.indicator.needed.2";
    public static final String GSM_ROAMING_INDICATOR_NEEDED_3 = "gsm.roaming.indicator.needed.3";
    public static final String GSM_ROAMING_INDICATOR_NEEDED_4 = "gsm.roaming.indicator.needed.4";
    public static final String GSM_ROAMING_INDICATOR_NEEDED_GEMINI[];
    public static final String GSM_SIM_RETRY_PIN = "gsm.sim.retry.pin";
    public static final String GSM_SIM_RETRY_PIN2 = "gsm.sim.retry.pin2";
    public static final String GSM_SIM_RETRY_PIN2_2 = "gsm.sim.retry.pin2.2";
    public static final String GSM_SIM_RETRY_PIN2_3 = "gsm.sim.retry.pin2.3";
    public static final String GSM_SIM_RETRY_PIN2_4 = "gsm.sim.retry.pin2.4";
    public static final String GSM_SIM_RETRY_PIN2_GEMINI[];
    public static final String GSM_SIM_RETRY_PIN_2 = "gsm.sim.retry.pin1.2";
    public static final String GSM_SIM_RETRY_PIN_3 = "gsm.sim.retry.pin1.3";
    public static final String GSM_SIM_RETRY_PIN_4 = "gsm.sim.retry.pin1.4";
    public static final String GSM_SIM_RETRY_PIN_GEMINI[];
    public static final String GSM_SIM_RETRY_PUK2 = "gsm.sim.retry.puk2";
    public static final String GSM_SIM_RETRY_PUK2_2 = "gsm.sim.retry.puk2.2";
    public static final String GSM_SIM_RETRY_PUK2_3 = "gsm.sim.retry.puk2.3";
    public static final String GSM_SIM_RETRY_PUK2_4 = "gsm.sim.retry.puk2.4";
    public static final String GSM_SIM_RETRY_PUK2_GEMINI[];
    public static final String NETWORK_SELECTION_KEY = "network_selection_key";
    public static final String NETWORK_SELECTION_KEYS[];
    public static final String NETWORK_SELECTION_KEY_2 = "network_selection_key_2";
    public static final String NETWORK_SELECTION_KEY_3 = "network_selection_key_3";
    public static final String NETWORK_SELECTION_KEY_4 = "network_selection_key_4";
    public static final String NETWORK_SELECTION_NAME_KEY = "network_selection_name_key";
    public static final String NETWORK_SELECTION_NAME_KEYS[];
    public static final String NETWORK_SELECTION_NAME_KEY_2 = "network_selection_name_key_2";
    public static final String NETWORK_SELECTION_NAME_KEY_3 = "network_selection_name_key_3";
    public static final String NETWORK_SELECTION_NAME_KEY_4 = "network_selection_name_key_4";
    public static final String PROPERTY_CS_NETWORK_TYPE = "gsm.cs.network.type";
    public static final String PROPERTY_CS_NETWORK_TYPES[];
    public static final String PROPERTY_CS_NETWORK_TYPE_2 = "gsm.cs.network.type.2";
    public static final String PROPERTY_CS_NETWORK_TYPE_3 = "gsm.cs.network.type.3";
    public static final String PROPERTY_CS_NETWORK_TYPE_4 = "gsm.cs.network.type.4";
    public static final String PROPERTY_OPERATOR_ALPHA = "gsm.operator.alpha";
    public static final String PROPERTY_OPERATOR_ALPHAS[];
    public static final String PROPERTY_OPERATOR_ALPHA_2 = "gsm.operator.alpha.2";
    public static final String PROPERTY_OPERATOR_ALPHA_3 = "gsm.operator.alpha.3";
    public static final String PROPERTY_OPERATOR_ALPHA_4 = "gsm.operator.alpha.4";
    public static final String PROPERTY_SIM_STATE = "gsm.sim.state";
    public static final String PROPERTY_SIM_STATES[];
    public static final String PROPERTY_SIM_STATE_2 = "gsm.sim.state.2";
    public static final String PROPERTY_SIM_STATE_3 = "gsm.sim.state.3";
    public static final String PROPERTY_SIM_STATE_4 = "gsm.sim.state.4";
    public static final int SLOTS[];
    public static final int SLOT_ID_1 = 0;
    public static final int SLOT_ID_2 = 1;
    public static final int SLOT_ID_3 = 2;
    public static final int SLOT_ID_4 = 3;
    public static final String SLOT_ID_KEY = "simId";
    public static final int SOLT_NUM;


    static 
    {
        SOLT_NUM = PhoneConstants.GEMINI_SIM_NUM;
        switch (SOLT_NUM)
        {
        case 4: // '\004'
            SLOTS = (new int[] {
                0, 1, 2, 3
            });
            NETWORK_SELECTION_KEYS = (new String[] {
                "network_selection_key", "network_selection_key_2", "network_selection_key_3", "network_selection_key_4"
            });
            NETWORK_SELECTION_NAME_KEYS = (new String[] {
                "network_selection_name_key", "network_selection_name_key_2", "network_selection_name_key_3", "network_selection_name_key_4"
            });
            PROPERTY_OPERATOR_ALPHAS = (new String[] {
                "gsm.operator.alpha", "gsm.operator.alpha.2", "gsm.operator.alpha.3", "gsm.operator.alpha.4"
            });
            PROPERTY_SIM_STATES = (new String[] {
                "gsm.sim.state", "gsm.sim.state.2", "gsm.sim.state.3", "gsm.sim.state.4"
            });
            PROPERTY_CS_NETWORK_TYPES = (new String[] {
                "gsm.cs.network.type", "gsm.cs.network.type.2", "gsm.cs.network.type.3", "gsm.cs.network.type.4"
            });
            FDN_CONTENT_GEMINI = (new String[] {
                "content://icc/fdn1", "content://icc/fdn2", "content://icc/fdn3", "content://icc/fdn4"
            });
            GSM_SIM_RETRY_PIN_GEMINI = (new String[] {
                "gsm.sim.retry.pin", "gsm.sim.retry.pin1.2", "gsm.sim.retry.pin1.3", "gsm.sim.retry.pin1.4"
            });
            GSM_SIM_RETRY_PIN2_GEMINI = (new String[] {
                "gsm.sim.retry.pin2", "gsm.sim.retry.pin2.2", "gsm.sim.retry.pin2.3", "gsm.sim.retry.pin2.4"
            });
            GSM_SIM_RETRY_PUK2_GEMINI = (new String[] {
                "gsm.sim.retry.puk2", "gsm.sim.retry.puk2.2", "gsm.sim.retry.puk2.3", "gsm.sim.retry.puk2.4"
            });
            GSM_ROAMING_INDICATOR_NEEDED_GEMINI = (new String[] {
                "gsm.roaming.indicator.needed", "gsm.roaming.indicator.needed.2", "gsm.roaming.indicator.needed.3", "gsm.roaming.indicator.needed.4"
            });
            break;

        case 3: // '\003'
            SLOTS = (new int[] {
                0, 1, 2
            });
            NETWORK_SELECTION_KEYS = (new String[] {
                "network_selection_key", "network_selection_key_2", "network_selection_key_3"
            });
            NETWORK_SELECTION_NAME_KEYS = (new String[] {
                "network_selection_name_key", "network_selection_name_key_2", "network_selection_name_key_3"
            });
            PROPERTY_OPERATOR_ALPHAS = (new String[] {
                "gsm.operator.alpha", "gsm.operator.alpha.2", "gsm.operator.alpha.3"
            });
            PROPERTY_SIM_STATES = (new String[] {
                "gsm.sim.state", "gsm.sim.state.2", "gsm.sim.state.3"
            });
            PROPERTY_CS_NETWORK_TYPES = (new String[] {
                "gsm.cs.network.type", "gsm.cs.network.type.2", "gsm.cs.network.type.3"
            });
            FDN_CONTENT_GEMINI = (new String[] {
                "content://icc/fdn1", "content://icc/fdn2", "content://icc/fdn3"
            });
            GSM_SIM_RETRY_PIN_GEMINI = (new String[] {
                "gsm.sim.retry.pin", "gsm.sim.retry.pin1.2", "gsm.sim.retry.pin1.3"
            });
            GSM_SIM_RETRY_PIN2_GEMINI = (new String[] {
                "gsm.sim.retry.pin2", "gsm.sim.retry.pin2.2", "gsm.sim.retry.pin2.3"
            });
            GSM_SIM_RETRY_PUK2_GEMINI = (new String[] {
                "gsm.sim.retry.puk2", "gsm.sim.retry.puk2.2", "gsm.sim.retry.puk2.3"
            });
            GSM_ROAMING_INDICATOR_NEEDED_GEMINI = (new String[] {
                "gsm.roaming.indicator.needed", "gsm.roaming.indicator.needed.2", "gsm.roaming.indicator.needed.3"
            });
            break;

        case 2: // '\002'
            SLOTS = (new int[] {
                0, 1
            });
            NETWORK_SELECTION_KEYS = (new String[] {
                "network_selection_key", "network_selection_key_2"
            });
            NETWORK_SELECTION_NAME_KEYS = (new String[] {
                "network_selection_name_key", "network_selection_name_key_2"
            });
            PROPERTY_OPERATOR_ALPHAS = (new String[] {
                "gsm.operator.alpha", "gsm.operator.alpha.2"
            });
            PROPERTY_SIM_STATES = (new String[] {
                "gsm.sim.state", "gsm.sim.state.2"
            });
            PROPERTY_CS_NETWORK_TYPES = (new String[] {
                "gsm.cs.network.type", "gsm.cs.network.type.2"
            });
            FDN_CONTENT_GEMINI = (new String[] {
                "content://icc/fdn1", "content://icc/fdn2"
            });
            GSM_SIM_RETRY_PIN_GEMINI = (new String[] {
                "gsm.sim.retry.pin", "gsm.sim.retry.pin1.2"
            });
            GSM_SIM_RETRY_PIN2_GEMINI = (new String[] {
                "gsm.sim.retry.pin2", "gsm.sim.retry.pin2.2"
            });
            GSM_SIM_RETRY_PUK2_GEMINI = (new String[] {
                "gsm.sim.retry.puk2", "gsm.sim.retry.puk2.2"
            });
            GSM_ROAMING_INDICATOR_NEEDED_GEMINI = (new String[] {
                "gsm.roaming.indicator.needed", "gsm.roaming.indicator.needed.2"
            });
            break;

        default:
            SLOTS = (new int[] {
                0
            });
            NETWORK_SELECTION_KEYS = (new String[] {
                "network_selection_key"
            });
            NETWORK_SELECTION_NAME_KEYS = (new String[] {
                "network_selection_name_key"
            });
            PROPERTY_OPERATOR_ALPHAS = (new String[] {
                "gsm.operator.alpha"
            });
            PROPERTY_SIM_STATES = (new String[] {
                "gsm.sim.state"
            });
            PROPERTY_CS_NETWORK_TYPES = (new String[] {
                "gsm.cs.network.type"
            });
            FDN_CONTENT_GEMINI = (new String[] {
                "content://icc/fdn"
            });
            GSM_SIM_RETRY_PIN_GEMINI = (new String[] {
                "gsm.sim.retry.pin"
            });
            GSM_SIM_RETRY_PIN2_GEMINI = (new String[] {
                "gsm.sim.retry.pin2"
            });
            GSM_SIM_RETRY_PUK2_GEMINI = (new String[] {
                "gsm.sim.retry.puk2"
            });
            GSM_ROAMING_INDICATOR_NEEDED_GEMINI = (new String[] {
                "gsm.roaming.indicator.needed"
            });
            break;
        }
    }
}
