import 'package:dartz/dartz.dart';
import 'package:manican/core/error/failures.dart';
import 'package:manican/features/Branches/data/repositories/Branches_repository_impl.dart';
import 'package:manican/features/branches/data/models/branch_model.dart';
import 'package:manican/features/branches/domain/entities/branch_entity.dart';

class BranchesUsecase {
  final BranchesRepositoryImpl repository;

  BranchesUsecase({required this.repository});

  Future<Either<Failure, Unit>> addBranch(BranchEntity branchEntity) async {
    return await repository.addBranch(branchEntity);
  }

  Future<Either<Failure, List<BranchModel>>> getAllBranches() async {
    return await repository.getAllBranches();
  }
}
