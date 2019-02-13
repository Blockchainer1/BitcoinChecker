.class public Lcom/robotoworks/mechanoid/net/JsonReaderUtil;
.super Ljava/lang/Object;
.source "JsonReaderUtil.java"


# direct methods
.method private constructor <init>()V
    .locals 0

    .prologue
    .line 24
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method

.method public static coerceNextBoolean(Lcom/robotoworks/mechanoid/internal/util/JsonReader;)Z
    .locals 2
    .param p0, "reader"    # Lcom/robotoworks/mechanoid/internal/util/JsonReader;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .prologue
    .line 34
    invoke-virtual {p0}, Lcom/robotoworks/mechanoid/internal/util/JsonReader;->peek()Lcom/robotoworks/mechanoid/internal/util/JsonToken;

    move-result-object v0

    .line 35
    .local v0, "nextToken":Lcom/robotoworks/mechanoid/internal/util/JsonToken;
    sget-object v1, Lcom/robotoworks/mechanoid/internal/util/JsonToken;->STRING:Lcom/robotoworks/mechanoid/internal/util/JsonToken;

    if-ne v0, v1, :cond_0

    .line 36
    invoke-virtual {p0}, Lcom/robotoworks/mechanoid/internal/util/JsonReader;->nextString()Ljava/lang/String;

    move-result-object v1

    invoke-static {v1}, Ljava/lang/Boolean;->valueOf(Ljava/lang/String;)Ljava/lang/Boolean;

    move-result-object v1

    invoke-virtual {v1}, Ljava/lang/Boolean;->booleanValue()Z

    move-result v1

    .line 40
    :goto_0
    return v1

    .line 37
    :cond_0
    sget-object v1, Lcom/robotoworks/mechanoid/internal/util/JsonToken;->NUMBER:Lcom/robotoworks/mechanoid/internal/util/JsonToken;

    if-ne v0, v1, :cond_2

    .line 38
    invoke-virtual {p0}, Lcom/robotoworks/mechanoid/internal/util/JsonReader;->nextInt()I

    move-result v1

    if-lez v1, :cond_1

    const/4 v1, 0x1

    goto :goto_0

    :cond_1
    const/4 v1, 0x0

    goto :goto_0

    .line 40
    :cond_2
    invoke-virtual {p0}, Lcom/robotoworks/mechanoid/internal/util/JsonReader;->nextBoolean()Z

    move-result v1

    goto :goto_0
.end method
