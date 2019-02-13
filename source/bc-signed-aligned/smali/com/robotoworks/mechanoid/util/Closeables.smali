.class public final Lcom/robotoworks/mechanoid/util/Closeables;
.super Ljava/lang/Object;
.source "Closeables.java"


# direct methods
.method private constructor <init>()V
    .locals 0

    .prologue
    .line 23
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method

.method public static closeSilently(Landroid/database/Cursor;)V
    .locals 0
    .param p0, "closeable"    # Landroid/database/Cursor;

    .prologue
    .line 26
    if-nez p0, :cond_0

    .line 31
    :goto_0
    return-void

    .line 30
    :cond_0
    invoke-interface {p0}, Landroid/database/Cursor;->close()V

    goto :goto_0
.end method

.method public static closeSilently(Ljava/io/Closeable;)V
    .locals 1
    .param p0, "closeable"    # Ljava/io/Closeable;

    .prologue
    .line 34
    if-nez p0, :cond_0

    .line 44
    :goto_0
    return-void

    .line 39
    :cond_0
    :try_start_0
    invoke-interface {p0}, Ljava/io/Closeable;->close()V
    :try_end_0
    .catch Ljava/io/IOException; {:try_start_0 .. :try_end_0} :catch_0

    goto :goto_0

    .line 40
    :catch_0
    move-exception v0

    .line 42
    .local v0, "x":Ljava/io/IOException;
    invoke-virtual {v0}, Ljava/io/IOException;->printStackTrace()V

    goto :goto_0
.end method
