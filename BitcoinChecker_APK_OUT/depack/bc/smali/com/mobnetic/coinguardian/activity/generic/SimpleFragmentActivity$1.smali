.class Lcom/mobnetic/coinguardian/activity/generic/SimpleFragmentActivity$1;
.super Landroid/content/BroadcastReceiver;
.source "SimpleFragmentActivity.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/mobnetic/coinguardian/activity/generic/SimpleFragmentActivity;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = null
.end annotation


# instance fields
.field final synthetic this$0:Lcom/mobnetic/coinguardian/activity/generic/SimpleFragmentActivity;


# direct methods
.method constructor <init>(Lcom/mobnetic/coinguardian/activity/generic/SimpleFragmentActivity;)V
    .locals 0
    .param p1, "this$0"    # Lcom/mobnetic/coinguardian/activity/generic/SimpleFragmentActivity;

    .prologue
    .line 40
    .local p0, "this":Lcom/mobnetic/coinguardian/activity/generic/SimpleFragmentActivity$1;, "Lcom/mobnetic/coinguardian/activity/generic/SimpleFragmentActivity$1;"
    iput-object p1, p0, Lcom/mobnetic/coinguardian/activity/generic/SimpleFragmentActivity$1;->this$0:Lcom/mobnetic/coinguardian/activity/generic/SimpleFragmentActivity;

    invoke-direct {p0}, Landroid/content/BroadcastReceiver;-><init>()V

    return-void
.end method


# virtual methods
.method public onReceive(Landroid/content/Context;Landroid/content/Intent;)V
    .locals 2
    .param p1, "context"    # Landroid/content/Context;
    .param p2, "intent"    # Landroid/content/Intent;

    .prologue
    .line 42
    .local p0, "this":Lcom/mobnetic/coinguardian/activity/generic/SimpleFragmentActivity$1;, "Lcom/mobnetic/coinguardian/activity/generic/SimpleFragmentActivity$1;"
    iget-object v0, p0, Lcom/mobnetic/coinguardian/activity/generic/SimpleFragmentActivity$1;->this$0:Lcom/mobnetic/coinguardian/activity/generic/SimpleFragmentActivity;

    invoke-static {p1}, Lcom/mobnetic/coinguardian/util/TTSHelper;->getProperAudioStream(Landroid/content/Context;)I

    move-result v1

    invoke-virtual {v0, v1}, Lcom/mobnetic/coinguardian/activity/generic/SimpleFragmentActivity;->setVolumeControlStream(I)V

    .line 43
    return-void
.end method
