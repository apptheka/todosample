import 'package:json_annotation/json_annotation.dart';

class SliderObject {
  String title;
  String subTitle;
  String image;

  SliderObject(this.title, this.subTitle, this.image);
}

class Customer {
  String id;
  String name;
  int numOfNotifications;

  Customer(this.id, this.name, this.numOfNotifications);
}

class ChannelData {
  String id;
  bool expanded;
  String channelName;
  List<String> topics;

  ChannelData(this.id, this.channelName, this.topics, {this.expanded = false});
  @override
  String toString() {
    return "${id} ${channelName} ${topics}";
  }
}

class AgendaData {
  String id;
  String time;
  String? agendaText;
  AgendaData(this.id, this.time, {this.agendaText = null});
}

class ActivityData {
  String id;
  String name;
  String desc;
  List<String> topics;

  ActivityData(this.id, this.name, this.desc, this.topics);
  @override
  String toString() {
    return "${id} ${name} ${topics}";
  }
}

@JsonSerializable()
class Contacts {
  String email;
  String phone;
  String link;

  Contacts(this.email, this.phone, this.link);
}

class Authentication {
  Customer? customer;
  Contacts? contacts;

  Authentication(this.customer, this.contacts);
}

class DeviceInfo {
  String name;
  String identifier;
  String version;

  DeviceInfo(this.name, this.identifier, this.version);
}

class Service {
  int id;
  String title;
  String image;

  Service(this.id, this.title, this.image);
}

class Store {
  int id;
  String title;
  String image;

  Store(this.id, this.title, this.image);
}

class BannerAd {
  int id;
  String title;
  String image;
  String link;

  BannerAd(this.id, this.title, this.image, this.link);
}

class HomeData {
  List<Service> services;
  List<Store> stores;
  List<BannerAd> banners;

  HomeData(this.services, this.stores, this.banners);
}

class HomeObject {
  HomeData data;
  HomeObject(this.data);
}
