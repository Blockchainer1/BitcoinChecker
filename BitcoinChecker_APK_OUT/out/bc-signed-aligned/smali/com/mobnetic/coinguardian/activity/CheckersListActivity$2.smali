.class Lcom/mobnetic/coinguardian/activity/CheckersListActivity$2;
.super Ljava/lang/Object;
.source "CheckersListActivity.java"

# interfaces
.implements Landroid/content/DialogInterface$OnClickListener;


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lcom/mobnetic/coinguardian/activity/CheckersListActivity;->onCreate(Landroid/os/Bundle;)V
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = null
.end annotation


# instance fields
.field final synthetic this$0:Lcom/mobnetic/coinguardian/activity/CheckersListActivity;


# direct methods
.method constructor <init>(Lcom/mobnetic/coinguardian/activity/CheckersListActivity;)V
    .locals 0
    .param p1, "this$0"    # Lcom/mobnetic/coinguardian/activity/CheckersListActivity;

    .prologue
    .line 79
    iput-object p1, p0, Lcom/mobnetic/coinguardian/activity/CheckersListActivity$2;->this$0:Lcom/mobnetic/coinguardian/activity/CheckersListActivity;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public onClick(Landroid/content/DialogInterface;I)V
    .locals 2
    .param p1, "dialog"    # Landroid/content/DialogInterface;
    .param p2, "which"    # I

    .prologue
    .line 81
    iget-object v0, p0, Lcom/mobnetic/coinguardian/activity/CheckersListActivity$2;->this$0:Lcom/mobnetic/coinguardian/activity/CheckersListActivity;

    const/4 v1, 0x1

    invoke-static {v0, v1}, Lcom/mobnetic/coinguardian/activity/CheckersListActivity;->access$002(Lcom/mobnetic/coinguardian/activity/CheckersListActivity;Z)Z

    .line 82
    iget-object v0, p0, Lcom/mobnetic/coinguardian/activity/CheckersListActivity$2;->this$0:Lcom/mobnetic/coinguardian/activity/CheckersListActivity;

    const/4 v1, 0x3

    invoke-static {v0, v1}, Lcom/mobnetic/coinguardian/util/PreferencesUtils;->setNewsShown(Landroid/content/Context;I)V

    .line 83
    iget-object v0, p0, Lcom/mobnetic/coinguardian/activity/CheckersListActivity$2;->this$0:Lcom/mobnetic/coinguardian/activity/CheckersListActivity;

    invoke-static {v0}, Lcom/mobnetic/coinguardian/util/Utils;->goToGitHubIssues(Landroid/content/Context;)Z

    .line 84
    return-void
.end method
