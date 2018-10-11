.class public Lcom/mobnetic/coinguardian/fragment/SettingsSoundsFragment;
.super Landroid/support/v4/preference/PreferenceFragment;
.source "SettingsSoundsFragment.java"


# direct methods
.method public constructor <init>()V
    .locals 0

    .prologue
    .line 19
    invoke-direct {p0}, Landroid/support/v4/preference/PreferenceFragment;-><init>()V

    return-void
.end method

.method static synthetic access$000(Lcom/mobnetic/coinguardian/fragment/SettingsSoundsFragment;Ljava/lang/String;)Ljava/lang/String;
    .locals 1
    .param p0, "x0"    # Lcom/mobnetic/coinguardian/fragment/SettingsSoundsFragment;
    .param p1, "x1"    # Ljava/lang/String;

    .prologue
    .line 19
    invoke-direct {p0, p1}, Lcom/mobnetic/coinguardian/fragment/SettingsSoundsFragment;->getRingtoneName(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v0

    return-object v0
.end method

.method private getRingtoneName(Ljava/lang/String;)Ljava/lang/String;
    .locals 3
    .param p1, "ringtoneUriString"    # Ljava/lang/String;

    .prologue
    .line 86
    if-eqz p1, :cond_0

    .line 87
    invoke-static {p1}, Landroid/net/Uri;->parse(Ljava/lang/String;)Landroid/net/Uri;

    move-result-object v1

    .line 88
    .local v1, "ringtoneUri":Landroid/net/Uri;
    if-eqz v1, :cond_0

    .line 89
    invoke-virtual {p0}, Lcom/mobnetic/coinguardian/fragment/SettingsSoundsFragment;->getActivity()Landroid/support/v4/app/FragmentActivity;

    move-result-object v2

    invoke-static {v2, v1}, Landroid/media/RingtoneManager;->getRingtone(Landroid/content/Context;Landroid/net/Uri;)Landroid/media/Ringtone;

    move-result-object v0

    .line 90
    .local v0, "ringtone":Landroid/media/Ringtone;
    if-eqz v0, :cond_0

    .line 91
    invoke-virtual {p0}, Lcom/mobnetic/coinguardian/fragment/SettingsSoundsFragment;->getActivity()Landroid/support/v4/app/FragmentActivity;

    move-result-object v2

    invoke-virtual {v0, v2}, Landroid/media/Ringtone;->getTitle(Landroid/content/Context;)Ljava/lang/String;

    move-result-object v2

    .line 95
    .end local v0    # "ringtone":Landroid/media/Ringtone;
    .end local v1    # "ringtoneUri":Landroid/net/Uri;
    :goto_0
    return-object v2

    :cond_0
    const-string v2, ""

    goto :goto_0
.end method


# virtual methods
.method public onCreate(Landroid/os/Bundle;)V
    .locals 6
    .param p1, "savedInstanceState"    # Landroid/os/Bundle;

    .prologue
    const/4 v5, 0x2

    .line 23
    invoke-super {p0, p1}, Landroid/support/v4/preference/PreferenceFragment;->onCreate(Landroid/os/Bundle;)V

    .line 25
    const v4, 0x7f050003

    invoke-virtual {p0, v4}, Lcom/mobnetic/coinguardian/fragment/SettingsSoundsFragment;->addPreferencesFromResource(I)V

    .line 27
    new-instance v3, Lcom/mobnetic/coinguardian/fragment/SettingsSoundsFragment$1;

    invoke-virtual {p0}, Lcom/mobnetic/coinguardian/fragment/SettingsSoundsFragment;->getActivity()Landroid/support/v4/app/FragmentActivity;

    move-result-object v4

    invoke-direct {v3, p0, v4}, Lcom/mobnetic/coinguardian/fragment/SettingsSoundsFragment$1;-><init>(Lcom/mobnetic/coinguardian/fragment/SettingsSoundsFragment;Landroid/content/Context;)V

    .line 35
    .local v3, "alarmNotificationUpPreference":Landroid/preference/RingtonePreference;
    const v4, 0x7f0700da

    invoke-virtual {p0, v4}, Lcom/mobnetic/coinguardian/fragment/SettingsSoundsFragment;->getString(I)Ljava/lang/String;

    move-result-object v4

    invoke-virtual {v3, v4}, Landroid/preference/RingtonePreference;->setKey(Ljava/lang/String;)V

    .line 36
    const v4, 0x7f0700db

    invoke-virtual {v3, v4}, Landroid/preference/RingtonePreference;->setTitle(I)V

    .line 37
    invoke-virtual {v3, v5}, Landroid/preference/RingtonePreference;->setRingtoneType(I)V

    .line 40
    invoke-virtual {p0}, Lcom/mobnetic/coinguardian/fragment/SettingsSoundsFragment;->getActivity()Landroid/support/v4/app/FragmentActivity;

    move-result-object v4

    invoke-static {v4}, Lcom/mobnetic/coinguardian/util/PreferencesUtils;->getSoundAlarmNotificationUp(Landroid/content/Context;)Ljava/lang/String;

    move-result-object v4

    invoke-direct {p0, v4}, Lcom/mobnetic/coinguardian/fragment/SettingsSoundsFragment;->getRingtoneName(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v4

    invoke-virtual {v3, v4}, Landroid/preference/RingtonePreference;->setSummary(Ljava/lang/CharSequence;)V

    .line 41
    new-instance v4, Lcom/mobnetic/coinguardian/fragment/SettingsSoundsFragment$2;

    invoke-direct {v4, p0, v3}, Lcom/mobnetic/coinguardian/fragment/SettingsSoundsFragment$2;-><init>(Lcom/mobnetic/coinguardian/fragment/SettingsSoundsFragment;Landroid/preference/RingtonePreference;)V

    invoke-virtual {v3, v4}, Landroid/preference/RingtonePreference;->setOnPreferenceChangeListener(Landroid/preference/Preference$OnPreferenceChangeListener;)V

    .line 49
    new-instance v2, Lcom/mobnetic/coinguardian/fragment/SettingsSoundsFragment$3;

    invoke-virtual {p0}, Lcom/mobnetic/coinguardian/fragment/SettingsSoundsFragment;->getActivity()Landroid/support/v4/app/FragmentActivity;

    move-result-object v4

    invoke-direct {v2, p0, v4}, Lcom/mobnetic/coinguardian/fragment/SettingsSoundsFragment$3;-><init>(Lcom/mobnetic/coinguardian/fragment/SettingsSoundsFragment;Landroid/content/Context;)V

    .line 57
    .local v2, "alarmNotificationDownPreference":Landroid/preference/RingtonePreference;
    const v4, 0x7f0700d8

    invoke-virtual {p0, v4}, Lcom/mobnetic/coinguardian/fragment/SettingsSoundsFragment;->getString(I)Ljava/lang/String;

    move-result-object v4

    invoke-virtual {v2, v4}, Landroid/preference/RingtonePreference;->setKey(Ljava/lang/String;)V

    .line 58
    const v4, 0x7f0700d9

    invoke-virtual {v2, v4}, Landroid/preference/RingtonePreference;->setTitle(I)V

    .line 59
    invoke-virtual {v2, v5}, Landroid/preference/RingtonePreference;->setRingtoneType(I)V

    .line 62
    invoke-virtual {p0}, Lcom/mobnetic/coinguardian/fragment/SettingsSoundsFragment;->getActivity()Landroid/support/v4/app/FragmentActivity;

    move-result-object v4

    invoke-static {v4}, Lcom/mobnetic/coinguardian/util/PreferencesUtils;->getSoundAlarmNotificationDown(Landroid/content/Context;)Ljava/lang/String;

    move-result-object v4

    invoke-direct {p0, v4}, Lcom/mobnetic/coinguardian/fragment/SettingsSoundsFragment;->getRingtoneName(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v4

    invoke-virtual {v2, v4}, Landroid/preference/RingtonePreference;->setSummary(Ljava/lang/CharSequence;)V

    .line 63
    new-instance v4, Lcom/mobnetic/coinguardian/fragment/SettingsSoundsFragment$4;

    invoke-direct {v4, p0, v2}, Lcom/mobnetic/coinguardian/fragment/SettingsSoundsFragment$4;-><init>(Lcom/mobnetic/coinguardian/fragment/SettingsSoundsFragment;Landroid/preference/RingtonePreference;)V

    invoke-virtual {v2, v4}, Landroid/preference/RingtonePreference;->setOnPreferenceChangeListener(Landroid/preference/Preference$OnPreferenceChangeListener;)V

    .line 71
    const v4, 0x7f0700d6

    invoke-virtual {p0, v4}, Lcom/mobnetic/coinguardian/fragment/SettingsSoundsFragment;->getString(I)Ljava/lang/String;

    move-result-object v4

    invoke-virtual {p0, v4}, Lcom/mobnetic/coinguardian/fragment/SettingsSoundsFragment;->findPreference(Ljava/lang/CharSequence;)Landroid/preference/Preference;

    move-result-object v1

    check-cast v1, Landroid/preference/PreferenceCategory;

    .line 72
    .local v1, "alarmNotificationCategory":Landroid/preference/PreferenceCategory;
    invoke-virtual {v1, v3}, Landroid/preference/PreferenceCategory;->addPreference(Landroid/preference/Preference;)Z

    .line 73
    invoke-virtual {v1, v2}, Landroid/preference/PreferenceCategory;->addPreference(Landroid/preference/Preference;)Z

    .line 76
    const v4, 0x7f0700d3

    invoke-virtual {p0, v4}, Lcom/mobnetic/coinguardian/fragment/SettingsSoundsFragment;->getString(I)Ljava/lang/String;

    move-result-object v4

    invoke-virtual {p0, v4}, Lcom/mobnetic/coinguardian/fragment/SettingsSoundsFragment;->findPreference(Ljava/lang/CharSequence;)Landroid/preference/Preference;

    move-result-object v0

    check-cast v0, Landroid/preference/ListPreference;

    .line 77
    .local v0, "advancedAlarmStreamPreference":Landroid/preference/ListPreference;
    invoke-virtual {v0}, Landroid/preference/ListPreference;->getEntry()Ljava/lang/CharSequence;

    move-result-object v4

    invoke-virtual {v0, v4}, Landroid/preference/ListPreference;->setSummary(Ljava/lang/CharSequence;)V

    .line 78
    new-instance v4, Lcom/mobnetic/coinguardian/fragment/SettingsSoundsFragment$5;

    invoke-direct {v4, p0, v0}, Lcom/mobnetic/coinguardian/fragment/SettingsSoundsFragment$5;-><init>(Lcom/mobnetic/coinguardian/fragment/SettingsSoundsFragment;Landroid/preference/ListPreference;)V

    invoke-virtual {v0, v4}, Landroid/preference/ListPreference;->setOnPreferenceChangeListener(Landroid/preference/Preference$OnPreferenceChangeListener;)V

    .line 83
    return-void
.end method
