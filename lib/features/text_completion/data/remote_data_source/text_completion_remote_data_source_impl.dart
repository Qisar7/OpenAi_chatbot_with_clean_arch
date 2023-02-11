import 'dart:convert';

import 'package:flutter1_a_l/features/text_completion/data/remote_data_source/text_completion_remote_data_source.dart';
import 'package:http/http.dart' as http;

import '../../../../core/error/custom_exceptions.dart';
import '../../../../core/open_ai_data.dart';
import '../../../global/provider/provider.dart';
import '../model/text_completion_model.dart';

class TextCompletionRemoteDataSourceImpl
    implements TextCompletionRemoteDataSource {
  final http.Client httpClient;

  TextCompletionRemoteDataSourceImpl({required this.httpClient});

  @override
  Future<TextCompletionModel> getTextCompletion(String query) async {
    final String _endPoint = "completions";

    Map<String, dynamic> rowParams = {
      "model": "text-davinci-003",
      "prompt": query,
      "max_tokens": 2048,
      "temperature": 0,
      "top_p": 1,
      "n": 1,
      "stream": false,
      "logprobs": null,
      // "stop": "\n"
    };

    final encodedParams = json.encode(rowParams);

    final response = await httpClient.post(
      Uri.parse(endPoint(_endPoint)),
      body: encodedParams,
      headers: headerBearerOption(OPEN_AI_KEY),
    );

    if (response.statusCode == 200) {
      return TextCompletionModel.fromJson(json.decode(response.body));
    } else {
      throw ServerException(message: "Text Completion Server Exception");
    }
  }
}
