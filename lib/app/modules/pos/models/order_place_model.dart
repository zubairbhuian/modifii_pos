class OrderPlaceModel {
    OrderPlaceModel({
         this.cart,
         this.orderAmount,
         this.tableId,
         this.branchId,
         this.numberOfPeople,
         this.paymentStatus,
         this.paymentMethod,
         this.gratuityAmount,
         this.gstAmount,
         this.orderNote,
    });

    final List<Cart>? cart;
    final num? orderAmount;
    final int? tableId;
    final int? branchId;
    final num? numberOfPeople;
    final String? paymentStatus;
    final String? paymentMethod;
    final num? gratuityAmount;
    final num? gstAmount;
    final String? orderNote;

    factory OrderPlaceModel.fromJson(Map<String, dynamic> json){ 
        return OrderPlaceModel(
            cart: json["cart"] == null ? [] : List<Cart>.from(json["cart"]!.map((x) => Cart.fromJson(x))),
            orderAmount: json["order_amount"],
            tableId: json["table_id"],
            branchId: json["branch_id"],
            numberOfPeople: json["number_of_people"],
            paymentStatus: json["payment_status"],
            paymentMethod: json["payment_method"],
            gratuityAmount: json["gratuity_amount"],
            gstAmount: json["gst_amount"],
            orderNote: json["order_note"],
        );
    }

    Map<String, dynamic> toJson() => {
        "cart": cart?.map((x) => x.toJson()).toList(),
        "order_amount": orderAmount,
        "table_id": tableId,
        "branch_id": branchId,
        "number_of_people": numberOfPeople,
        "payment_status": paymentStatus,
        "payment_method": paymentMethod,
        "gratuity_amount": gratuityAmount,
        "gst_amount": gstAmount,
        "order_note": orderNote,
    };

}

class Cart {
    Cart({
        required this.id,
        required this.type,
        required this.name,
        required this.price,
        required this.description,
        required this.quantity,
        this.variations,
    });

    final String id;
    final String? type;
    final String? name;
    final num price;
    final String? description;
    num quantity;
    final List<dynamic>? variations;

    factory Cart.fromJson(Map<String, dynamic> json){ 
        return Cart(
            id: json["id"],
            type: json["type"],
            name: json["name"],
            price: json["price"],
            description: json["description"],
            quantity: json["quantity"],
            variations: json["variations"] == null ? [] : List<dynamic>.from(json["variations"]!.map((x) => x)),
        );
    }

    Map<String, dynamic> toJson() => {
        "id": id,
        "type": type,
        "name": name,
        "price": price,
        "description": description,
        "quantity": quantity,
        "variations": variations?.map((x) => x).toList(),
    };

    

}
