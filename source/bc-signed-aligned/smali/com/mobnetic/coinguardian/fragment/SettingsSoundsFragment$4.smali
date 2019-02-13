.class Lcom/mobnetic/coinguardian/fragment/SettingsSoundsFragment$4;
.super Ljava/lang/Object;
.source "SettingsSoundsFragment.java"

# interfaces
.implements Landroid/preference/Preference$OnPreferenceChangeListener;


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lcom/mobnetic/coinguardian/fragment/SettingsSoundsFragment;->onCreate(Landroid/os/Bundle;)V
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = null
.end annotation


# instance fields
.field final synthetic this$0:Lcom/mobnetic/coinguardian/fragment/SettingsSoundsFragment;

.field final synthetic val$alarmNotificationDownPreference:Landroid/preference/RingtonePreference;


# direct methods
.method constructor <init>(Lcom/mobnetic/coinguardian/fragment/SettingsSoundsFragment;Landroid/preference/RingtonePreference;)V
    .locals 0
    .param p1, "this$0"    # Lcom/mobnetic/coinguardian/fragment/SettingsSoundsFragment;

    .prologue
    .line 63
    iput-object p1, p0, Lcom/mobnetic/coinguardian/fragment/SettingsSoundsFragment$4;->this$0:Lcom/mobnetic/coinguardian/fragment/SettingsSoundsFragment;

    iput-object p2, p0, Lcom/mobnetic/coinguardian/fragment/SettingsSoundsFragment$4;->val$alarmNotificationDownPreference:Landroid/preference/RingtonePreference;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public onPreferenceChange(Landroid/preference/Preference;Ljava/lang/Object;)Z
    .locals 2
    .param p1, "preference"    # Landroid/preference/Preference;
    .param p2, "newValue"    # Ljava/lang/Object;

    .prologue
    .line 66
    iget-object v0, p0, Lcom/mobnetic/coinguardian/fragment/SettingsSoundsFragment$4;->val$alarmNotificationDownPreference:Landroid/preference/RingtonePreference;

    iget-object v1, p0, Lcom/mobnetic/coinguardian/fragment/SettingsSoundsFragment$4;->this$0:Lcom/mobnetic/coinguardian/fragment/SettingsSoundsFragment;

    check-cast p2, Ljava/lang/String;

    .end local p2    # "newValue":Ljava/lang/Object;
    invoke-static {v1, p2}, Lcom/mobnetic/coinguardian/fragment/SettingsSoundsFragment;->access$000(Lcom/mobnetic/coinguardian/fragment/SettingsSoundsFragment;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v1

    invoke-virtual {v0, v1}, Landroid/preference/RingtonePreference;->setSummary(Ljava/lang/CharSequence;)V

    .line 67
    const/4 v0, 0x1

    return v0
.end method
