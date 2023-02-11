import 'dart:io';

import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';

import '../../../../core/error/custom_exceptions.dart';
import '../../data/model/image_generation_model.dart';
import '../../domain/usecases/image_generation_usecase.dart';

part 'image_generation_state.dart';

class ImageGenerationCubit extends Cubit<ImageGenerationState> {
  final ImageGenerationUseCase imageGenerationUseCase;
  ImageGenerationCubit({required this.imageGenerationUseCase})
      : super(ImageGenerationInitial());

  Future<void> imagesGenerate({required String query}) async {
    emit(ImageGenerationLoading());
    try {
      final imageGenerationModelData = await imageGenerationUseCase.call(query);
      emit(ImageGenerationLoaded(
          imageGenerationModelData: imageGenerationModelData));
    } on SocketException catch (e) {
      emit(ImageGenerationFailure(errorMsg: e.message));
    } on ServerException catch (e) {
      emit(ImageGenerationFailure(errorMsg: e.message));
    }
  }
}
