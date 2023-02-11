import '../model/image_generation_model.dart';

abstract class ImageGenerationRemoteDataSource {
  Future<ImageGenerationModel> getGenerateImages(String query);
}
