.class public abstract Lcom/mobnetic/coinguardian/activity/generic/SimpleFragmentActivity;
.super Landroid/support/v7/app/ActionBarActivity;
.source "SimpleFragmentActivity.java"


# annotations
.annotation system Ldalvik/annotation/Signature;
    value = {
        "<T:",
        "Landroid/support/v4/app/Fragment;",
        ">",
        "Landroid/support/v7/app/ActionBarActivity;"
    }
.end annotation


# static fields
.field private static final CHILD_FRAGMENT_TAG:Ljava/lang/String; = "CHILD_FRAGMENT"

.field private static final audioHeadsetChangedFilter:Landroid/content/IntentFilter;


# instance fields
.field private final audioHeadsetChangedReceiver:Landroid/content/BroadcastReceiver;

.field protected childFragment:Landroid/support/v4/app/Fragment;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "TT;"
        }
    .end annotation
.end field


# direct methods
.method static constructor <clinit>()V
    .locals 2

    .prologue
    .line 39
    new-instance v0, Landroid/content/IntentFilter;

    const-string v1, "android.intent.action.HEADSET_PLUG"

    invoke-direct {v0, v1}, Landroid/content/IntentFilter;-><init>(Ljava/lang/String;)V

    sput-object v0, Lcom/mobnetic/coinguardian/activity/generic/SimpleFragmentActivity;->audioHeadsetChangedFilter:Landroid/content/IntentFilter;

    return-void
.end method

.method public constructor <init>()V
    .locals 1

    .prologue
    .line 16
    .local p0, "this":Lcom/mobnetic/coinguardian/activity/generic/SimpleFragmentActivity;, "Lcom/mobnetic/coinguardian/activity/generic/SimpleFragmentActivity<TT;>;"
    invoke-direct {p0}, Landroid/support/v7/app/ActionBarActivity;-><init>()V

    .line 40
    new-instance v0, Lcom/mobnetic/coinguardian/activity/generic/SimpleFragmentActivity$1;

    invoke-direct {v0, p0}, Lcom/mobnetic/coinguardian/activity/generic/SimpleFragmentActivity$1;-><init>(Lcom/mobnetic/coinguardian/activity/generic/SimpleFragmentActivity;)V

    iput-object v0, p0, Lcom/mobnetic/coinguardian/activity/generic/SimpleFragmentActivity;->audioHeadsetChangedReceiver:Landroid/content/BroadcastReceiver;

    return-void
.end method


# virtual methods
.method protected abstract createChildFragment()Landroid/support/v4/app/Fragment;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()TT;"
        }
    .end annotation
.end method

.method public getChildFragment()Landroid/support/v4/app/Fragment;
    .locals 1
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()TT;"
        }
    .end annotation

    .prologue
    .line 67
    .local p0, "this":Lcom/mobnetic/coinguardian/activity/generic/SimpleFragmentActivity;, "Lcom/mobnetic/coinguardian/activity/generic/SimpleFragmentActivity<TT;>;"
    iget-object v0, p0, Lcom/mobnetic/coinguardian/activity/generic/SimpleFragmentActivity;->childFragment:Landroid/support/v4/app/Fragment;

    return-object v0
.end method

.method protected getContentViewResId()I
    .locals 1

    .prologue
    .line 61
    .local p0, "this":Lcom/mobnetic/coinguardian/activity/generic/SimpleFragmentActivity;, "Lcom/mobnetic/coinguardian/activity/generic/SimpleFragmentActivity<TT;>;"
    const v0, 0x7f030024

    return v0
.end method

.method protected onCreate(Landroid/os/Bundle;)V
    .locals 5
    .param p1, "savedInstanceState"    # Landroid/os/Bundle;

    .prologue
    .line 23
    .local p0, "this":Lcom/mobnetic/coinguardian/activity/generic/SimpleFragmentActivity;, "Lcom/mobnetic/coinguardian/activity/generic/SimpleFragmentActivity<TT;>;"
    invoke-super {p0, p1}, Landroid/support/v7/app/ActionBarActivity;->onCreate(Landroid/os/Bundle;)V

    .line 25
    invoke-virtual {p0}, Lcom/mobnetic/coinguardian/activity/generic/SimpleFragmentActivity;->getContentViewResId()I

    move-result v2

    invoke-virtual {p0, v2}, Lcom/mobnetic/coinguardian/activity/generic/SimpleFragmentActivity;->setContentView(I)V

    .line 27
    invoke-virtual {p0}, Lcom/mobnetic/coinguardian/activity/generic/SimpleFragmentActivity;->getSupportFragmentManager()Landroid/support/v4/app/FragmentManager;

    move-result-object v2

    const-string v3, "CHILD_FRAGMENT"

    invoke-virtual {v2, v3}, Landroid/support/v4/app/FragmentManager;->findFragmentByTag(Ljava/lang/String;)Landroid/support/v4/app/Fragment;

    move-result-object v2

    iput-object v2, p0, Lcom/mobnetic/coinguardian/activity/generic/SimpleFragmentActivity;->childFragment:Landroid/support/v4/app/Fragment;

    .line 28
    iget-object v2, p0, Lcom/mobnetic/coinguardian/activity/generic/SimpleFragmentActivity;->childFragment:Landroid/support/v4/app/Fragment;

    if-nez v2, :cond_0

    .line 29
    invoke-virtual {p0}, Lcom/mobnetic/coinguardian/activity/generic/SimpleFragmentActivity;->createChildFragment()Landroid/support/v4/app/Fragment;

    move-result-object v2

    iput-object v2, p0, Lcom/mobnetic/coinguardian/activity/generic/SimpleFragmentActivity;->childFragment:Landroid/support/v4/app/Fragment;

    .line 30
    iget-object v2, p0, Lcom/mobnetic/coinguardian/activity/generic/SimpleFragmentActivity;->childFragment:Landroid/support/v4/app/Fragment;

    if-eqz v2, :cond_0

    .line 31
    invoke-virtual {p0}, Lcom/mobnetic/coinguardian/activity/generic/SimpleFragmentActivity;->getSupportFragmentManager()Landroid/support/v4/app/FragmentManager;

    move-result-object v0

    .line 32
    .local v0, "mFragmentManager":Landroid/support/v4/app/FragmentManager;
    invoke-virtual {v0}, Landroid/support/v4/app/FragmentManager;->beginTransaction()Landroid/support/v4/app/FragmentTransaction;

    move-result-object v1

    .line 33
    .local v1, "mFragmentTransaction":Landroid/support/v4/app/FragmentTransaction;
    const v2, 0x7f0e004e

    iget-object v3, p0, Lcom/mobnetic/coinguardian/activity/generic/SimpleFragmentActivity;->childFragment:Landroid/support/v4/app/Fragment;

    const-string v4, "CHILD_FRAGMENT"

    invoke-virtual {v1, v2, v3, v4}, Landroid/support/v4/app/FragmentTransaction;->replace(ILandroid/support/v4/app/Fragment;Ljava/lang/String;)Landroid/support/v4/app/FragmentTransaction;

    .line 34
    invoke-virtual {v1}, Landroid/support/v4/app/FragmentTransaction;->commit()I

    .line 37
    .end local v0    # "mFragmentManager":Landroid/support/v4/app/FragmentManager;
    .end local v1    # "mFragmentTransaction":Landroid/support/v4/app/FragmentTransaction;
    :cond_0
    return-void
.end method

.method protected onStart()V
    .locals 2

    .prologue
    .line 48
    .local p0, "this":Lcom/mobnetic/coinguardian/activity/generic/SimpleFragmentActivity;, "Lcom/mobnetic/coinguardian/activity/generic/SimpleFragmentActivity<TT;>;"
    invoke-super {p0}, Landroid/support/v7/app/ActionBarActivity;->onStart()V

    .line 49
    iget-object v0, p0, Lcom/mobnetic/coinguardian/activity/generic/SimpleFragmentActivity;->audioHeadsetChangedReceiver:Landroid/content/BroadcastReceiver;

    sget-object v1, Lcom/mobnetic/coinguardian/activity/generic/SimpleFragmentActivity;->audioHeadsetChangedFilter:Landroid/content/IntentFilter;

    invoke-virtual {p0, v0, v1}, Lcom/mobnetic/coinguardian/activity/generic/SimpleFragmentActivity;->registerReceiver(Landroid/content/BroadcastReceiver;Landroid/content/IntentFilter;)Landroid/content/Intent;

    .line 50
    invoke-static {p0}, Lcom/mobnetic/coinguardian/util/TTSHelper;->getProperAudioStream(Landroid/content/Context;)I

    move-result v0

    invoke-virtual {p0, v0}, Lcom/mobnetic/coinguardian/activity/generic/SimpleFragmentActivity;->setVolumeControlStream(I)V

    .line 51
    return-void
.end method

.method protected onStop()V
    .locals 1

    .prologue
    .line 54
    .local p0, "this":Lcom/mobnetic/coinguardian/activity/generic/SimpleFragmentActivity;, "Lcom/mobnetic/coinguardian/activity/generic/SimpleFragmentActivity<TT;>;"
    invoke-super {p0}, Landroid/support/v7/app/ActionBarActivity;->onStop()V

    .line 56
    :try_start_0
    iget-object v0, p0, Lcom/mobnetic/coinguardian/activity/generic/SimpleFragmentActivity;->audioHeadsetChangedReceiver:Landroid/content/BroadcastReceiver;

    invoke-virtual {p0, v0}, Lcom/mobnetic/coinguardian/activity/generic/SimpleFragmentActivity;->unregisterReceiver(Landroid/content/BroadcastReceiver;)V
    :try_end_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_0

    .line 58
    :goto_0
    return-void

    .line 57
    :catch_0
    move-exception v0

    goto :goto_0
.end method
