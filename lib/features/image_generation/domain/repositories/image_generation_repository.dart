import '../../data/model/image_generation_model.dart';

abstract class ImageGenerationRepository {
  Future<ImageGenerationModel> getGenerateImages(String query);
}
