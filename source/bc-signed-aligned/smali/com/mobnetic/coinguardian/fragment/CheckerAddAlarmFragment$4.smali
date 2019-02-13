.class Lcom/mobnetic/coinguardian/fragment/CheckerAddAlarmFragment$4;
.super Ljava/lang/Object;
.source "CheckerAddAlarmFragment.java"

# interfaces
.implements Lcom/mobnetic/coinguardian/view/ViewAlarmCheckPointPreference$OnCheckpointChangedListener;


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
    .line 139
    iput-object p1, p0, Lcom/mobnetic/coinguardian/fragment/CheckerAddAlarmFragment$4;->this$0:Lcom/mobnetic/coinguardian/fragment/CheckerAddAlarmFragment;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public onCheckpointChanged(Lcom/mobnetic/coinguardian/view/ViewAlarmCheckPointPreference;Lcom/mobnetic/coinguardian/model/Ticker;)Z
    .locals 3
    .param p1, "viewAlarmCheckpointPreference"    # Lcom/mobnetic/coinguardian/view/ViewAlarmCheckPointPreference;
    .param p2, "lastCheckPointTicker"    # Lcom/mobnetic/coinguardian/model/Ticker;

    .prologue
    const/4 v2, 0x1

    .line 142
    iget-object v0, p0, Lcom/mobnetic/coinguardian/fragment/CheckerAddAlarmFragment$4;->this$0:Lcom/mobnetic/coinguardian/fragment/CheckerAddAlarmFragment;

    invoke-static {v0}, Lcom/mobnetic/coinguardian/fragment/CheckerAddAlarmFragment;->access$000(Lcom/mobnetic/coinguardian/fragment/CheckerAddAlarmFragment;)Lcom/mobnetic/coinguardian/db/content/AlarmRecord;

    move-result-object v1

    if-eqz p2, :cond_0

    invoke-static {p2}, Lcom/mobnetic/coinguardian/util/TickerUtils;->toJson(Lcom/mobnetic/coinguardian/model/Ticker;)Ljava/lang/String;

    move-result-object v0

    :goto_0
    invoke-virtual {v1, v0}, Lcom/mobnetic/coinguardian/db/content/AlarmRecord;->setLastCheckPointTicker(Ljava/lang/String;)V

    .line 143
    iget-object v0, p0, Lcom/mobnetic/coinguardian/fragment/CheckerAddAlarmFragment$4;->this$0:Lcom/mobnetic/coinguardian/fragment/CheckerAddAlarmFragment;

    invoke-static {v0, v2}, Lcom/mobnetic/coinguardian/fragment/CheckerAddAlarmFragment;->access$102(Lcom/mobnetic/coinguardian/fragment/CheckerAddAlarmFragment;Z)Z

    .line 144
    return v2

    .line 142
    :cond_0
    const/4 v0, 0x0

    goto :goto_0
.end method
