// To parse this JSON data, do
//
//     final dineinOrderModel = dineinOrderModelFromJson(jsonString);

import 'dart:convert';

DineInOrderModel dineinOrderModelFromJson(String str) =>
    DineInOrderModel.fromJson(json.decode(str));

String dineinOrderModelToJson(DineInOrderModel data) =>
    json.encode(data.toJson());

class DineInOrderModel {
  Orders? orders;

  DineInOrderModel({this.orders});

  factory DineInOrderModel.fromJson(Map<String, dynamic> json) =>
      DineInOrderModel(
        orders: json["orders"] == null ? null : Orders.fromJson(json["orders"]),
      );

  Map<String, dynamic> toJson() => {
        "orders": orders?.toJson(),
      };
}

class Orders {
  int? currentPage;
  List<OrderData>? orderData;
  String? firstPageUrl;
  int? from;
  int? lastPage;
  String? lastPageUrl;
  List<Link>? links;
  String? nextPageUrl;
  String? path;
  int? perPage;
  dynamic prevPageUrl;
  int? to;
  int? total;

  Orders({
    this.currentPage,
    this.orderData,
    this.firstPageUrl,
    this.from,
    this.lastPage,
    this.lastPageUrl,
    this.links,
    this.nextPageUrl,
    this.path,
    this.perPage,
    this.prevPageUrl,
    this.to,
    this.total,
  });

  factory Orders.fromJson(Map<String, dynamic> json) => Orders(
        currentPage: json["current_page"],
        orderData: json["data"] == null
            ? []
            : List<OrderData>.from(
                json["data"]!.map((x) => OrderData.fromJson(x))),
        firstPageUrl: json["first_page_url"],
        from: json["from"],
        lastPage: json["last_page"],
        lastPageUrl: json["last_page_url"],
        links: json["links"] == null
            ? []
            : List<Link>.from(json["links"]!.map((x) => Link.fromJson(x))),
        nextPageUrl: json["next_page_url"],
        path: json["path"],
        perPage: json["per_page"],
        prevPageUrl: json["prev_page_url"],
        to: json["to"],
        total: json["total"],
      );

  Map<String, dynamic> toJson() => {
        "current_page": currentPage,
        "data": orderData == null
            ? []
            : List<dynamic>.from(orderData!.map((x) => x.toJson())),
        "first_page_url": firstPageUrl,
        "from": from,
        "last_page": lastPage,
        "last_page_url": lastPageUrl,
        "links": links == null
            ? []
            : List<dynamic>.from(links!.map((x) => x.toJson())),
        "next_page_url": nextPageUrl,
        "path": path,
        "per_page": perPage,
        "prev_page_url": prevPageUrl,
        "to": to,
        "total": total,
      };
}

class OrderData {
  int? id;
  int? adminId;
  dynamic userId;
  int? serverId;
  int? isGuest;
  double? orderAmount;
  double? gratuityAmount;
  int? pstAmount;
  int? couponDiscountAmount;
  dynamic couponDiscountTitle;
  String? paymentStatus;
  String? orderStatus;
  double? totalTaxAmount;
  String? paymentMethod;
  dynamic transactionReference;
  dynamic deliveryAddressId;
  DateTime? createdAt;
  DateTime? updatedAt;
  int? checked;
  dynamic deliveryManId;
  int? deliveryCharge;
  dynamic orderNote;
  dynamic couponCode;
  String? orderType;
  int? branchId;
  dynamic callback;
  DateTime? deliveryDate;
  String? deliveryTime;
  String? extraDiscount;
  dynamic extraDiscountType;
  int? extraDiscountDiscount;
  dynamic extraDiscountReason;
  dynamic deliveryAddress;
  int? preparationTime;
  int? tableId;
  int? numberOfPeople;
  int? tableOrderId;
  dynamic refundOrderId;
  dynamic voidOrderId;
  dynamic refundReason;
  int? totalRefundAmount;
  String? authorizationCode;
  int? recieveCash;
  int? changeCashAmount;
  dynamic deliveryDistance;
  int? addonSubTotal;
  int? addonGst;
  int? addonPst;
  int? addonGratuity;
  int? addonTotal;
  int? tipAmount;
  int? parentOrderId;
  dynamic clearedAt;
  dynamic bookingType;
  dynamic customerName;
  dynamic barId;
  dynamic deletedAt;
  dynamic serveFirst;
  int? packagingCharge;
  String? extraPaymentMethod;
  int? cashTip;
  String? serverName;
  Server? server;
  dynamic admin;

  OrderData({
    this.id,
    this.adminId,
    this.userId,
    this.serverId,
    this.isGuest,
    this.orderAmount,
    this.gratuityAmount,
    this.pstAmount,
    this.couponDiscountAmount,
    this.couponDiscountTitle,
    this.paymentStatus,
    this.orderStatus,
    this.totalTaxAmount,
    this.paymentMethod,
    this.transactionReference,
    this.deliveryAddressId,
    this.createdAt,
    this.updatedAt,
    this.checked,
    this.deliveryManId,
    this.deliveryCharge,
    this.orderNote,
    this.couponCode,
    this.orderType,
    this.branchId,
    this.callback,
    this.deliveryDate,
    this.deliveryTime,
    this.extraDiscount,
    this.extraDiscountType,
    this.extraDiscountDiscount,
    this.extraDiscountReason,
    this.deliveryAddress,
    this.preparationTime,
    this.tableId,
    this.numberOfPeople,
    this.tableOrderId,
    this.refundOrderId,
    this.voidOrderId,
    this.refundReason,
    this.totalRefundAmount,
    this.authorizationCode,
    this.recieveCash,
    this.changeCashAmount,
    this.deliveryDistance,
    this.addonSubTotal,
    this.addonGst,
    this.addonPst,
    this.addonGratuity,
    this.addonTotal,
    this.tipAmount,
    this.parentOrderId,
    this.clearedAt,
    this.bookingType,
    this.customerName,
    this.barId,
    this.deletedAt,
    this.serveFirst,
    this.packagingCharge,
    this.extraPaymentMethod,
    this.cashTip,
    this.serverName,
    this.server,
    this.admin,
  });

  factory OrderData.fromJson(Map<String, dynamic> json) => OrderData(
        id: json["id"],
        adminId: json["admin_id"],
        userId: json["user_id"],
        serverId: json["server_id"],
        isGuest: json["is_guest"],
        orderAmount: json["order_amount"]?.toDouble(),
        gratuityAmount: json["gratuity_amount"]?.toDouble(),
        pstAmount: json["pst_amount"],
        couponDiscountAmount: json["coupon_discount_amount"],
        couponDiscountTitle: json["coupon_discount_title"],
        paymentStatus: json["payment_status"],
        orderStatus: json["order_status"],
        totalTaxAmount: json["total_tax_amount"]?.toDouble(),
        paymentMethod: json["payment_method"],
        transactionReference: json["transaction_reference"],
        deliveryAddressId: json["delivery_address_id"],
        createdAt: json["created_at"] == null
            ? null
            : DateTime.parse(json["created_at"]),
        updatedAt: json["updated_at"] == null
            ? null
            : DateTime.parse(json["updated_at"]),
        checked: json["checked"],
        deliveryManId: json["delivery_man_id"],
        deliveryCharge: json["delivery_charge"],
        orderNote: json["order_note"],
        couponCode: json["coupon_code"],
        orderType: json["order_type"],
        branchId: json["branch_id"],
        callback: json["callback"],
        deliveryDate: json["delivery_date"] == null
            ? null
            : DateTime.parse(json["delivery_date"]),
        deliveryTime: json["delivery_time"],
        extraDiscount: json["extra_discount"],
        extraDiscountType: json["extra_discount_type"],
        extraDiscountDiscount: json["extra_discount_discount"],
        extraDiscountReason: json["extra_discount_reason"],
        deliveryAddress: json["delivery_address"],
        preparationTime: json["preparation_time"],
        tableId: json["table_id"],
        numberOfPeople: json["number_of_people"],
        tableOrderId: json["table_order_id"],
        refundOrderId: json["refund_order_id"],
        voidOrderId: json["void_order_id"],
        refundReason: json["refund_reason"],
        totalRefundAmount: json["total_refund_amount"],
        authorizationCode: json["authorization_code"],
        recieveCash: json["recieve_cash"],
        changeCashAmount: json["change_cash_amount"],
        deliveryDistance: json["delivery_distance"],
        addonSubTotal: json["addon_sub_total"],
        addonGst: json["addon_gst"],
        addonPst: json["addon_pst"],
        addonGratuity: json["addon_gratuity"],
        addonTotal: json["addon_total"],
        tipAmount: json["tip_amount"],
        parentOrderId: json["parent_order_id"],
        clearedAt: json["cleared_at"],
        bookingType: json["booking_type"],
        customerName: json["customer_name"],
        barId: json["bar_id"],
        deletedAt: json["deleted_at"],
        serveFirst: json["serve_first"],
        packagingCharge: json["packaging_charge"],
        extraPaymentMethod: json["extra_payment_method"],
        cashTip: json["cash_tip"],
        serverName: json["server_name"],
        server: json["server"] == null ? null : Server.fromJson(json["server"]),
        admin: json["admin"],
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "admin_id": adminId,
        "user_id": userId,
        "server_id": serverId,
        "is_guest": isGuest,
        "order_amount": orderAmount,
        "gratuity_amount": gratuityAmount,
        "pst_amount": pstAmount,
        "coupon_discount_amount": couponDiscountAmount,
        "coupon_discount_title": couponDiscountTitle,
        "payment_status": paymentStatus,
        "order_status": orderStatus,
        "total_tax_amount": totalTaxAmount,
        "payment_method": paymentMethod,
        "transaction_reference": transactionReference,
        "delivery_address_id": deliveryAddressId,
        "created_at": createdAt?.toIso8601String(),
        "updated_at": updatedAt?.toIso8601String(),
        "checked": checked,
        "delivery_man_id": deliveryManId,
        "delivery_charge": deliveryCharge,
        "order_note": orderNote,
        "coupon_code": couponCode,
        "order_type": orderType,
        "branch_id": branchId,
        "callback": callback,
        "delivery_date":
            "${deliveryDate!.year.toString().padLeft(4, '0')}-${deliveryDate!.month.toString().padLeft(2, '0')}-${deliveryDate!.day.toString().padLeft(2, '0')}",
        "delivery_time": deliveryTime,
        "extra_discount": extraDiscount,
        "extra_discount_type": extraDiscountType,
        "extra_discount_discount": extraDiscountDiscount,
        "extra_discount_reason": extraDiscountReason,
        "delivery_address": deliveryAddress,
        "preparation_time": preparationTime,
        "table_id": tableId,
        "number_of_people": numberOfPeople,
        "table_order_id": tableOrderId,
        "refund_order_id": refundOrderId,
        "void_order_id": voidOrderId,
        "refund_reason": refundReason,
        "total_refund_amount": totalRefundAmount,
        "authorization_code": authorizationCode,
        "recieve_cash": recieveCash,
        "change_cash_amount": changeCashAmount,
        "delivery_distance": deliveryDistance,
        "addon_sub_total": addonSubTotal,
        "addon_gst": addonGst,
        "addon_pst": addonPst,
        "addon_gratuity": addonGratuity,
        "addon_total": addonTotal,
        "tip_amount": tipAmount,
        "parent_order_id": parentOrderId,
        "cleared_at": clearedAt,
        "booking_type": bookingType,
        "customer_name": customerName,
        "bar_id": barId,
        "deleted_at": deletedAt,
        "serve_first": serveFirst,
        "packaging_charge": packagingCharge,
        "extra_payment_method": extraPaymentMethod,
        "cash_tip": cashTip,
        "server_name": nameValues.reverse[serverName],
        "server": server?.toJson(),
        "admin": admin,
      };
}

class Server {
  int? id;
  Name? fName;
  String? lName;
  String? phone;
  String? email;
  String? image;
  String? password;
  String? rememberToken;
  DateTime? createdAt;
  DateTime? updatedAt;
  dynamic fcmToken;
  int? adminRoleId;
  int? status;
  String? identityNumber;
  String? identityType;
  String? identityImage;
  String? authenticationPin;
  dynamic accessPin;
  String? adminName;
  String? workTime;

  Server({
    this.id,
    this.fName,
    this.lName,
    this.phone,
    this.email,
    this.image,
    this.password,
    this.rememberToken,
    this.createdAt,
    this.updatedAt,
    this.fcmToken,
    this.adminRoleId,
    this.status,
    this.identityNumber,
    this.identityType,
    this.identityImage,
    this.authenticationPin,
    this.accessPin,
    this.adminName,
    this.workTime,
  });

  factory Server.fromJson(Map<String, dynamic> json) => Server(
        id: json["id"],
        fName: nameValues.map[json["f_name"]]!,
        lName: json["l_name"],
        phone: json["phone"],
        email: json["email"],
        image: json["image"],
        password: json["password"],
        rememberToken: json["remember_token"],
        createdAt: json["created_at"] == null
            ? null
            : DateTime.parse(json["created_at"]),
        updatedAt: json["updated_at"] == null
            ? null
            : DateTime.parse(json["updated_at"]),
        fcmToken: json["fcm_token"],
        adminRoleId: json["admin_role_id"],
        status: json["status"],
        identityNumber: json["identity_number"],
        identityType: json["identity_type"],
        identityImage: json["identity_image"],
        authenticationPin: json["authentication_pin"],
        accessPin: json["access_pin"],
        adminName: json["admin_name"],
        workTime: json["work_time"],
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "f_name": nameValues.reverse[fName],
        "l_name": lName,
        "phone": phone,
        "email": email,
        "image": image,
        "password": password,
        "remember_token": rememberToken,
        "created_at": createdAt?.toIso8601String(),
        "updated_at": updatedAt?.toIso8601String(),
        "fcm_token": fcmToken,
        "admin_role_id": adminRoleId,
        "status": status,
        "identity_number": identityNumber,
        "identity_type": identityType,
        "identity_image": identityImage,
        "authentication_pin": authenticationPin,
        "access_pin": accessPin,
        "admin_name": adminName,
        "work_time": workTime,
      };
}

enum Name { EMPTY, HAVELI }

final nameValues = EnumValues({"": Name.EMPTY, "Haveli": Name.HAVELI});

class Link {
  String? url;
  String? label;
  bool? active;

  Link({
    this.url,
    this.label,
    this.active,
  });

  factory Link.fromJson(Map<String, dynamic> json) => Link(
        url: json["url"],
        label: json["label"],
        active: json["active"],
      );

  Map<String, dynamic> toJson() => {
        "url": url,
        "label": label,
        "active": active,
      };
}

class EnumValues<T> {
  Map<String, T> map;
  late Map<T, String> reverseMap;

  EnumValues(this.map);

  Map<T, String> get reverse {
    reverseMap = map.map((k, v) => MapEntry(v, k));
    return reverseMap;
  }
}
