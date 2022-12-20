class Customer {
  Customer({
    required this.id,
    required this.dateCreated,
    required this.dateCreatedGmt,
    required this.dateModified,
    required this.dateModifiedGmt,
    required this.email,
    required this.firstName,
    required this.lastName,
    required this.role,
    required this.username,
    required this.billing,
    required this.shipping,
    required this.isPayingCustomer,
    required this.avatarUrl,
    required this.metaData,
    required this.links,
  });
  late final int id;
  late final String dateCreated;
  late final String dateCreatedGmt;
  late final String dateModified;
  late final String dateModifiedGmt;
  late final String email;
  late final String firstName;
  late final String lastName;
  late final String role;
  late final String username;
  late final Billing billing;
  late final Shipping shipping;
  late final bool isPayingCustomer;
  late final String avatarUrl;
  late final List<dynamic> metaData;
  late final Links links;
  
  Customer.fromJson(Map<String, dynamic> json){
    id = json['id'];
    dateCreated = json['date_created'];
    dateCreatedGmt = json['date_created_gmt'];
    dateModified = json['date_modified'];
    dateModifiedGmt = json['date_modified_gmt'];
    email = json['email'];
    firstName = json['first_name'];
    lastName = json['last_name'];
    role = json['role'];
    username = json['username'];
    billing = Billing.fromJson(json['billing']);
    shipping = Shipping.fromJson(json['shipping']);
    isPayingCustomer = json['is_paying_customer'];
    avatarUrl = json['avatar_url'];
    metaData = List.castFrom<dynamic, dynamic>(json['meta_data']);
    links = Links.fromJson(json['_links']);
  }

  Map<String, dynamic> toJson() {
    final _data = <String, dynamic>{};
    _data['id'] = id;
    _data['date_created'] = dateCreated;
    _data['date_created_gmt'] = dateCreatedGmt;
    _data['date_modified'] = dateModified;
    _data['date_modified_gmt'] = dateModifiedGmt;
    _data['email'] = email;
    _data['first_name'] = firstName;
    _data['last_name'] = lastName;
    _data['role'] = role;
    _data['username'] = username;
    _data['billing'] = billing.toJson();
    _data['shipping'] = shipping.toJson();
    _data['is_paying_customer'] = isPayingCustomer;
    _data['avatar_url'] = avatarUrl;
    _data['meta_data'] = metaData;
    _data['_links'] = links.toJson();
    return _data;
  }
}

class Billing {
  Billing({
    required this.firstName,
    required this.lastName,
    required this.company,
    required this.address_1,
    required this.address_2,
    required this.city,
    required this.state,
    required this.postcode,
    required this.country,
    required this.email,
    required this.phone,
  });
  late final String firstName;
  late final String lastName;
  late final String company;
  late final String address_1;
  late final String address_2;
  late final String city;
  late final String state;
  late final String postcode;
  late final String country;
  late final String email;
  late final String phone;
  
  Billing.fromJson(Map<String, dynamic> json){
    firstName = json['first_name'];
    lastName = json['last_name'];
    company = json['company'];
    address_1 = json['address_1'];
    address_2 = json['address_2'];
    city = json['city'];
    state = json['state'];
    postcode = json['postcode'];
    country = json['country'];
    email = json['email'];
    phone = json['phone'];
  }

  Map<String, dynamic> toJson() {
    final _data = <String, dynamic>{};
    _data['first_name'] = firstName;
    _data['last_name'] = lastName;
    _data['company'] = company;
    _data['address_1'] = address_1;
    _data['address_2'] = address_2;
    _data['city'] = city;
    _data['state'] = state;
    _data['postcode'] = postcode;
    _data['country'] = country;
    _data['email'] = email;
    _data['phone'] = phone;
    return _data;
  }
}

class Shipping {
  Shipping({
    required this.firstName,
    required this.lastName,
    required this.company,
    required this.address_1,
    required this.address_2,
    required this.city,
    required this.state,
    required this.postcode,
    required this.country,
  });
  late final String firstName;
  late final String lastName;
  late final String company;
  late final String address_1;
  late final String address_2;
  late final String city;
  late final String state;
  late final String postcode;
  late final String country;
  
  Shipping.fromJson(Map<String, dynamic> json){
    firstName = json['first_name'];
    lastName = json['last_name'];
    company = json['company'];
    address_1 = json['address_1'];
    address_2 = json['address_2'];
    city = json['city'];
    state = json['state'];
    postcode = json['postcode'];
    country = json['country'];
  }

  Map<String, dynamic> toJson() {
    final _data = <String, dynamic>{};
    _data['first_name'] = firstName;
    _data['last_name'] = lastName;
    _data['company'] = company;
    _data['address_1'] = address_1;
    _data['address_2'] = address_2;
    _data['city'] = city;
    _data['state'] = state;
    _data['postcode'] = postcode;
    _data['country'] = country;
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
  
  Links.fromJson(Map<String, dynamic> json){
    self = List.from(json['self']).map((e)=>Self.fromJson(e)).toList();
    collection = List.from(json['collection']).map((e)=>Collection.fromJson(e)).toList();
  }

  Map<String, dynamic> toJson() {
    final _data = <String, dynamic>{};
    _data['self'] = self.map((e)=>e.toJson()).toList();
    _data['collection'] = collection.map((e)=>e.toJson()).toList();
    return _data;
  }
}

class Self {
  Self({
    required this.href,
  });
  late final String href;
  
  Self.fromJson(Map<String, dynamic> json){
    href = json['href'];
  }

  Map<String, dynamic> toJson() {
    final _data = <String, dynamic>{};
    _data['href'] = href;
    return _data;
  }
}

class Collection {
  Collection({
    required this.href,
  });
  late final String href;
  
  Collection.fromJson(Map<String, dynamic> json){
    href = json['href'];
  }

  Map<String, dynamic> toJson() {
    final _data = <String, dynamic>{};
    _data['href'] = href;
    return _data;
  }
}