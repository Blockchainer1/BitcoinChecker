.class public final Lbutterknife/internal/InjectViewProcessor;
.super Ljavax/annotation/processing/AbstractProcessor;
.source "InjectViewProcessor.java"


# static fields
.field private static final LISTENERS:Ljava/util/List;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/List",
            "<",
            "Ljava/lang/Class",
            "<+",
            "Ljava/lang/annotation/Annotation;",
            ">;>;"
        }
    .end annotation
.end field

.field private static final LISTENER_MAP:Ljava/util/Map;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/Map",
            "<",
            "Ljava/lang/String;",
            "Lbutterknife/internal/Listener;",
            ">;"
        }
    .end annotation
.end field

.field public static final SUFFIX:Ljava/lang/String; = "$$ViewInjector"

.field static final VIEW_TYPE:Ljava/lang/String; = "android.view.View"


# instance fields
.field private elementUtils:Ljavax/lang/model/util/Elements;

.field private filer:Ljavax/annotation/processing/Filer;

.field private typeUtils:Ljavax/lang/model/util/Types;


# direct methods
.method static constructor <clinit>()V
    .locals 3

    .prologue
    .line 52
    new-instance v0, Ljava/util/LinkedHashMap;

    invoke-direct {v0}, Ljava/util/LinkedHashMap;-><init>()V

    sput-object v0, Lbutterknife/internal/InjectViewProcessor;->LISTENER_MAP:Ljava/util/Map;

    .line 53
    const/4 v0, 0x7

    new-array v0, v0, [Ljava/lang/Class;

    const/4 v1, 0x0

    const-class v2, Lbutterknife/OnCheckedChanged;

    aput-object v2, v0, v1

    const/4 v1, 0x1

    const-class v2, Lbutterknife/OnClick;

    aput-object v2, v0, v1

    const/4 v1, 0x2

    const-class v2, Lbutterknife/OnEditorAction;

    aput-object v2, v0, v1

    const/4 v1, 0x3

    const-class v2, Lbutterknife/OnFocusChanged;

    aput-object v2, v0, v1

    const/4 v1, 0x4

    const-class v2, Lbutterknife/OnItemClick;

    aput-object v2, v0, v1

    const/4 v1, 0x5

    const-class v2, Lbutterknife/OnItemLongClick;

    aput-object v2, v0, v1

    const/4 v1, 0x6

    const-class v2, Lbutterknife/OnLongClick;

    aput-object v2, v0, v1

    invoke-static {v0}, Ljava/util/Arrays;->asList([Ljava/lang/Object;)Ljava/util/List;

    move-result-object v0

    sput-object v0, Lbutterknife/internal/InjectViewProcessor;->LISTENERS:Ljava/util/List;

    return-void
.end method

.method public constructor <init>()V
    .locals 0

    .prologue
    .line 49
    invoke-direct {p0}, Ljavax/annotation/processing/AbstractProcessor;-><init>()V

    return-void
.end method

.method private containsTypeMirror(Ljava/util/Collection;Ljavax/lang/model/type/TypeMirror;)Z
    .locals 3
    .param p2, "query"    # Ljavax/lang/model/type/TypeMirror;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/util/Collection",
            "<",
            "Ljavax/lang/model/type/TypeMirror;",
            ">;",
            "Ljavax/lang/model/type/TypeMirror;",
            ")Z"
        }
    .end annotation

    .prologue
    .line 450
    .local p1, "mirrors":Ljava/util/Collection;, "Ljava/util/Collection<Ljavax/lang/model/type/TypeMirror;>;"
    iget-object v2, p0, Lbutterknife/internal/InjectViewProcessor;->typeUtils:Ljavax/lang/model/util/Types;

    invoke-interface {v2, p2}, Ljavax/lang/model/util/Types;->erasure(Ljavax/lang/model/type/TypeMirror;)Ljavax/lang/model/type/TypeMirror;

    move-result-object p2

    .line 452
    invoke-interface {p1}, Ljava/util/Collection;->iterator()Ljava/util/Iterator;

    move-result-object v0

    .local v0, "i$":Ljava/util/Iterator;
    :cond_0
    invoke-interface {v0}, Ljava/util/Iterator;->hasNext()Z

    move-result v2

    if-eqz v2, :cond_1

    invoke-interface {v0}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Ljavax/lang/model/type/TypeMirror;

    .line 453
    .local v1, "mirror":Ljavax/lang/model/type/TypeMirror;
    iget-object v2, p0, Lbutterknife/internal/InjectViewProcessor;->typeUtils:Ljavax/lang/model/util/Types;

    invoke-interface {v2, v1, p2}, Ljavax/lang/model/util/Types;->isSameType(Ljavax/lang/model/type/TypeMirror;Ljavax/lang/model/type/TypeMirror;)Z

    move-result v2

    if-eqz v2, :cond_0

    .line 454
    const/4 v2, 0x1

    .line 457
    .end local v1    # "mirror":Ljavax/lang/model/type/TypeMirror;
    :goto_0
    return v2

    :cond_1
    const/4 v2, 0x0

    goto :goto_0
.end method

.method private varargs error(Ljavax/lang/model/element/Element;Ljava/lang/String;[Ljava/lang/Object;)V
    .locals 3
    .param p1, "element"    # Ljavax/lang/model/element/Element;
    .param p2, "message"    # Ljava/lang/String;
    .param p3, "args"    # [Ljava/lang/Object;

    .prologue
    .line 465
    iget-object v0, p0, Lbutterknife/internal/InjectViewProcessor;->processingEnv:Ljavax/annotation/processing/ProcessingEnvironment;

    invoke-interface {v0}, Ljavax/annotation/processing/ProcessingEnvironment;->getMessager()Ljavax/annotation/processing/Messager;

    move-result-object v0

    sget-object v1, Ljavax/tools/Diagnostic$Kind;->ERROR:Ljavax/tools/Diagnostic$Kind;

    invoke-static {p2, p3}, Ljava/lang/String;->format(Ljava/lang/String;[Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v2

    invoke-interface {v0, v1, v2, p1}, Ljavax/annotation/processing/Messager;->printMessage(Ljavax/tools/Diagnostic$Kind;Ljava/lang/CharSequence;Ljavax/lang/model/element/Element;)V

    .line 466
    return-void
.end method

.method private findAndParseListener(Ljavax/annotation/processing/RoundEnvironment;Ljava/lang/Class;Ljava/util/Map;Ljava/util/Set;)V
    .locals 8
    .param p1, "env"    # Ljavax/annotation/processing/RoundEnvironment;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljavax/annotation/processing/RoundEnvironment;",
            "Ljava/lang/Class",
            "<+",
            "Ljava/lang/annotation/Annotation;",
            ">;",
            "Ljava/util/Map",
            "<",
            "Ljavax/lang/model/element/TypeElement;",
            "Lbutterknife/internal/ViewInjector;",
            ">;",
            "Ljava/util/Set",
            "<",
            "Ljavax/lang/model/type/TypeMirror;",
            ">;)V"
        }
    .end annotation

    .prologue
    .line 208
    .local p2, "annotationClass":Ljava/lang/Class;, "Ljava/lang/Class<+Ljava/lang/annotation/Annotation;>;"
    .local p3, "targetClassMap":Ljava/util/Map;, "Ljava/util/Map<Ljavax/lang/model/element/TypeElement;Lbutterknife/internal/ViewInjector;>;"
    .local p4, "erasedTargetTypes":Ljava/util/Set;, "Ljava/util/Set<Ljavax/lang/model/type/TypeMirror;>;"
    invoke-interface {p1, p2}, Ljavax/annotation/processing/RoundEnvironment;->getElementsAnnotatedWith(Ljava/lang/Class;)Ljava/util/Set;

    move-result-object v4

    invoke-interface {v4}, Ljava/util/Set;->iterator()Ljava/util/Iterator;

    move-result-object v2

    .local v2, "i$":Ljava/util/Iterator;
    :goto_0
    invoke-interface {v2}, Ljava/util/Iterator;->hasNext()Z

    move-result v4

    if-eqz v4, :cond_0

    invoke-interface {v2}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Ljavax/lang/model/element/Element;

    .line 210
    .local v1, "element":Ljavax/lang/model/element/Element;
    :try_start_0
    invoke-direct {p0, p2, v1, p3, p4}, Lbutterknife/internal/InjectViewProcessor;->parseListenerAnnotation(Ljava/lang/Class;Ljavax/lang/model/element/Element;Ljava/util/Map;Ljava/util/Set;)V
    :try_end_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_0

    goto :goto_0

    .line 211
    :catch_0
    move-exception v0

    .line 212
    .local v0, "e":Ljava/lang/Exception;
    new-instance v3, Ljava/io/StringWriter;

    invoke-direct {v3}, Ljava/io/StringWriter;-><init>()V

    .line 213
    .local v3, "stackTrace":Ljava/io/StringWriter;
    new-instance v4, Ljava/io/PrintWriter;

    invoke-direct {v4, v3}, Ljava/io/PrintWriter;-><init>(Ljava/io/Writer;)V

    invoke-virtual {v0, v4}, Ljava/lang/Exception;->printStackTrace(Ljava/io/PrintWriter;)V

    .line 215
    const-string v4, "Unable to generate view injector for @%s.\n\n%s"

    const/4 v5, 0x2

    new-array v5, v5, [Ljava/lang/Object;

    const/4 v6, 0x0

    invoke-virtual {p2}, Ljava/lang/Class;->getSimpleName()Ljava/lang/String;

    move-result-object v7

    aput-object v7, v5, v6

    const/4 v6, 0x1

    invoke-virtual {v3}, Ljava/io/StringWriter;->toString()Ljava/lang/String;

    move-result-object v7

    aput-object v7, v5, v6

    invoke-direct {p0, v1, v4, v5}, Lbutterknife/internal/InjectViewProcessor;->error(Ljavax/lang/model/element/Element;Ljava/lang/String;[Ljava/lang/Object;)V

    goto :goto_0

    .line 219
    .end local v0    # "e":Ljava/lang/Exception;
    .end local v1    # "element":Ljavax/lang/model/element/Element;
    .end local v3    # "stackTrace":Ljava/io/StringWriter;
    :cond_0
    return-void
.end method

.method private findAndParseTargets(Ljavax/annotation/processing/RoundEnvironment;)Ljava/util/Map;
    .locals 13
    .param p1, "env"    # Ljavax/annotation/processing/RoundEnvironment;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljavax/annotation/processing/RoundEnvironment;",
            ")",
            "Ljava/util/Map",
            "<",
            "Ljavax/lang/model/element/TypeElement;",
            "Lbutterknife/internal/ViewInjector;",
            ">;"
        }
    .end annotation

    .prologue
    .line 107
    new-instance v8, Ljava/util/LinkedHashMap;

    invoke-direct {v8}, Ljava/util/LinkedHashMap;-><init>()V

    .line 108
    .local v8, "targetClassMap":Ljava/util/Map;, "Ljava/util/Map<Ljavax/lang/model/element/TypeElement;Lbutterknife/internal/ViewInjector;>;"
    new-instance v3, Ljava/util/LinkedHashSet;

    invoke-direct {v3}, Ljava/util/LinkedHashSet;-><init>()V

    .line 111
    .local v3, "erasedTargetTypes":Ljava/util/Set;, "Ljava/util/Set<Ljavax/lang/model/type/TypeMirror;>;"
    const-class v9, Lbutterknife/InjectView;

    invoke-interface {p1, v9}, Ljavax/annotation/processing/RoundEnvironment;->getElementsAnnotatedWith(Ljava/lang/Class;)Ljava/util/Set;

    move-result-object v9

    invoke-interface {v9}, Ljava/util/Set;->iterator()Ljava/util/Iterator;

    move-result-object v4

    .local v4, "i$":Ljava/util/Iterator;
    :goto_0
    invoke-interface {v4}, Ljava/util/Iterator;->hasNext()Z

    move-result v9

    if-eqz v9, :cond_0

    invoke-interface {v4}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Ljavax/lang/model/element/Element;

    .line 113
    .local v1, "element":Ljavax/lang/model/element/Element;
    :try_start_0
    invoke-direct {p0, v1, v8, v3}, Lbutterknife/internal/InjectViewProcessor;->parseInjectView(Ljavax/lang/model/element/Element;Ljava/util/Map;Ljava/util/Set;)V
    :try_end_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_0

    goto :goto_0

    .line 114
    :catch_0
    move-exception v0

    .line 115
    .local v0, "e":Ljava/lang/Exception;
    new-instance v7, Ljava/io/StringWriter;

    invoke-direct {v7}, Ljava/io/StringWriter;-><init>()V

    .line 116
    .local v7, "stackTrace":Ljava/io/StringWriter;
    new-instance v9, Ljava/io/PrintWriter;

    invoke-direct {v9, v7}, Ljava/io/PrintWriter;-><init>(Ljava/io/Writer;)V

    invoke-virtual {v0, v9}, Ljava/lang/Exception;->printStackTrace(Ljava/io/PrintWriter;)V

    .line 118
    const-string v9, "Unable to generate view injector for @InjectView.\n\n%s"

    const/4 v10, 0x1

    new-array v10, v10, [Ljava/lang/Object;

    const/4 v11, 0x0

    invoke-virtual {v7}, Ljava/io/StringWriter;->toString()Ljava/lang/String;

    move-result-object v12

    aput-object v12, v10, v11

    invoke-direct {p0, v1, v9, v10}, Lbutterknife/internal/InjectViewProcessor;->error(Ljavax/lang/model/element/Element;Ljava/lang/String;[Ljava/lang/Object;)V

    goto :goto_0

    .line 124
    .end local v0    # "e":Ljava/lang/Exception;
    .end local v1    # "element":Ljavax/lang/model/element/Element;
    .end local v7    # "stackTrace":Ljava/io/StringWriter;
    :cond_0
    sget-object v9, Lbutterknife/internal/InjectViewProcessor;->LISTENERS:Ljava/util/List;

    invoke-interface {v9}, Ljava/util/List;->iterator()Ljava/util/Iterator;

    move-result-object v4

    :goto_1
    invoke-interface {v4}, Ljava/util/Iterator;->hasNext()Z

    move-result v9

    if-eqz v9, :cond_1

    invoke-interface {v4}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v5

    check-cast v5, Ljava/lang/Class;

    .line 125
    .local v5, "listener":Ljava/lang/Class;, "Ljava/lang/Class<+Ljava/lang/annotation/Annotation;>;"
    invoke-direct {p0, p1, v5, v8, v3}, Lbutterknife/internal/InjectViewProcessor;->findAndParseListener(Ljavax/annotation/processing/RoundEnvironment;Ljava/lang/Class;Ljava/util/Map;Ljava/util/Set;)V

    goto :goto_1

    .line 129
    .end local v5    # "listener":Ljava/lang/Class;, "Ljava/lang/Class<+Ljava/lang/annotation/Annotation;>;"
    :cond_1
    invoke-interface {v8}, Ljava/util/Map;->entrySet()Ljava/util/Set;

    move-result-object v9

    invoke-interface {v9}, Ljava/util/Set;->iterator()Ljava/util/Iterator;

    move-result-object v4

    :cond_2
    :goto_2
    invoke-interface {v4}, Ljava/util/Iterator;->hasNext()Z

    move-result v9

    if-eqz v9, :cond_3

    invoke-interface {v4}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v2

    check-cast v2, Ljava/util/Map$Entry;

    .line 130
    .local v2, "entry":Ljava/util/Map$Entry;, "Ljava/util/Map$Entry<Ljavax/lang/model/element/TypeElement;Lbutterknife/internal/ViewInjector;>;"
    invoke-interface {v2}, Ljava/util/Map$Entry;->getKey()Ljava/lang/Object;

    move-result-object v9

    check-cast v9, Ljavax/lang/model/element/TypeElement;

    invoke-direct {p0, v9, v3}, Lbutterknife/internal/InjectViewProcessor;->findParentFqcn(Ljavax/lang/model/element/TypeElement;Ljava/util/Set;)Ljava/lang/String;

    move-result-object v6

    .line 131
    .local v6, "parentClassFqcn":Ljava/lang/String;
    if-eqz v6, :cond_2

    .line 132
    invoke-interface {v2}, Ljava/util/Map$Entry;->getValue()Ljava/lang/Object;

    move-result-object v9

    check-cast v9, Lbutterknife/internal/ViewInjector;

    new-instance v10, Ljava/lang/StringBuilder;

    invoke-direct {v10}, Ljava/lang/StringBuilder;-><init>()V

    invoke-virtual {v10, v6}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v10

    const-string v11, "$$ViewInjector"

    invoke-virtual {v10, v11}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v10

    invoke-virtual {v10}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v10

    invoke-virtual {v9, v10}, Lbutterknife/internal/ViewInjector;->setParentInjector(Ljava/lang/String;)V

    goto :goto_2

    .line 136
    .end local v2    # "entry":Ljava/util/Map$Entry;, "Ljava/util/Map$Entry<Ljavax/lang/model/element/TypeElement;Lbutterknife/internal/ViewInjector;>;"
    .end local v6    # "parentClassFqcn":Ljava/lang/String;
    :cond_3
    return-object v8
.end method

.method private findParentFqcn(Ljavax/lang/model/element/TypeElement;Ljava/util/Set;)Ljava/lang/String;
    .locals 4
    .param p1, "typeElement"    # Ljavax/lang/model/element/TypeElement;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljavax/lang/model/element/TypeElement;",
            "Ljava/util/Set",
            "<",
            "Ljavax/lang/model/type/TypeMirror;",
            ">;)",
            "Ljava/lang/String;"
        }
    .end annotation

    .prologue
    .line 436
    .local p2, "parents":Ljava/util/Set;, "Ljava/util/Set<Ljavax/lang/model/type/TypeMirror;>;"
    :cond_0
    invoke-interface {p1}, Ljavax/lang/model/element/TypeElement;->getSuperclass()Ljavax/lang/model/type/TypeMirror;

    move-result-object v1

    .line 437
    .local v1, "type":Ljavax/lang/model/type/TypeMirror;
    invoke-interface {v1}, Ljavax/lang/model/type/TypeMirror;->getKind()Ljavax/lang/model/type/TypeKind;

    move-result-object v2

    sget-object v3, Ljavax/lang/model/type/TypeKind;->NONE:Ljavax/lang/model/type/TypeKind;

    if-ne v2, v3, :cond_1

    .line 438
    const/4 v2, 0x0

    .line 443
    :goto_0
    return-object v2

    :cond_1
    move-object v2, v1

    .line 440
    check-cast v2, Ljavax/lang/model/type/DeclaredType;

    invoke-interface {v2}, Ljavax/lang/model/type/DeclaredType;->asElement()Ljavax/lang/model/element/Element;

    move-result-object p1

    .end local p1    # "typeElement":Ljavax/lang/model/element/TypeElement;
    check-cast p1, Ljavax/lang/model/element/TypeElement;

    .line 441
    .restart local p1    # "typeElement":Ljavax/lang/model/element/TypeElement;
    invoke-direct {p0, p2, v1}, Lbutterknife/internal/InjectViewProcessor;->containsTypeMirror(Ljava/util/Collection;Ljavax/lang/model/type/TypeMirror;)Z

    move-result v2

    if-eqz v2, :cond_0

    .line 442
    invoke-direct {p0, p1}, Lbutterknife/internal/InjectViewProcessor;->getPackageName(Ljavax/lang/model/element/TypeElement;)Ljava/lang/String;

    move-result-object v0

    .line 443
    .local v0, "packageName":Ljava/lang/String;
    new-instance v2, Ljava/lang/StringBuilder;

    invoke-direct {v2}, Ljava/lang/StringBuilder;-><init>()V

    invoke-virtual {v2, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    const-string v3, "."

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    invoke-static {p1, v0}, Lbutterknife/internal/InjectViewProcessor;->getClassName(Ljavax/lang/model/element/TypeElement;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v3

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    invoke-virtual {v2}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v2

    goto :goto_0
.end method

.method private static getClassName(Ljavax/lang/model/element/TypeElement;Ljava/lang/String;)Ljava/lang/String;
    .locals 4
    .param p0, "type"    # Ljavax/lang/model/element/TypeElement;
    .param p1, "packageName"    # Ljava/lang/String;

    .prologue
    .line 428
    invoke-virtual {p1}, Ljava/lang/String;->length()I

    move-result v1

    add-int/lit8 v0, v1, 0x1

    .line 429
    .local v0, "packageLen":I
    invoke-interface {p0}, Ljavax/lang/model/element/TypeElement;->getQualifiedName()Ljavax/lang/model/element/Name;

    move-result-object v1

    invoke-virtual {v1}, Ljava/lang/Object;->toString()Ljava/lang/String;

    move-result-object v1

    invoke-virtual {v1, v0}, Ljava/lang/String;->substring(I)Ljava/lang/String;

    move-result-object v1

    const/16 v2, 0x2e

    const/16 v3, 0x24

    invoke-virtual {v1, v2, v3}, Ljava/lang/String;->replace(CC)Ljava/lang/String;

    move-result-object v1

    return-object v1
.end method

.method private getOrCreateTargetClass(Ljava/util/Map;Ljavax/lang/model/element/TypeElement;)Lbutterknife/internal/ViewInjector;
    .locals 6
    .param p2, "enclosingElement"    # Ljavax/lang/model/element/TypeElement;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/util/Map",
            "<",
            "Ljavax/lang/model/element/TypeElement;",
            "Lbutterknife/internal/ViewInjector;",
            ">;",
            "Ljavax/lang/model/element/TypeElement;",
            ")",
            "Lbutterknife/internal/ViewInjector;"
        }
    .end annotation

    .prologue
    .line 415
    .local p1, "targetClassMap":Ljava/util/Map;, "Ljava/util/Map<Ljavax/lang/model/element/TypeElement;Lbutterknife/internal/ViewInjector;>;"
    invoke-interface {p1, p2}, Ljava/util/Map;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v3

    check-cast v3, Lbutterknife/internal/ViewInjector;

    .line 416
    .local v3, "viewInjector":Lbutterknife/internal/ViewInjector;
    if-nez v3, :cond_0

    .line 417
    invoke-interface {p2}, Ljavax/lang/model/element/TypeElement;->getQualifiedName()Ljavax/lang/model/element/Name;

    move-result-object v4

    invoke-virtual {v4}, Ljava/lang/Object;->toString()Ljava/lang/String;

    move-result-object v2

    .line 418
    .local v2, "targetType":Ljava/lang/String;
    invoke-direct {p0, p2}, Lbutterknife/internal/InjectViewProcessor;->getPackageName(Ljavax/lang/model/element/TypeElement;)Ljava/lang/String;

    move-result-object v1

    .line 419
    .local v1, "classPackage":Ljava/lang/String;
    new-instance v4, Ljava/lang/StringBuilder;

    invoke-direct {v4}, Ljava/lang/StringBuilder;-><init>()V

    invoke-static {p2, v1}, Lbutterknife/internal/InjectViewProcessor;->getClassName(Ljavax/lang/model/element/TypeElement;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v5

    invoke-virtual {v4, v5}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v4

    const-string v5, "$$ViewInjector"

    invoke-virtual {v4, v5}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v4

    invoke-virtual {v4}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v0

    .line 421
    .local v0, "className":Ljava/lang/String;
    new-instance v3, Lbutterknife/internal/ViewInjector;

    .end local v3    # "viewInjector":Lbutterknife/internal/ViewInjector;
    invoke-direct {v3, v1, v0, v2}, Lbutterknife/internal/ViewInjector;-><init>(Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)V

    .line 422
    .restart local v3    # "viewInjector":Lbutterknife/internal/ViewInjector;
    invoke-interface {p1, p2, v3}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 424
    .end local v0    # "className":Ljava/lang/String;
    .end local v1    # "classPackage":Ljava/lang/String;
    .end local v2    # "targetType":Ljava/lang/String;
    :cond_0
    return-object v3
.end method

.method private getPackageName(Ljavax/lang/model/element/TypeElement;)Ljava/lang/String;
    .locals 1
    .param p1, "type"    # Ljavax/lang/model/element/TypeElement;

    .prologue
    .line 469
    iget-object v0, p0, Lbutterknife/internal/InjectViewProcessor;->elementUtils:Ljavax/lang/model/util/Elements;

    invoke-interface {v0, p1}, Ljavax/lang/model/util/Elements;->getPackageOf(Ljavax/lang/model/element/Element;)Ljavax/lang/model/element/PackageElement;

    move-result-object v0

    invoke-interface {v0}, Ljavax/lang/model/element/PackageElement;->getQualifiedName()Ljavax/lang/model/element/Name;

    move-result-object v0

    invoke-virtual {v0}, Ljava/lang/Object;->toString()Ljava/lang/String;

    move-result-object v0

    return-object v0
.end method

.method private isSubtypeOfType(Ljavax/lang/model/type/TypeMirror;Ljava/lang/String;)Z
    .locals 12
    .param p1, "typeMirror"    # Ljavax/lang/model/type/TypeMirror;
    .param p2, "otherType"    # Ljava/lang/String;

    .prologue
    const/4 v10, 0x0

    const/4 v9, 0x1

    .line 374
    invoke-virtual {p1}, Ljava/lang/Object;->toString()Ljava/lang/String;

    move-result-object v11

    invoke-virtual {p2, v11}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v11

    if-eqz v11, :cond_1

    .line 410
    :cond_0
    :goto_0
    return v9

    .line 377
    :cond_1
    instance-of v11, p1, Ljavax/lang/model/type/DeclaredType;

    if-nez v11, :cond_2

    move v9, v10

    .line 378
    goto :goto_0

    :cond_2
    move-object v0, p1

    .line 380
    check-cast v0, Ljavax/lang/model/type/DeclaredType;

    .line 381
    .local v0, "declaredType":Ljavax/lang/model/type/DeclaredType;
    invoke-interface {v0}, Ljavax/lang/model/type/DeclaredType;->getTypeArguments()Ljava/util/List;

    move-result-object v6

    .line 382
    .local v6, "typeArguments":Ljava/util/List;, "Ljava/util/List<+Ljavax/lang/model/type/TypeMirror;>;"
    invoke-interface {v6}, Ljava/util/List;->size()I

    move-result v11

    if-lez v11, :cond_5

    .line 383
    new-instance v8, Ljava/lang/StringBuilder;

    invoke-interface {v0}, Ljavax/lang/model/type/DeclaredType;->asElement()Ljavax/lang/model/element/Element;

    move-result-object v11

    invoke-virtual {v11}, Ljava/lang/Object;->toString()Ljava/lang/String;

    move-result-object v11

    invoke-direct {v8, v11}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    .line 384
    .local v8, "typeString":Ljava/lang/StringBuilder;
    const/16 v11, 0x3c

    invoke-virtual {v8, v11}, Ljava/lang/StringBuilder;->append(C)Ljava/lang/StringBuilder;

    .line 385
    const/4 v2, 0x0

    .local v2, "i":I
    :goto_1
    invoke-interface {v6}, Ljava/util/List;->size()I

    move-result v11

    if-ge v2, v11, :cond_4

    .line 386
    if-lez v2, :cond_3

    .line 387
    const/16 v11, 0x2c

    invoke-virtual {v8, v11}, Ljava/lang/StringBuilder;->append(C)Ljava/lang/StringBuilder;

    .line 389
    :cond_3
    const/16 v11, 0x3f

    invoke-virtual {v8, v11}, Ljava/lang/StringBuilder;->append(C)Ljava/lang/StringBuilder;

    .line 385
    add-int/lit8 v2, v2, 0x1

    goto :goto_1

    .line 391
    :cond_4
    const/16 v11, 0x3e

    invoke-virtual {v8, v11}, Ljava/lang/StringBuilder;->append(C)Ljava/lang/StringBuilder;

    .line 392
    invoke-virtual {v8}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v11

    invoke-virtual {v11, p2}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v11

    if-nez v11, :cond_0

    .line 396
    .end local v2    # "i":I
    .end local v8    # "typeString":Ljava/lang/StringBuilder;
    :cond_5
    invoke-interface {v0}, Ljavax/lang/model/type/DeclaredType;->asElement()Ljavax/lang/model/element/Element;

    move-result-object v1

    .line 397
    .local v1, "element":Ljavax/lang/model/element/Element;
    instance-of v11, v1, Ljavax/lang/model/element/TypeElement;

    if-nez v11, :cond_6

    move v9, v10

    .line 398
    goto :goto_0

    :cond_6
    move-object v7, v1

    .line 400
    check-cast v7, Ljavax/lang/model/element/TypeElement;

    .line 401
    .local v7, "typeElement":Ljavax/lang/model/element/TypeElement;
    invoke-interface {v7}, Ljavax/lang/model/element/TypeElement;->getSuperclass()Ljavax/lang/model/type/TypeMirror;

    move-result-object v5

    .line 402
    .local v5, "superType":Ljavax/lang/model/type/TypeMirror;
    invoke-direct {p0, v5, p2}, Lbutterknife/internal/InjectViewProcessor;->isSubtypeOfType(Ljavax/lang/model/type/TypeMirror;Ljava/lang/String;)Z

    move-result v11

    if-nez v11, :cond_0

    .line 405
    invoke-interface {v7}, Ljavax/lang/model/element/TypeElement;->getInterfaces()Ljava/util/List;

    move-result-object v11

    invoke-interface {v11}, Ljava/util/List;->iterator()Ljava/util/Iterator;

    move-result-object v3

    .local v3, "i$":Ljava/util/Iterator;
    :cond_7
    invoke-interface {v3}, Ljava/util/Iterator;->hasNext()Z

    move-result v11

    if-eqz v11, :cond_8

    invoke-interface {v3}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v4

    check-cast v4, Ljavax/lang/model/type/TypeMirror;

    .line 406
    .local v4, "interfaceType":Ljavax/lang/model/type/TypeMirror;
    invoke-direct {p0, v4, p2}, Lbutterknife/internal/InjectViewProcessor;->isSubtypeOfType(Ljavax/lang/model/type/TypeMirror;Ljava/lang/String;)Z

    move-result v11

    if-eqz v11, :cond_7

    goto :goto_0

    .end local v4    # "interfaceType":Ljavax/lang/model/type/TypeMirror;
    :cond_8
    move v9, v10

    .line 410
    goto :goto_0
.end method

.method private isValidForGeneratedCode(Ljava/lang/Class;Ljava/lang/String;Ljavax/lang/model/element/Element;)Z
    .locals 11
    .param p2, "targetThing"    # Ljava/lang/String;
    .param p3, "element"    # Ljavax/lang/model/element/Element;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/lang/Class",
            "<+",
            "Ljava/lang/annotation/Annotation;",
            ">;",
            "Ljava/lang/String;",
            "Ljavax/lang/model/element/Element;",
            ")Z"
        }
    .end annotation

    .prologue
    .local p1, "annotationClass":Ljava/lang/Class;, "Ljava/lang/Class<+Ljava/lang/annotation/Annotation;>;"
    const/4 v10, 0x4

    const/4 v9, 0x3

    const/4 v8, 0x2

    const/4 v7, 0x1

    const/4 v6, 0x0

    .line 141
    const/4 v1, 0x0

    .line 142
    .local v1, "hasError":Z
    invoke-interface {p3}, Ljavax/lang/model/element/Element;->getEnclosingElement()Ljavax/lang/model/element/Element;

    move-result-object v0

    check-cast v0, Ljavax/lang/model/element/TypeElement;

    .line 145
    .local v0, "enclosingElement":Ljavax/lang/model/element/TypeElement;
    invoke-interface {p3}, Ljavax/lang/model/element/Element;->getModifiers()Ljava/util/Set;

    move-result-object v2

    .line 146
    .local v2, "modifiers":Ljava/util/Set;, "Ljava/util/Set<Ljavax/lang/model/element/Modifier;>;"
    sget-object v3, Ljavax/lang/model/element/Modifier;->PRIVATE:Ljavax/lang/model/element/Modifier;

    invoke-interface {v2, v3}, Ljava/util/Set;->contains(Ljava/lang/Object;)Z

    move-result v3

    if-nez v3, :cond_0

    sget-object v3, Ljavax/lang/model/element/Modifier;->STATIC:Ljavax/lang/model/element/Modifier;

    invoke-interface {v2, v3}, Ljava/util/Set;->contains(Ljava/lang/Object;)Z

    move-result v3

    if-eqz v3, :cond_1

    .line 147
    :cond_0
    const-string v3, "@%s %s must not be private or static. (%s.%s)"

    new-array v4, v10, [Ljava/lang/Object;

    invoke-virtual {p1}, Ljava/lang/Class;->getSimpleName()Ljava/lang/String;

    move-result-object v5

    aput-object v5, v4, v6

    aput-object p2, v4, v7

    invoke-interface {v0}, Ljavax/lang/model/element/TypeElement;->getQualifiedName()Ljavax/lang/model/element/Name;

    move-result-object v5

    aput-object v5, v4, v8

    invoke-interface {p3}, Ljavax/lang/model/element/Element;->getSimpleName()Ljavax/lang/model/element/Name;

    move-result-object v5

    aput-object v5, v4, v9

    invoke-direct {p0, p3, v3, v4}, Lbutterknife/internal/InjectViewProcessor;->error(Ljavax/lang/model/element/Element;Ljava/lang/String;[Ljava/lang/Object;)V

    .line 150
    const/4 v1, 0x1

    .line 154
    :cond_1
    invoke-interface {v0}, Ljavax/lang/model/element/TypeElement;->getKind()Ljavax/lang/model/element/ElementKind;

    move-result-object v3

    sget-object v4, Ljavax/lang/model/element/ElementKind;->CLASS:Ljavax/lang/model/element/ElementKind;

    if-eq v3, v4, :cond_2

    .line 155
    const-string v3, "@%s %s may only be contained in classes. (%s.%s)"

    new-array v4, v10, [Ljava/lang/Object;

    invoke-virtual {p1}, Ljava/lang/Class;->getSimpleName()Ljava/lang/String;

    move-result-object v5

    aput-object v5, v4, v6

    aput-object p2, v4, v7

    invoke-interface {v0}, Ljavax/lang/model/element/TypeElement;->getQualifiedName()Ljavax/lang/model/element/Name;

    move-result-object v5

    aput-object v5, v4, v8

    invoke-interface {p3}, Ljavax/lang/model/element/Element;->getSimpleName()Ljavax/lang/model/element/Name;

    move-result-object v5

    aput-object v5, v4, v9

    invoke-direct {p0, v0, v3, v4}, Lbutterknife/internal/InjectViewProcessor;->error(Ljavax/lang/model/element/Element;Ljava/lang/String;[Ljava/lang/Object;)V

    .line 158
    const/4 v1, 0x1

    .line 162
    :cond_2
    invoke-interface {v0}, Ljavax/lang/model/element/TypeElement;->getModifiers()Ljava/util/Set;

    move-result-object v3

    sget-object v4, Ljavax/lang/model/element/Modifier;->PRIVATE:Ljavax/lang/model/element/Modifier;

    invoke-interface {v3, v4}, Ljava/util/Set;->contains(Ljava/lang/Object;)Z

    move-result v3

    if-eqz v3, :cond_3

    .line 163
    const-string v3, "@%s %s may not be contained in private classes. (%s.%s)"

    new-array v4, v10, [Ljava/lang/Object;

    invoke-virtual {p1}, Ljava/lang/Class;->getSimpleName()Ljava/lang/String;

    move-result-object v5

    aput-object v5, v4, v6

    aput-object p2, v4, v7

    invoke-interface {v0}, Ljavax/lang/model/element/TypeElement;->getQualifiedName()Ljavax/lang/model/element/Name;

    move-result-object v5

    aput-object v5, v4, v8

    invoke-interface {p3}, Ljavax/lang/model/element/Element;->getSimpleName()Ljavax/lang/model/element/Name;

    move-result-object v5

    aput-object v5, v4, v9

    invoke-direct {p0, v0, v3, v4}, Lbutterknife/internal/InjectViewProcessor;->error(Ljavax/lang/model/element/Element;Ljava/lang/String;[Ljava/lang/Object;)V

    .line 166
    const/4 v1, 0x1

    .line 169
    :cond_3
    return v1
.end method

.method private parseInjectView(Ljavax/lang/model/element/Element;Ljava/util/Map;Ljava/util/Set;)V
    .locals 12
    .param p1, "element"    # Ljavax/lang/model/element/Element;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljavax/lang/model/element/Element;",
            "Ljava/util/Map",
            "<",
            "Ljavax/lang/model/element/TypeElement;",
            "Lbutterknife/internal/ViewInjector;",
            ">;",
            "Ljava/util/Set",
            "<",
            "Ljavax/lang/model/type/TypeMirror;",
            ">;)V"
        }
    .end annotation

    .prologue
    .local p2, "targetClassMap":Ljava/util/Map;, "Ljava/util/Map<Ljavax/lang/model/element/TypeElement;Lbutterknife/internal/ViewInjector;>;"
    .local p3, "erasedTargetTypes":Ljava/util/Set;, "Ljava/util/Set<Ljavax/lang/model/type/TypeMirror;>;"
    const/4 v5, 0x1

    const/4 v9, 0x0

    .line 174
    const/4 v2, 0x0

    .line 175
    .local v2, "hasError":Z
    invoke-interface {p1}, Ljavax/lang/model/element/Element;->getEnclosingElement()Ljavax/lang/model/element/Element;

    move-result-object v0

    check-cast v0, Ljavax/lang/model/element/TypeElement;

    .line 178
    .local v0, "enclosingElement":Ljavax/lang/model/element/TypeElement;
    invoke-interface {p1}, Ljavax/lang/model/element/Element;->asType()Ljavax/lang/model/type/TypeMirror;

    move-result-object v8

    const-string v10, "android.view.View"

    invoke-direct {p0, v8, v10}, Lbutterknife/internal/InjectViewProcessor;->isSubtypeOfType(Ljavax/lang/model/type/TypeMirror;Ljava/lang/String;)Z

    move-result v8

    if-nez v8, :cond_0

    .line 179
    const-string v8, "@InjectView fields must extend from View (%s.%s)."

    const/4 v10, 0x2

    new-array v10, v10, [Ljava/lang/Object;

    invoke-interface {v0}, Ljavax/lang/model/element/TypeElement;->getQualifiedName()Ljavax/lang/model/element/Name;

    move-result-object v11

    aput-object v11, v10, v9

    invoke-interface {p1}, Ljavax/lang/model/element/Element;->getSimpleName()Ljavax/lang/model/element/Name;

    move-result-object v11

    aput-object v11, v10, v5

    invoke-direct {p0, p1, v8, v10}, Lbutterknife/internal/InjectViewProcessor;->error(Ljavax/lang/model/element/Element;Ljava/lang/String;[Ljava/lang/Object;)V

    .line 181
    const/4 v2, 0x1

    .line 185
    :cond_0
    const-class v8, Lbutterknife/InjectView;

    const-string v10, "fields"

    invoke-direct {p0, v8, v10, p1}, Lbutterknife/internal/InjectViewProcessor;->isValidForGeneratedCode(Ljava/lang/Class;Ljava/lang/String;Ljavax/lang/model/element/Element;)Z

    move-result v8

    or-int/2addr v2, v8

    .line 187
    if-eqz v2, :cond_1

    .line 203
    :goto_0
    return-void

    .line 192
    :cond_1
    invoke-interface {p1}, Ljavax/lang/model/element/Element;->getSimpleName()Ljavax/lang/model/element/Name;

    move-result-object v8

    invoke-virtual {v8}, Ljava/lang/Object;->toString()Ljava/lang/String;

    move-result-object v4

    .line 193
    .local v4, "name":Ljava/lang/String;
    const-class v8, Lbutterknife/InjectView;

    invoke-interface {p1, v8}, Ljavax/lang/model/element/Element;->getAnnotation(Ljava/lang/Class;)Ljava/lang/annotation/Annotation;

    move-result-object v8

    check-cast v8, Lbutterknife/InjectView;

    invoke-interface {v8}, Lbutterknife/InjectView;->value()I

    move-result v3

    .line 194
    .local v3, "id":I
    invoke-interface {p1}, Ljavax/lang/model/element/Element;->asType()Ljavax/lang/model/type/TypeMirror;

    move-result-object v8

    invoke-virtual {v8}, Ljava/lang/Object;->toString()Ljava/lang/String;

    move-result-object v6

    .line 195
    .local v6, "type":Ljava/lang/String;
    const-class v8, Lbutterknife/Optional;

    invoke-interface {p1, v8}, Ljavax/lang/model/element/Element;->getAnnotation(Ljava/lang/Class;)Ljava/lang/annotation/Annotation;

    move-result-object v8

    if-nez v8, :cond_2

    .line 197
    .local v5, "required":Z
    :goto_1
    invoke-direct {p0, p2, v0}, Lbutterknife/internal/InjectViewProcessor;->getOrCreateTargetClass(Ljava/util/Map;Ljavax/lang/model/element/TypeElement;)Lbutterknife/internal/ViewInjector;

    move-result-object v7

    .line 198
    .local v7, "viewInjector":Lbutterknife/internal/ViewInjector;
    invoke-virtual {v7, v3, v4, v6, v5}, Lbutterknife/internal/ViewInjector;->addField(ILjava/lang/String;Ljava/lang/String;Z)V

    .line 201
    iget-object v8, p0, Lbutterknife/internal/InjectViewProcessor;->typeUtils:Ljavax/lang/model/util/Types;

    invoke-interface {v0}, Ljavax/lang/model/element/TypeElement;->asType()Ljavax/lang/model/type/TypeMirror;

    move-result-object v9

    invoke-interface {v8, v9}, Ljavax/lang/model/util/Types;->erasure(Ljavax/lang/model/type/TypeMirror;)Ljavax/lang/model/type/TypeMirror;

    move-result-object v1

    .line 202
    .local v1, "erasedTargetType":Ljavax/lang/model/type/TypeMirror;
    invoke-interface {p3, v1}, Ljava/util/Set;->add(Ljava/lang/Object;)Z

    goto :goto_0

    .end local v1    # "erasedTargetType":Ljavax/lang/model/type/TypeMirror;
    .end local v5    # "required":Z
    .end local v7    # "viewInjector":Lbutterknife/internal/ViewInjector;
    :cond_2
    move v5, v9

    .line 195
    goto :goto_1
.end method

.method private parseListenerAnnotation(Ljava/lang/Class;Ljavax/lang/model/element/Element;Ljava/util/Map;Ljava/util/Set;)V
    .locals 38
    .param p2, "element"    # Ljavax/lang/model/element/Element;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/lang/Class",
            "<+",
            "Ljava/lang/annotation/Annotation;",
            ">;",
            "Ljavax/lang/model/element/Element;",
            "Ljava/util/Map",
            "<",
            "Ljavax/lang/model/element/TypeElement;",
            "Lbutterknife/internal/ViewInjector;",
            ">;",
            "Ljava/util/Set",
            "<",
            "Ljavax/lang/model/type/TypeMirror;",
            ">;)V"
        }
    .end annotation

    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/lang/Exception;
        }
    .end annotation

    .prologue
    .line 225
    .local p1, "annotationClass":Ljava/lang/Class;, "Ljava/lang/Class<+Ljava/lang/annotation/Annotation;>;"
    .local p3, "targetClassMap":Ljava/util/Map;, "Ljava/util/Map<Ljavax/lang/model/element/TypeElement;Lbutterknife/internal/ViewInjector;>;"
    .local p4, "erasedTargetTypes":Ljava/util/Set;, "Ljava/util/Set<Ljavax/lang/model/type/TypeMirror;>;"
    move-object/from16 v0, p2

    instance-of v7, v0, Ljavax/lang/model/element/ExecutableElement;

    if-eqz v7, :cond_0

    invoke-interface/range {p2 .. p2}, Ljavax/lang/model/element/Element;->getKind()Ljavax/lang/model/element/ElementKind;

    move-result-object v7

    sget-object v34, Ljavax/lang/model/element/ElementKind;->METHOD:Ljavax/lang/model/element/ElementKind;

    move-object/from16 v0, v34

    if-eq v7, v0, :cond_2

    .line 226
    :cond_0
    const-string v7, "@%s annotation must be on a method."

    const/16 v34, 0x1

    move/from16 v0, v34

    new-array v0, v0, [Ljava/lang/Object;

    move-object/from16 v34, v0

    const/16 v35, 0x0

    invoke-virtual/range {p1 .. p1}, Ljava/lang/Class;->getSimpleName()Ljava/lang/String;

    move-result-object v36

    aput-object v36, v34, v35

    move-object/from16 v0, p0

    move-object/from16 v1, p2

    move-object/from16 v2, v34

    invoke-direct {v0, v1, v7, v2}, Lbutterknife/internal/InjectViewProcessor;->error(Ljavax/lang/model/element/Element;Ljava/lang/String;[Ljava/lang/Object;)V

    .line 371
    :cond_1
    :goto_0
    return-void

    :cond_2
    move-object/from16 v16, p2

    .line 230
    check-cast v16, Ljavax/lang/model/element/ExecutableElement;

    .line 231
    .local v16, "executableElement":Ljavax/lang/model/element/ExecutableElement;
    invoke-interface/range {p2 .. p2}, Ljavax/lang/model/element/Element;->getEnclosingElement()Ljavax/lang/model/element/Element;

    move-result-object v14

    check-cast v14, Ljavax/lang/model/element/TypeElement;

    .line 234
    .local v14, "enclosingElement":Ljavax/lang/model/element/TypeElement;
    move-object/from16 v0, p2

    move-object/from16 v1, p1

    invoke-interface {v0, v1}, Ljavax/lang/model/element/Element;->getAnnotation(Ljava/lang/Class;)Ljava/lang/annotation/Annotation;

    move-result-object v9

    .line 235
    .local v9, "annotation":Ljava/lang/annotation/Annotation;
    const-string v7, "value"

    const/16 v34, 0x0

    move/from16 v0, v34

    new-array v0, v0, [Ljava/lang/Class;

    move-object/from16 v34, v0

    move-object/from16 v0, p1

    move-object/from16 v1, v34

    invoke-virtual {v0, v7, v1}, Ljava/lang/Class;->getDeclaredMethod(Ljava/lang/String;[Ljava/lang/Class;)Ljava/lang/reflect/Method;

    move-result-object v10

    .line 236
    .local v10, "annotationValue":Ljava/lang/reflect/Method;
    if-eqz v10, :cond_3

    invoke-virtual {v10}, Ljava/lang/reflect/Method;->getReturnType()Ljava/lang/Class;

    move-result-object v7

    const-class v34, [I

    move-object/from16 v0, v34

    if-eq v7, v0, :cond_4

    .line 237
    :cond_3
    const-string v7, "@%s annotation lacks int[] value property. (%s.%s)"

    const/16 v34, 0x3

    move/from16 v0, v34

    new-array v0, v0, [Ljava/lang/Object;

    move-object/from16 v34, v0

    const/16 v35, 0x0

    aput-object p1, v34, v35

    const/16 v35, 0x1

    invoke-interface {v14}, Ljavax/lang/model/element/TypeElement;->getQualifiedName()Ljavax/lang/model/element/Name;

    move-result-object v36

    aput-object v36, v34, v35

    const/16 v35, 0x2

    invoke-interface/range {p2 .. p2}, Ljavax/lang/model/element/Element;->getSimpleName()Ljavax/lang/model/element/Name;

    move-result-object v36

    aput-object v36, v34, v35

    move-object/from16 v0, p0

    move-object/from16 v1, p2

    move-object/from16 v2, v34

    invoke-direct {v0, v1, v7, v2}, Lbutterknife/internal/InjectViewProcessor;->error(Ljavax/lang/model/element/Element;Ljava/lang/String;[Ljava/lang/Object;)V

    goto :goto_0

    .line 242
    :cond_4
    const/4 v7, 0x0

    new-array v7, v7, [Ljava/lang/Object;

    invoke-virtual {v10, v9, v7}, Ljava/lang/reflect/Method;->invoke(Ljava/lang/Object;[Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v7

    check-cast v7, [I

    move-object/from16 v20, v7

    check-cast v20, [I

    .line 243
    .local v20, "ids":[I
    invoke-interface/range {v16 .. v16}, Ljavax/lang/model/element/ExecutableElement;->getSimpleName()Ljavax/lang/model/element/Name;

    move-result-object v7

    invoke-virtual {v7}, Ljava/lang/Object;->toString()Ljava/lang/String;

    move-result-object v6

    .line 244
    .local v6, "name":Ljava/lang/String;
    const-class v7, Lbutterknife/Optional;

    move-object/from16 v0, p2

    invoke-interface {v0, v7}, Ljavax/lang/model/element/Element;->getAnnotation(Ljava/lang/Class;)Ljava/lang/annotation/Annotation;

    move-result-object v7

    if-nez v7, :cond_6

    const/4 v8, 0x1

    .line 247
    .local v8, "required":Z
    :goto_1
    const-string v7, "methods"

    move-object/from16 v0, p0

    move-object/from16 v1, p1

    move-object/from16 v2, p2

    invoke-direct {v0, v1, v7, v2}, Lbutterknife/internal/InjectViewProcessor;->isValidForGeneratedCode(Ljava/lang/Class;Ljava/lang/String;Ljavax/lang/model/element/Element;)Z

    move-result v17

    .line 249
    .local v17, "hasError":Z
    new-instance v33, Ljava/util/LinkedHashSet;

    move-object/from16 v0, v20

    array-length v7, v0

    move-object/from16 v0, v33

    invoke-direct {v0, v7}, Ljava/util/LinkedHashSet;-><init>(I)V

    .line 250
    .local v33, "seenIds":Ljava/util/Set;, "Ljava/util/Set<Ljava/lang/Integer;>;"
    move-object/from16 v11, v20

    .local v11, "arr$":[I
    array-length v0, v11

    move/from16 v22, v0

    .local v22, "len$":I
    const/16 v19, 0x0

    .local v19, "i$":I
    :goto_2
    move/from16 v0, v19

    move/from16 v1, v22

    if-ge v0, v1, :cond_7

    aget v4, v11, v19

    .line 251
    .local v4, "id":I
    invoke-static {v4}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v7

    move-object/from16 v0, v33

    invoke-interface {v0, v7}, Ljava/util/Set;->add(Ljava/lang/Object;)Z

    move-result v7

    if-nez v7, :cond_5

    .line 252
    const-string v7, "@%s annotation for method contains duplicate ID %d. (%s.%s)"

    const/16 v34, 0x4

    move/from16 v0, v34

    new-array v0, v0, [Ljava/lang/Object;

    move-object/from16 v34, v0

    const/16 v35, 0x0

    invoke-virtual/range {p1 .. p1}, Ljava/lang/Class;->getSimpleName()Ljava/lang/String;

    move-result-object v36

    aput-object v36, v34, v35

    const/16 v35, 0x1

    invoke-static {v4}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v36

    aput-object v36, v34, v35

    const/16 v35, 0x2

    invoke-interface {v14}, Ljavax/lang/model/element/TypeElement;->getQualifiedName()Ljavax/lang/model/element/Name;

    move-result-object v36

    aput-object v36, v34, v35

    const/16 v35, 0x3

    invoke-interface/range {p2 .. p2}, Ljavax/lang/model/element/Element;->getSimpleName()Ljavax/lang/model/element/Name;

    move-result-object v36

    aput-object v36, v34, v35

    move-object/from16 v0, p0

    move-object/from16 v1, p2

    move-object/from16 v2, v34

    invoke-direct {v0, v1, v7, v2}, Lbutterknife/internal/InjectViewProcessor;->error(Ljavax/lang/model/element/Element;Ljava/lang/String;[Ljava/lang/Object;)V

    .line 255
    const/16 v17, 0x1

    .line 250
    :cond_5
    add-int/lit8 v19, v19, 0x1

    goto :goto_2

    .line 244
    .end local v4    # "id":I
    .end local v8    # "required":Z
    .end local v11    # "arr$":[I
    .end local v17    # "hasError":Z
    .end local v19    # "i$":I
    .end local v22    # "len$":I
    .end local v33    # "seenIds":Ljava/util/Set;, "Ljava/util/Set<Ljava/lang/Integer;>;"
    :cond_6
    const/4 v8, 0x0

    goto :goto_1

    .line 259
    .restart local v8    # "required":Z
    .restart local v11    # "arr$":[I
    .restart local v17    # "hasError":Z
    .restart local v19    # "i$":I
    .restart local v22    # "len$":I
    .restart local v33    # "seenIds":Ljava/util/Set;, "Ljava/util/Set<Ljava/lang/Integer;>;"
    :cond_7
    const-class v7, Lbutterknife/internal/ListenerClass;

    move-object/from16 v0, p1

    invoke-virtual {v0, v7}, Ljava/lang/Class;->getAnnotation(Ljava/lang/Class;)Ljava/lang/annotation/Annotation;

    move-result-object v23

    check-cast v23, Lbutterknife/internal/ListenerClass;

    .line 260
    .local v23, "listenerClass":Lbutterknife/internal/ListenerClass;
    if-nez v23, :cond_8

    .line 261
    const-string v7, "No @%s defined on @%s."

    const/16 v34, 0x2

    move/from16 v0, v34

    new-array v0, v0, [Ljava/lang/Object;

    move-object/from16 v34, v0

    const/16 v35, 0x0

    const-class v36, Lbutterknife/internal/ListenerClass;

    invoke-virtual/range {v36 .. v36}, Ljava/lang/Class;->getSimpleName()Ljava/lang/String;

    move-result-object v36

    aput-object v36, v34, v35

    const/16 v35, 0x1

    invoke-virtual/range {p1 .. p1}, Ljava/lang/Class;->getSimpleName()Ljava/lang/String;

    move-result-object v36

    aput-object v36, v34, v35

    move-object/from16 v0, p0

    move-object/from16 v1, p2

    move-object/from16 v2, v34

    invoke-direct {v0, v1, v7, v2}, Lbutterknife/internal/InjectViewProcessor;->error(Ljavax/lang/model/element/Element;Ljava/lang/String;[Ljava/lang/Object;)V

    goto/16 :goto_0

    .line 267
    :cond_8
    invoke-interface/range {v23 .. v23}, Lbutterknife/internal/ListenerClass;->value()Ljava/lang/String;

    move-result-object v24

    .line 268
    .local v24, "listenerFqcn":Ljava/lang/String;
    sget-object v7, Lbutterknife/internal/InjectViewProcessor;->LISTENER_MAP:Ljava/util/Map;

    move-object/from16 v0, v24

    invoke-interface {v7, v0}, Ljava/util/Map;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v5

    check-cast v5, Lbutterknife/internal/Listener;

    .line 269
    .local v5, "listener":Lbutterknife/internal/Listener;
    if-nez v5, :cond_9

    .line 271
    :try_start_0
    move-object/from16 v0, p0

    iget-object v7, v0, Lbutterknife/internal/InjectViewProcessor;->elementUtils:Ljavax/lang/model/util/Elements;

    move-object/from16 v0, v24

    invoke-interface {v7, v0}, Ljavax/lang/model/util/Elements;->getTypeElement(Ljava/lang/CharSequence;)Ljavax/lang/model/element/TypeElement;

    move-result-object v7

    move-object/from16 v0, p0

    iget-object v0, v0, Lbutterknife/internal/InjectViewProcessor;->typeUtils:Ljavax/lang/model/util/Types;

    move-object/from16 v34, v0

    move-object/from16 v0, v34

    invoke-static {v7, v0}, Lbutterknife/internal/Listener;->from(Ljavax/lang/model/element/TypeElement;Ljavax/lang/model/util/Types;)Lbutterknife/internal/Listener;

    move-result-object v5

    .line 272
    sget-object v7, Lbutterknife/internal/InjectViewProcessor;->LISTENER_MAP:Ljava/util/Map;

    move-object/from16 v0, v24

    invoke-interface {v7, v0, v5}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;
    :try_end_0
    .catch Ljava/lang/IllegalArgumentException; {:try_start_0 .. :try_end_0} :catch_0

    .line 281
    :cond_9
    invoke-interface/range {v16 .. v16}, Ljavax/lang/model/element/ExecutableElement;->getParameters()Ljava/util/List;

    move-result-object v28

    .line 282
    .local v28, "methodParameters":Ljava/util/List;, "Ljava/util/List<+Ljavax/lang/model/element/VariableElement;>;"
    invoke-interface/range {v28 .. v28}, Ljava/util/List;->size()I

    move-result v7

    invoke-virtual {v5}, Lbutterknife/internal/Listener;->getParameterTypes()Ljava/util/List;

    move-result-object v34

    invoke-interface/range {v34 .. v34}, Ljava/util/List;->size()I

    move-result v34

    move/from16 v0, v34

    if-le v7, v0, :cond_a

    .line 283
    const-string v7, "@%s methods can have at most %s parameter(s). (%s.%s)"

    const/16 v34, 0x4

    move/from16 v0, v34

    new-array v0, v0, [Ljava/lang/Object;

    move-object/from16 v34, v0

    const/16 v35, 0x0

    invoke-virtual/range {p1 .. p1}, Ljava/lang/Class;->getSimpleName()Ljava/lang/String;

    move-result-object v36

    aput-object v36, v34, v35

    const/16 v35, 0x1

    invoke-virtual {v5}, Lbutterknife/internal/Listener;->getParameterTypes()Ljava/util/List;

    move-result-object v36

    invoke-interface/range {v36 .. v36}, Ljava/util/List;->size()I

    move-result v36

    invoke-static/range {v36 .. v36}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v36

    aput-object v36, v34, v35

    const/16 v35, 0x2

    invoke-interface {v14}, Ljavax/lang/model/element/TypeElement;->getQualifiedName()Ljavax/lang/model/element/Name;

    move-result-object v36

    aput-object v36, v34, v35

    const/16 v35, 0x3

    invoke-interface/range {p2 .. p2}, Ljavax/lang/model/element/Element;->getSimpleName()Ljavax/lang/model/element/Name;

    move-result-object v36

    aput-object v36, v34, v35

    move-object/from16 v0, p0

    move-object/from16 v1, p2

    move-object/from16 v2, v34

    invoke-direct {v0, v1, v7, v2}, Lbutterknife/internal/InjectViewProcessor;->error(Ljavax/lang/model/element/Element;Ljava/lang/String;[Ljava/lang/Object;)V

    .line 286
    const/16 v17, 0x1

    .line 290
    :cond_a
    invoke-interface/range {v16 .. v16}, Ljavax/lang/model/element/ExecutableElement;->getReturnType()Ljavax/lang/model/type/TypeMirror;

    move-result-object v7

    invoke-virtual {v7}, Ljava/lang/Object;->toString()Ljava/lang/String;

    move-result-object v7

    invoke-virtual {v5}, Lbutterknife/internal/Listener;->getReturnType()Ljava/lang/String;

    move-result-object v34

    move-object/from16 v0, v34

    invoke-virtual {v7, v0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v7

    if-nez v7, :cond_b

    .line 291
    const-string v7, "@%s methods must have a \'%s\' return type. (%s.%s)"

    const/16 v34, 0x4

    move/from16 v0, v34

    new-array v0, v0, [Ljava/lang/Object;

    move-object/from16 v34, v0

    const/16 v35, 0x0

    invoke-virtual/range {p1 .. p1}, Ljava/lang/Class;->getSimpleName()Ljava/lang/String;

    move-result-object v36

    aput-object v36, v34, v35

    const/16 v35, 0x1

    invoke-virtual {v5}, Lbutterknife/internal/Listener;->getReturnType()Ljava/lang/String;

    move-result-object v36

    aput-object v36, v34, v35

    const/16 v35, 0x2

    invoke-interface {v14}, Ljavax/lang/model/element/TypeElement;->getQualifiedName()Ljavax/lang/model/element/Name;

    move-result-object v36

    aput-object v36, v34, v35

    const/16 v35, 0x3

    invoke-interface/range {p2 .. p2}, Ljavax/lang/model/element/Element;->getSimpleName()Ljavax/lang/model/element/Name;

    move-result-object v36

    aput-object v36, v34, v35

    move-object/from16 v0, p0

    move-object/from16 v1, p2

    move-object/from16 v2, v34

    invoke-direct {v0, v1, v7, v2}, Lbutterknife/internal/InjectViewProcessor;->error(Ljavax/lang/model/element/Element;Ljava/lang/String;[Ljava/lang/Object;)V

    .line 294
    const/16 v17, 0x1

    .line 297
    :cond_b
    if-nez v17, :cond_1

    .line 301
    sget-object v32, Lbutterknife/internal/Parameter;->NONE:[Lbutterknife/internal/Parameter;

    .line 302
    .local v32, "parameters":[Lbutterknife/internal/Parameter;
    invoke-interface/range {v28 .. v28}, Ljava/util/List;->isEmpty()Z

    move-result v7

    if-nez v7, :cond_13

    .line 303
    invoke-interface/range {v28 .. v28}, Ljava/util/List;->size()I

    move-result v7

    new-array v0, v7, [Lbutterknife/internal/Parameter;

    move-object/from16 v32, v0

    .line 304
    new-instance v27, Ljava/util/BitSet;

    invoke-interface/range {v28 .. v28}, Ljava/util/List;->size()I

    move-result v7

    move-object/from16 v0, v27

    invoke-direct {v0, v7}, Ljava/util/BitSet;-><init>(I)V

    .line 305
    .local v27, "methodParameterUsed":Ljava/util/BitSet;
    invoke-virtual {v5}, Lbutterknife/internal/Listener;->getParameterTypes()Ljava/util/List;

    move-result-object v31

    .line 306
    .local v31, "parameterTypes":Ljava/util/List;, "Ljava/util/List<Ljava/lang/String;>;"
    const/16 v18, 0x0

    .local v18, "i":I
    :goto_3
    invoke-interface/range {v28 .. v28}, Ljava/util/List;->size()I

    move-result v7

    move/from16 v0, v18

    if-ge v0, v7, :cond_13

    .line 307
    move-object/from16 v0, v28

    move/from16 v1, v18

    invoke-interface {v0, v1}, Ljava/util/List;->get(I)Ljava/lang/Object;

    move-result-object v25

    check-cast v25, Ljavax/lang/model/element/VariableElement;

    .line 308
    .local v25, "methodParameter":Ljavax/lang/model/element/VariableElement;
    invoke-interface/range {v25 .. v25}, Ljavax/lang/model/element/VariableElement;->asType()Ljavax/lang/model/type/TypeMirror;

    move-result-object v26

    .line 310
    .local v26, "methodParameterType":Ljavax/lang/model/type/TypeMirror;
    const/16 v21, 0x0

    .local v21, "j":I
    :goto_4
    invoke-interface/range {v31 .. v31}, Ljava/util/List;->size()I

    move-result v7

    move/from16 v0, v21

    if-ge v0, v7, :cond_e

    .line 311
    move-object/from16 v0, v27

    move/from16 v1, v21

    invoke-virtual {v0, v1}, Ljava/util/BitSet;->get(I)Z

    move-result v7

    if-eqz v7, :cond_d

    .line 310
    :cond_c
    add-int/lit8 v21, v21, 0x1

    goto :goto_4

    .line 273
    .end local v18    # "i":I
    .end local v21    # "j":I
    .end local v25    # "methodParameter":Ljavax/lang/model/element/VariableElement;
    .end local v26    # "methodParameterType":Ljavax/lang/model/type/TypeMirror;
    .end local v27    # "methodParameterUsed":Ljava/util/BitSet;
    .end local v28    # "methodParameters":Ljava/util/List;, "Ljava/util/List<+Ljavax/lang/model/element/VariableElement;>;"
    .end local v31    # "parameterTypes":Ljava/util/List;, "Ljava/util/List<Ljava/lang/String;>;"
    .end local v32    # "parameters":[Lbutterknife/internal/Parameter;
    :catch_0
    move-exception v13

    .line 274
    .local v13, "e":Ljava/lang/IllegalArgumentException;
    move-object/from16 v0, p0

    iget-object v7, v0, Lbutterknife/internal/InjectViewProcessor;->elementUtils:Ljavax/lang/model/util/Elements;

    invoke-virtual/range {p1 .. p1}, Ljava/lang/Class;->getName()Ljava/lang/String;

    move-result-object v34

    move-object/from16 v0, v34

    invoke-interface {v7, v0}, Ljavax/lang/model/util/Elements;->getTypeElement(Ljava/lang/CharSequence;)Ljavax/lang/model/element/TypeElement;

    move-result-object v7

    const-string v34, "%s (%s on @%s)"

    const/16 v35, 0x3

    move/from16 v0, v35

    new-array v0, v0, [Ljava/lang/Object;

    move-object/from16 v35, v0

    const/16 v36, 0x0

    invoke-virtual {v13}, Ljava/lang/IllegalArgumentException;->getMessage()Ljava/lang/String;

    move-result-object v37

    aput-object v37, v35, v36

    const/16 v36, 0x1

    aput-object v24, v35, v36

    const/16 v36, 0x2

    invoke-virtual/range {p1 .. p1}, Ljava/lang/Class;->getName()Ljava/lang/String;

    move-result-object v37

    aput-object v37, v35, v36

    move-object/from16 v0, p0

    move-object/from16 v1, v34

    move-object/from16 v2, v35

    invoke-direct {v0, v7, v1, v2}, Lbutterknife/internal/InjectViewProcessor;->error(Ljavax/lang/model/element/Element;Ljava/lang/String;[Ljava/lang/Object;)V

    goto/16 :goto_0

    .line 314
    .end local v13    # "e":Ljava/lang/IllegalArgumentException;
    .restart local v18    # "i":I
    .restart local v21    # "j":I
    .restart local v25    # "methodParameter":Ljavax/lang/model/element/VariableElement;
    .restart local v26    # "methodParameterType":Ljavax/lang/model/type/TypeMirror;
    .restart local v27    # "methodParameterUsed":Ljava/util/BitSet;
    .restart local v28    # "methodParameters":Ljava/util/List;, "Ljava/util/List<+Ljavax/lang/model/element/VariableElement;>;"
    .restart local v31    # "parameterTypes":Ljava/util/List;, "Ljava/util/List<Ljava/lang/String;>;"
    .restart local v32    # "parameters":[Lbutterknife/internal/Parameter;
    :cond_d
    move-object/from16 v0, v31

    move/from16 v1, v21

    invoke-interface {v0, v1}, Ljava/util/List;->get(I)Ljava/lang/Object;

    move-result-object v7

    check-cast v7, Ljava/lang/String;

    move-object/from16 v0, p0

    move-object/from16 v1, v26

    invoke-direct {v0, v1, v7}, Lbutterknife/internal/InjectViewProcessor;->isSubtypeOfType(Ljavax/lang/model/type/TypeMirror;Ljava/lang/String;)Z

    move-result v7

    if-eqz v7, :cond_c

    .line 315
    new-instance v7, Lbutterknife/internal/Parameter;

    invoke-virtual/range {v26 .. v26}, Ljava/lang/Object;->toString()Ljava/lang/String;

    move-result-object v34

    move/from16 v0, v21

    move-object/from16 v1, v34

    invoke-direct {v7, v0, v1}, Lbutterknife/internal/Parameter;-><init>(ILjava/lang/String;)V

    aput-object v7, v32, v18

    .line 316
    move-object/from16 v0, v27

    move/from16 v1, v21

    invoke-virtual {v0, v1}, Ljava/util/BitSet;->set(I)V

    .line 320
    :cond_e
    aget-object v7, v32, v18

    if-nez v7, :cond_12

    .line 321
    new-instance v12, Ljava/lang/StringBuilder;

    invoke-direct {v12}, Ljava/lang/StringBuilder;-><init>()V

    .line 322
    .local v12, "builder":Ljava/lang/StringBuilder;
    const-string v7, "Unable to match @"

    invoke-virtual {v12, v7}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v7

    invoke-virtual/range {p1 .. p1}, Ljava/lang/Class;->getSimpleName()Ljava/lang/String;

    move-result-object v34

    move-object/from16 v0, v34

    invoke-virtual {v7, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v7

    const-string v34, " method arguments. ("

    move-object/from16 v0, v34

    invoke-virtual {v7, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v7

    invoke-interface {v14}, Ljavax/lang/model/element/TypeElement;->getQualifiedName()Ljavax/lang/model/element/Name;

    move-result-object v34

    move-object/from16 v0, v34

    invoke-virtual {v7, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/CharSequence;)Ljava/lang/StringBuilder;

    move-result-object v7

    const/16 v34, 0x2e

    move/from16 v0, v34

    invoke-virtual {v7, v0}, Ljava/lang/StringBuilder;->append(C)Ljava/lang/StringBuilder;

    move-result-object v7

    invoke-interface/range {p2 .. p2}, Ljavax/lang/model/element/Element;->getSimpleName()Ljavax/lang/model/element/Name;

    move-result-object v34

    move-object/from16 v0, v34

    invoke-virtual {v7, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/CharSequence;)Ljava/lang/StringBuilder;

    move-result-object v7

    const/16 v34, 0x29

    move/from16 v0, v34

    invoke-virtual {v7, v0}, Ljava/lang/StringBuilder;->append(C)Ljava/lang/StringBuilder;

    .line 329
    const/16 v21, 0x0

    :goto_5
    move-object/from16 v0, v32

    array-length v7, v0

    move/from16 v0, v21

    if-ge v0, v7, :cond_10

    .line 330
    aget-object v29, v32, v21

    .line 331
    .local v29, "parameter":Lbutterknife/internal/Parameter;
    const-string v7, "\n\n  Parameter #"

    invoke-virtual {v12, v7}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v7

    add-int/lit8 v34, v21, 0x1

    move/from16 v0, v34

    invoke-virtual {v7, v0}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v7

    const-string v34, ": "

    move-object/from16 v0, v34

    invoke-virtual {v7, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v34

    move-object/from16 v0, v28

    move/from16 v1, v21

    invoke-interface {v0, v1}, Ljava/util/List;->get(I)Ljava/lang/Object;

    move-result-object v7

    check-cast v7, Ljavax/lang/model/element/VariableElement;

    invoke-interface {v7}, Ljavax/lang/model/element/VariableElement;->asType()Ljavax/lang/model/type/TypeMirror;

    move-result-object v7

    invoke-virtual {v7}, Ljava/lang/Object;->toString()Ljava/lang/String;

    move-result-object v7

    move-object/from16 v0, v34

    invoke-virtual {v0, v7}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v7

    const-string v34, "\n    "

    move-object/from16 v0, v34

    invoke-virtual {v7, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 336
    if-nez v29, :cond_f

    .line 337
    const-string v7, "did not match any listener parameters"

    invoke-virtual {v12, v7}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 329
    :goto_6
    add-int/lit8 v21, v21, 0x1

    goto :goto_5

    .line 339
    :cond_f
    const-string v7, "matched listener parameter #"

    invoke-virtual {v12, v7}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v7

    invoke-virtual/range {v29 .. v29}, Lbutterknife/internal/Parameter;->getListenerPosition()I

    move-result v34

    add-int/lit8 v34, v34, 0x1

    move/from16 v0, v34

    invoke-virtual {v7, v0}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v7

    const-string v34, ": "

    move-object/from16 v0, v34

    invoke-virtual {v7, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v7

    invoke-virtual/range {v29 .. v29}, Lbutterknife/internal/Parameter;->getType()Ljava/lang/String;

    move-result-object v34

    move-object/from16 v0, v34

    invoke-virtual {v7, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    goto :goto_6

    .line 345
    .end local v29    # "parameter":Lbutterknife/internal/Parameter;
    :cond_10
    const-string v7, "\n\nMethods may have up to "

    invoke-virtual {v12, v7}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v7

    invoke-virtual {v5}, Lbutterknife/internal/Listener;->getParameterTypes()Ljava/util/List;

    move-result-object v34

    invoke-interface/range {v34 .. v34}, Ljava/util/List;->size()I

    move-result v34

    move/from16 v0, v34

    invoke-virtual {v7, v0}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v7

    const-string v34, " parameter(s):\n"

    move-object/from16 v0, v34

    invoke-virtual {v7, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 348
    invoke-virtual {v5}, Lbutterknife/internal/Listener;->getParameterTypes()Ljava/util/List;

    move-result-object v7

    invoke-interface {v7}, Ljava/util/List;->iterator()Ljava/util/Iterator;

    move-result-object v19

    .local v19, "i$":Ljava/util/Iterator;
    :goto_7
    invoke-interface/range {v19 .. v19}, Ljava/util/Iterator;->hasNext()Z

    move-result v7

    if-eqz v7, :cond_11

    invoke-interface/range {v19 .. v19}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v30

    check-cast v30, Ljava/lang/String;

    .line 349
    .local v30, "parameterType":Ljava/lang/String;
    const-string v7, "\n  "

    invoke-virtual {v12, v7}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v7

    move-object/from16 v0, v30

    invoke-virtual {v7, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    goto :goto_7

    .line 351
    .end local v30    # "parameterType":Ljava/lang/String;
    :cond_11
    const-string v7, "\n\nThese may be listed in any order but will be searched for from top to bottom."

    invoke-virtual {v12, v7}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 353
    invoke-virtual {v12}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v7

    const/16 v34, 0x0

    move/from16 v0, v34

    new-array v0, v0, [Ljava/lang/Object;

    move-object/from16 v34, v0

    move-object/from16 v0, p0

    move-object/from16 v1, v16

    move-object/from16 v2, v34

    invoke-direct {v0, v1, v7, v2}, Lbutterknife/internal/InjectViewProcessor;->error(Ljavax/lang/model/element/Element;Ljava/lang/String;[Ljava/lang/Object;)V

    goto/16 :goto_0

    .line 306
    .end local v12    # "builder":Ljava/lang/StringBuilder;
    .local v19, "i$":I
    :cond_12
    add-int/lit8 v18, v18, 0x1

    goto/16 :goto_3

    .line 359
    .end local v18    # "i":I
    .end local v21    # "j":I
    .end local v25    # "methodParameter":Ljavax/lang/model/element/VariableElement;
    .end local v26    # "methodParameterType":Ljavax/lang/model/type/TypeMirror;
    .end local v27    # "methodParameterUsed":Ljava/util/BitSet;
    .end local v31    # "parameterTypes":Ljava/util/List;, "Ljava/util/List<Ljava/lang/String;>;"
    :cond_13
    move-object/from16 v0, p0

    move-object/from16 v1, p3

    invoke-direct {v0, v1, v14}, Lbutterknife/internal/InjectViewProcessor;->getOrCreateTargetClass(Ljava/util/Map;Ljavax/lang/model/element/TypeElement;)Lbutterknife/internal/ViewInjector;

    move-result-object v3

    .line 360
    .local v3, "viewInjector":Lbutterknife/internal/ViewInjector;
    move-object/from16 v11, v20

    array-length v0, v11

    move/from16 v22, v0

    const/16 v19, 0x0

    :goto_8
    move/from16 v0, v19

    move/from16 v1, v22

    if-ge v0, v1, :cond_15

    aget v4, v11, v19

    .line 361
    .restart local v4    # "id":I
    invoke-static/range {v32 .. v32}, Ljava/util/Arrays;->asList([Ljava/lang/Object;)Ljava/util/List;

    move-result-object v7

    invoke-virtual/range {v3 .. v8}, Lbutterknife/internal/ViewInjector;->addMethod(ILbutterknife/internal/Listener;Ljava/lang/String;Ljava/util/List;Z)Z

    move-result v7

    if-nez v7, :cond_14

    .line 362
    const-string v7, "Multiple @%s methods declared for ID %s in %s."

    const/16 v34, 0x3

    move/from16 v0, v34

    new-array v0, v0, [Ljava/lang/Object;

    move-object/from16 v34, v0

    const/16 v35, 0x0

    invoke-virtual/range {p1 .. p1}, Ljava/lang/Class;->getSimpleName()Ljava/lang/String;

    move-result-object v36

    aput-object v36, v34, v35

    const/16 v35, 0x1

    invoke-static {v4}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v36

    aput-object v36, v34, v35

    const/16 v35, 0x2

    invoke-interface {v14}, Ljavax/lang/model/element/TypeElement;->getQualifiedName()Ljavax/lang/model/element/Name;

    move-result-object v36

    aput-object v36, v34, v35

    move-object/from16 v0, p0

    move-object/from16 v1, p2

    move-object/from16 v2, v34

    invoke-direct {v0, v1, v7, v2}, Lbutterknife/internal/InjectViewProcessor;->error(Ljavax/lang/model/element/Element;Ljava/lang/String;[Ljava/lang/Object;)V

    goto/16 :goto_0

    .line 360
    :cond_14
    add-int/lit8 v19, v19, 0x1

    goto :goto_8

    .line 369
    .end local v4    # "id":I
    :cond_15
    move-object/from16 v0, p0

    iget-object v7, v0, Lbutterknife/internal/InjectViewProcessor;->typeUtils:Ljavax/lang/model/util/Types;

    invoke-interface {v14}, Ljavax/lang/model/element/TypeElement;->asType()Ljavax/lang/model/type/TypeMirror;

    move-result-object v34

    move-object/from16 v0, v34

    invoke-interface {v7, v0}, Ljavax/lang/model/util/Types;->erasure(Ljavax/lang/model/type/TypeMirror;)Ljavax/lang/model/type/TypeMirror;

    move-result-object v15

    .line 370
    .local v15, "erasedTargetType":Ljavax/lang/model/type/TypeMirror;
    move-object/from16 v0, p4

    invoke-interface {v0, v15}, Ljava/util/Set;->add(Ljava/lang/Object;)Z

    goto/16 :goto_0
.end method


# virtual methods
.method public getSupportedAnnotationTypes()Ljava/util/Set;
    .locals 4
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()",
            "Ljava/util/Set",
            "<",
            "Ljava/lang/String;",
            ">;"
        }
    .end annotation

    .prologue
    .line 76
    new-instance v2, Ljava/util/LinkedHashSet;

    invoke-direct {v2}, Ljava/util/LinkedHashSet;-><init>()V

    .line 77
    .local v2, "supportTypes":Ljava/util/Set;, "Ljava/util/Set<Ljava/lang/String;>;"
    const-class v3, Lbutterknife/InjectView;

    invoke-virtual {v3}, Ljava/lang/Class;->getCanonicalName()Ljava/lang/String;

    move-result-object v3

    invoke-interface {v2, v3}, Ljava/util/Set;->add(Ljava/lang/Object;)Z

    .line 78
    sget-object v3, Lbutterknife/internal/InjectViewProcessor;->LISTENERS:Ljava/util/List;

    invoke-interface {v3}, Ljava/util/List;->iterator()Ljava/util/Iterator;

    move-result-object v0

    .local v0, "i$":Ljava/util/Iterator;
    :goto_0
    invoke-interface {v0}, Ljava/util/Iterator;->hasNext()Z

    move-result v3

    if-eqz v3, :cond_0

    invoke-interface {v0}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Ljava/lang/Class;

    .line 79
    .local v1, "listener":Ljava/lang/Class;, "Ljava/lang/Class<+Ljava/lang/annotation/Annotation;>;"
    invoke-virtual {v1}, Ljava/lang/Class;->getCanonicalName()Ljava/lang/String;

    move-result-object v3

    invoke-interface {v2, v3}, Ljava/util/Set;->add(Ljava/lang/Object;)Z

    goto :goto_0

    .line 82
    .end local v1    # "listener":Ljava/lang/Class;, "Ljava/lang/Class<+Ljava/lang/annotation/Annotation;>;"
    :cond_0
    return-object v2
.end method

.method public getSupportedSourceVersion()Ljavax/lang/model/SourceVersion;
    .locals 1

    .prologue
    .line 461
    invoke-static {}, Ljavax/lang/model/SourceVersion;->latestSupported()Ljavax/lang/model/SourceVersion;

    move-result-object v0

    return-object v0
.end method

.method public declared-synchronized init(Ljavax/annotation/processing/ProcessingEnvironment;)V
    .locals 1
    .param p1, "env"    # Ljavax/annotation/processing/ProcessingEnvironment;

    .prologue
    .line 68
    monitor-enter p0

    :try_start_0
    invoke-super {p0, p1}, Ljavax/annotation/processing/AbstractProcessor;->init(Ljavax/annotation/processing/ProcessingEnvironment;)V

    .line 70
    invoke-interface {p1}, Ljavax/annotation/processing/ProcessingEnvironment;->getElementUtils()Ljavax/lang/model/util/Elements;

    move-result-object v0

    iput-object v0, p0, Lbutterknife/internal/InjectViewProcessor;->elementUtils:Ljavax/lang/model/util/Elements;

    .line 71
    invoke-interface {p1}, Ljavax/annotation/processing/ProcessingEnvironment;->getTypeUtils()Ljavax/lang/model/util/Types;

    move-result-object v0

    iput-object v0, p0, Lbutterknife/internal/InjectViewProcessor;->typeUtils:Ljavax/lang/model/util/Types;

    .line 72
    invoke-interface {p1}, Ljavax/annotation/processing/ProcessingEnvironment;->getFiler()Ljavax/annotation/processing/Filer;

    move-result-object v0

    iput-object v0, p0, Lbutterknife/internal/InjectViewProcessor;->filer:Ljavax/annotation/processing/Filer;
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    .line 73
    monitor-exit p0

    return-void

    .line 68
    :catchall_0
    move-exception v0

    monitor-exit p0

    throw v0
.end method

.method public process(Ljava/util/Set;Ljavax/annotation/processing/RoundEnvironment;)Z
    .locals 12
    .param p2, "env"    # Ljavax/annotation/processing/RoundEnvironment;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/util/Set",
            "<+",
            "Ljavax/lang/model/element/TypeElement;",
            ">;",
            "Ljavax/annotation/processing/RoundEnvironment;",
            ")Z"
        }
    .end annotation

    .prologue
    .line 86
    .local p1, "elements":Ljava/util/Set;, "Ljava/util/Set<+Ljavax/lang/model/element/TypeElement;>;"
    invoke-direct {p0, p2}, Lbutterknife/internal/InjectViewProcessor;->findAndParseTargets(Ljavax/annotation/processing/RoundEnvironment;)Ljava/util/Map;

    move-result-object v4

    .line 88
    .local v4, "targetClassMap":Ljava/util/Map;, "Ljava/util/Map<Ljavax/lang/model/element/TypeElement;Lbutterknife/internal/ViewInjector;>;"
    invoke-interface {v4}, Ljava/util/Map;->entrySet()Ljava/util/Set;

    move-result-object v8

    invoke-interface {v8}, Ljava/util/Set;->iterator()Ljava/util/Iterator;

    move-result-object v2

    .local v2, "i$":Ljava/util/Iterator;
    :goto_0
    invoke-interface {v2}, Ljava/util/Iterator;->hasNext()Z

    move-result v8

    if-eqz v8, :cond_0

    invoke-interface {v2}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Ljava/util/Map$Entry;

    .line 89
    .local v1, "entry":Ljava/util/Map$Entry;, "Ljava/util/Map$Entry<Ljavax/lang/model/element/TypeElement;Lbutterknife/internal/ViewInjector;>;"
    invoke-interface {v1}, Ljava/util/Map$Entry;->getKey()Ljava/lang/Object;

    move-result-object v5

    check-cast v5, Ljavax/lang/model/element/TypeElement;

    .line 90
    .local v5, "typeElement":Ljavax/lang/model/element/TypeElement;
    invoke-interface {v1}, Ljava/util/Map$Entry;->getValue()Ljava/lang/Object;

    move-result-object v6

    check-cast v6, Lbutterknife/internal/ViewInjector;

    .line 93
    .local v6, "viewInjector":Lbutterknife/internal/ViewInjector;
    :try_start_0
    iget-object v8, p0, Lbutterknife/internal/InjectViewProcessor;->filer:Ljavax/annotation/processing/Filer;

    invoke-virtual {v6}, Lbutterknife/internal/ViewInjector;->getFqcn()Ljava/lang/String;

    move-result-object v9

    const/4 v10, 0x1

    new-array v10, v10, [Ljavax/lang/model/element/Element;

    const/4 v11, 0x0

    aput-object v5, v10, v11

    invoke-interface {v8, v9, v10}, Ljavax/annotation/processing/Filer;->createSourceFile(Ljava/lang/CharSequence;[Ljavax/lang/model/element/Element;)Ljavax/tools/JavaFileObject;

    move-result-object v3

    .line 94
    .local v3, "jfo":Ljavax/tools/JavaFileObject;
    invoke-interface {v3}, Ljavax/tools/JavaFileObject;->openWriter()Ljava/io/Writer;

    move-result-object v7

    .line 95
    .local v7, "writer":Ljava/io/Writer;
    invoke-virtual {v6}, Lbutterknife/internal/ViewInjector;->brewJava()Ljava/lang/String;

    move-result-object v8

    invoke-virtual {v7, v8}, Ljava/io/Writer;->write(Ljava/lang/String;)V

    .line 96
    invoke-virtual {v7}, Ljava/io/Writer;->flush()V

    .line 97
    invoke-virtual {v7}, Ljava/io/Writer;->close()V
    :try_end_0
    .catch Ljava/io/IOException; {:try_start_0 .. :try_end_0} :catch_0

    goto :goto_0

    .line 98
    .end local v3    # "jfo":Ljavax/tools/JavaFileObject;
    .end local v7    # "writer":Ljava/io/Writer;
    :catch_0
    move-exception v0

    .line 99
    .local v0, "e":Ljava/io/IOException;
    const-string v8, "Unable to write injector for type %s: %s"

    const/4 v9, 0x2

    new-array v9, v9, [Ljava/lang/Object;

    const/4 v10, 0x0

    aput-object v5, v9, v10

    const/4 v10, 0x1

    invoke-virtual {v0}, Ljava/io/IOException;->getMessage()Ljava/lang/String;

    move-result-object v11

    aput-object v11, v9, v10

    invoke-direct {p0, v5, v8, v9}, Lbutterknife/internal/InjectViewProcessor;->error(Ljavax/lang/model/element/Element;Ljava/lang/String;[Ljava/lang/Object;)V

    goto :goto_0

    .line 103
    .end local v0    # "e":Ljava/io/IOException;
    .end local v1    # "entry":Ljava/util/Map$Entry;, "Ljava/util/Map$Entry<Ljavax/lang/model/element/TypeElement;Lbutterknife/internal/ViewInjector;>;"
    .end local v5    # "typeElement":Ljavax/lang/model/element/TypeElement;
    .end local v6    # "viewInjector":Lbutterknife/internal/ViewInjector;
    :cond_0
    const/4 v8, 0x1

    return v8
.end method
