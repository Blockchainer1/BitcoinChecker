.class Lcom/mobnetic/coinguardian/fragment/SettingsMainFragment$10;
.super Ljava/lang/Object;
.source "SettingsMainFragment.java"

# interfaces
.implements Landroid/preference/Preference$OnPreferenceClickListener;


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
    .line 127
    iput-object p1, p0, Lcom/mobnetic/coinguardian/fragment/SettingsMainFragment$10;->this$0:Lcom/mobnetic/coinguardian/fragment/SettingsMainFragment;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public onPreferenceClick(Landroid/preference/Preference;)Z
    .locals 2
    .param p1, "preference"    # Landroid/preference/Preference;

    .prologue
    .line 129
    new-instance v0, Lcom/mobnetic/coinguardian/dialog/ChangeLogDialog;

    iget-object v1, p0, Lcom/mobnetic/coinguardian/fragment/SettingsMainFragment$10;->this$0:Lcom/mobnetic/coinguardian/fragment/SettingsMainFragment;

    invoke-virtual {v1}, Lcom/mobnetic/coinguardian/fragment/SettingsMainFragment;->getActivity()Landroid/support/v4/app/FragmentActivity;

    move-result-object v1

    invoke-direct {v0, v1}, Lcom/mobnetic/coinguardian/dialog/ChangeLogDialog;-><init>(Landroid/app/Activity;)V

    invoke-virtual {v0}, Lcom/mobnetic/coinguardian/dialog/ChangeLogDialog;->show()V

    .line 130
    const/4 v0, 0x1

    return v0
.end method
