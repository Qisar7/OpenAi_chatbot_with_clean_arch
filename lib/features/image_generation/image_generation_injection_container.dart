import 'package:flutter1_a_l/features/image_generation/data/remote_data_source/image_generation_remote_data_source.dart';
import 'package:flutter1_a_l/features/image_generation/data/remote_data_source/image_generation_remote_data_source_impl.dart';
import 'package:flutter1_a_l/features/image_generation/data/repositories/image_generation_repository_impl.dart';
import 'package:flutter1_a_l/features/image_generation/domain/repositories/image_generation_repository.dart';
import 'package:flutter1_a_l/features/image_generation/presentation/cubit/image_generation_cubit.dart';
import '../../injection_container.dart';
import 'domain/usecases/image_generation_usecase.dart';

Future<void> imageGenerationInjectionContainer() async {
  //Futures bloc
  sl.registerFactory<ImageGenerationCubit>(
    () => ImageGenerationCubit(
      imageGenerationUseCase: sl.call(),
    ),
  );

  //UseCase
  sl.registerLazySingleton<ImageGenerationUseCase>(() => ImageGenerationUseCase(
        repository: sl.call(),
      ));
  //repository
  sl.registerLazySingleton<ImageGenerationRepository>(
      () => ImageGenerationRepositoryImpl(
            remoteDataSource: sl.call(),
          ));
  //remote data
  sl.registerLazySingleton<ImageGenerationRemoteDataSource>(
      () => ImageGenerationRemoteDataSourceImpl(
            httpClient: sl.call(),
          ));
}
