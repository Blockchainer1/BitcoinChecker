.class public final Lcom/robotoworks/mechanoid/internal/util/JsonWriter;
.super Ljava/lang/Object;
.source "JsonWriter.java"

# interfaces
.implements Ljava/io/Closeable;


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lcom/robotoworks/mechanoid/internal/util/JsonWriter$1;
    }
.end annotation


# instance fields
.field private indent:Ljava/lang/String;

.field private lenient:Z

.field private final out:Ljava/io/Writer;

.field private separator:Ljava/lang/String;

.field private final stack:Ljava/util/List;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/List",
            "<",
            "Lcom/robotoworks/mechanoid/internal/util/JsonScope;",
            ">;"
        }
    .end annotation
.end field


# direct methods
.method public constructor <init>(Ljava/io/Writer;)V
    .locals 2
    .param p1, "out"    # Ljava/io/Writer;

    .prologue
    .line 152
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 129
    new-instance v0, Ljava/util/ArrayList;

    invoke-direct {v0}, Ljava/util/ArrayList;-><init>()V

    iput-object v0, p0, Lcom/robotoworks/mechanoid/internal/util/JsonWriter;->stack:Ljava/util/List;

    .line 131
    iget-object v0, p0, Lcom/robotoworks/mechanoid/internal/util/JsonWriter;->stack:Ljava/util/List;

    sget-object v1, Lcom/robotoworks/mechanoid/internal/util/JsonScope;->EMPTY_DOCUMENT:Lcom/robotoworks/mechanoid/internal/util/JsonScope;

    invoke-interface {v0, v1}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    .line 143
    const-string v0, ":"

    iput-object v0, p0, Lcom/robotoworks/mechanoid/internal/util/JsonWriter;->separator:Ljava/lang/String;

    .line 153
    if-nez p1, :cond_0

    .line 154
    new-instance v0, Ljava/lang/NullPointerException;

    const-string v1, "out == null"

    invoke-direct {v0, v1}, Ljava/lang/NullPointerException;-><init>(Ljava/lang/String;)V

    throw v0

    .line 156
    :cond_0
    iput-object p1, p0, Lcom/robotoworks/mechanoid/internal/util/JsonWriter;->out:Ljava/io/Writer;

    .line 157
    return-void
.end method

.method private beforeName()V
    .locals 4
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .prologue
    .line 481
    invoke-direct {p0}, Lcom/robotoworks/mechanoid/internal/util/JsonWriter;->peek()Lcom/robotoworks/mechanoid/internal/util/JsonScope;

    move-result-object v0

    .line 482
    .local v0, "context":Lcom/robotoworks/mechanoid/internal/util/JsonScope;
    sget-object v1, Lcom/robotoworks/mechanoid/internal/util/JsonScope;->NONEMPTY_OBJECT:Lcom/robotoworks/mechanoid/internal/util/JsonScope;

    if-ne v0, v1, :cond_1

    .line 483
    iget-object v1, p0, Lcom/robotoworks/mechanoid/internal/util/JsonWriter;->out:Ljava/io/Writer;

    const/16 v2, 0x2c

    invoke-virtual {v1, v2}, Ljava/io/Writer;->write(I)V

    .line 487
    :cond_0
    invoke-direct {p0}, Lcom/robotoworks/mechanoid/internal/util/JsonWriter;->newline()V

    .line 488
    sget-object v1, Lcom/robotoworks/mechanoid/internal/util/JsonScope;->DANGLING_NAME:Lcom/robotoworks/mechanoid/internal/util/JsonScope;

    invoke-direct {p0, v1}, Lcom/robotoworks/mechanoid/internal/util/JsonWriter;->replaceTop(Lcom/robotoworks/mechanoid/internal/util/JsonScope;)V

    .line 489
    return-void

    .line 484
    :cond_1
    sget-object v1, Lcom/robotoworks/mechanoid/internal/util/JsonScope;->EMPTY_OBJECT:Lcom/robotoworks/mechanoid/internal/util/JsonScope;

    if-eq v0, v1, :cond_0

    .line 485
    new-instance v1, Ljava/lang/IllegalStateException;

    new-instance v2, Ljava/lang/StringBuilder;

    invoke-direct {v2}, Ljava/lang/StringBuilder;-><init>()V

    const-string v3, "Nesting problem: "

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    iget-object v3, p0, Lcom/robotoworks/mechanoid/internal/util/JsonWriter;->stack:Ljava/util/List;

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    move-result-object v2

    invoke-virtual {v2}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v2

    invoke-direct {v1, v2}, Ljava/lang/IllegalStateException;-><init>(Ljava/lang/String;)V

    throw v1
.end method

.method private beforeValue(Z)V
    .locals 3
    .param p1, "root"    # Z
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .prologue
    .line 500
    sget-object v0, Lcom/robotoworks/mechanoid/internal/util/JsonWriter$1;->$SwitchMap$com$robotoworks$mechanoid$internal$util$JsonScope:[I

    invoke-direct {p0}, Lcom/robotoworks/mechanoid/internal/util/JsonWriter;->peek()Lcom/robotoworks/mechanoid/internal/util/JsonScope;

    move-result-object v1

    invoke-virtual {v1}, Lcom/robotoworks/mechanoid/internal/util/JsonScope;->ordinal()I

    move-result v1

    aget v0, v0, v1

    packed-switch v0, :pswitch_data_0

    .line 529
    new-instance v0, Ljava/lang/IllegalStateException;

    new-instance v1, Ljava/lang/StringBuilder;

    invoke-direct {v1}, Ljava/lang/StringBuilder;-><init>()V

    const-string v2, "Nesting problem: "

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    iget-object v2, p0, Lcom/robotoworks/mechanoid/internal/util/JsonWriter;->stack:Ljava/util/List;

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v1

    invoke-direct {v0, v1}, Ljava/lang/IllegalStateException;-><init>(Ljava/lang/String;)V

    throw v0

    .line 502
    :pswitch_0
    iget-boolean v0, p0, Lcom/robotoworks/mechanoid/internal/util/JsonWriter;->lenient:Z

    if-nez v0, :cond_0

    if-nez p1, :cond_0

    .line 503
    new-instance v0, Ljava/lang/IllegalStateException;

    const-string v1, "JSON must start with an array or an object."

    invoke-direct {v0, v1}, Ljava/lang/IllegalStateException;-><init>(Ljava/lang/String;)V

    throw v0

    .line 506
    :cond_0
    sget-object v0, Lcom/robotoworks/mechanoid/internal/util/JsonScope;->NONEMPTY_DOCUMENT:Lcom/robotoworks/mechanoid/internal/util/JsonScope;

    invoke-direct {p0, v0}, Lcom/robotoworks/mechanoid/internal/util/JsonWriter;->replaceTop(Lcom/robotoworks/mechanoid/internal/util/JsonScope;)V

    .line 531
    :goto_0
    return-void

    .line 510
    :pswitch_1
    sget-object v0, Lcom/robotoworks/mechanoid/internal/util/JsonScope;->NONEMPTY_ARRAY:Lcom/robotoworks/mechanoid/internal/util/JsonScope;

    invoke-direct {p0, v0}, Lcom/robotoworks/mechanoid/internal/util/JsonWriter;->replaceTop(Lcom/robotoworks/mechanoid/internal/util/JsonScope;)V

    .line 511
    invoke-direct {p0}, Lcom/robotoworks/mechanoid/internal/util/JsonWriter;->newline()V

    goto :goto_0

    .line 515
    :pswitch_2
    iget-object v0, p0, Lcom/robotoworks/mechanoid/internal/util/JsonWriter;->out:Ljava/io/Writer;

    const/16 v1, 0x2c

    invoke-virtual {v0, v1}, Ljava/io/Writer;->append(C)Ljava/io/Writer;

    .line 516
    invoke-direct {p0}, Lcom/robotoworks/mechanoid/internal/util/JsonWriter;->newline()V

    goto :goto_0

    .line 520
    :pswitch_3
    iget-object v0, p0, Lcom/robotoworks/mechanoid/internal/util/JsonWriter;->out:Ljava/io/Writer;

    iget-object v1, p0, Lcom/robotoworks/mechanoid/internal/util/JsonWriter;->separator:Ljava/lang/String;

    invoke-virtual {v0, v1}, Ljava/io/Writer;->append(Ljava/lang/CharSequence;)Ljava/io/Writer;

    .line 521
    sget-object v0, Lcom/robotoworks/mechanoid/internal/util/JsonScope;->NONEMPTY_OBJECT:Lcom/robotoworks/mechanoid/internal/util/JsonScope;

    invoke-direct {p0, v0}, Lcom/robotoworks/mechanoid/internal/util/JsonWriter;->replaceTop(Lcom/robotoworks/mechanoid/internal/util/JsonScope;)V

    goto :goto_0

    .line 525
    :pswitch_4
    new-instance v0, Ljava/lang/IllegalStateException;

    const-string v1, "JSON must have only one top-level value."

    invoke-direct {v0, v1}, Ljava/lang/IllegalStateException;-><init>(Ljava/lang/String;)V

    throw v0

    .line 500
    nop

    :pswitch_data_0
    .packed-switch 0x1
        :pswitch_0
        :pswitch_1
        :pswitch_2
        :pswitch_3
        :pswitch_4
    .end packed-switch
.end method

.method private close(Lcom/robotoworks/mechanoid/internal/util/JsonScope;Lcom/robotoworks/mechanoid/internal/util/JsonScope;Ljava/lang/String;)Lcom/robotoworks/mechanoid/internal/util/JsonWriter;
    .locals 4
    .param p1, "empty"    # Lcom/robotoworks/mechanoid/internal/util/JsonScope;
    .param p2, "nonempty"    # Lcom/robotoworks/mechanoid/internal/util/JsonScope;
    .param p3, "closeBracket"    # Ljava/lang/String;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .prologue
    .line 255
    invoke-direct {p0}, Lcom/robotoworks/mechanoid/internal/util/JsonWriter;->peek()Lcom/robotoworks/mechanoid/internal/util/JsonScope;

    move-result-object v0

    .line 256
    .local v0, "context":Lcom/robotoworks/mechanoid/internal/util/JsonScope;
    if-eq v0, p2, :cond_0

    if-eq v0, p1, :cond_0

    .line 257
    new-instance v1, Ljava/lang/IllegalStateException;

    new-instance v2, Ljava/lang/StringBuilder;

    invoke-direct {v2}, Ljava/lang/StringBuilder;-><init>()V

    const-string v3, "Nesting problem: "

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    iget-object v3, p0, Lcom/robotoworks/mechanoid/internal/util/JsonWriter;->stack:Ljava/util/List;

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    move-result-object v2

    invoke-virtual {v2}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v2

    invoke-direct {v1, v2}, Ljava/lang/IllegalStateException;-><init>(Ljava/lang/String;)V

    throw v1

    .line 260
    :cond_0
    iget-object v1, p0, Lcom/robotoworks/mechanoid/internal/util/JsonWriter;->stack:Ljava/util/List;

    iget-object v2, p0, Lcom/robotoworks/mechanoid/internal/util/JsonWriter;->stack:Ljava/util/List;

    invoke-interface {v2}, Ljava/util/List;->size()I

    move-result v2

    add-int/lit8 v2, v2, -0x1

    invoke-interface {v1, v2}, Ljava/util/List;->remove(I)Ljava/lang/Object;

    .line 261
    if-ne v0, p2, :cond_1

    .line 262
    invoke-direct {p0}, Lcom/robotoworks/mechanoid/internal/util/JsonWriter;->newline()V

    .line 264
    :cond_1
    iget-object v1, p0, Lcom/robotoworks/mechanoid/internal/util/JsonWriter;->out:Ljava/io/Writer;

    invoke-virtual {v1, p3}, Ljava/io/Writer;->write(Ljava/lang/String;)V

    .line 265
    return-object p0
.end method

.method private newline()V
    .locals 3
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .prologue
    .line 466
    iget-object v1, p0, Lcom/robotoworks/mechanoid/internal/util/JsonWriter;->indent:Ljava/lang/String;

    if-nez v1, :cond_1

    .line 474
    :cond_0
    return-void

    .line 470
    :cond_1
    iget-object v1, p0, Lcom/robotoworks/mechanoid/internal/util/JsonWriter;->out:Ljava/io/Writer;

    const-string v2, "\n"

    invoke-virtual {v1, v2}, Ljava/io/Writer;->write(Ljava/lang/String;)V

    .line 471
    const/4 v0, 0x1

    .local v0, "i":I
    :goto_0
    iget-object v1, p0, Lcom/robotoworks/mechanoid/internal/util/JsonWriter;->stack:Ljava/util/List;

    invoke-interface {v1}, Ljava/util/List;->size()I

    move-result v1

    if-ge v0, v1, :cond_0

    .line 472
    iget-object v1, p0, Lcom/robotoworks/mechanoid/internal/util/JsonWriter;->out:Ljava/io/Writer;

    iget-object v2, p0, Lcom/robotoworks/mechanoid/internal/util/JsonWriter;->indent:Ljava/lang/String;

    invoke-virtual {v1, v2}, Ljava/io/Writer;->write(Ljava/lang/String;)V

    .line 471
    add-int/lit8 v0, v0, 0x1

    goto :goto_0
.end method

.method private open(Lcom/robotoworks/mechanoid/internal/util/JsonScope;Ljava/lang/String;)Lcom/robotoworks/mechanoid/internal/util/JsonWriter;
    .locals 1
    .param p1, "empty"    # Lcom/robotoworks/mechanoid/internal/util/JsonScope;
    .param p2, "openBracket"    # Ljava/lang/String;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .prologue
    .line 243
    const/4 v0, 0x1

    invoke-direct {p0, v0}, Lcom/robotoworks/mechanoid/internal/util/JsonWriter;->beforeValue(Z)V

    .line 244
    iget-object v0, p0, Lcom/robotoworks/mechanoid/internal/util/JsonWriter;->stack:Ljava/util/List;

    invoke-interface {v0, p1}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    .line 245
    iget-object v0, p0, Lcom/robotoworks/mechanoid/internal/util/JsonWriter;->out:Ljava/io/Writer;

    invoke-virtual {v0, p2}, Ljava/io/Writer;->write(Ljava/lang/String;)V

    .line 246
    return-object p0
.end method

.method private peek()Lcom/robotoworks/mechanoid/internal/util/JsonScope;
    .locals 2

    .prologue
    .line 272
    iget-object v0, p0, Lcom/robotoworks/mechanoid/internal/util/JsonWriter;->stack:Ljava/util/List;

    iget-object v1, p0, Lcom/robotoworks/mechanoid/internal/util/JsonWriter;->stack:Ljava/util/List;

    invoke-interface {v1}, Ljava/util/List;->size()I

    move-result v1

    add-int/lit8 v1, v1, -0x1

    invoke-interface {v0, v1}, Ljava/util/List;->get(I)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Lcom/robotoworks/mechanoid/internal/util/JsonScope;

    return-object v0
.end method

.method private replaceTop(Lcom/robotoworks/mechanoid/internal/util/JsonScope;)V
    .locals 2
    .param p1, "topOfStack"    # Lcom/robotoworks/mechanoid/internal/util/JsonScope;

    .prologue
    .line 279
    iget-object v0, p0, Lcom/robotoworks/mechanoid/internal/util/JsonWriter;->stack:Ljava/util/List;

    iget-object v1, p0, Lcom/robotoworks/mechanoid/internal/util/JsonWriter;->stack:Ljava/util/List;

    invoke-interface {v1}, Ljava/util/List;->size()I

    move-result v1

    add-int/lit8 v1, v1, -0x1

    invoke-interface {v0, v1, p1}, Ljava/util/List;->set(ILjava/lang/Object;)Ljava/lang/Object;

    .line 280
    return-void
.end method

.method private string(Ljava/lang/String;)V
    .locals 9
    .param p1, "value"    # Ljava/lang/String;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .prologue
    const/4 v8, 0x1

    const/4 v7, 0x0

    .line 405
    iget-object v3, p0, Lcom/robotoworks/mechanoid/internal/util/JsonWriter;->out:Ljava/io/Writer;

    const-string v4, "\""

    invoke-virtual {v3, v4}, Ljava/io/Writer;->write(Ljava/lang/String;)V

    .line 406
    const/4 v1, 0x0

    .local v1, "i":I
    invoke-virtual {p1}, Ljava/lang/String;->length()I

    move-result v2

    .local v2, "length":I
    :goto_0
    if-ge v1, v2, :cond_1

    .line 407
    invoke-virtual {p1, v1}, Ljava/lang/String;->charAt(I)C

    move-result v0

    .line 420
    .local v0, "c":C
    sparse-switch v0, :sswitch_data_0

    .line 453
    const/16 v3, 0x1f

    if-gt v0, v3, :cond_0

    .line 454
    iget-object v3, p0, Lcom/robotoworks/mechanoid/internal/util/JsonWriter;->out:Ljava/io/Writer;

    const-string v4, "\\u%04x"

    new-array v5, v8, [Ljava/lang/Object;

    invoke-static {v0}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v6

    aput-object v6, v5, v7

    invoke-static {v4, v5}, Ljava/lang/String;->format(Ljava/lang/String;[Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v4

    invoke-virtual {v3, v4}, Ljava/io/Writer;->write(Ljava/lang/String;)V

    .line 406
    :goto_1
    add-int/lit8 v1, v1, 0x1

    goto :goto_0

    .line 423
    :sswitch_0
    iget-object v3, p0, Lcom/robotoworks/mechanoid/internal/util/JsonWriter;->out:Ljava/io/Writer;

    const/16 v4, 0x5c

    invoke-virtual {v3, v4}, Ljava/io/Writer;->write(I)V

    .line 424
    iget-object v3, p0, Lcom/robotoworks/mechanoid/internal/util/JsonWriter;->out:Ljava/io/Writer;

    invoke-virtual {v3, v0}, Ljava/io/Writer;->write(I)V

    goto :goto_1

    .line 428
    :sswitch_1
    iget-object v3, p0, Lcom/robotoworks/mechanoid/internal/util/JsonWriter;->out:Ljava/io/Writer;

    const-string v4, "\\t"

    invoke-virtual {v3, v4}, Ljava/io/Writer;->write(Ljava/lang/String;)V

    goto :goto_1

    .line 432
    :sswitch_2
    iget-object v3, p0, Lcom/robotoworks/mechanoid/internal/util/JsonWriter;->out:Ljava/io/Writer;

    const-string v4, "\\b"

    invoke-virtual {v3, v4}, Ljava/io/Writer;->write(Ljava/lang/String;)V

    goto :goto_1

    .line 436
    :sswitch_3
    iget-object v3, p0, Lcom/robotoworks/mechanoid/internal/util/JsonWriter;->out:Ljava/io/Writer;

    const-string v4, "\\n"

    invoke-virtual {v3, v4}, Ljava/io/Writer;->write(Ljava/lang/String;)V

    goto :goto_1

    .line 440
    :sswitch_4
    iget-object v3, p0, Lcom/robotoworks/mechanoid/internal/util/JsonWriter;->out:Ljava/io/Writer;

    const-string v4, "\\r"

    invoke-virtual {v3, v4}, Ljava/io/Writer;->write(Ljava/lang/String;)V

    goto :goto_1

    .line 444
    :sswitch_5
    iget-object v3, p0, Lcom/robotoworks/mechanoid/internal/util/JsonWriter;->out:Ljava/io/Writer;

    const-string v4, "\\f"

    invoke-virtual {v3, v4}, Ljava/io/Writer;->write(Ljava/lang/String;)V

    goto :goto_1

    .line 449
    :sswitch_6
    iget-object v3, p0, Lcom/robotoworks/mechanoid/internal/util/JsonWriter;->out:Ljava/io/Writer;

    const-string v4, "\\u%04x"

    new-array v5, v8, [Ljava/lang/Object;

    invoke-static {v0}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v6

    aput-object v6, v5, v7

    invoke-static {v4, v5}, Ljava/lang/String;->format(Ljava/lang/String;[Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v4

    invoke-virtual {v3, v4}, Ljava/io/Writer;->write(Ljava/lang/String;)V

    goto :goto_1

    .line 456
    :cond_0
    iget-object v3, p0, Lcom/robotoworks/mechanoid/internal/util/JsonWriter;->out:Ljava/io/Writer;

    invoke-virtual {v3, v0}, Ljava/io/Writer;->write(I)V

    goto :goto_1

    .line 462
    .end local v0    # "c":C
    :cond_1
    iget-object v3, p0, Lcom/robotoworks/mechanoid/internal/util/JsonWriter;->out:Ljava/io/Writer;

    const-string v4, "\""

    invoke-virtual {v3, v4}, Ljava/io/Writer;->write(Ljava/lang/String;)V

    .line 463
    return-void

    .line 420
    :sswitch_data_0
    .sparse-switch
        0x8 -> :sswitch_2
        0x9 -> :sswitch_1
        0xa -> :sswitch_3
        0xc -> :sswitch_5
        0xd -> :sswitch_4
        0x22 -> :sswitch_0
        0x5c -> :sswitch_0
        0x2028 -> :sswitch_6
        0x2029 -> :sswitch_6
    .end sparse-switch
.end method


# virtual methods
.method public beginArray()Lcom/robotoworks/mechanoid/internal/util/JsonWriter;
    .locals 2
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .prologue
    .line 207
    sget-object v0, Lcom/robotoworks/mechanoid/internal/util/JsonScope;->EMPTY_ARRAY:Lcom/robotoworks/mechanoid/internal/util/JsonScope;

    const-string v1, "["

    invoke-direct {p0, v0, v1}, Lcom/robotoworks/mechanoid/internal/util/JsonWriter;->open(Lcom/robotoworks/mechanoid/internal/util/JsonScope;Ljava/lang/String;)Lcom/robotoworks/mechanoid/internal/util/JsonWriter;

    move-result-object v0

    return-object v0
.end method

.method public beginObject()Lcom/robotoworks/mechanoid/internal/util/JsonWriter;
    .locals 2
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .prologue
    .line 226
    sget-object v0, Lcom/robotoworks/mechanoid/internal/util/JsonScope;->EMPTY_OBJECT:Lcom/robotoworks/mechanoid/internal/util/JsonScope;

    const-string v1, "{"

    invoke-direct {p0, v0, v1}, Lcom/robotoworks/mechanoid/internal/util/JsonWriter;->open(Lcom/robotoworks/mechanoid/internal/util/JsonScope;Ljava/lang/String;)Lcom/robotoworks/mechanoid/internal/util/JsonWriter;

    move-result-object v0

    return-object v0
.end method

.method public close()V
    .locals 2
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .prologue
    .line 397
    iget-object v0, p0, Lcom/robotoworks/mechanoid/internal/util/JsonWriter;->out:Ljava/io/Writer;

    invoke-virtual {v0}, Ljava/io/Writer;->close()V

    .line 399
    invoke-direct {p0}, Lcom/robotoworks/mechanoid/internal/util/JsonWriter;->peek()Lcom/robotoworks/mechanoid/internal/util/JsonScope;

    move-result-object v0

    sget-object v1, Lcom/robotoworks/mechanoid/internal/util/JsonScope;->NONEMPTY_DOCUMENT:Lcom/robotoworks/mechanoid/internal/util/JsonScope;

    if-eq v0, v1, :cond_0

    .line 400
    new-instance v0, Ljava/io/IOException;

    const-string v1, "Incomplete document"

    invoke-direct {v0, v1}, Ljava/io/IOException;-><init>(Ljava/lang/String;)V

    throw v0

    .line 402
    :cond_0
    return-void
.end method

.method public endArray()Lcom/robotoworks/mechanoid/internal/util/JsonWriter;
    .locals 3
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .prologue
    .line 216
    sget-object v0, Lcom/robotoworks/mechanoid/internal/util/JsonScope;->EMPTY_ARRAY:Lcom/robotoworks/mechanoid/internal/util/JsonScope;

    sget-object v1, Lcom/robotoworks/mechanoid/internal/util/JsonScope;->NONEMPTY_ARRAY:Lcom/robotoworks/mechanoid/internal/util/JsonScope;

    const-string v2, "]"

    invoke-direct {p0, v0, v1, v2}, Lcom/robotoworks/mechanoid/internal/util/JsonWriter;->close(Lcom/robotoworks/mechanoid/internal/util/JsonScope;Lcom/robotoworks/mechanoid/internal/util/JsonScope;Ljava/lang/String;)Lcom/robotoworks/mechanoid/internal/util/JsonWriter;

    move-result-object v0

    return-object v0
.end method

.method public endObject()Lcom/robotoworks/mechanoid/internal/util/JsonWriter;
    .locals 3
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .prologue
    .line 235
    sget-object v0, Lcom/robotoworks/mechanoid/internal/util/JsonScope;->EMPTY_OBJECT:Lcom/robotoworks/mechanoid/internal/util/JsonScope;

    sget-object v1, Lcom/robotoworks/mechanoid/internal/util/JsonScope;->NONEMPTY_OBJECT:Lcom/robotoworks/mechanoid/internal/util/JsonScope;

    const-string v2, "}"

    invoke-direct {p0, v0, v1, v2}, Lcom/robotoworks/mechanoid/internal/util/JsonWriter;->close(Lcom/robotoworks/mechanoid/internal/util/JsonScope;Lcom/robotoworks/mechanoid/internal/util/JsonScope;Ljava/lang/String;)Lcom/robotoworks/mechanoid/internal/util/JsonWriter;

    move-result-object v0

    return-object v0
.end method

.method public flush()V
    .locals 1
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .prologue
    .line 388
    iget-object v0, p0, Lcom/robotoworks/mechanoid/internal/util/JsonWriter;->out:Ljava/io/Writer;

    invoke-virtual {v0}, Ljava/io/Writer;->flush()V

    .line 389
    return-void
.end method

.method public isLenient()Z
    .locals 1

    .prologue
    .line 197
    iget-boolean v0, p0, Lcom/robotoworks/mechanoid/internal/util/JsonWriter;->lenient:Z

    return v0
.end method

.method public name(Ljava/lang/String;)Lcom/robotoworks/mechanoid/internal/util/JsonWriter;
    .locals 2
    .param p1, "name"    # Ljava/lang/String;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .prologue
    .line 289
    if-nez p1, :cond_0

    .line 290
    new-instance v0, Ljava/lang/NullPointerException;

    const-string v1, "name == null"

    invoke-direct {v0, v1}, Ljava/lang/NullPointerException;-><init>(Ljava/lang/String;)V

    throw v0

    .line 292
    :cond_0
    invoke-direct {p0}, Lcom/robotoworks/mechanoid/internal/util/JsonWriter;->beforeName()V

    .line 293
    invoke-direct {p0, p1}, Lcom/robotoworks/mechanoid/internal/util/JsonWriter;->string(Ljava/lang/String;)V

    .line 294
    return-object p0
.end method

.method public nullValue()Lcom/robotoworks/mechanoid/internal/util/JsonWriter;
    .locals 2
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .prologue
    .line 318
    const/4 v0, 0x0

    invoke-direct {p0, v0}, Lcom/robotoworks/mechanoid/internal/util/JsonWriter;->beforeValue(Z)V

    .line 319
    iget-object v0, p0, Lcom/robotoworks/mechanoid/internal/util/JsonWriter;->out:Ljava/io/Writer;

    const-string v1, "null"

    invoke-virtual {v0, v1}, Ljava/io/Writer;->write(Ljava/lang/String;)V

    .line 320
    return-object p0
.end method

.method public setIndent(Ljava/lang/String;)V
    .locals 1
    .param p1, "indent"    # Ljava/lang/String;

    .prologue
    .line 168
    invoke-virtual {p1}, Ljava/lang/String;->isEmpty()Z

    move-result v0

    if-eqz v0, :cond_0

    .line 169
    const/4 v0, 0x0

    iput-object v0, p0, Lcom/robotoworks/mechanoid/internal/util/JsonWriter;->indent:Ljava/lang/String;

    .line 170
    const-string v0, ":"

    iput-object v0, p0, Lcom/robotoworks/mechanoid/internal/util/JsonWriter;->separator:Ljava/lang/String;

    .line 175
    :goto_0
    return-void

    .line 172
    :cond_0
    iput-object p1, p0, Lcom/robotoworks/mechanoid/internal/util/JsonWriter;->indent:Ljava/lang/String;

    .line 173
    const-string v0, ": "

    iput-object v0, p0, Lcom/robotoworks/mechanoid/internal/util/JsonWriter;->separator:Ljava/lang/String;

    goto :goto_0
.end method

.method public setLenient(Z)V
    .locals 0
    .param p1, "lenient"    # Z

    .prologue
    .line 190
    iput-boolean p1, p0, Lcom/robotoworks/mechanoid/internal/util/JsonWriter;->lenient:Z

    .line 191
    return-void
.end method

.method public value(D)Lcom/robotoworks/mechanoid/internal/util/JsonWriter;
    .locals 3
    .param p1, "value"    # D
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .prologue
    .line 342
    iget-boolean v0, p0, Lcom/robotoworks/mechanoid/internal/util/JsonWriter;->lenient:Z

    if-nez v0, :cond_1

    invoke-static {p1, p2}, Ljava/lang/Double;->isNaN(D)Z

    move-result v0

    if-nez v0, :cond_0

    invoke-static {p1, p2}, Ljava/lang/Double;->isInfinite(D)Z

    move-result v0

    if-eqz v0, :cond_1

    .line 343
    :cond_0
    new-instance v0, Ljava/lang/IllegalArgumentException;

    new-instance v1, Ljava/lang/StringBuilder;

    invoke-direct {v1}, Ljava/lang/StringBuilder;-><init>()V

    const-string v2, "Numeric values must be finite, but was "

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v1, p1, p2}, Ljava/lang/StringBuilder;->append(D)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v1

    invoke-direct {v0, v1}, Ljava/lang/IllegalArgumentException;-><init>(Ljava/lang/String;)V

    throw v0

    .line 345
    :cond_1
    const/4 v0, 0x0

    invoke-direct {p0, v0}, Lcom/robotoworks/mechanoid/internal/util/JsonWriter;->beforeValue(Z)V

    .line 346
    iget-object v0, p0, Lcom/robotoworks/mechanoid/internal/util/JsonWriter;->out:Ljava/io/Writer;

    invoke-static {p1, p2}, Ljava/lang/Double;->toString(D)Ljava/lang/String;

    move-result-object v1

    invoke-virtual {v0, v1}, Ljava/io/Writer;->append(Ljava/lang/CharSequence;)Ljava/io/Writer;

    .line 347
    return-object p0
.end method

.method public value(J)Lcom/robotoworks/mechanoid/internal/util/JsonWriter;
    .locals 3
    .param p1, "value"    # J
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .prologue
    .line 356
    const/4 v0, 0x0

    invoke-direct {p0, v0}, Lcom/robotoworks/mechanoid/internal/util/JsonWriter;->beforeValue(Z)V

    .line 357
    iget-object v0, p0, Lcom/robotoworks/mechanoid/internal/util/JsonWriter;->out:Ljava/io/Writer;

    invoke-static {p1, p2}, Ljava/lang/Long;->toString(J)Ljava/lang/String;

    move-result-object v1

    invoke-virtual {v0, v1}, Ljava/io/Writer;->write(Ljava/lang/String;)V

    .line 358
    return-object p0
.end method

.method public value(Ljava/lang/Number;)Lcom/robotoworks/mechanoid/internal/util/JsonWriter;
    .locals 4
    .param p1, "value"    # Ljava/lang/Number;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .prologue
    .line 369
    if-nez p1, :cond_0

    .line 370
    invoke-virtual {p0}, Lcom/robotoworks/mechanoid/internal/util/JsonWriter;->nullValue()Lcom/robotoworks/mechanoid/internal/util/JsonWriter;

    move-result-object p0

    .line 380
    .end local p0    # "this":Lcom/robotoworks/mechanoid/internal/util/JsonWriter;
    :goto_0
    return-object p0

    .line 373
    .restart local p0    # "this":Lcom/robotoworks/mechanoid/internal/util/JsonWriter;
    :cond_0
    invoke-virtual {p1}, Ljava/lang/Object;->toString()Ljava/lang/String;

    move-result-object v0

    .line 374
    .local v0, "string":Ljava/lang/String;
    iget-boolean v1, p0, Lcom/robotoworks/mechanoid/internal/util/JsonWriter;->lenient:Z

    if-nez v1, :cond_2

    const-string v1, "-Infinity"

    invoke-virtual {v0, v1}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v1

    if-nez v1, :cond_1

    const-string v1, "Infinity"

    invoke-virtual {v0, v1}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v1

    if-nez v1, :cond_1

    const-string v1, "NaN"

    invoke-virtual {v0, v1}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v1

    if-eqz v1, :cond_2

    .line 376
    :cond_1
    new-instance v1, Ljava/lang/IllegalArgumentException;

    new-instance v2, Ljava/lang/StringBuilder;

    invoke-direct {v2}, Ljava/lang/StringBuilder;-><init>()V

    const-string v3, "Numeric values must be finite, but was "

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    invoke-virtual {v2, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    move-result-object v2

    invoke-virtual {v2}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v2

    invoke-direct {v1, v2}, Ljava/lang/IllegalArgumentException;-><init>(Ljava/lang/String;)V

    throw v1

    .line 378
    :cond_2
    const/4 v1, 0x0

    invoke-direct {p0, v1}, Lcom/robotoworks/mechanoid/internal/util/JsonWriter;->beforeValue(Z)V

    .line 379
    iget-object v1, p0, Lcom/robotoworks/mechanoid/internal/util/JsonWriter;->out:Ljava/io/Writer;

    invoke-virtual {v1, v0}, Ljava/io/Writer;->append(Ljava/lang/CharSequence;)Ljava/io/Writer;

    goto :goto_0
.end method

.method public value(Ljava/lang/String;)Lcom/robotoworks/mechanoid/internal/util/JsonWriter;
    .locals 1
    .param p1, "value"    # Ljava/lang/String;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .prologue
    .line 304
    if-nez p1, :cond_0

    .line 305
    invoke-virtual {p0}, Lcom/robotoworks/mechanoid/internal/util/JsonWriter;->nullValue()Lcom/robotoworks/mechanoid/internal/util/JsonWriter;

    move-result-object p0

    .line 309
    .end local p0    # "this":Lcom/robotoworks/mechanoid/internal/util/JsonWriter;
    :goto_0
    return-object p0

    .line 307
    .restart local p0    # "this":Lcom/robotoworks/mechanoid/internal/util/JsonWriter;
    :cond_0
    const/4 v0, 0x0

    invoke-direct {p0, v0}, Lcom/robotoworks/mechanoid/internal/util/JsonWriter;->beforeValue(Z)V

    .line 308
    invoke-direct {p0, p1}, Lcom/robotoworks/mechanoid/internal/util/JsonWriter;->string(Ljava/lang/String;)V

    goto :goto_0
.end method

.method public value(Z)Lcom/robotoworks/mechanoid/internal/util/JsonWriter;
    .locals 2
    .param p1, "value"    # Z
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .prologue
    .line 329
    const/4 v0, 0x0

    invoke-direct {p0, v0}, Lcom/robotoworks/mechanoid/internal/util/JsonWriter;->beforeValue(Z)V

    .line 330
    iget-object v1, p0, Lcom/robotoworks/mechanoid/internal/util/JsonWriter;->out:Ljava/io/Writer;

    if-eqz p1, :cond_0

    const-string v0, "true"

    :goto_0
    invoke-virtual {v1, v0}, Ljava/io/Writer;->write(Ljava/lang/String;)V

    .line 331
    return-object p0

    .line 330
    :cond_0
    const-string v0, "false"

    goto :goto_0
.end method
