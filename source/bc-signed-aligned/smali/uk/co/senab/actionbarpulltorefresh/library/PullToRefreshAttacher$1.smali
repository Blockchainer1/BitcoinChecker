.class Luk/co/senab/actionbarpulltorefresh/library/PullToRefreshAttacher$1;
.super Ljava/lang/Object;
.source "PullToRefreshAttacher.java"

# interfaces
.implements Ljava/lang/Runnable;


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Luk/co/senab/actionbarpulltorefresh/library/PullToRefreshAttacher;-><init>(Landroid/app/Activity;Luk/co/senab/actionbarpulltorefresh/library/Options;)V
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = null
.end annotation


# instance fields
.field final synthetic this$0:Luk/co/senab/actionbarpulltorefresh/library/PullToRefreshAttacher;

.field final synthetic val$decorView:Landroid/view/ViewGroup;


# direct methods
.method constructor <init>(Luk/co/senab/actionbarpulltorefresh/library/PullToRefreshAttacher;Landroid/view/ViewGroup;)V
    .locals 0
    .param p1, "this$0"    # Luk/co/senab/actionbarpulltorefresh/library/PullToRefreshAttacher;

    .prologue
    .line 122
    iput-object p1, p0, Luk/co/senab/actionbarpulltorefresh/library/PullToRefreshAttacher$1;->this$0:Luk/co/senab/actionbarpulltorefresh/library/PullToRefreshAttacher;

    iput-object p2, p0, Luk/co/senab/actionbarpulltorefresh/library/PullToRefreshAttacher$1;->val$decorView:Landroid/view/ViewGroup;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public run()V
    .locals 3

    .prologue
    .line 125
    iget-object v0, p0, Luk/co/senab/actionbarpulltorefresh/library/PullToRefreshAttacher$1;->val$decorView:Landroid/view/ViewGroup;

    invoke-virtual {v0}, Landroid/view/ViewGroup;->getWindowToken()Landroid/os/IBinder;

    move-result-object v0

    if-eqz v0, :cond_0

    .line 127
    iget-object v0, p0, Luk/co/senab/actionbarpulltorefresh/library/PullToRefreshAttacher$1;->this$0:Luk/co/senab/actionbarpulltorefresh/library/PullToRefreshAttacher;

    iget-object v1, p0, Luk/co/senab/actionbarpulltorefresh/library/PullToRefreshAttacher$1;->this$0:Luk/co/senab/actionbarpulltorefresh/library/PullToRefreshAttacher;

    invoke-static {v1}, Luk/co/senab/actionbarpulltorefresh/library/PullToRefreshAttacher;->access$000(Luk/co/senab/actionbarpulltorefresh/library/PullToRefreshAttacher;)Landroid/view/View;

    move-result-object v1

    iget-object v2, p0, Luk/co/senab/actionbarpulltorefresh/library/PullToRefreshAttacher$1;->this$0:Luk/co/senab/actionbarpulltorefresh/library/PullToRefreshAttacher;

    invoke-static {v2}, Luk/co/senab/actionbarpulltorefresh/library/PullToRefreshAttacher;->access$100(Luk/co/senab/actionbarpulltorefresh/library/PullToRefreshAttacher;)Landroid/app/Activity;

    move-result-object v2

    invoke-virtual {v0, v1, v2}, Luk/co/senab/actionbarpulltorefresh/library/PullToRefreshAttacher;->addHeaderViewToActivity(Landroid/view/View;Landroid/app/Activity;)V

    .line 132
    :goto_0
    return-void

    .line 130
    :cond_0
    iget-object v0, p0, Luk/co/senab/actionbarpulltorefresh/library/PullToRefreshAttacher$1;->this$0:Luk/co/senab/actionbarpulltorefresh/library/PullToRefreshAttacher;

    invoke-static {v0}, Luk/co/senab/actionbarpulltorefresh/library/PullToRefreshAttacher;->access$200(Luk/co/senab/actionbarpulltorefresh/library/PullToRefreshAttacher;)Landroid/os/Handler;

    move-result-object v0

    invoke-virtual {v0, p0}, Landroid/os/Handler;->post(Ljava/lang/Runnable;)Z

    goto :goto_0
.end method
