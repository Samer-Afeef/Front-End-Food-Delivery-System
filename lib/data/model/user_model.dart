class UserModel {
  String? jwToken;
  int? id;
  bool? status;
  String? notificationToken;
  List<CustomerAddresses>? customerAddresses;
  List<CustomerPhoneNumbers>? customerPhoneNumbers;
  String? fullName;
  String? email;

  UserModel(
      {this.jwToken,
        this.id,
        this.status,
        this.notificationToken,
        this.customerAddresses,
        this.customerPhoneNumbers,
        this.fullName,
        this.email});

  UserModel.fromJson(Map<String, dynamic> json) {
    jwToken = json['jwToken'];
    id = json['id'];
    status = json['status'];
    notificationToken = json['notificationToken'];
    if (json['customerAddresses'] != null) {
      customerAddresses = <CustomerAddresses>[];
      json['customerAddresses'].forEach((v) {
        customerAddresses!.add(CustomerAddresses.fromJson(v));
      });
    }
    if (json['customerPhoneNumbers'] != null) {
      customerPhoneNumbers = <CustomerPhoneNumbers>[];
      json['customerPhoneNumbers'].forEach((v) {
        customerPhoneNumbers!.add(CustomerPhoneNumbers.fromJson(v));
      });
    }
    fullName = json['fullName'];
    email = json['email'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['jwToken'] = jwToken;
    data['id'] = id;
    data['status'] = status;
    data['notificationToken'] = notificationToken;
    if (customerAddresses != null) {
      data['customerAddresses'] =
          customerAddresses!.map((v) => v.toJson()).toList();
    }
    if (customerPhoneNumbers != null) {
      data['customerPhoneNumbers'] =
          customerPhoneNumbers!.map((v) => v.toJson()).toList();
    }
    data['fullName'] = fullName;
    data['email'] = email;
    return data;
  }
}

class CustomerAddresses {
  int? id;
  int? customerId;
  String? address;

  CustomerAddresses({this.id, this.customerId, this.address});

  CustomerAddresses.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    customerId = json['customerId'];
    address = json['address'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['id'] = id;
    data['customerId'] = customerId;
    data['address'] = address;
    return data;
  }
}

class CustomerPhoneNumbers {
  int? id;
  int? customerId;
  String? phoneNumber;

  CustomerPhoneNumbers({this.id, this.customerId, this.phoneNumber});

  CustomerPhoneNumbers.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    customerId = json['customerId'];
    phoneNumber = json['phoneNumber'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['id'] = id;
    data['customerId'] = customerId;
    data['phoneNumber'] = phoneNumber;
    return data;
  }
}