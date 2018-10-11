.class final Lbutterknife/internal/Listener;
.super Ljava/lang/Object;
.source "Listener.java"


# instance fields
.field private final methodName:Ljava/lang/String;

.field private final ownerType:Ljava/lang/String;

.field private final parameterTypes:Ljava/util/List;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/List",
            "<",
            "Ljava/lang/String;",
            ">;"
        }
    .end annotation
.end field

.field private final returnType:Ljava/lang/String;

.field private final setterName:Ljava/lang/String;

.field private final type:Ljava/lang/String;


# direct methods
.method private constructor <init>(Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Ljava/util/List;)V
    .locals 0
    .param p1, "ownerType"    # Ljava/lang/String;
    .param p2, "setterName"    # Ljava/lang/String;
    .param p3, "type"    # Ljava/lang/String;
    .param p4, "returnType"    # Ljava/lang/String;
    .param p5, "methodName"    # Ljava/lang/String;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/lang/String;",
            "Ljava/lang/String;",
            "Ljava/lang/String;",
            "Ljava/lang/String;",
            "Ljava/lang/String;",
            "Ljava/util/List",
            "<",
            "Ljava/lang/String;",
            ">;)V"
        }
    .end annotation

    .prologue
    .line 68
    .local p6, "parameterTypes":Ljava/util/List;, "Ljava/util/List<Ljava/lang/String;>;"
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 69
    iput-object p1, p0, Lbutterknife/internal/Listener;->ownerType:Ljava/lang/String;

    .line 70
    iput-object p2, p0, Lbutterknife/internal/Listener;->setterName:Ljava/lang/String;

    .line 71
    iput-object p3, p0, Lbutterknife/internal/Listener;->type:Ljava/lang/String;

    .line 72
    iput-object p4, p0, Lbutterknife/internal/Listener;->returnType:Ljava/lang/String;

    .line 73
    iput-object p5, p0, Lbutterknife/internal/Listener;->methodName:Ljava/lang/String;

    .line 74
    iput-object p6, p0, Lbutterknife/internal/Listener;->parameterTypes:Ljava/util/List;

    .line 75
    return-void
.end method

.method static from(Ljavax/lang/model/element/TypeElement;Ljavax/lang/model/util/Types;)Lbutterknife/internal/Listener;
    .locals 17
    .param p0, "listenerElement"    # Ljavax/lang/model/element/TypeElement;
    .param p1, "typeUtils"    # Ljavax/lang/model/util/Types;

    .prologue
    .line 32
    invoke-interface/range {p0 .. p0}, Ljavax/lang/model/element/TypeElement;->getEnclosedElements()Ljava/util/List;

    move-result-object v9

    .line 33
    .local v9, "listenerEnclosedElements":Ljava/util/List;, "Ljava/util/List<+Ljavax/lang/model/element/Element;>;"
    invoke-interface {v9}, Ljava/util/List;->size()I

    move-result v1

    const/4 v15, 0x1

    if-eq v1, v15, :cond_0

    .line 34
    new-instance v1, Ljava/lang/IllegalArgumentException;

    new-instance v15, Ljava/lang/StringBuilder;

    invoke-direct {v15}, Ljava/lang/StringBuilder;-><init>()V

    invoke-interface/range {p0 .. p0}, Ljavax/lang/model/element/TypeElement;->getSimpleName()Ljavax/lang/model/element/Name;

    move-result-object v16

    invoke-virtual/range {v15 .. v16}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    move-result-object v15

    const-string v16, " is not a single-method interface"

    invoke-virtual/range {v15 .. v16}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v15

    invoke-virtual {v15}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v15

    invoke-direct {v1, v15}, Ljava/lang/IllegalArgumentException;-><init>(Ljava/lang/String;)V

    throw v1

    .line 37
    :cond_0
    const/4 v1, 0x0

    invoke-interface {v9, v1}, Ljava/util/List;->get(I)Ljava/lang/Object;

    move-result-object v10

    check-cast v10, Ljavax/lang/model/element/ExecutableElement;

    .line 39
    .local v10, "listenerMethod":Ljavax/lang/model/element/ExecutableElement;
    invoke-interface/range {p0 .. p0}, Ljavax/lang/model/element/TypeElement;->getEnclosingElement()Ljavax/lang/model/element/Element;

    move-result-object v1

    invoke-interface {v1}, Ljavax/lang/model/element/Element;->asType()Ljavax/lang/model/type/TypeMirror;

    move-result-object v13

    .line 40
    .local v13, "ownerTypeMirror":Ljavax/lang/model/type/TypeMirror;
    move-object/from16 v0, p1

    invoke-interface {v0, v13}, Ljavax/lang/model/util/Types;->erasure(Ljavax/lang/model/type/TypeMirror;)Ljavax/lang/model/type/TypeMirror;

    move-result-object v13

    .line 41
    invoke-virtual {v13}, Ljava/lang/Object;->toString()Ljava/lang/String;

    move-result-object v2

    .line 42
    .local v2, "ownerType":Ljava/lang/String;
    new-instance v1, Ljava/lang/StringBuilder;

    invoke-direct {v1}, Ljava/lang/StringBuilder;-><init>()V

    const-string v15, "set"

    invoke-virtual {v1, v15}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-interface/range {p0 .. p0}, Ljavax/lang/model/element/TypeElement;->getSimpleName()Ljavax/lang/model/element/Name;

    move-result-object v15

    invoke-virtual {v1, v15}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v3

    .line 43
    .local v3, "setterName":Ljava/lang/String;
    invoke-interface/range {p0 .. p0}, Ljavax/lang/model/element/TypeElement;->getQualifiedName()Ljavax/lang/model/element/Name;

    move-result-object v1

    invoke-virtual {v1}, Ljava/lang/Object;->toString()Ljava/lang/String;

    move-result-object v4

    .line 44
    .local v4, "type":Ljava/lang/String;
    invoke-interface {v10}, Ljavax/lang/model/element/ExecutableElement;->getSimpleName()Ljavax/lang/model/element/Name;

    move-result-object v1

    invoke-virtual {v1}, Ljava/lang/Object;->toString()Ljava/lang/String;

    move-result-object v6

    .line 45
    .local v6, "methodName":Ljava/lang/String;
    invoke-interface {v10}, Ljavax/lang/model/element/ExecutableElement;->getReturnType()Ljavax/lang/model/type/TypeMirror;

    move-result-object v1

    invoke-virtual {v1}, Ljava/lang/Object;->toString()Ljava/lang/String;

    move-result-object v5

    .line 47
    .local v5, "returnType":Ljava/lang/String;
    invoke-interface {v10}, Ljavax/lang/model/element/ExecutableElement;->getParameters()Ljava/util/List;

    move-result-object v12

    .line 48
    .local v12, "listenerParameterTypes":Ljava/util/List;, "Ljava/util/List<+Ljavax/lang/model/element/VariableElement;>;"
    new-instance v7, Ljava/util/ArrayList;

    invoke-interface {v12}, Ljava/util/List;->size()I

    move-result v1

    invoke-direct {v7, v1}, Ljava/util/ArrayList;-><init>(I)V

    .line 49
    .local v7, "parameterTypes":Ljava/util/List;, "Ljava/util/List<Ljava/lang/String;>;"
    invoke-interface {v12}, Ljava/util/List;->iterator()Ljava/util/Iterator;

    move-result-object v8

    .local v8, "i$":Ljava/util/Iterator;
    :goto_0
    invoke-interface {v8}, Ljava/util/Iterator;->hasNext()Z

    move-result v1

    if-eqz v1, :cond_2

    invoke-interface {v8}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v11

    check-cast v11, Ljavax/lang/model/element/VariableElement;

    .line 50
    .local v11, "listenerParameterType":Ljavax/lang/model/element/VariableElement;
    invoke-interface {v11}, Ljavax/lang/model/element/VariableElement;->asType()Ljavax/lang/model/type/TypeMirror;

    move-result-object v1

    invoke-virtual {v1}, Ljava/lang/Object;->toString()Ljava/lang/String;

    move-result-object v14

    .line 51
    .local v14, "parameterType":Ljava/lang/String;
    const-string v1, "java.lang."

    invoke-virtual {v14, v1}, Ljava/lang/String;->startsWith(Ljava/lang/String;)Z

    move-result v1

    if-eqz v1, :cond_1

    const/16 v1, 0xa

    invoke-virtual {v14, v1}, Ljava/lang/String;->substring(I)Ljava/lang/String;

    move-result-object v1

    const-string v15, "."

    invoke-virtual {v1, v15}, Ljava/lang/String;->contains(Ljava/lang/CharSequence;)Z

    move-result v1

    if-nez v1, :cond_1

    .line 52
    const/16 v1, 0xa

    invoke-virtual {v14, v1}, Ljava/lang/String;->substring(I)Ljava/lang/String;

    move-result-object v14

    .line 54
    :cond_1
    invoke-interface {v7, v14}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    goto :goto_0

    .line 57
    .end local v11    # "listenerParameterType":Ljavax/lang/model/element/VariableElement;
    .end local v14    # "parameterType":Ljava/lang/String;
    :cond_2
    new-instance v1, Lbutterknife/internal/Listener;

    invoke-direct/range {v1 .. v7}, Lbutterknife/internal/Listener;-><init>(Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Ljava/util/List;)V

    return-object v1
.end method


# virtual methods
.method public equals(Ljava/lang/Object;)Z
    .locals 5
    .param p1, "o"    # Ljava/lang/Object;

    .prologue
    const/4 v1, 0x1

    const/4 v2, 0x0

    .line 102
    if-ne p0, p1, :cond_1

    .line 107
    :cond_0
    :goto_0
    return v1

    .line 103
    :cond_1
    if-eqz p1, :cond_2

    invoke-virtual {p0}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    move-result-object v3

    invoke-virtual {p1}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    move-result-object v4

    if-eq v3, v4, :cond_3

    :cond_2
    move v1, v2

    goto :goto_0

    :cond_3
    move-object v0, p1

    .line 105
    check-cast v0, Lbutterknife/internal/Listener;

    .line 107
    .local v0, "listener":Lbutterknife/internal/Listener;
    iget-object v3, p0, Lbutterknife/internal/Listener;->methodName:Ljava/lang/String;

    iget-object v4, v0, Lbutterknife/internal/Listener;->methodName:Ljava/lang/String;

    invoke-virtual {v3, v4}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v3

    if-eqz v3, :cond_4

    iget-object v3, p0, Lbutterknife/internal/Listener;->ownerType:Ljava/lang/String;

    iget-object v4, v0, Lbutterknife/internal/Listener;->ownerType:Ljava/lang/String;

    invoke-virtual {v3, v4}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v3

    if-eqz v3, :cond_4

    iget-object v3, p0, Lbutterknife/internal/Listener;->parameterTypes:Ljava/util/List;

    iget-object v4, v0, Lbutterknife/internal/Listener;->parameterTypes:Ljava/util/List;

    invoke-virtual {v3, v4}, Ljava/lang/Object;->equals(Ljava/lang/Object;)Z

    move-result v3

    if-eqz v3, :cond_4

    iget-object v3, p0, Lbutterknife/internal/Listener;->returnType:Ljava/lang/String;

    iget-object v4, v0, Lbutterknife/internal/Listener;->returnType:Ljava/lang/String;

    invoke-virtual {v3, v4}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v3

    if-eqz v3, :cond_4

    iget-object v3, p0, Lbutterknife/internal/Listener;->setterName:Ljava/lang/String;

    iget-object v4, v0, Lbutterknife/internal/Listener;->setterName:Ljava/lang/String;

    invoke-virtual {v3, v4}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v3

    if-eqz v3, :cond_4

    iget-object v3, p0, Lbutterknife/internal/Listener;->type:Ljava/lang/String;

    iget-object v4, v0, Lbutterknife/internal/Listener;->type:Ljava/lang/String;

    invoke-virtual {v3, v4}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v3

    if-nez v3, :cond_0

    :cond_4
    move v1, v2

    goto :goto_0
.end method

.method getMethodName()Ljava/lang/String;
    .locals 1

    .prologue
    .line 94
    iget-object v0, p0, Lbutterknife/internal/Listener;->methodName:Ljava/lang/String;

    return-object v0
.end method

.method public getOwnerType()Ljava/lang/String;
    .locals 1

    .prologue
    .line 78
    iget-object v0, p0, Lbutterknife/internal/Listener;->ownerType:Ljava/lang/String;

    return-object v0
.end method

.method getParameterTypes()Ljava/util/List;
    .locals 1
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()",
            "Ljava/util/List",
            "<",
            "Ljava/lang/String;",
            ">;"
        }
    .end annotation

    .prologue
    .line 98
    iget-object v0, p0, Lbutterknife/internal/Listener;->parameterTypes:Ljava/util/List;

    return-object v0
.end method

.method getReturnType()Ljava/lang/String;
    .locals 1

    .prologue
    .line 90
    iget-object v0, p0, Lbutterknife/internal/Listener;->returnType:Ljava/lang/String;

    return-object v0
.end method

.method public getSetterName()Ljava/lang/String;
    .locals 1

    .prologue
    .line 82
    iget-object v0, p0, Lbutterknife/internal/Listener;->setterName:Ljava/lang/String;

    return-object v0
.end method

.method getType()Ljava/lang/String;
    .locals 1

    .prologue
    .line 86
    iget-object v0, p0, Lbutterknife/internal/Listener;->type:Ljava/lang/String;

    return-object v0
.end method

.method public hashCode()I
    .locals 3

    .prologue
    .line 116
    iget-object v1, p0, Lbutterknife/internal/Listener;->ownerType:Ljava/lang/String;

    invoke-virtual {v1}, Ljava/lang/String;->hashCode()I

    move-result v0

    .line 117
    .local v0, "result":I
    mul-int/lit8 v1, v0, 0x1f

    iget-object v2, p0, Lbutterknife/internal/Listener;->setterName:Ljava/lang/String;

    invoke-virtual {v2}, Ljava/lang/String;->hashCode()I

    move-result v2

    add-int v0, v1, v2

    .line 118
    mul-int/lit8 v1, v0, 0x1f

    iget-object v2, p0, Lbutterknife/internal/Listener;->type:Ljava/lang/String;

    invoke-virtual {v2}, Ljava/lang/String;->hashCode()I

    move-result v2

    add-int v0, v1, v2

    .line 119
    mul-int/lit8 v1, v0, 0x1f

    iget-object v2, p0, Lbutterknife/internal/Listener;->returnType:Ljava/lang/String;

    invoke-virtual {v2}, Ljava/lang/String;->hashCode()I

    move-result v2

    add-int v0, v1, v2

    .line 120
    mul-int/lit8 v1, v0, 0x1f

    iget-object v2, p0, Lbutterknife/internal/Listener;->methodName:Ljava/lang/String;

    invoke-virtual {v2}, Ljava/lang/String;->hashCode()I

    move-result v2

    add-int v0, v1, v2

    .line 121
    mul-int/lit8 v1, v0, 0x1f

    iget-object v2, p0, Lbutterknife/internal/Listener;->parameterTypes:Ljava/util/List;

    invoke-virtual {v2}, Ljava/lang/Object;->hashCode()I

    move-result v2

    add-int v0, v1, v2

    .line 122
    return v0
.end method
