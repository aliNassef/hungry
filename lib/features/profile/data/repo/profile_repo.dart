import 'package:dartz/dartz.dart';
import 'package:hungry/core/api/errors/failure.dart';

import '../models/profile_model.dart';

abstract class ProfileRepo {
  Future<Either<Failure, ProfileModel>> getProfileData();
  Future<Either<Failure, void>> logout();
}
