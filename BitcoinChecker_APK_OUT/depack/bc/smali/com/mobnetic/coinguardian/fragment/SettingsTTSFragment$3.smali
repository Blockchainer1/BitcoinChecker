.class Lcom/mobnetic/coinguardian/fragment/SettingsTTSFragment$3;
.super Ljava/lang/Object;
.source "SettingsTTSFragment.java"

# interfaces
.implements Landroid/preference/Preference$OnPreferenceChangeListener;


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lcom/mobnetic/coinguardian/fragment/SettingsTTSFragment;->onCreate(Landroid/os/Bundle;)V
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = null
.end annotation


# instance fields
.field final synthetic this$0:Lcom/mobnetic/coinguardian/fragment/SettingsTTSFragment;

.field final synthetic val$advancedStreamPreference:Landroid/preference/ListPreference;


# direct methods
.method constructor <init>(Lcom/mobnetic/coinguardian/fragment/SettingsTTSFragment;Landroid/preference/ListPreference;)V
    .locals 0
    .param p1, "this$0"    # Lcom/mobnetic/coinguardian/fragment/SettingsTTSFragment;

    .prologue
    .line 67
    iput-object p1, p0, Lcom/mobnetic/coinguardian/fragment/SettingsTTSFragment$3;->this$0:Lcom/mobnetic/coinguardian/fragment/SettingsTTSFragment;

    iput-object p2, p0, Lcom/mobnetic/coinguardian/fragment/SettingsTTSFragment$3;->val$advancedStreamPreference:Landroid/preference/ListPreference;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public onPreferenceChange(Landroid/preference/Preference;Ljava/lang/Object;)Z
    .locals 1
    .param p1, "preference"    # Landroid/preference/Preference;
    .param p2, "newValue"    # Ljava/lang/Object;

    .prologue
    .line 69
    iget-object v0, p0, Lcom/mobnetic/coinguardian/fragment/SettingsTTSFragment$3;->val$advancedStreamPreference:Landroid/preference/ListPreference;

    invoke-static {v0, p2}, Lcom/mobnetic/coinguardian/util/Utils;->handleIntListOnPreferenceChange(Landroid/preference/ListPreference;Ljava/lang/Object;)Z

    move-result v0

    return v0
.end method
