.class public Lcom/mobnetic/coinguardiandatamodule/tester/volley/CheckerVolleyMainRequest$TickerWrapper;
.super Ljava/lang/Object;
.source "CheckerVolleyMainRequest.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/mobnetic/coinguardiandatamodule/tester/volley/CheckerVolleyMainRequest;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x1
    name = "TickerWrapper"
.end annotation


# instance fields
.field final synthetic this$0:Lcom/mobnetic/coinguardiandatamodule/tester/volley/CheckerVolleyMainRequest;

.field public ticker:Lcom/mobnetic/coinguardian/model/Ticker;


# direct methods
.method public constructor <init>(Lcom/mobnetic/coinguardiandatamodule/tester/volley/CheckerVolleyMainRequest;)V
    .locals 0
    .param p1, "this$0"    # Lcom/mobnetic/coinguardiandatamodule/tester/volley/CheckerVolleyMainRequest;

    .prologue
    .line 67
    iput-object p1, p0, Lcom/mobnetic/coinguardiandatamodule/tester/volley/CheckerVolleyMainRequest$TickerWrapper;->this$0:Lcom/mobnetic/coinguardiandatamodule/tester/volley/CheckerVolleyMainRequest;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method
