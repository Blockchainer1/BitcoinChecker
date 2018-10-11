.class Lcom/mobnetic/coinguardiandatamodule/tester/MainActivity$2;
.super Ljava/lang/Object;
.source "MainActivity.java"

# interfaces
.implements Landroid/view/View$OnClickListener;


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lcom/mobnetic/coinguardiandatamodule/tester/MainActivity;->onCreate(Landroid/os/Bundle;)V
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = null
.end annotation


# instance fields
.field final synthetic this$0:Lcom/mobnetic/coinguardiandatamodule/tester/MainActivity;


# direct methods
.method constructor <init>(Lcom/mobnetic/coinguardiandatamodule/tester/MainActivity;)V
    .locals 0
    .param p1, "this$0"    # Lcom/mobnetic/coinguardiandatamodule/tester/MainActivity;

    .prologue
    .line 97
    iput-object p1, p0, Lcom/mobnetic/coinguardiandatamodule/tester/MainActivity$2;->this$0:Lcom/mobnetic/coinguardiandatamodule/tester/MainActivity;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public onClick(Landroid/view/View;)V
    .locals 4
    .param p1, "v"    # Landroid/view/View;

    .prologue
    .line 99
    new-instance v0, Lcom/mobnetic/coinguardiandatamodule/tester/MainActivity$2$1;

    iget-object v1, p0, Lcom/mobnetic/coinguardiandatamodule/tester/MainActivity$2;->this$0:Lcom/mobnetic/coinguardiandatamodule/tester/MainActivity;

    iget-object v2, p0, Lcom/mobnetic/coinguardiandatamodule/tester/MainActivity$2;->this$0:Lcom/mobnetic/coinguardiandatamodule/tester/MainActivity;

    invoke-static {v2}, Lcom/mobnetic/coinguardiandatamodule/tester/MainActivity;->access$000(Lcom/mobnetic/coinguardiandatamodule/tester/MainActivity;)Lcom/mobnetic/coinguardian/model/Market;

    move-result-object v2

    iget-object v3, p0, Lcom/mobnetic/coinguardiandatamodule/tester/MainActivity$2;->this$0:Lcom/mobnetic/coinguardiandatamodule/tester/MainActivity;

    invoke-static {v3}, Lcom/mobnetic/coinguardiandatamodule/tester/MainActivity;->access$100(Lcom/mobnetic/coinguardiandatamodule/tester/MainActivity;)Lcom/mobnetic/coinguardian/util/CurrencyPairsMapHelper;

    move-result-object v3

    invoke-direct {v0, p0, v1, v2, v3}, Lcom/mobnetic/coinguardiandatamodule/tester/MainActivity$2$1;-><init>(Lcom/mobnetic/coinguardiandatamodule/tester/MainActivity$2;Landroid/content/Context;Lcom/mobnetic/coinguardian/model/Market;Lcom/mobnetic/coinguardian/util/CurrencyPairsMapHelper;)V

    .line 104
    invoke-virtual {v0}, Lcom/mobnetic/coinguardiandatamodule/tester/MainActivity$2$1;->show()V

    .line 105
    return-void
.end method
