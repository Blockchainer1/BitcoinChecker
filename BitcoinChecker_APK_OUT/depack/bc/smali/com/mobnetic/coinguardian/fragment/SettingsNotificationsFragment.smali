.class public Lcom/mobnetic/coinguardian/fragment/SettingsNotificationsFragment;
.super Landroid/support/v4/preference/PreferenceFragment;
.source "SettingsNotificationsFragment.java"


# direct methods
.method public constructor <init>()V
    .locals 0

    .prologue
    .line 14
    invoke-direct {p0}, Landroid/support/v4/preference/PreferenceFragment;-><init>()V

    return-void
.end method


# virtual methods
.method public onCreate(Landroid/os/Bundle;)V
    .locals 5
    .param p1, "savedInstanceState"    # Landroid/os/Bundle;

    .prologue
    .line 18
    invoke-super {p0, p1}, Landroid/support/v4/preference/PreferenceFragment;->onCreate(Landroid/os/Bundle;)V

    .line 20
    const v3, 0x7f050002

    invoke-virtual {p0, v3}, Lcom/mobnetic/coinguardian/fragment/SettingsNotificationsFragment;->addPreferencesFromResource(I)V

    .line 22
    const v3, 0x7f0700c6

    invoke-virtual {p0, v3}, Lcom/mobnetic/coinguardian/fragment/SettingsNotificationsFragment;->getString(I)Ljava/lang/String;

    move-result-object v3

    invoke-virtual {p0, v3}, Lcom/mobnetic/coinguardian/fragment/SettingsNotificationsFragment;->findPreference(Ljava/lang/CharSequence;)Landroid/preference/Preference;

    move-result-object v0

    check-cast v0, Landroid/preference/PreferenceCategory;

    .line 24
    .local v0, "checkNotificationCategoryPreference":Landroid/preference/PreferenceCategory;
    const v3, 0x7f0700cb

    invoke-virtual {p0, v3}, Lcom/mobnetic/coinguardian/fragment/SettingsNotificationsFragment;->getString(I)Ljava/lang/String;

    move-result-object v3

    invoke-virtual {p0, v3}, Lcom/mobnetic/coinguardian/fragment/SettingsNotificationsFragment;->findPreference(Ljava/lang/CharSequence;)Landroid/preference/Preference;

    move-result-object v2

    .line 25
    .local v2, "checkNotificationExpandablePreference":Landroid/preference/Preference;
    sget v3, Landroid/os/Build$VERSION;->SDK_INT:I

    const/16 v4, 0x10

    if-ge v3, v4, :cond_0

    .line 26
    invoke-virtual {v0, v2}, Landroid/preference/PreferenceCategory;->removePreference(Landroid/preference/Preference;)Z

    .line 37
    :goto_0
    const v3, 0x7f0700c8

    invoke-virtual {p0, v3}, Lcom/mobnetic/coinguardian/fragment/SettingsNotificationsFragment;->getString(I)Ljava/lang/String;

    move-result-object v3

    invoke-virtual {p0, v3}, Lcom/mobnetic/coinguardian/fragment/SettingsNotificationsFragment;->findPreference(Ljava/lang/CharSequence;)Landroid/preference/Preference;

    move-result-object v1

    .line 38
    .local v1, "checkNotificationCustomLayoutPreference":Landroid/preference/Preference;
    sget v3, Landroid/os/Build$VERSION;->SDK_INT:I

    const/16 v4, 0xe

    if-ge v3, v4, :cond_1

    .line 39
    invoke-virtual {v0, v1}, Landroid/preference/PreferenceCategory;->removePreference(Landroid/preference/Preference;)Z

    .line 49
    :goto_1
    return-void

    .line 28
    .end local v1    # "checkNotificationCustomLayoutPreference":Landroid/preference/Preference;
    :cond_0
    new-instance v3, Lcom/mobnetic/coinguardian/fragment/SettingsNotificationsFragment$1;

    invoke-direct {v3, p0}, Lcom/mobnetic/coinguardian/fragment/SettingsNotificationsFragment$1;-><init>(Lcom/mobnetic/coinguardian/fragment/SettingsNotificationsFragment;)V

    invoke-virtual {v2, v3}, Landroid/preference/Preference;->setOnPreferenceChangeListener(Landroid/preference/Preference$OnPreferenceChangeListener;)V

    goto :goto_0

    .line 41
    .restart local v1    # "checkNotificationCustomLayoutPreference":Landroid/preference/Preference;
    :cond_1
    new-instance v3, Lcom/mobnetic/coinguardian/fragment/SettingsNotificationsFragment$2;

    invoke-direct {v3, p0}, Lcom/mobnetic/coinguardian/fragment/SettingsNotificationsFragment$2;-><init>(Lcom/mobnetic/coinguardian/fragment/SettingsNotificationsFragment;)V

    invoke-virtual {v1, v3}, Landroid/preference/Preference;->setOnPreferenceChangeListener(Landroid/preference/Preference$OnPreferenceChangeListener;)V

    goto :goto_1
.end method
