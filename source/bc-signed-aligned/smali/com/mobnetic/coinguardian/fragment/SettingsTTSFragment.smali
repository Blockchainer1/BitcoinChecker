.class public Lcom/mobnetic/coinguardian/fragment/SettingsTTSFragment;
.super Landroid/support/v4/preference/PreferenceFragment;
.source "SettingsTTSFragment.java"

# interfaces
.implements Landroid/content/SharedPreferences$OnSharedPreferenceChangeListener;


# instance fields
.field private final currencyDst:Ljava/lang/String;

.field private final currencySrc:Ljava/lang/String;

.field private formatExamplePreference:Landroid/preference/Preference;

.field private final lastPrice:D

.field private final market:Lcom/mobnetic/coinguardian/model/Market;

.field private final subunitDst:Lcom/mobnetic/coinguardian/model/CurrencySubunit;


# direct methods
.method public constructor <init>()V
    .locals 4

    .prologue
    .line 25
    invoke-direct {p0}, Landroid/support/v4/preference/PreferenceFragment;-><init>()V

    .line 28
    new-instance v0, Lcom/mobnetic/coinguardian/model/market/Bitstamp;

    invoke-direct {v0}, Lcom/mobnetic/coinguardian/model/market/Bitstamp;-><init>()V

    iput-object v0, p0, Lcom/mobnetic/coinguardian/fragment/SettingsTTSFragment;->market:Lcom/mobnetic/coinguardian/model/Market;

    .line 29
    const-string v0, "BTC"

    iput-object v0, p0, Lcom/mobnetic/coinguardian/fragment/SettingsTTSFragment;->currencySrc:Ljava/lang/String;

    .line 30
    const-string v0, "USD"

    iput-object v0, p0, Lcom/mobnetic/coinguardian/fragment/SettingsTTSFragment;->currencyDst:Ljava/lang/String;

    .line 31
    const-string v0, "USD"

    const-wide/16 v2, 0x1

    invoke-static {v0, v2, v3}, Lcom/mobnetic/coinguardian/util/CurrencyUtils;->getCurrencySubunit(Ljava/lang/String;J)Lcom/mobnetic/coinguardian/model/CurrencySubunit;

    move-result-object v0

    iput-object v0, p0, Lcom/mobnetic/coinguardian/fragment/SettingsTTSFragment;->subunitDst:Lcom/mobnetic/coinguardian/model/CurrencySubunit;

    .line 32
    const-wide v0, 0x4086455c28f5c28fL    # 712.67

    iput-wide v0, p0, Lcom/mobnetic/coinguardian/fragment/SettingsTTSFragment;->lastPrice:D

    return-void
.end method

.method static synthetic access$000(Lcom/mobnetic/coinguardian/fragment/SettingsTTSFragment;)Lcom/mobnetic/coinguardian/model/CurrencySubunit;
    .locals 1
    .param p0, "x0"    # Lcom/mobnetic/coinguardian/fragment/SettingsTTSFragment;

    .prologue
    .line 25
    iget-object v0, p0, Lcom/mobnetic/coinguardian/fragment/SettingsTTSFragment;->subunitDst:Lcom/mobnetic/coinguardian/model/CurrencySubunit;

    return-object v0
.end method

.method static synthetic access$100(Lcom/mobnetic/coinguardian/fragment/SettingsTTSFragment;)Lcom/mobnetic/coinguardian/model/Market;
    .locals 1
    .param p0, "x0"    # Lcom/mobnetic/coinguardian/fragment/SettingsTTSFragment;

    .prologue
    .line 25
    iget-object v0, p0, Lcom/mobnetic/coinguardian/fragment/SettingsTTSFragment;->market:Lcom/mobnetic/coinguardian/model/Market;

    return-object v0
.end method

.method private refreshFormatExamplePreference()V
    .locals 12

    .prologue
    const/4 v5, 0x0

    .line 102
    invoke-virtual {p0}, Lcom/mobnetic/coinguardian/fragment/SettingsTTSFragment;->getActivity()Landroid/support/v4/app/FragmentActivity;

    move-result-object v1

    const-wide v2, 0x4086455c28f5c28fL    # 712.67

    const-string v4, "BTC"

    iget-object v7, p0, Lcom/mobnetic/coinguardian/fragment/SettingsTTSFragment;->subunitDst:Lcom/mobnetic/coinguardian/model/CurrencySubunit;

    iget-object v9, p0, Lcom/mobnetic/coinguardian/fragment/SettingsTTSFragment;->market:Lcom/mobnetic/coinguardian/model/Market;

    iget-object v6, p0, Lcom/mobnetic/coinguardian/fragment/SettingsTTSFragment;->market:Lcom/mobnetic/coinguardian/model/Market;

    iget-object v10, v6, Lcom/mobnetic/coinguardian/model/Market;->name:Ljava/lang/String;

    move v6, v5

    move v8, v5

    move v11, v5

    invoke-static/range {v1 .. v11}, Lcom/mobnetic/coinguardian/util/FormatUtils;->formatTextForTTS(Landroid/content/Context;DLjava/lang/String;IZLcom/mobnetic/coinguardian/model/CurrencySubunit;ZLcom/mobnetic/coinguardian/model/Market;Ljava/lang/String;Z)Ljava/lang/String;

    move-result-object v0

    .line 103
    .local v0, "ttsString":Ljava/lang/String;
    iget-object v1, p0, Lcom/mobnetic/coinguardian/fragment/SettingsTTSFragment;->formatExamplePreference:Landroid/preference/Preference;

    invoke-virtual {v1, v0}, Landroid/preference/Preference;->setSummary(Ljava/lang/CharSequence;)V

    .line 104
    return-void
.end method


# virtual methods
.method public onCreate(Landroid/os/Bundle;)V
    .locals 8
    .param p1, "savedInstanceState"    # Landroid/os/Bundle;

    .prologue
    const/4 v7, 0x2

    const/4 v6, 0x1

    const/4 v5, 0x0

    .line 36
    invoke-super {p0, p1}, Landroid/support/v4/preference/PreferenceFragment;->onCreate(Landroid/os/Bundle;)V

    .line 38
    const v2, 0x7f050004

    invoke-virtual {p0, v2}, Lcom/mobnetic/coinguardian/fragment/SettingsTTSFragment;->addPreferencesFromResource(I)V

    .line 40
    const v2, 0x7f0700e6

    invoke-virtual {p0, v2}, Lcom/mobnetic/coinguardian/fragment/SettingsTTSFragment;->getString(I)Ljava/lang/String;

    move-result-object v2

    invoke-virtual {p0, v2}, Lcom/mobnetic/coinguardian/fragment/SettingsTTSFragment;->findPreference(Ljava/lang/CharSequence;)Landroid/preference/Preference;

    move-result-object v2

    new-instance v3, Lcom/mobnetic/coinguardian/fragment/SettingsTTSFragment$1;

    invoke-direct {v3, p0}, Lcom/mobnetic/coinguardian/fragment/SettingsTTSFragment$1;-><init>(Lcom/mobnetic/coinguardian/fragment/SettingsTTSFragment;)V

    invoke-virtual {v2, v3}, Landroid/preference/Preference;->setOnPreferenceClickListener(Landroid/preference/Preference$OnPreferenceClickListener;)V

    .line 54
    const v2, 0x7f0700ea

    invoke-virtual {p0, v2}, Lcom/mobnetic/coinguardian/fragment/SettingsTTSFragment;->getString(I)Ljava/lang/String;

    move-result-object v2

    invoke-virtual {p0, v2}, Lcom/mobnetic/coinguardian/fragment/SettingsTTSFragment;->findPreference(Ljava/lang/CharSequence;)Landroid/preference/Preference;

    move-result-object v2

    iput-object v2, p0, Lcom/mobnetic/coinguardian/fragment/SettingsTTSFragment;->formatExamplePreference:Landroid/preference/Preference;

    .line 55
    const v2, 0x7f07006e

    new-array v3, v7, [Ljava/lang/Object;

    const-string v4, "BTC"

    aput-object v4, v3, v5

    const-string v4, "USD"

    aput-object v4, v3, v6

    invoke-virtual {p0, v2, v3}, Lcom/mobnetic/coinguardian/fragment/SettingsTTSFragment;->getString(I[Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v1

    .line 56
    .local v1, "currencyString":Ljava/lang/String;
    iget-object v2, p0, Lcom/mobnetic/coinguardian/fragment/SettingsTTSFragment;->formatExamplePreference:Landroid/preference/Preference;

    const v3, 0x7f0700eb

    new-array v4, v7, [Ljava/lang/Object;

    aput-object v1, v4, v5

    iget-object v5, p0, Lcom/mobnetic/coinguardian/fragment/SettingsTTSFragment;->market:Lcom/mobnetic/coinguardian/model/Market;

    iget-object v5, v5, Lcom/mobnetic/coinguardian/model/Market;->name:Ljava/lang/String;

    aput-object v5, v4, v6

    invoke-virtual {p0, v3, v4}, Lcom/mobnetic/coinguardian/fragment/SettingsTTSFragment;->getString(I[Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v3

    invoke-virtual {v2, v3}, Landroid/preference/Preference;->setTitle(Ljava/lang/CharSequence;)V

    .line 57
    iget-object v2, p0, Lcom/mobnetic/coinguardian/fragment/SettingsTTSFragment;->formatExamplePreference:Landroid/preference/Preference;

    new-instance v3, Lcom/mobnetic/coinguardian/fragment/SettingsTTSFragment$2;

    invoke-direct {v3, p0}, Lcom/mobnetic/coinguardian/fragment/SettingsTTSFragment$2;-><init>(Lcom/mobnetic/coinguardian/fragment/SettingsTTSFragment;)V

    invoke-virtual {v2, v3}, Landroid/preference/Preference;->setOnPreferenceClickListener(Landroid/preference/Preference$OnPreferenceClickListener;)V

    .line 65
    const v2, 0x7f0700e0

    invoke-virtual {p0, v2}, Lcom/mobnetic/coinguardian/fragment/SettingsTTSFragment;->getString(I)Ljava/lang/String;

    move-result-object v2

    invoke-virtual {p0, v2}, Lcom/mobnetic/coinguardian/fragment/SettingsTTSFragment;->findPreference(Ljava/lang/CharSequence;)Landroid/preference/Preference;

    move-result-object v0

    check-cast v0, Landroid/preference/ListPreference;

    .line 66
    .local v0, "advancedStreamPreference":Landroid/preference/ListPreference;
    invoke-virtual {v0}, Landroid/preference/ListPreference;->getEntry()Ljava/lang/CharSequence;

    move-result-object v2

    invoke-virtual {v0, v2}, Landroid/preference/ListPreference;->setSummary(Ljava/lang/CharSequence;)V

    .line 67
    new-instance v2, Lcom/mobnetic/coinguardian/fragment/SettingsTTSFragment$3;

    invoke-direct {v2, p0, v0}, Lcom/mobnetic/coinguardian/fragment/SettingsTTSFragment$3;-><init>(Lcom/mobnetic/coinguardian/fragment/SettingsTTSFragment;Landroid/preference/ListPreference;)V

    invoke-virtual {v0, v2}, Landroid/preference/ListPreference;->setOnPreferenceChangeListener(Landroid/preference/Preference$OnPreferenceChangeListener;)V

    .line 72
    return-void
.end method

.method public onSharedPreferenceChanged(Landroid/content/SharedPreferences;Ljava/lang/String;)V
    .locals 1
    .param p1, "sharedPreferences"    # Landroid/content/SharedPreferences;
    .param p2, "key"    # Ljava/lang/String;

    .prologue
    .line 93
    const v0, 0x7f0700ef

    invoke-virtual {p0, v0}, Lcom/mobnetic/coinguardian/fragment/SettingsTTSFragment;->getString(I)Ljava/lang/String;

    move-result-object v0

    invoke-virtual {v0, p2}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v0

    if-nez v0, :cond_0

    const v0, 0x7f0700ec

    .line 94
    invoke-virtual {p0, v0}, Lcom/mobnetic/coinguardian/fragment/SettingsTTSFragment;->getString(I)Ljava/lang/String;

    move-result-object v0

    invoke-virtual {v0, p2}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v0

    if-nez v0, :cond_0

    const v0, 0x7f0700f2

    .line 95
    invoke-virtual {p0, v0}, Lcom/mobnetic/coinguardian/fragment/SettingsTTSFragment;->getString(I)Ljava/lang/String;

    move-result-object v0

    invoke-virtual {v0, p2}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v0

    if-nez v0, :cond_0

    const v0, 0x7f0700f5

    .line 96
    invoke-virtual {p0, v0}, Lcom/mobnetic/coinguardian/fragment/SettingsTTSFragment;->getString(I)Ljava/lang/String;

    move-result-object v0

    invoke-virtual {v0, p2}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v0

    if-eqz v0, :cond_1

    .line 97
    :cond_0
    invoke-direct {p0}, Lcom/mobnetic/coinguardian/fragment/SettingsTTSFragment;->refreshFormatExamplePreference()V

    .line 99
    :cond_1
    return-void
.end method

.method public onStart()V
    .locals 1

    .prologue
    .line 76
    invoke-super {p0}, Landroid/support/v4/preference/PreferenceFragment;->onStart()V

    .line 77
    invoke-virtual {p0}, Lcom/mobnetic/coinguardian/fragment/SettingsTTSFragment;->getPreferenceManager()Landroid/preference/PreferenceManager;

    move-result-object v0

    invoke-virtual {v0}, Landroid/preference/PreferenceManager;->getSharedPreferences()Landroid/content/SharedPreferences;

    move-result-object v0

    invoke-interface {v0, p0}, Landroid/content/SharedPreferences;->registerOnSharedPreferenceChangeListener(Landroid/content/SharedPreferences$OnSharedPreferenceChangeListener;)V

    .line 78
    invoke-direct {p0}, Lcom/mobnetic/coinguardian/fragment/SettingsTTSFragment;->refreshFormatExamplePreference()V

    .line 79
    return-void
.end method

.method public onStop()V
    .locals 2

    .prologue
    .line 83
    invoke-super {p0}, Landroid/support/v4/preference/PreferenceFragment;->onStop()V

    .line 85
    :try_start_0
    invoke-virtual {p0}, Lcom/mobnetic/coinguardian/fragment/SettingsTTSFragment;->getPreferenceManager()Landroid/preference/PreferenceManager;

    move-result-object v1

    invoke-virtual {v1}, Landroid/preference/PreferenceManager;->getSharedPreferences()Landroid/content/SharedPreferences;

    move-result-object v1

    invoke-interface {v1, p0}, Landroid/content/SharedPreferences;->unregisterOnSharedPreferenceChangeListener(Landroid/content/SharedPreferences$OnSharedPreferenceChangeListener;)V
    :try_end_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_0

    .line 89
    :goto_0
    return-void

    .line 86
    :catch_0
    move-exception v0

    .line 87
    .local v0, "e":Ljava/lang/Exception;
    invoke-virtual {v0}, Ljava/lang/Exception;->printStackTrace()V

    goto :goto_0
.end method
