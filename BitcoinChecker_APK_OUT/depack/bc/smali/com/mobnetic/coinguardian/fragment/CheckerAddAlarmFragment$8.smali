.class Lcom/mobnetic/coinguardian/fragment/CheckerAddAlarmFragment$8;
.super Ljava/lang/Object;
.source "CheckerAddAlarmFragment.java"

# interfaces
.implements Lcom/mobnetic/coinguardian/view/generic/ViewTwoStatePreference$OnCheckChangedListener;


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lcom/mobnetic/coinguardian/fragment/CheckerAddAlarmFragment;->refreshUI()V
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = null
.end annotation


# instance fields
.field final synthetic this$0:Lcom/mobnetic/coinguardian/fragment/CheckerAddAlarmFragment;


# direct methods
.method constructor <init>(Lcom/mobnetic/coinguardian/fragment/CheckerAddAlarmFragment;)V
    .locals 0
    .param p1, "this$0"    # Lcom/mobnetic/coinguardian/fragment/CheckerAddAlarmFragment;

    .prologue
    .line 196
    iput-object p1, p0, Lcom/mobnetic/coinguardian/fragment/CheckerAddAlarmFragment$8;->this$0:Lcom/mobnetic/coinguardian/fragment/CheckerAddAlarmFragment;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public onCheckChanged(Lcom/mobnetic/coinguardian/view/generic/ViewTwoStatePreference;Z)Z
    .locals 2
    .param p1, "viewCheckBoxPreference"    # Lcom/mobnetic/coinguardian/view/generic/ViewTwoStatePreference;
    .param p2, "checked"    # Z

    .prologue
    const/4 v1, 0x1

    .line 198
    iget-object v0, p0, Lcom/mobnetic/coinguardian/fragment/CheckerAddAlarmFragment$8;->this$0:Lcom/mobnetic/coinguardian/fragment/CheckerAddAlarmFragment;

    invoke-static {v0}, Lcom/mobnetic/coinguardian/fragment/CheckerAddAlarmFragment;->access$000(Lcom/mobnetic/coinguardian/fragment/CheckerAddAlarmFragment;)Lcom/mobnetic/coinguardian/db/content/AlarmRecord;

    move-result-object v0

    invoke-virtual {v0, p2}, Lcom/mobnetic/coinguardian/db/content/AlarmRecord;->setTtsEnabled(Z)V

    .line 199
    iget-object v0, p0, Lcom/mobnetic/coinguardian/fragment/CheckerAddAlarmFragment$8;->this$0:Lcom/mobnetic/coinguardian/fragment/CheckerAddAlarmFragment;

    invoke-static {v0, v1}, Lcom/mobnetic/coinguardian/fragment/CheckerAddAlarmFragment;->access$102(Lcom/mobnetic/coinguardian/fragment/CheckerAddAlarmFragment;Z)Z

    .line 200
    return v1
.end method
