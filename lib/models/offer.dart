// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:convert';

class Offer {
  final String? id;
  final String title;
  final String description;
  final double discountPercentage;
  final double originalPrice;
  final double discountedPrice;
  final DateTime createdAt;
  final DateTime? updatedAt;
  Offer({
    this.id,
    required this.title,
    required this.description,
    required this.discountPercentage,
    required this.originalPrice,
    required this.discountedPrice,
    required this.createdAt,
    this.updatedAt,
  });

  Offer copyWith({
    String? id,
    String? title,
    String? description,
    double? discountPercentage,
    double? originalPrice,
    double? discountedPrice,
    DateTime? createdAt,
    DateTime? updatedAt,
  }) {
    return Offer(
      id: id ?? this.id,
      title: title ?? this.title,
      description: description ?? this.description,
      discountPercentage: discountPercentage ?? this.discountPercentage,
      originalPrice: originalPrice ?? this.originalPrice,
      discountedPrice: discountedPrice ?? this.discountedPrice,
      createdAt: createdAt ?? this.createdAt,
      updatedAt: updatedAt ?? this.updatedAt,
    );
  }

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'id': id,
      'title': title,
      'description': description,
      'discountPercentage': discountPercentage,
      'originalPrice': originalPrice,
      'discountedPrice': discountedPrice,
      'createdAt': createdAt.millisecondsSinceEpoch,
      'updatedAt': updatedAt?.millisecondsSinceEpoch,
    };
  }

  factory Offer.fromMap(Map<String, dynamic> map) {
    return Offer(
      id: map['id'] != null ? map['id'] as String : null,
      title: map['title'] as String,
      description: map['description'] as String,
      discountPercentage: map['discountPercentage'] as double,
      originalPrice: map['originalPrice'] as double,
      discountedPrice: map['discountedPrice'] as double,
      createdAt: DateTime.parse(map['createdAt'] as String),
      updatedAt: map['updatedAt'] != null
          ? DateTime.parse(map['updatedAt'] as String)
          : null,
    );
  }

  String toJson() => json.encode(toMap());

  factory Offer.fromJson(String source) =>
      Offer.fromMap(json.decode(source) as Map<String, dynamic>);

  @override
  String toString() {
    return 'Offer(id: $id, title: $title, description: $description, discountPercentage: $discountPercentage, originalPrice: $originalPrice, discountedPrice: $discountedPrice, createdAt: $createdAt, updatedAt: $updatedAt)';
  }

  @override
  bool operator ==(covariant Offer other) {
    if (identical(this, other)) return true;

    return other.id == id &&
        other.title == title &&
        other.description == description &&
        other.discountPercentage == discountPercentage &&
        other.originalPrice == originalPrice &&
        other.discountedPrice == discountedPrice &&
        other.createdAt == createdAt &&
        other.updatedAt == updatedAt;
  }

  @override
  int get hashCode {
    return id.hashCode ^
        title.hashCode ^
        description.hashCode ^
        discountPercentage.hashCode ^
        originalPrice.hashCode ^
        discountedPrice.hashCode ^
        createdAt.hashCode ^
        updatedAt.hashCode;
  }
}
