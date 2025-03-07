/* 
// Example Usage
Map<String, dynamic> map = jsonDecode(<myJSONString>);
var myRootNode = Root.fromJson(map);
*/
class Order {
  String? id;
  String? price;
  String? location;
  String? address;
  String? phone;
  String? status;
  String? dateCreated;
  String? dateModified;
  List<OrderItem?>? orderitems;

  Order(
      {this.id,
      this.price,
      this.location,
      this.address,
      this.phone,
      this.status,
      this.dateCreated,
      this.dateModified,
      this.orderitems});

  Order.fromJson(Map<String, dynamic> json) {
    id = json['order_id'];
    price = json['order_price'];
    location = json['order_location'];
    address = json['order_address'];
    phone = json['order_phone'];
    status = json['order_status'];
    dateCreated = json['order_dateCreated'];
    dateModified = json['order_dateModified'];
    if (json['order_items'] != null) {
      orderitems = <OrderItem>[];
      json['order_items'].forEach((v) {
        orderitems!.add(OrderItem.fromJson(v));
      });
    }
  }
}

class OrderItem {
  String? itemId;
  String? itemPrice;
  String? itemQuantity;
  String? itemCode;
  String? itemName;

  OrderItem(
      {this.itemId,
      this.itemPrice,
      this.itemQuantity,
      this.itemCode,
      this.itemName});

  OrderItem.fromJson(Map<String, dynamic> json) {
    itemId = json['item_id'];
    itemPrice = json['item_price'];
    itemQuantity = json['item_quota'];
    itemCode = json['item_productCode'];
    itemName = json['item_productName'];
  }
}

class OrdersModel {
  List<Order?>? orders;
  bool? success;
  String? message;

  OrdersModel({this.orders, this.success, this.message});

  OrdersModel.fromJson(Map<String, dynamic> json) {
    if (json['orders'] != null) {
      orders = <Order>[];
      json['orders'].forEach((v) {
        orders!.add(Order.fromJson(v));
      });
    }
    success = json['success'];
    message = json['message'];
  }
}
