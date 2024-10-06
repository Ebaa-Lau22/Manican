import 'package:manican/features/offers/domain/entities/offer.dart';
import 'package:manican/models.dart';

// ignore: must_be_immutable
class OfferModel extends OfferEntity {
  OfferModel(
      {required super.id,
      required super.title,
      super.image,
      required super.description,
      required super.date});

  factory OfferModel.fromJson(Map<String, dynamic> json) {
    return OfferModel(
      id: json['id'],
      title: json['title'],
      description: json['description'],
      date: DateTime.parse(json['date']),
      image: json['image'] != null ? ImageModel.fromJson(json['image']) : null,
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'title': title,
      'description': description,
      'date': date.toIso8601String(),
      'image': image?.toJson(),
    };
  }
}
