class Product {
  Product({
    required this.id,
    required this.name,
    required this.slug,
    required this.permalink,
    required this.dateCreated,
    required this.dateCreatedGmt,
    required this.dateModified,
    required this.dateModifiedGmt,
    required this.type,
    required this.status,
    required this.featured,
    required this.catalogVisibility,
    required this.description,
    required this.shortDescription,
    required this.sku,
    required this.price,
    required this.regularPrice,
    required this.salePrice,
    this.dateOnSaleFrom,
    this.dateOnSaleFromGmt,
    this.dateOnSaleTo,
    this.dateOnSaleToGmt,
    required this.priceHtml,
    required this.onSale,
    required this.purchasable,
    required this.totalSales,
    required this.virtual,
    required this.downloadable,
    required this.downloads,
    required this.downloadLimit,
    required this.downloadExpiry,
    required this.externalUrl,
    required this.buttonText,
    required this.taxStatus,
    required this.taxClass,
    required this.manageStock,
    this.stockQuantity,
    required this.stockStatus,
    required this.backorders,
    required this.backordersAllowed,
    required this.backordered,
    required this.soldIndividually,
    required this.weight,
    required this.dimensions,
    required this.shippingRequired,
    required this.shippingTaxable,
    required this.shippingClass,
    required this.shippingClassId,
    required this.reviewsAllowed,
    required this.averageRating,
    required this.ratingCount,
    required this.relatedIds,
    required this.upsellIds,
    required this.crossSellIds,
    required this.parentId,
    required this.purchaseNote,
    required this.categories,
    required this.tags,
    required this.images,
    required this.attributes,
    required this.defaultAttributes,
    required this.variations,
    required this.groupedProducts,
    required this.menuOrder,
    required this.metaData,
    required this.links,
  });
  late final int id;
  late final String name;
  late final String slug;
  late final String permalink;
  late final String dateCreated;
  late final String dateCreatedGmt;
  late final String dateModified;
  late final String dateModifiedGmt;
  late final String type;
  late final String status;
  late final bool featured;
  late final String catalogVisibility;
  late final String description;
  late final String shortDescription;
  late final String sku;
  late final double? price;
  late final double? regularPrice;
  late final double? salePrice;
  late final Null dateOnSaleFrom;
  late final Null dateOnSaleFromGmt;
  late final Null dateOnSaleTo;
  late final Null dateOnSaleToGmt;
  late final String? priceHtml;
  late final bool onSale;
  late final bool purchasable;
  late final int totalSales;
  late final bool virtual;
  late final bool downloadable;
  late final List<dynamic> downloads;
  late final int downloadLimit;
  late final int downloadExpiry;
  late final String? externalUrl;
  late final String? buttonText;
  late final String? taxStatus;
  late final String? taxClass;
  late final bool manageStock;
  late final Null stockQuantity;
  late final String? stockStatus;
  late final String? backorders;
  late final bool backordersAllowed;
  late final bool backordered;
  late final bool soldIndividually;
  late final String? weight;
  late final Dimensions dimensions;
  late final bool shippingRequired;
  late final bool shippingTaxable;
  late final String? shippingClass;
  late final int shippingClassId;
  late final bool reviewsAllowed;
  late final String? averageRating;
  late final int ratingCount;
  late final List<int> relatedIds;
  late final List<dynamic> upsellIds;
  late final List<dynamic> crossSellIds;
  late final int parentId;
  late final String? purchaseNote;
  late final List<Categories> categories;
  late final List<dynamic> tags;
  late final List<Images> images;
  late final List<dynamic> attributes;
  late final List<dynamic> defaultAttributes;
  late final List<dynamic> variations;
  late final List<dynamic> groupedProducts;
  late final int menuOrder;
  late final List<dynamic> metaData;
  late final Links links;

  Product.fromJson(Map<String?, dynamic> json) {
    id = json['id'];
    name = json['name'];
    slug = json['slug'];
    permalink = json['permalink'];
    dateCreated = json['date_created'];
    dateCreatedGmt = json['date_created_gmt'];
    dateModified = json['date_modified'];
    dateModifiedGmt = json['date_modified_gmt'];
    type = json['type'];
    status = json['status'];
    featured = json['featured'];
    catalogVisibility = json['catalog_visibility'];
    description = json['description'];
    shortDescription = json['short_description'];
    sku = json['sku'];
    price = double.tryParse(json['price'].toString());
    regularPrice = double.tryParse(json['regular_price'].toString());
    salePrice = double.tryParse(json['sale_price'].toString());
    dateOnSaleFrom = null;
    dateOnSaleFromGmt = null;
    dateOnSaleTo = null;
    dateOnSaleToGmt = null;
    priceHtml = json['price_html'];
    onSale = json['on_sale'];
    purchasable = json['purchasable'];
    // totalSales = int.parse(json['total_sales']);
    totalSales = 0;
    virtual = json['virtual'];
    downloadable = json['downloadable'];
    downloads = List.castFrom<dynamic, dynamic>(json['downloads']);
    downloadLimit = json['download_limit'];
    downloadExpiry = json['download_expiry'];
    externalUrl = json['external_url'];
    buttonText = json['button_text'];
    taxStatus = json['tax_status'];
    taxClass = json['tax_class'];
    manageStock = json['manage_stock'];
    stockQuantity = null;
    stockStatus = json['stock_status'];
    backorders = json['backorders'];
    backordersAllowed = json['backorders_allowed'];
    backordered = json['backordered'];
    soldIndividually = json['sold_individually'];
    weight = json['weight'];
    dimensions = Dimensions.fromJson(json['dimensions']);
    shippingRequired = json['shipping_required'];
    shippingTaxable = json['shipping_taxable'];
    shippingClass = json['shipping_class'];
    shippingClassId = json['shipping_class_id'];
    reviewsAllowed = json['reviews_allowed'];
    averageRating = json['average_rating'];
    ratingCount = json['rating_count'];
    relatedIds = List.castFrom<dynamic, int>(json['related_ids']);
    upsellIds = List.castFrom<dynamic, dynamic>(json['upsell_ids']);
    crossSellIds = List.castFrom<dynamic, dynamic>(json['cross_sell_ids']);
    parentId = json['parent_id'];
    purchaseNote = json['purchase_note'];
    categories = List.from(json['categories'])
        .map((e) => Categories.fromJson(e))
        .toList();
    tags = List.castFrom<dynamic, dynamic>(json['tags']);
    images = List.from(json['images']).map((e) => Images.fromJson(e)).toList();
    attributes = List.castFrom<dynamic, dynamic>(json['attributes']);
    defaultAttributes =
        List.castFrom<dynamic, dynamic>(json['default_attributes']);
    variations = List.castFrom<dynamic, dynamic>(json['variations']);
    groupedProducts = List.castFrom<dynamic, dynamic>(json['grouped_products']);
    menuOrder = json['menu_order'];
    metaData = List.castFrom<dynamic, dynamic>(json['meta_data']);
    links = Links.fromJson(json['_links']);
  }

  Map<String?, dynamic> toJson() {
    final _data = <String?, dynamic>{};
    _data['id'] = id;
    _data['name'] = name;
    _data['slug'] = slug;
    _data['permalink'] = permalink;
    _data['date_created'] = dateCreated;
    _data['date_created_gmt'] = dateCreatedGmt;
    _data['date_modified'] = dateModified;
    _data['date_modified_gmt'] = dateModifiedGmt;
    _data['type'] = type;
    _data['status'] = status;
    _data['featured'] = featured;
    _data['catalog_visibility'] = catalogVisibility;
    _data['description'] = description;
    _data['short_description'] = shortDescription;
    _data['sku'] = sku;
    _data['price'] = price;
    _data['regular_price'] = regularPrice;
    _data['sale_price'] = salePrice;
    _data['date_on_sale_from'] = dateOnSaleFrom;
    _data['date_on_sale_from_gmt'] = dateOnSaleFromGmt;
    _data['date_on_sale_to'] = dateOnSaleTo;
    _data['date_on_sale_to_gmt'] = dateOnSaleToGmt;
    _data['price_html'] = priceHtml;
    _data['on_sale'] = onSale;
    _data['purchasable'] = purchasable;
    _data['total_sales'] = totalSales;
    _data['virtual'] = virtual;
    _data['downloadable'] = downloadable;
    _data['downloads'] = downloads;
    _data['download_limit'] = downloadLimit;
    _data['download_expiry'] = downloadExpiry;
    _data['external_url'] = externalUrl;
    _data['button_text'] = buttonText;
    _data['tax_status'] = taxStatus;
    _data['tax_class'] = taxClass;
    _data['manage_stock'] = manageStock;
    _data['stock_quantity'] = stockQuantity;
    _data['stock_status'] = stockStatus;
    _data['backorders'] = backorders;
    _data['backorders_allowed'] = backordersAllowed;
    _data['backordered'] = backordered;
    _data['sold_individually'] = soldIndividually;
    _data['weight'] = weight;
    _data['dimensions'] = dimensions.toJson();
    _data['shipping_required'] = shippingRequired;
    _data['shipping_taxable'] = shippingTaxable;
    _data['shipping_class'] = shippingClass;
    _data['shipping_class_id'] = shippingClassId;
    _data['reviews_allowed'] = reviewsAllowed;
    _data['average_rating'] = averageRating;
    _data['rating_count'] = ratingCount;
    _data['related_ids'] = relatedIds;
    _data['upsell_ids'] = upsellIds;
    _data['cross_sell_ids'] = crossSellIds;
    _data['parent_id'] = parentId;
    _data['purchase_note'] = purchaseNote;
    _data['categories'] = categories.map((e) => e.toJson()).toList();
    _data['tags'] = tags;
    _data['images'] = images.map((e) => e.toJson()).toList();
    _data['attributes'] = attributes;
    _data['default_attributes'] = defaultAttributes;
    _data['variations'] = variations;
    _data['grouped_products'] = groupedProducts;
    _data['menu_order'] = menuOrder;
    _data['meta_data'] = metaData;
    _data['_links'] = links.toJson();
    return _data;
  }
}

class Dimensions {
  Dimensions({
    required this.length,
    required this.width,
    required this.height,
  });
  late final String? length;
  late final String? width;
  late final String? height;

  Dimensions.fromJson(Map<String?, dynamic> json) {
    length = json['length'];
    width = json['width'];
    height = json['height'];
  }

  Map<String?, dynamic> toJson() {
    final _data = <String?, dynamic>{};
    _data['length'] = length;
    _data['width'] = width;
    _data['height'] = height;
    return _data;
  }
}

class Categories {
  Categories({
    required this.id,
    required this.name,
    required this.slug,
  });
  late final int id;
  late final String? name;
  late final String? slug;

  Categories.fromJson(Map<String?, dynamic> json) {
    id = json['id'];
    name = json['name'];
    slug = json['slug'];
  }

  Map<String?, dynamic> toJson() {
    final _data = <String?, dynamic>{};
    _data['id'] = id;
    _data['name'] = name;
    _data['slug'] = slug;
    return _data;
  }
}

class Images {
  Images({
    required this.id,
    required this.dateCreated,
    required this.dateCreatedGmt,
    required this.dateModified,
    required this.dateModifiedGmt,
    required this.src,
    required this.name,
    required this.alt,
  });
  late final int id;
  late final String dateCreated;
  late final String dateCreatedGmt;
  late final String dateModified;
  late final String dateModifiedGmt;
  late final String src;
  late final String name;
  late final String alt;

  Images.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    dateCreated = json['date_created'];
    dateCreatedGmt = json['date_created_gmt'];
    dateModified = json['date_modified'];
    dateModifiedGmt = json['date_modified_gmt'];
    src = json['src'];
    name = json['name'];
    alt = json['alt'];
  }

  Map<String?, dynamic> toJson() {
    final _data = <String?, dynamic>{};
    _data['id'] = id;
    _data['date_created'] = dateCreated;
    _data['date_created_gmt'] = dateCreatedGmt;
    _data['date_modified'] = dateModified;
    _data['date_modified_gmt'] = dateModifiedGmt;
    _data['src'] = src;
    _data['name'] = name;
    _data['alt'] = alt;
    return _data;
  }
}

class Links {
  Links({
    required this.self,
    required this.collection,
  });
  late final List<Self> self;
  late final List<Collection> collection;

  Links.fromJson(Map<String?, dynamic> json) {
    self = List.from(json['self']).map((e) => Self.fromJson(e)).toList();
    collection = List.from(json['collection'])
        .map((e) => Collection.fromJson(e))
        .toList();
  }

  Map<String?, dynamic> toJson() {
    final _data = <String?, dynamic>{};
    _data['self'] = self.map((e) => e.toJson()).toList();
    _data['collection'] = collection.map((e) => e.toJson()).toList();
    return _data;
  }
}

class Self {
  Self({
    required this.href,
  });
  late final String? href;

  Self.fromJson(Map<String?, dynamic> json) {
    href = json['href'];
  }

  Map<String?, dynamic> toJson() {
    final _data = <String?, dynamic>{};
    _data['href'] = href;
    return _data;
  }
}

class Collection {
  Collection({
    required this.href,
  });
  late final String? href;

  Collection.fromJson(Map<String?, dynamic> json) {
    href = json['href'];
  }

  Map<String?, dynamic> toJson() {
    final _data = <String?, dynamic>{};
    _data['href'] = href;
    return _data;
  }
}
