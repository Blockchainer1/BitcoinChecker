.class Lcom/mobnetic/coinguardian/fragment/SettingsMainFragment$2;
.super Ljava/lang/Object;
.source "SettingsMainFragment.java"

# interfaces
.implements Landroid/preference/Preference$OnPreferenceChangeListener;


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lcom/mobnetic/coinguardian/fragment/SettingsMainFragment;->onCreateBeforeInitTTS(Landroid/os/Bundle;)V
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = null
.end annotation


# instance fields
.field final synthetic this$0:Lcom/mobnetic/coinguardian/fragment/SettingsMainFragment;


# direct methods
.method constructor <init>(Lcom/mobnetic/coinguardian/fragment/SettingsMainFragment;)V
    .locals 0
    .param p1, "this$0"    # Lcom/mobnetic/coinguardian/fragment/SettingsMainFragment;

    .prologue
    .line 57
    iput-object p1, p0, Lcom/mobnetic/coinguardian/fragment/SettingsMainFragment$2;->this$0:Lcom/mobnetic/coinguardian/fragment/SettingsMainFragment;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public onPreferenceChange(Landroid/preference/Preference;Ljava/lang/Object;)Z
    .locals 3
    .param p1, "preference"    # Landroid/preference/Preference;
    .param p2, "newValue"    # Ljava/lang/Object;

    .prologue
    .line 59
    check-cast p2, Ljava/lang/Long;

    .end local p2    # "newValue":Ljava/lang/Object;
    invoke-virtual {p2}, Ljava/lang/Long;->longValue()J

    move-result-wide v0

    .line 60
    .local v0, "globalFrequency":J
    iget-object v2, p0, Lcom/mobnetic/coinguardian/fragment/SettingsMainFragment$2;->this$0:Lcom/mobnetic/coinguardian/fragment/SettingsMainFragment;

    invoke-virtual {v2}, Lcom/mobnetic/coinguardian/fragment/SettingsMainFragment;->getActivity()Landroid/support/v4/app/FragmentActivity;

    move-result-object v2

    invoke-static {v2, v0, v1}, Lcom/mobnetic/coinguardian/util/PreferencesUtils;->setCheckGlobalFrequency(Landroid/content/Context;J)V

    .line 61
    iget-object v2, p0, Lcom/mobnetic/coinguardian/fragment/SettingsMainFragment$2;->this$0:Lcom/mobnetic/coinguardian/fragment/SettingsMainFragment;

    invoke-virtual {v2}, Lcom/mobnetic/coinguardian/fragment/SettingsMainFragment;->getActivity()Landroid/support/v4/app/FragmentActivity;

    move-result-object v2

    invoke-static {v2}, Lcom/mobnetic/coinguardian/receiver/MarketChecker;->resetAlarmManagerForAllEnabledThatUseGlobalFrequency(Landroid/content/Context;)V

    .line 62
    const/4 v2, 0x1

    return v2
.end method
