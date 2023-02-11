import 'package:flutter1_a_l/features/image_generation/data/model/image_generation_model.dart';

import '../../domain/repositories/image_generation_repository.dart';
import '../remote_data_source/image_generation_remote_data_source.dart';

class ImageGenerationRepositoryImpl implements ImageGenerationRepository {
  final ImageGenerationRemoteDataSource remoteDataSource;

  ImageGenerationRepositoryImpl({required this.remoteDataSource});

  @override
  Future<ImageGenerationModel> getGenerateImages(String query) async =>
      remoteDataSource.getGenerateImages(query);
}
