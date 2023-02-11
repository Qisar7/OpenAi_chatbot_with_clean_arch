import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter1_a_l/features/app/manger/color_manger.dart';
import 'package:flutter1_a_l/features/global/widgets/search_text_field_widget.dart';
import 'package:flutter1_a_l/features/image_generation/presentation/cubit/image_generation_cubit.dart';
import 'package:flutter1_a_l/features/image_generation/presentation/pages/image_details.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';
import 'package:lottie/lottie.dart';
import 'package:shimmer/shimmer.dart';

class ImageGenerationPage extends StatefulWidget {
  const ImageGenerationPage({Key? key}) : super(key: key);

  @override
  State<ImageGenerationPage> createState() => _ImageGenerationPageState();
}

class _ImageGenerationPageState extends State<ImageGenerationPage> {
  TextEditingController _searchTextController = TextEditingController();

  @override
  void initState() {
    WidgetsFlutterBinding.ensureInitialized();
    _searchTextController.addListener(() {
      setState(() {});
    });
    super.initState();
  }

  @override
  void dispose() {
    _searchTextController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Mycolor.mgrey,
      appBar: AppBar(
        title: const Text("Image Generation"),
        centerTitle: true,
      ),
      body: Center(
        child: Column(
          children: [
            Expanded(
                child: BlocBuilder<ImageGenerationCubit, ImageGenerationState>(
              builder: (context, imageGenerationState) {
                if (imageGenerationState is ImageGenerationLoading) {
                  return Center(
                    child: Container(
                      width: 300,
                      height: 300,
                      child: Lottie.asset('assets/cube.json'),
                    ),
                  );
                }

                if (imageGenerationState is ImageGenerationLoaded) {
                  return MasonryGridView.builder(
                      gridDelegate:
                          const SliverSimpleGridDelegateWithFixedCrossAxisCount(
                              crossAxisCount: 2),
                      mainAxisSpacing: 3,
                      crossAxisSpacing: 3,
                      itemCount: imageGenerationState
                          .imageGenerationModelData.data.length,
                      itemBuilder: (context, index) {
                        final generatedImage = imageGenerationState
                            .imageGenerationModelData.data[index];

                        return Hero(
                          tag: generatedImage.url,
                          child: Material(
                            color: Colors.transparent,
                            child: InkWell(
                              onTap: () {
                                Navigator.of(context).push(
                                  MaterialPageRoute(
                                    builder: (context) => ImageDetails(
                                      imgurl: generatedImage.url,
                                    ),
                                  ),
                                );
                              },
                              child: Card(
                                child: CachedNetworkImage(
                                  imageUrl: "${generatedImage.url}",
                                  fit: BoxFit.cover,
                                  progressIndicatorBuilder:
                                      (context, url, downloadProgress) =>
                                          SizedBox(
                                    height: 150,
                                    width: 150,
                                    child: Shimmer.fromColors(
                                      baseColor: Colors.grey.withOpacity(.3),
                                      highlightColor: Colors.grey,
                                      child: Container(
                                        height: 220,
                                        width: 130,
                                        decoration: BoxDecoration(
                                            color: Colors.white,
                                            borderRadius:
                                                BorderRadius.circular(4)),
                                      ),
                                    ),
                                  ),
                                  errorWidget: (context, url, error) =>
                                      const Icon(Icons.error),
                                ),
                              ),
                            ),
                          ),
                        );
                      });
                }

                return const Center(
                    child: Text(
                  "OpenAI Image Generation",
                  style: TextStyle(fontSize: 20, color: Colors.grey),
                ));
              },
            )),
            SearchTextFieldWidget(
              textEditingController: _searchTextController,
              onTap: () {
                BlocProvider.of<ImageGenerationCubit>(context)
                    .imagesGenerate(
                      query: _searchTextController.text,
                    )
                    .then((value) => _clearTextField);
                _clearTextField();
              },
            ),
            const SizedBox(
              height: 20,
            ),
          ],
        ),
      ),
    );
  }

  void _clearTextField() {
    setState(() {
      _searchTextController.clear();
    });
  }
}
