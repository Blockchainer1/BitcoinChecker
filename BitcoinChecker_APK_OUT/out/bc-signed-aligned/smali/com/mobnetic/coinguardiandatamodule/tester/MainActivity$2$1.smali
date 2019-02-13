.class Lcom/mobnetic/coinguardiandatamodule/tester/MainActivity$2$1;
.super Lcom/mobnetic/coinguardiandatamodule/tester/dialog/DynamicCurrencyPairsDialog;
.source "MainActivity.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lcom/mobnetic/coinguardiandatamodule/tester/MainActivity$2;->onClick(Landroid/view/View;)V
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = null
.end annotation


# instance fields
.field final synthetic this$1:Lcom/mobnetic/coinguardiandatamodule/tester/MainActivity$2;


# direct methods
.method constructor <init>(Lcom/mobnetic/coinguardiandatamodule/tester/MainActivity$2;Landroid/content/Context;Lcom/mobnetic/coinguardian/model/Market;Lcom/mobnetic/coinguardian/util/CurrencyPairsMapHelper;)V
    .locals 0
    .param p1, "this$1"    # Lcom/mobnetic/coinguardiandatamodule/tester/MainActivity$2;
    .param p2, "context"    # Landroid/content/Context;
    .param p3, "market"    # Lcom/mobnetic/coinguardian/model/Market;
    .param p4, "currencyPairsMapHelper"    # Lcom/mobnetic/coinguardian/util/CurrencyPairsMapHelper;

    .prologue
    .line 99
    iput-object p1, p0, Lcom/mobnetic/coinguardiandatamodule/tester/MainActivity$2$1;->this$1:Lcom/mobnetic/coinguardiandatamodule/tester/MainActivity$2;

    invoke-direct {p0, p2, p3, p4}, Lcom/mobnetic/coinguardiandatamodule/tester/dialog/DynamicCurrencyPairsDialog;-><init>(Landroid/content/Context;Lcom/mobnetic/coinguardian/model/Market;Lcom/mobnetic/coinguardian/util/CurrencyPairsMapHelper;)V

    return-void
.end method


# virtual methods
.method public onPairsUpdated(Lcom/mobnetic/coinguardian/model/Market;Lcom/mobnetic/coinguardian/util/CurrencyPairsMapHelper;)V
    .locals 1
    .param p1, "market"    # Lcom/mobnetic/coinguardian/model/Market;
    .param p2, "currencyPairsMapHelper"    # Lcom/mobnetic/coinguardian/util/CurrencyPairsMapHelper;

    .prologue
    .line 101
    iget-object v0, p0, Lcom/mobnetic/coinguardiandatamodule/tester/MainActivity$2$1;->this$1:Lcom/mobnetic/coinguardiandatamodule/tester/MainActivity$2;

    iget-object v0, v0, Lcom/mobnetic/coinguardiandatamodule/tester/MainActivity$2;->this$0:Lcom/mobnetic/coinguardiandatamodule/tester/MainActivity;

    invoke-static {v0, p2}, Lcom/mobnetic/coinguardiandatamodule/tester/MainActivity;->access$102(Lcom/mobnetic/coinguardiandatamodule/tester/MainActivity;Lcom/mobnetic/coinguardian/util/CurrencyPairsMapHelper;)Lcom/mobnetic/coinguardian/util/CurrencyPairsMapHelper;

    .line 102
    iget-object v0, p0, Lcom/mobnetic/coinguardiandatamodule/tester/MainActivity$2$1;->this$1:Lcom/mobnetic/coinguardiandatamodule/tester/MainActivity$2;

    iget-object v0, v0, Lcom/mobnetic/coinguardiandatamodule/tester/MainActivity$2;->this$0:Lcom/mobnetic/coinguardiandatamodule/tester/MainActivity;

    invoke-static {v0, p1}, Lcom/mobnetic/coinguardiandatamodule/tester/MainActivity;->access$200(Lcom/mobnetic/coinguardiandatamodule/tester/MainActivity;Lcom/mobnetic/coinguardian/model/Market;)V

    .line 103
    return-void
.end method
