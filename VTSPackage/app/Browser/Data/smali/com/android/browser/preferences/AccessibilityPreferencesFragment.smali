.class public Lcom/android/browser/preferences/AccessibilityPreferencesFragment;
.super Landroid/preference/PreferenceFragment;
.source "AccessibilityPreferencesFragment.java"

# interfaces
.implements Landroid/preference/Preference$OnPreferenceChangeListener;


# instance fields
.field private mBrowserSmallFeatureEx:Lcom/mediatek/browser/ext/IBrowserSmallFeatureEx;

.field mControlWebView:Landroid/webkit/WebView;

.field mFormat:Ljava/text/NumberFormat;


# direct methods
.method public constructor <init>()V
    .locals 1

    .prologue
    .line 33
    invoke-direct {p0}, Landroid/preference/PreferenceFragment;-><init>()V

    .line 40
    const/4 v0, 0x0

    iput-object v0, p0, Lcom/android/browser/preferences/AccessibilityPreferencesFragment;->mBrowserSmallFeatureEx:Lcom/mediatek/browser/ext/IBrowserSmallFeatureEx;

    return-void
.end method


# virtual methods
.method public onCreate(Landroid/os/Bundle;)V
    .locals 4
    .parameter "savedInstanceState"

    .prologue
    .line 44
    invoke-super {p0, p1}, Landroid/preference/PreferenceFragment;->onCreate(Landroid/os/Bundle;)V

    .line 45
    new-instance v2, Landroid/webkit/WebView;

    invoke-virtual {p0}, Lcom/android/browser/preferences/AccessibilityPreferencesFragment;->getActivity()Landroid/app/Activity;

    move-result-object v3

    invoke-direct {v2, v3}, Landroid/webkit/WebView;-><init>(Landroid/content/Context;)V

    iput-object v2, p0, Lcom/android/browser/preferences/AccessibilityPreferencesFragment;->mControlWebView:Landroid/webkit/WebView;

    .line 46
    const/high16 v2, 0x7f06

    invoke-virtual {p0, v2}, Lcom/android/browser/preferences/AccessibilityPreferencesFragment;->addPreferencesFromResource(I)V

    .line 47
    invoke-static {}, Lcom/android/browser/BrowserSettings;->getInstance()Lcom/android/browser/BrowserSettings;

    move-result-object v1

    .line 48
    .local v1, settings:Lcom/android/browser/BrowserSettings;
    invoke-static {}, Ljava/text/NumberFormat;->getPercentInstance()Ljava/text/NumberFormat;

    move-result-object v2

    iput-object v2, p0, Lcom/android/browser/preferences/AccessibilityPreferencesFragment;->mFormat:Ljava/text/NumberFormat;

    .line 50
    const-string v2, "min_font_size"

    invoke-virtual {p0, v2}, Lcom/android/browser/preferences/AccessibilityPreferencesFragment;->findPreference(Ljava/lang/CharSequence;)Landroid/preference/Preference;

    move-result-object v0

    .line 51
    .local v0, e:Landroid/preference/Preference;
    invoke-virtual {v0, p0}, Landroid/preference/Preference;->setOnPreferenceChangeListener(Landroid/preference/Preference$OnPreferenceChangeListener;)V

    .line 52
    invoke-virtual {v1}, Lcom/android/browser/BrowserSettings;->getMinimumFontSize()I

    move-result v2

    invoke-virtual {p0, v0, v2}, Lcom/android/browser/preferences/AccessibilityPreferencesFragment;->updateMinFontSummary(Landroid/preference/Preference;I)V

    .line 53
    const-string v2, "font_family"

    invoke-virtual {p0, v2}, Lcom/android/browser/preferences/AccessibilityPreferencesFragment;->findPreference(Ljava/lang/CharSequence;)Landroid/preference/Preference;

    move-result-object v0

    .line 56
    invoke-virtual {p0}, Lcom/android/browser/preferences/AccessibilityPreferencesFragment;->getActivity()Landroid/app/Activity;

    move-result-object v2

    invoke-static {v2}, Lcom/mediatek/browser/ext/Extensions;->getSmallFeaturePlugin(Landroid/content/Context;)Lcom/mediatek/browser/ext/IBrowserSmallFeatureEx;

    move-result-object v2

    iput-object v2, p0, Lcom/android/browser/preferences/AccessibilityPreferencesFragment;->mBrowserSmallFeatureEx:Lcom/mediatek/browser/ext/IBrowserSmallFeatureEx;

    .line 57
    iget-object v2, p0, Lcom/android/browser/preferences/AccessibilityPreferencesFragment;->mBrowserSmallFeatureEx:Lcom/mediatek/browser/ext/IBrowserSmallFeatureEx;

    invoke-virtual {v1}, Lcom/android/browser/BrowserSettings;->getFontFamily()Ljava/lang/String;

    move-result-object v3

    invoke-interface {v2, v0, v3, p0}, Lcom/mediatek/browser/ext/IBrowserSmallFeatureEx;->updatePreferenceItemAndSetListener(Landroid/preference/Preference;Ljava/lang/String;Landroid/preference/Preference$OnPreferenceChangeListener;)V

    .line 60
    const-string v2, "text_zoom"

    invoke-virtual {p0, v2}, Lcom/android/browser/preferences/AccessibilityPreferencesFragment;->findPreference(Ljava/lang/CharSequence;)Landroid/preference/Preference;

    move-result-object v0

    .line 61
    invoke-virtual {v0, p0}, Landroid/preference/Preference;->setOnPreferenceChangeListener(Landroid/preference/Preference$OnPreferenceChangeListener;)V

    .line 62
    invoke-virtual {v1}, Lcom/android/browser/BrowserSettings;->getTextZoom()I

    move-result v2

    invoke-virtual {p0, v0, v2}, Lcom/android/browser/preferences/AccessibilityPreferencesFragment;->updateTextZoomSummary(Landroid/preference/Preference;I)V

    .line 63
    const-string v2, "double_tap_zoom"

    invoke-virtual {p0, v2}, Lcom/android/browser/preferences/AccessibilityPreferencesFragment;->findPreference(Ljava/lang/CharSequence;)Landroid/preference/Preference;

    move-result-object v0

    .line 64
    invoke-virtual {v0, p0}, Landroid/preference/Preference;->setOnPreferenceChangeListener(Landroid/preference/Preference$OnPreferenceChangeListener;)V

    .line 65
    invoke-virtual {v1}, Lcom/android/browser/BrowserSettings;->getDoubleTapZoom()I

    move-result v2

    invoke-virtual {p0, v0, v2}, Lcom/android/browser/preferences/AccessibilityPreferencesFragment;->updateDoubleTapZoomSummary(Landroid/preference/Preference;I)V

    .line 66
    const-string v2, "inverted_contrast"

    invoke-virtual {p0, v2}, Lcom/android/browser/preferences/AccessibilityPreferencesFragment;->findPreference(Ljava/lang/CharSequence;)Landroid/preference/Preference;

    move-result-object v0

    .line 67
    invoke-virtual {v0, p0}, Landroid/preference/Preference;->setOnPreferenceChangeListener(Landroid/preference/Preference$OnPreferenceChangeListener;)V

    .line 68
    invoke-virtual {v1}, Lcom/android/browser/BrowserSettings;->getInvertedContrast()F

    move-result v2

    const/high16 v3, 0x42c8

    mul-float/2addr v2, v3

    float-to-int v2, v2

    invoke-virtual {p0, v0, v2}, Lcom/android/browser/preferences/AccessibilityPreferencesFragment;->updateInvertedContrastSummary(Landroid/preference/Preference;I)V

    .line 69
    return-void
.end method

.method public onDestroy()V
    .locals 1

    .prologue
    .line 85
    invoke-super {p0}, Landroid/preference/PreferenceFragment;->onDestroy()V

    .line 86
    iget-object v0, p0, Lcom/android/browser/preferences/AccessibilityPreferencesFragment;->mControlWebView:Landroid/webkit/WebView;

    invoke-virtual {v0}, Landroid/webkit/WebView;->destroy()V

    .line 87
    const/4 v0, 0x0

    iput-object v0, p0, Lcom/android/browser/preferences/AccessibilityPreferencesFragment;->mControlWebView:Landroid/webkit/WebView;

    .line 88
    return-void
.end method

.method public onPause()V
    .locals 1

    .prologue
    .line 79
    invoke-super {p0}, Landroid/preference/PreferenceFragment;->onPause()V

    .line 80
    iget-object v0, p0, Lcom/android/browser/preferences/AccessibilityPreferencesFragment;->mControlWebView:Landroid/webkit/WebView;

    invoke-virtual {v0}, Landroid/webkit/WebView;->pauseTimers()V

    .line 81
    return-void
.end method

.method public onPreferenceChange(Landroid/preference/Preference;Ljava/lang/Object;)Z
    .locals 3
    .parameter "pref"
    .parameter "objValue"

    .prologue
    .line 109
    invoke-virtual {p0}, Lcom/android/browser/preferences/AccessibilityPreferencesFragment;->getActivity()Landroid/app/Activity;

    move-result-object v1

    if-nez v1, :cond_0

    .line 112
    const/4 v1, 0x0

    .line 138
    :goto_0
    return v1

    .line 115
    :cond_0
    const-string v1, "min_font_size"

    invoke-virtual {p1}, Landroid/preference/Preference;->getKey()Ljava/lang/String;

    move-result-object v2

    invoke-virtual {v1, v2}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v1

    if-eqz v1, :cond_1

    move-object v1, p2

    .line 116
    check-cast v1, Ljava/lang/Integer;

    invoke-virtual {v1}, Ljava/lang/Integer;->intValue()I

    move-result v1

    invoke-static {v1}, Lcom/android/browser/BrowserSettings;->getAdjustedMinimumFontSize(I)I

    move-result v1

    invoke-virtual {p0, p1, v1}, Lcom/android/browser/preferences/AccessibilityPreferencesFragment;->updateMinFontSummary(Landroid/preference/Preference;I)V

    .line 119
    :cond_1
    const-string v1, "text_zoom"

    invoke-virtual {p1}, Landroid/preference/Preference;->getKey()Ljava/lang/String;

    move-result-object v2

    invoke-virtual {v1, v2}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v1

    if-eqz v1, :cond_2

    .line 120
    invoke-static {}, Lcom/android/browser/BrowserSettings;->getInstance()Lcom/android/browser/BrowserSettings;

    move-result-object v0

    .local v0, settings:Lcom/android/browser/BrowserSettings;
    move-object v1, p2

    .line 121
    check-cast v1, Ljava/lang/Integer;

    invoke-virtual {v1}, Ljava/lang/Integer;->intValue()I

    move-result v1

    invoke-virtual {v0, v1}, Lcom/android/browser/BrowserSettings;->getAdjustedTextZoom(I)I

    move-result v1

    invoke-virtual {p0, p1, v1}, Lcom/android/browser/preferences/AccessibilityPreferencesFragment;->updateTextZoomSummary(Landroid/preference/Preference;I)V

    .line 124
    .end local v0           #settings:Lcom/android/browser/BrowserSettings;
    :cond_2
    const-string v1, "double_tap_zoom"

    invoke-virtual {p1}, Landroid/preference/Preference;->getKey()Ljava/lang/String;

    move-result-object v2

    invoke-virtual {v1, v2}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v1

    if-eqz v1, :cond_3

    .line 125
    invoke-static {}, Lcom/android/browser/BrowserSettings;->getInstance()Lcom/android/browser/BrowserSettings;

    move-result-object v0

    .restart local v0       #settings:Lcom/android/browser/BrowserSettings;
    move-object v1, p2

    .line 126
    check-cast v1, Ljava/lang/Integer;

    invoke-virtual {v1}, Ljava/lang/Integer;->intValue()I

    move-result v1

    invoke-virtual {v0, v1}, Lcom/android/browser/BrowserSettings;->getAdjustedDoubleTapZoom(I)I

    move-result v1

    invoke-virtual {p0, p1, v1}, Lcom/android/browser/preferences/AccessibilityPreferencesFragment;->updateDoubleTapZoomSummary(Landroid/preference/Preference;I)V

    .line 129
    .end local v0           #settings:Lcom/android/browser/BrowserSettings;
    :cond_3
    const-string v1, "inverted_contrast"

    invoke-virtual {p1}, Landroid/preference/Preference;->getKey()Ljava/lang/String;

    move-result-object v2

    invoke-virtual {v1, v2}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v1

    if-eqz v1, :cond_4

    move-object v1, p2

    .line 130
    check-cast v1, Ljava/lang/Integer;

    invoke-virtual {v1}, Ljava/lang/Integer;->intValue()I

    move-result v1

    add-int/lit8 v1, v1, 0xa

    mul-int/lit8 v1, v1, 0xa

    invoke-virtual {p0, p1, v1}, Lcom/android/browser/preferences/AccessibilityPreferencesFragment;->updateInvertedContrastSummary(Landroid/preference/Preference;I)V

    .line 135
    :cond_4
    invoke-virtual {p0}, Lcom/android/browser/preferences/AccessibilityPreferencesFragment;->getActivity()Landroid/app/Activity;

    move-result-object v1

    invoke-static {v1}, Lcom/mediatek/browser/ext/Extensions;->getSmallFeaturePlugin(Landroid/content/Context;)Lcom/mediatek/browser/ext/IBrowserSmallFeatureEx;

    move-result-object v1

    iput-object v1, p0, Lcom/android/browser/preferences/AccessibilityPreferencesFragment;->mBrowserSmallFeatureEx:Lcom/mediatek/browser/ext/IBrowserSmallFeatureEx;

    .line 136
    iget-object v1, p0, Lcom/android/browser/preferences/AccessibilityPreferencesFragment;->mBrowserSmallFeatureEx:Lcom/mediatek/browser/ext/IBrowserSmallFeatureEx;

    invoke-virtual {p2}, Ljava/lang/Object;->toString()Ljava/lang/String;

    move-result-object v2

    invoke-interface {v1, p1, v2}, Lcom/mediatek/browser/ext/IBrowserSmallFeatureEx;->updatePreferenceItem(Landroid/preference/Preference;Ljava/lang/String;)V

    .line 138
    const/4 v1, 0x1

    goto/16 :goto_0
.end method

.method public onResume()V
    .locals 1

    .prologue
    .line 73
    invoke-super {p0}, Landroid/preference/PreferenceFragment;->onResume()V

    .line 74
    iget-object v0, p0, Lcom/android/browser/preferences/AccessibilityPreferencesFragment;->mControlWebView:Landroid/webkit/WebView;

    invoke-virtual {v0}, Landroid/webkit/WebView;->resumeTimers()V

    .line 75
    return-void
.end method

.method updateDoubleTapZoomSummary(Landroid/preference/Preference;I)V
    .locals 5
    .parameter "pref"
    .parameter "doubleTapZoom"

    .prologue
    .line 100
    iget-object v0, p0, Lcom/android/browser/preferences/AccessibilityPreferencesFragment;->mFormat:Ljava/text/NumberFormat;

    int-to-double v1, p2

    const-wide/high16 v3, 0x4059

    div-double/2addr v1, v3

    invoke-virtual {v0, v1, v2}, Ljava/text/NumberFormat;->format(D)Ljava/lang/String;

    move-result-object v0

    invoke-virtual {p1, v0}, Landroid/preference/Preference;->setSummary(Ljava/lang/CharSequence;)V

    .line 101
    return-void
.end method

.method updateInvertedContrastSummary(Landroid/preference/Preference;I)V
    .locals 5
    .parameter "pref"
    .parameter "contrast"

    .prologue
    .line 104
    iget-object v0, p0, Lcom/android/browser/preferences/AccessibilityPreferencesFragment;->mFormat:Ljava/text/NumberFormat;

    int-to-double v1, p2

    const-wide/high16 v3, 0x4059

    div-double/2addr v1, v3

    invoke-virtual {v0, v1, v2}, Ljava/text/NumberFormat;->format(D)Ljava/lang/String;

    move-result-object v0

    invoke-virtual {p1, v0}, Landroid/preference/Preference;->setSummary(Ljava/lang/CharSequence;)V

    .line 105
    return-void
.end method

.method updateMinFontSummary(Landroid/preference/Preference;I)V
    .locals 5
    .parameter "pref"
    .parameter "minFontSize"

    .prologue
    .line 91
    invoke-virtual {p0}, Lcom/android/browser/preferences/AccessibilityPreferencesFragment;->getActivity()Landroid/app/Activity;

    move-result-object v0

    .line 92
    .local v0, c:Landroid/content/Context;
    const v1, 0x7f0c0106

    const/4 v2, 0x1

    new-array v2, v2, [Ljava/lang/Object;

    const/4 v3, 0x0

    invoke-static {p2}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v4

    aput-object v4, v2, v3

    invoke-virtual {v0, v1, v2}, Landroid/app/Activity;->getString(I[Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v1

    invoke-virtual {p1, v1}, Landroid/preference/Preference;->setSummary(Ljava/lang/CharSequence;)V

    .line 93
    return-void
.end method

.method updateTextZoomSummary(Landroid/preference/Preference;I)V
    .locals 5
    .parameter "pref"
    .parameter "textZoom"

    .prologue
    .line 96
    iget-object v0, p0, Lcom/android/browser/preferences/AccessibilityPreferencesFragment;->mFormat:Ljava/text/NumberFormat;

    int-to-double v1, p2

    const-wide/high16 v3, 0x4059

    div-double/2addr v1, v3

    invoke-virtual {v0, v1, v2}, Ljava/text/NumberFormat;->format(D)Ljava/lang/String;

    move-result-object v0

    invoke-virtual {p1, v0}, Landroid/preference/Preference;->setSummary(Ljava/lang/CharSequence;)V

    .line 97
    return-void
.end method
