.class Lcom/mobnetic/coinguardian/fragment/SettingsMainFragment$11;
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
    .line 141
    iput-object p1, p0, Lcom/mobnetic/coinguardian/fragment/SettingsMainFragment$11;->this$0:Lcom/mobnetic/coinguardian/fragment/SettingsMainFragment;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public onPreferenceClick(Landroid/preference/Preference;)Z
    .locals 3
    .param p1, "preference"    # Landroid/preference/Preference;

    .prologue
    .line 143
    new-instance v0, Landroid/app/AlertDialog$Builder;

    iget-object v1, p0, Lcom/mobnetic/coinguardian/fragment/SettingsMainFragment$11;->this$0:Lcom/mobnetic/coinguardian/fragment/SettingsMainFragment;

    invoke-virtual {v1}, Lcom/mobnetic/coinguardian/fragment/SettingsMainFragment;->getActivity()Landroid/support/v4/app/FragmentActivity;

    move-result-object v1

    invoke-direct {v0, v1}, Landroid/app/AlertDialog$Builder;-><init>(Landroid/content/Context;)V

    const v1, 0x7f0700bf

    .line 144
    invoke-virtual {v0, v1}, Landroid/app/AlertDialog$Builder;->setMessage(I)Landroid/app/AlertDialog$Builder;

    move-result-object v0

    const v1, 0x7f0700be

    new-instance v2, Lcom/mobnetic/coinguardian/fragment/SettingsMainFragment$11$2;

    invoke-direct {v2, p0}, Lcom/mobnetic/coinguardian/fragment/SettingsMainFragment$11$2;-><init>(Lcom/mobnetic/coinguardian/fragment/SettingsMainFragment$11;)V

    .line 145
    invoke-virtual {v0, v1, v2}, Landroid/app/AlertDialog$Builder;->setNeutralButton(ILandroid/content/DialogInterface$OnClickListener;)Landroid/app/AlertDialog$Builder;

    move-result-object v0

    const v1, 0x7f0700bd

    new-instance v2, Lcom/mobnetic/coinguardian/fragment/SettingsMainFragment$11$1;

    invoke-direct {v2, p0}, Lcom/mobnetic/coinguardian/fragment/SettingsMainFragment$11$1;-><init>(Lcom/mobnetic/coinguardian/fragment/SettingsMainFragment$11;)V

    .line 150
    invoke-virtual {v0, v1, v2}, Landroid/app/AlertDialog$Builder;->setPositiveButton(ILandroid/content/DialogInterface$OnClickListener;)Landroid/app/AlertDialog$Builder;

    move-result-object v0

    .line 155
    invoke-virtual {v0}, Landroid/app/AlertDialog$Builder;->show()Landroid/app/AlertDialog;

    .line 156
    const/4 v0, 0x1

    return v0
.end method
