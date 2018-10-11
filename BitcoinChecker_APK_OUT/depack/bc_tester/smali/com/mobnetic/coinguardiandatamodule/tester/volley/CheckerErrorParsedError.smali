.class public Lcom/mobnetic/coinguardiandatamodule/tester/volley/CheckerErrorParsedError;
.super Lcom/android/volley/ParseError;
.source "CheckerErrorParsedError.java"


# static fields
.field private static final serialVersionUID:J = -0x76882fd468103fffL


# instance fields
.field private final errorMsg:Ljava/lang/String;


# direct methods
.method public constructor <init>(Ljava/lang/String;)V
    .locals 0
    .param p1, "errorMsg"    # Ljava/lang/String;

    .prologue
    .line 12
    invoke-direct {p0}, Lcom/android/volley/ParseError;-><init>()V

    .line 13
    iput-object p1, p0, Lcom/mobnetic/coinguardiandatamodule/tester/volley/CheckerErrorParsedError;->errorMsg:Ljava/lang/String;

    .line 14
    return-void
.end method


# virtual methods
.method public getErrorMsg()Ljava/lang/String;
    .locals 1

    .prologue
    .line 17
    iget-object v0, p0, Lcom/mobnetic/coinguardiandatamodule/tester/volley/CheckerErrorParsedError;->errorMsg:Ljava/lang/String;

    return-object v0
.end method
