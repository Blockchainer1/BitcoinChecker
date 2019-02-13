.class Lcom/mobnetic/coinguardian/fragment/SettingsNotificationsFragment$2;
.super Ljava/lang/Object;
.source "SettingsNotificationsFragment.java"

# interfaces
.implements Landroid/preference/Preference$OnPreferenceChangeListener;


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lcom/mobnetic/coinguardian/fragment/SettingsNotificationsFragment;->onCreate(Landroid/os/Bundle;)V
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = null
.end annotation


# instance fields
.field final synthetic this$0:Lcom/mobnetic/coinguardian/fragment/SettingsNotificationsFragment;


# direct methods
.method constructor <init>(Lcom/mobnetic/coinguardian/fragment/SettingsNotificationsFragment;)V
    .locals 0
    .param p1, "this$0"    # Lcom/mobnetic/coinguardian/fragment/SettingsNotificationsFragment;

    .prologue
    .line 41
    iput-object p1, p0, Lcom/mobnetic/coinguardian/fragment/SettingsNotificationsFragment$2;->this$0:Lcom/mobnetic/coinguardian/fragment/SettingsNotificationsFragment;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public onPreferenceChange(Landroid/preference/Preference;Ljava/lang/Object;)Z
    .locals 2
    .param p1, "preference"    # Landroid/preference/Preference;
    .param p2, "newValue"    # Ljava/lang/Object;

    .prologue
    .line 43
    iget-object v0, p0, Lcom/mobnetic/coinguardian/fragment/SettingsNotificationsFragment$2;->this$0:Lcom/mobnetic/coinguardian/fragment/SettingsNotificationsFragment;

    invoke-virtual {v0}, Lcom/mobnetic/coinguardian/fragment/SettingsNotificationsFragment;->getActivity()Landroid/support/v4/app/FragmentActivity;

    move-result-object v0

    check-cast p2, Ljava/lang/Boolean;

    .end local p2    # "newValue":Ljava/lang/Object;
    invoke-virtual {p2}, Ljava/lang/Boolean;->booleanValue()Z

    move-result v1

    invoke-static {v0, v1}, Lcom/mobnetic/coinguardian/util/PreferencesUtils;->setCheckNotificationCustomLayout(Landroid/content/Context;Z)V

    .line 44
    iget-object v0, p0, Lcom/mobnetic/coinguardian/fragment/SettingsNotificationsFragment$2;->this$0:Lcom/mobnetic/coinguardian/fragment/SettingsNotificationsFragment;

    invoke-virtual {v0}, Lcom/mobnetic/coinguardian/fragment/SettingsNotificationsFragment;->getActivity()Landroid/support/v4/app/FragmentActivity;

    move-result-object v0

    invoke-static {v0}, Lcom/mobnetic/coinguardian/util/NotificationUtils;->refreshOngoingNotifications(Landroid/content/Context;)V

    .line 45
    const/4 v0, 0x1

    return v0
.end method
