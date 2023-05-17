// To parse this JSON data, do
//
//     final restaurants = restaurantsFromJson(jsonString);

import 'dart:convert';

Restaurants restaurantsFromJson(String str) =>
    Restaurants.fromJson(jsonDecode(str));

String restaurantsToJson(Restaurants data) => jsonEncode(data.toJson());

class Restaurants {
  final List<Restaurant> restaurants;

  Restaurants({
    required this.restaurants,
  });

  factory Restaurants.fromJson(Map<String, dynamic> json) => Restaurants(
        restaurants: List<Restaurant>.from(
            json["restaurants"].map((x) => Restaurant.fromJson(x))),
      );

  Map<String, dynamic> toJson() => {
        "restaurants":
            List<Restaurant>.from(restaurants.map((x) => x.toJson())),
      };
}

class Restaurant {
  final String id;
  final String name;
  final String description;
  final String pictureId;
  final String city;
  final double rating;
  final Menus menus;

  Restaurant({
    required this.id,
    required this.name,
    required this.description,
    required this.pictureId,
    required this.city,
    required this.rating,
    required this.menus,
  });

  factory Restaurant.fromJson(Map<String, dynamic> json) => Restaurant(
        id: json["id"],
        name: json["name"],
        description: json["description"],
        pictureId: json["pictureId"],
        city: json["city"],
        rating: json["rating"]?.toDouble(),
        menus: Menus.fromJson(json["menus"]),
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "name": name,
        "description": description,
        "pictureId": pictureId,
        "city": city,
        "rating": rating,
        "menus": menus.toJson(),
      };
}

class Menus {
  final List<Menu> foods;
  final List<Menu> drinks;

  Menus({
    required this.foods,
    required this.drinks,
  });

  factory Menus.fromJson(Map<String, dynamic> json) => Menus(
        foods: List<Menu>.from(json["foods"].map((x) => Menu.fromJson(x))),
        drinks: List<Menu>.from(json["drinks"].map((x) => Menu.fromJson(x))),
      );

  Map<String, dynamic> toJson() => {
        "foods": List<dynamic>.from(foods.map((x) => x.toJson())),
        "drinks": List<dynamic>.from(drinks.map((x) => x.toJson())),
      };
}

class Menu {
  final String name;

  Menu({
    required this.name,
  });

  factory Menu.fromJson(Map<String, dynamic> json) => Menu(
        name: json["name"],
      );

  Map<String, dynamic> toJson() => {
        "name": name,
      };
}
