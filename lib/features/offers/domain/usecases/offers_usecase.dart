import 'dart:io';

import 'package:dartz/dartz.dart';
import 'package:manican/core/error/failures.dart';
import 'package:manican/features/offers/data/models/offer_model.dart';
import 'package:manican/features/offers/data/repositories/offers_repository_impl.dart';
import 'package:manican/features/offers/domain/entities/offer_entity_data.dart';

class OffersUsecase {
  final OffersRepositoryImpl repository;

  OffersUsecase({required this.repository});

  Future<Either<Failure, Unit>> addOffer(
      OfferEntityData offerEntityData) async {
    return await repository.addOffer(offerEntityData);
  }

  Future<Either<Failure, Unit>> editOffer(
      OfferEntityData offerEntityData, String id) async {
    return await repository.editOffer(offerEntityData, id);
  }

  Future<Either<Failure, Unit>> deleteOffer(String id) async {
    return await repository.deleteOffer(id);
  }

  Future<Either<Failure, List<OfferModel>>> getAllOffers() async {
    return await repository.getAllOffers();
  }
}
