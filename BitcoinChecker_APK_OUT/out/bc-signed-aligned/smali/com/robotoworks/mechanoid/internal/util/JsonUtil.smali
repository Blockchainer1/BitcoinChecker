.class public Lcom/robotoworks/mechanoid/internal/util/JsonUtil;
.super Ljava/lang/Object;
.source "JsonUtil.java"


# direct methods
.method public constructor <init>()V
    .locals 0

    .prologue
    .line 9
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method

.method public static readBooleanList(Lcom/robotoworks/mechanoid/internal/util/JsonReader;)Ljava/util/List;
    .locals 2
    .param p0, "reader"    # Lcom/robotoworks/mechanoid/internal/util/JsonReader;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Lcom/robotoworks/mechanoid/internal/util/JsonReader;",
            ")",
            "Ljava/util/List",
            "<",
            "Ljava/lang/Boolean;",
            ">;"
        }
    .end annotation

    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .prologue
    .line 67
    new-instance v0, Ljava/util/ArrayList;

    invoke-direct {v0}, Ljava/util/ArrayList;-><init>()V

    .line 69
    .local v0, "list":Ljava/util/ArrayList;, "Ljava/util/ArrayList<Ljava/lang/Boolean;>;"
    invoke-virtual {p0}, Lcom/robotoworks/mechanoid/internal/util/JsonReader;->beginArray()V

    .line 71
    :goto_0
    invoke-virtual {p0}, Lcom/robotoworks/mechanoid/internal/util/JsonReader;->hasNext()Z

    move-result v1

    if-eqz v1, :cond_0

    .line 72
    invoke-static {p0}, Lcom/robotoworks/mechanoid/net/JsonReaderUtil;->coerceNextBoolean(Lcom/robotoworks/mechanoid/internal/util/JsonReader;)Z

    move-result v1

    invoke-static {v1}, Ljava/lang/Boolean;->valueOf(Z)Ljava/lang/Boolean;

    move-result-object v1

    invoke-virtual {v0, v1}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    goto :goto_0

    .line 75
    :cond_0
    invoke-virtual {p0}, Lcom/robotoworks/mechanoid/internal/util/JsonReader;->endArray()V

    .line 77
    return-object v0
.end method

.method public static readDoubleList(Lcom/robotoworks/mechanoid/internal/util/JsonReader;)Ljava/util/List;
    .locals 4
    .param p0, "reader"    # Lcom/robotoworks/mechanoid/internal/util/JsonReader;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Lcom/robotoworks/mechanoid/internal/util/JsonReader;",
            ")",
            "Ljava/util/List",
            "<",
            "Ljava/lang/Double;",
            ">;"
        }
    .end annotation

    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .prologue
    .line 39
    new-instance v0, Ljava/util/ArrayList;

    invoke-direct {v0}, Ljava/util/ArrayList;-><init>()V

    .line 41
    .local v0, "list":Ljava/util/ArrayList;, "Ljava/util/ArrayList<Ljava/lang/Double;>;"
    invoke-virtual {p0}, Lcom/robotoworks/mechanoid/internal/util/JsonReader;->beginArray()V

    .line 43
    :goto_0
    invoke-virtual {p0}, Lcom/robotoworks/mechanoid/internal/util/JsonReader;->hasNext()Z

    move-result v1

    if-eqz v1, :cond_0

    .line 44
    invoke-virtual {p0}, Lcom/robotoworks/mechanoid/internal/util/JsonReader;->nextDouble()D

    move-result-wide v2

    invoke-static {v2, v3}, Ljava/lang/Double;->valueOf(D)Ljava/lang/Double;

    move-result-object v1

    invoke-virtual {v0, v1}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    goto :goto_0

    .line 47
    :cond_0
    invoke-virtual {p0}, Lcom/robotoworks/mechanoid/internal/util/JsonReader;->endArray()V

    .line 49
    return-object v0
.end method

.method public static readIntegerList(Lcom/robotoworks/mechanoid/internal/util/JsonReader;)Ljava/util/List;
    .locals 2
    .param p0, "reader"    # Lcom/robotoworks/mechanoid/internal/util/JsonReader;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Lcom/robotoworks/mechanoid/internal/util/JsonReader;",
            ")",
            "Ljava/util/List",
            "<",
            "Ljava/lang/Integer;",
            ">;"
        }
    .end annotation

    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .prologue
    .line 25
    new-instance v0, Ljava/util/ArrayList;

    invoke-direct {v0}, Ljava/util/ArrayList;-><init>()V

    .line 27
    .local v0, "list":Ljava/util/ArrayList;, "Ljava/util/ArrayList<Ljava/lang/Integer;>;"
    invoke-virtual {p0}, Lcom/robotoworks/mechanoid/internal/util/JsonReader;->beginArray()V

    .line 29
    :goto_0
    invoke-virtual {p0}, Lcom/robotoworks/mechanoid/internal/util/JsonReader;->hasNext()Z

    move-result v1

    if-eqz v1, :cond_0

    .line 30
    invoke-virtual {p0}, Lcom/robotoworks/mechanoid/internal/util/JsonReader;->nextInt()I

    move-result v1

    invoke-static {v1}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v1

    invoke-virtual {v0, v1}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    goto :goto_0

    .line 33
    :cond_0
    invoke-virtual {p0}, Lcom/robotoworks/mechanoid/internal/util/JsonReader;->endArray()V

    .line 35
    return-object v0
.end method

.method public static readLongList(Lcom/robotoworks/mechanoid/internal/util/JsonReader;)Ljava/util/List;
    .locals 4
    .param p0, "reader"    # Lcom/robotoworks/mechanoid/internal/util/JsonReader;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Lcom/robotoworks/mechanoid/internal/util/JsonReader;",
            ")",
            "Ljava/util/List",
            "<",
            "Ljava/lang/Long;",
            ">;"
        }
    .end annotation

    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .prologue
    .line 53
    new-instance v0, Ljava/util/ArrayList;

    invoke-direct {v0}, Ljava/util/ArrayList;-><init>()V

    .line 55
    .local v0, "list":Ljava/util/ArrayList;, "Ljava/util/ArrayList<Ljava/lang/Long;>;"
    invoke-virtual {p0}, Lcom/robotoworks/mechanoid/internal/util/JsonReader;->beginArray()V

    .line 57
    :goto_0
    invoke-virtual {p0}, Lcom/robotoworks/mechanoid/internal/util/JsonReader;->hasNext()Z

    move-result v1

    if-eqz v1, :cond_0

    .line 58
    invoke-virtual {p0}, Lcom/robotoworks/mechanoid/internal/util/JsonReader;->nextLong()J

    move-result-wide v2

    invoke-static {v2, v3}, Ljava/lang/Long;->valueOf(J)Ljava/lang/Long;

    move-result-object v1

    invoke-virtual {v0, v1}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    goto :goto_0

    .line 61
    :cond_0
    invoke-virtual {p0}, Lcom/robotoworks/mechanoid/internal/util/JsonReader;->endArray()V

    .line 63
    return-object v0
.end method

.method public static readStringList(Lcom/robotoworks/mechanoid/internal/util/JsonReader;)Ljava/util/List;
    .locals 2
    .param p0, "reader"    # Lcom/robotoworks/mechanoid/internal/util/JsonReader;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Lcom/robotoworks/mechanoid/internal/util/JsonReader;",
            ")",
            "Ljava/util/List",
            "<",
            "Ljava/lang/String;",
            ">;"
        }
    .end annotation

    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .prologue
    .line 11
    new-instance v0, Ljava/util/ArrayList;

    invoke-direct {v0}, Ljava/util/ArrayList;-><init>()V

    .line 13
    .local v0, "list":Ljava/util/ArrayList;, "Ljava/util/ArrayList<Ljava/lang/String;>;"
    invoke-virtual {p0}, Lcom/robotoworks/mechanoid/internal/util/JsonReader;->beginArray()V

    .line 15
    :goto_0
    invoke-virtual {p0}, Lcom/robotoworks/mechanoid/internal/util/JsonReader;->hasNext()Z

    move-result v1

    if-eqz v1, :cond_0

    .line 16
    invoke-virtual {p0}, Lcom/robotoworks/mechanoid/internal/util/JsonReader;->nextString()Ljava/lang/String;

    move-result-object v1

    invoke-virtual {v0, v1}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    goto :goto_0

    .line 19
    :cond_0
    invoke-virtual {p0}, Lcom/robotoworks/mechanoid/internal/util/JsonReader;->endArray()V

    .line 21
    return-object v0
.end method

.method public static writeBooleanList(Lcom/robotoworks/mechanoid/internal/util/JsonWriter;Ljava/util/List;)V
    .locals 3
    .param p0, "writer"    # Lcom/robotoworks/mechanoid/internal/util/JsonWriter;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Lcom/robotoworks/mechanoid/internal/util/JsonWriter;",
            "Ljava/util/List",
            "<",
            "Ljava/lang/Boolean;",
            ">;)V"
        }
    .end annotation

    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .prologue
    .line 126
    .local p1, "values":Ljava/util/List;, "Ljava/util/List<Ljava/lang/Boolean;>;"
    invoke-virtual {p0}, Lcom/robotoworks/mechanoid/internal/util/JsonWriter;->beginArray()Lcom/robotoworks/mechanoid/internal/util/JsonWriter;

    .line 128
    invoke-interface {p1}, Ljava/util/List;->iterator()Ljava/util/Iterator;

    move-result-object v0

    .local v0, "i$":Ljava/util/Iterator;
    :goto_0
    invoke-interface {v0}, Ljava/util/Iterator;->hasNext()Z

    move-result v2

    if-eqz v2, :cond_0

    invoke-interface {v0}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Ljava/lang/Boolean;

    .line 129
    .local v1, "value":Ljava/lang/Boolean;
    invoke-virtual {v1}, Ljava/lang/Boolean;->booleanValue()Z

    move-result v2

    invoke-virtual {p0, v2}, Lcom/robotoworks/mechanoid/internal/util/JsonWriter;->value(Z)Lcom/robotoworks/mechanoid/internal/util/JsonWriter;

    goto :goto_0

    .line 132
    .end local v1    # "value":Ljava/lang/Boolean;
    :cond_0
    invoke-virtual {p0}, Lcom/robotoworks/mechanoid/internal/util/JsonWriter;->endArray()Lcom/robotoworks/mechanoid/internal/util/JsonWriter;

    .line 133
    return-void
.end method

.method public static writeDoubleList(Lcom/robotoworks/mechanoid/internal/util/JsonWriter;Ljava/util/List;)V
    .locals 3
    .param p0, "writer"    # Lcom/robotoworks/mechanoid/internal/util/JsonWriter;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Lcom/robotoworks/mechanoid/internal/util/JsonWriter;",
            "Ljava/util/List",
            "<",
            "Ljava/lang/Double;",
            ">;)V"
        }
    .end annotation

    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .prologue
    .line 115
    .local p1, "values":Ljava/util/List;, "Ljava/util/List<Ljava/lang/Double;>;"
    invoke-virtual {p0}, Lcom/robotoworks/mechanoid/internal/util/JsonWriter;->beginArray()Lcom/robotoworks/mechanoid/internal/util/JsonWriter;

    .line 117
    invoke-interface {p1}, Ljava/util/List;->iterator()Ljava/util/Iterator;

    move-result-object v0

    .local v0, "i$":Ljava/util/Iterator;
    :goto_0
    invoke-interface {v0}, Ljava/util/Iterator;->hasNext()Z

    move-result v2

    if-eqz v2, :cond_0

    invoke-interface {v0}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Ljava/lang/Double;

    .line 118
    .local v1, "value":Ljava/lang/Double;
    invoke-virtual {p0, v1}, Lcom/robotoworks/mechanoid/internal/util/JsonWriter;->value(Ljava/lang/Number;)Lcom/robotoworks/mechanoid/internal/util/JsonWriter;

    goto :goto_0

    .line 121
    .end local v1    # "value":Ljava/lang/Double;
    :cond_0
    invoke-virtual {p0}, Lcom/robotoworks/mechanoid/internal/util/JsonWriter;->endArray()Lcom/robotoworks/mechanoid/internal/util/JsonWriter;

    .line 122
    return-void
.end method

.method public static writeIntegerList(Lcom/robotoworks/mechanoid/internal/util/JsonWriter;Ljava/util/List;)V
    .locals 3
    .param p0, "writer"    # Lcom/robotoworks/mechanoid/internal/util/JsonWriter;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Lcom/robotoworks/mechanoid/internal/util/JsonWriter;",
            "Ljava/util/List",
            "<",
            "Ljava/lang/Integer;",
            ">;)V"
        }
    .end annotation

    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .prologue
    .line 93
    .local p1, "values":Ljava/util/List;, "Ljava/util/List<Ljava/lang/Integer;>;"
    invoke-virtual {p0}, Lcom/robotoworks/mechanoid/internal/util/JsonWriter;->beginArray()Lcom/robotoworks/mechanoid/internal/util/JsonWriter;

    .line 95
    invoke-interface {p1}, Ljava/util/List;->iterator()Ljava/util/Iterator;

    move-result-object v0

    .local v0, "i$":Ljava/util/Iterator;
    :goto_0
    invoke-interface {v0}, Ljava/util/Iterator;->hasNext()Z

    move-result v2

    if-eqz v2, :cond_0

    invoke-interface {v0}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Ljava/lang/Integer;

    .line 96
    .local v1, "value":Ljava/lang/Integer;
    invoke-virtual {p0, v1}, Lcom/robotoworks/mechanoid/internal/util/JsonWriter;->value(Ljava/lang/Number;)Lcom/robotoworks/mechanoid/internal/util/JsonWriter;

    goto :goto_0

    .line 99
    .end local v1    # "value":Ljava/lang/Integer;
    :cond_0
    invoke-virtual {p0}, Lcom/robotoworks/mechanoid/internal/util/JsonWriter;->endArray()Lcom/robotoworks/mechanoid/internal/util/JsonWriter;

    .line 100
    return-void
.end method

.method public static writeLongList(Lcom/robotoworks/mechanoid/internal/util/JsonWriter;Ljava/util/List;)V
    .locals 3
    .param p0, "writer"    # Lcom/robotoworks/mechanoid/internal/util/JsonWriter;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Lcom/robotoworks/mechanoid/internal/util/JsonWriter;",
            "Ljava/util/List",
            "<",
            "Ljava/lang/Long;",
            ">;)V"
        }
    .end annotation

    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .prologue
    .line 104
    .local p1, "values":Ljava/util/List;, "Ljava/util/List<Ljava/lang/Long;>;"
    invoke-virtual {p0}, Lcom/robotoworks/mechanoid/internal/util/JsonWriter;->beginArray()Lcom/robotoworks/mechanoid/internal/util/JsonWriter;

    .line 106
    invoke-interface {p1}, Ljava/util/List;->iterator()Ljava/util/Iterator;

    move-result-object v0

    .local v0, "i$":Ljava/util/Iterator;
    :goto_0
    invoke-interface {v0}, Ljava/util/Iterator;->hasNext()Z

    move-result v2

    if-eqz v2, :cond_0

    invoke-interface {v0}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Ljava/lang/Long;

    .line 107
    .local v1, "value":Ljava/lang/Long;
    invoke-virtual {p0, v1}, Lcom/robotoworks/mechanoid/internal/util/JsonWriter;->value(Ljava/lang/Number;)Lcom/robotoworks/mechanoid/internal/util/JsonWriter;

    goto :goto_0

    .line 110
    .end local v1    # "value":Ljava/lang/Long;
    :cond_0
    invoke-virtual {p0}, Lcom/robotoworks/mechanoid/internal/util/JsonWriter;->endArray()Lcom/robotoworks/mechanoid/internal/util/JsonWriter;

    .line 111
    return-void
.end method

.method public static writeStringList(Lcom/robotoworks/mechanoid/internal/util/JsonWriter;Ljava/util/List;)V
    .locals 3
    .param p0, "writer"    # Lcom/robotoworks/mechanoid/internal/util/JsonWriter;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Lcom/robotoworks/mechanoid/internal/util/JsonWriter;",
            "Ljava/util/List",
            "<",
            "Ljava/lang/String;",
            ">;)V"
        }
    .end annotation

    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .prologue
    .line 82
    .local p1, "values":Ljava/util/List;, "Ljava/util/List<Ljava/lang/String;>;"
    invoke-virtual {p0}, Lcom/robotoworks/mechanoid/internal/util/JsonWriter;->beginArray()Lcom/robotoworks/mechanoid/internal/util/JsonWriter;

    .line 84
    invoke-interface {p1}, Ljava/util/List;->iterator()Ljava/util/Iterator;

    move-result-object v0

    .local v0, "i$":Ljava/util/Iterator;
    :goto_0
    invoke-interface {v0}, Ljava/util/Iterator;->hasNext()Z

    move-result v2

    if-eqz v2, :cond_0

    invoke-interface {v0}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Ljava/lang/String;

    .line 85
    .local v1, "value":Ljava/lang/String;
    invoke-virtual {p0, v1}, Lcom/robotoworks/mechanoid/internal/util/JsonWriter;->value(Ljava/lang/String;)Lcom/robotoworks/mechanoid/internal/util/JsonWriter;

    goto :goto_0

    .line 88
    .end local v1    # "value":Ljava/lang/String;
    :cond_0
    invoke-virtual {p0}, Lcom/robotoworks/mechanoid/internal/util/JsonWriter;->endArray()Lcom/robotoworks/mechanoid/internal/util/JsonWriter;

    .line 89
    return-void
.end method
