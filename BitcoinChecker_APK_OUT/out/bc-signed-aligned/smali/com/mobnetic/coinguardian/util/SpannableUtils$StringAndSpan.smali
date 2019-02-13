.class public Lcom/mobnetic/coinguardian/util/SpannableUtils$StringAndSpan;
.super Landroid/util/Pair;
.source "SpannableUtils.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/mobnetic/coinguardian/util/SpannableUtils;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x9
    name = "StringAndSpan"
.end annotation

.annotation system Ldalvik/annotation/Signature;
    value = {
        "Landroid/util/Pair",
        "<",
        "Ljava/lang/String;",
        "Landroid/text/style/CharacterStyle;",
        ">;"
    }
.end annotation


# direct methods
.method public constructor <init>(Ljava/lang/String;Landroid/text/style/CharacterStyle;)V
    .locals 0
    .param p1, "first"    # Ljava/lang/String;
    .param p2, "second"    # Landroid/text/style/CharacterStyle;

    .prologue
    .line 12
    invoke-direct {p0, p1, p2}, Landroid/util/Pair;-><init>(Ljava/lang/Object;Ljava/lang/Object;)V

    .line 13
    return-void
.end method
