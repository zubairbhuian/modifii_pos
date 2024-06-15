class ProductModel {
  ProductModel({
    this.id,
    this.name,
    this.description,
    this.image,
    this.price,
    this.variations,
    this.addOns,
    this.tax,
    this.availableTimeStarts,
    this.availableTimeEnds,
    this.status,
    this.createdAt,
    this.updatedAt,
    this.attributes,
    this.categoryIds,
    this.choiceOptions,
    this.discount,
    this.discountType,
    this.taxType,
    this.setMenu,
    this.branchId,
    this.colors,
    this.popularityCount,
    this.productType,
    this.isLiquor,
    this.branchProduct,
    this.rating,
  });

  final int? id;
  final String? name;
  final String? description;
  final String? image;
  final num? price;
  final List<Variation>? variations;
  final List<dynamic>? addOns;
  final num? tax;
  final String? availableTimeStarts;
  final String? availableTimeEnds;
  final num? status;
  final DateTime? createdAt;
  final DateTime? updatedAt;
  final List<dynamic>? attributes;
  final List<CategoryId>? categoryIds;
  final List<dynamic>? choiceOptions;
  final num? discount;
  final String? discountType;
  final String? taxType;
  final num? setMenu;
  final int? branchId;
  final dynamic colors;
  final num? popularityCount;
  final String? productType;
  final num? isLiquor;
  final dynamic branchProduct;
  final List<dynamic>? rating;

  factory ProductModel.fromJson(Map<String, dynamic> json) {
    return ProductModel(
      id: json["id"] ?? 0,
      name: json["name"] ?? "",
      description: json["description"] ?? "",
      image: json["image"] ?? "",
      price: json["price"] ?? 0,
      variations: json["variations"] == null
          ? []
          : List<Variation>.from(
              json["variations"]!.map((x) => Variation.fromJson(x))),
      addOns: json["add_ons"] == null
          ? []
          : List<dynamic>.from(json["add_ons"]!.map((x) => x)),
      tax: json["tax"] ?? 0,
      availableTimeStarts: json["available_time_starts"] ?? "",
      availableTimeEnds: json["available_time_ends"] ?? "",
      status: json["status"] ?? 0,
      createdAt: DateTime.tryParse(json["created_at"] ?? ""),
      updatedAt: DateTime.tryParse(json["updated_at"] ?? ""),
      attributes: json["attributes"] == null
          ? []
          : List<dynamic>.from(json["attributes"]!.map((x) => x)),
      categoryIds: json["category_ids"] == null
          ? []
          : List<CategoryId>.from(
              json["category_ids"]!.map((x) => CategoryId.fromJson(x))),
      choiceOptions: json["choice_options"] == null
          ? []
          : List<dynamic>.from(json["choice_options"]!.map((x) => x)),
      discount: json["discount"] ?? 0,
      discountType: json["discount_type"] ?? "",
      taxType: json["tax_type"] ?? "",
      setMenu: json["set_menu"] ?? 0,
      branchId: json["branch_id"] ?? 0,
      colors: json["colors"],
      popularityCount: json["popularity_count"] ?? 0,
      productType: json["product_type"] ?? "",
      isLiquor: json["is_liquor"] ?? 0,
      branchProduct: json["branch_product"],
      rating: json["rating"] == null
          ? []
          : List<dynamic>.from(json["rating"]!.map((x) => x)),
    );
  }
  @override
  String toString() {
    return 'ProductModel{name: $name, price: $price, variations: $variations, isLiquor: $isLiquor}';
  }
}

class CategoryId {
  CategoryId({
    required this.id,
    required this.position,
  });

  final String id;
  final num position;

  factory CategoryId.fromJson(Map<String, dynamic> json) {
    return CategoryId(
      id: json["id"] ?? "",
      position: json["position"] ?? 0,
    );
  }
}

class Variation {
  Variation({
    required this.name,
    required this.type,
    required this.min,
    required this.max,
    required this.require,
    required this.values,
  });

  final String name;
  final String type;
  final num min;
  final num max;
  final String require;
  final List<Value> values;

  factory Variation.fromJson(Map<String, dynamic> json) {
    return Variation(
      name: json["name"] ?? "",
      type: json["type"] ?? "",
      min: json["min"] ?? 0,
      max: json["max"] ?? 0,
      require: json["required"] ?? "",
      values: json["values"] == null
          ? []
          : List<Value>.from(json["values"]!.map((x) => Value.fromJson(x))),
    );
  }

  @override
  String toString() {
    return 'Variation{name: $name, type: $type, min: $min, max: $max, required: $require, values: $values}';
  }
}

class Value {
  Value({
    required this.label,
    required this.optionPrice,
  });

  final String label;
  final String optionPrice;

  factory Value.fromJson(Map<String, dynamic> json) {
    return Value(
      label: json["label"] ?? "",
      optionPrice: json["optionPrice"] ?? "",
    );
  }

  @override
  String toString() {
    return 'Value{label: $label, price: $optionPrice}';
  }
}
