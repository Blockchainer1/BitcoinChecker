.class Lcom/mobnetic/coinguardian/fragment/SettingsTTSFragment$2;
.super Ljava/lang/Object;
.source "SettingsTTSFragment.java"

# interfaces
.implements Landroid/preference/Preference$OnPreferenceClickListener;


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


# direct methods
.method constructor <init>(Lcom/mobnetic/coinguardian/fragment/SettingsTTSFragment;)V
    .locals 0
    .param p1, "this$0"    # Lcom/mobnetic/coinguardian/fragment/SettingsTTSFragment;

    .prologue
    .line 57
    iput-object p1, p0, Lcom/mobnetic/coinguardian/fragment/SettingsTTSFragment$2;->this$0:Lcom/mobnetic/coinguardian/fragment/SettingsTTSFragment;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public onPreferenceClick(Landroid/preference/Preference;)Z
    .locals 12
    .param p1, "preference"    # Landroid/preference/Preference;

    .prologue
    const/4 v5, 0x0

    .line 59
    iget-object v0, p0, Lcom/mobnetic/coinguardian/fragment/SettingsTTSFragment$2;->this$0:Lcom/mobnetic/coinguardian/fragment/SettingsTTSFragment;

    invoke-virtual {v0}, Lcom/mobnetic/coinguardian/fragment/SettingsTTSFragment;->getActivity()Landroid/support/v4/app/FragmentActivity;

    move-result-object v0

    iget-object v1, p0, Lcom/mobnetic/coinguardian/fragment/SettingsTTSFragment$2;->this$0:Lcom/mobnetic/coinguardian/fragment/SettingsTTSFragment;

    .line 60
    invoke-virtual {v1}, Lcom/mobnetic/coinguardian/fragment/SettingsTTSFragment;->getActivity()Landroid/support/v4/app/FragmentActivity;

    move-result-object v1

    const-wide v2, 0x4086455c28f5c28fL    # 712.67

    const-string v4, "BTC"

    iget-object v6, p0, Lcom/mobnetic/coinguardian/fragment/SettingsTTSFragment$2;->this$0:Lcom/mobnetic/coinguardian/fragment/SettingsTTSFragment;

    invoke-static {v6}, Lcom/mobnetic/coinguardian/fragment/SettingsTTSFragment;->access$000(Lcom/mobnetic/coinguardian/fragment/SettingsTTSFragment;)Lcom/mobnetic/coinguardian/model/CurrencySubunit;

    move-result-object v7

    iget-object v6, p0, Lcom/mobnetic/coinguardian/fragment/SettingsTTSFragment$2;->this$0:Lcom/mobnetic/coinguardian/fragment/SettingsTTSFragment;

    invoke-static {v6}, Lcom/mobnetic/coinguardian/fragment/SettingsTTSFragment;->access$100(Lcom/mobnetic/coinguardian/fragment/SettingsTTSFragment;)Lcom/mobnetic/coinguardian/model/Market;

    move-result-object v9

    iget-object v6, p0, Lcom/mobnetic/coinguardian/fragment/SettingsTTSFragment$2;->this$0:Lcom/mobnetic/coinguardian/fragment/SettingsTTSFragment;

    invoke-static {v6}, Lcom/mobnetic/coinguardian/fragment/SettingsTTSFragment;->access$100(Lcom/mobnetic/coinguardian/fragment/SettingsTTSFragment;)Lcom/mobnetic/coinguardian/model/Market;

    move-result-object v6

    iget-object v10, v6, Lcom/mobnetic/coinguardian/model/Market;->ttsName:Ljava/lang/String;

    move v6, v5

    move v8, v5

    move v11, v5

    invoke-static/range {v1 .. v11}, Lcom/mobnetic/coinguardian/util/FormatUtils;->formatTextForTTS(Landroid/content/Context;DLjava/lang/String;IZLcom/mobnetic/coinguardian/model/CurrencySubunit;ZLcom/mobnetic/coinguardian/model/Market;Ljava/lang/String;Z)Ljava/lang/String;

    move-result-object v1

    .line 59
    invoke-static {v0, v1}, Lcom/mobnetic/coinguardian/util/TTSHelper;->speak(Landroid/content/Context;Ljava/lang/String;)V

    .line 61
    const/4 v0, 0x1

    return v0
.end method
