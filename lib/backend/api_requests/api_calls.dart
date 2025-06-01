import 'dart:convert';

import 'package:flutter/foundation.dart';

import '/flutter_flow/flutter_flow_util.dart';
import 'api_manager.dart';

export 'api_manager.dart' show ApiCallResponse;

const _kPrivateApiFunctionName = 'ffPrivateApiCall';

class GetRandomQouteCall {
  static Future<ApiCallResponse> call({
    String? quote = '',
    String? author = '',
    String? category = 'happiness',
  }) async {
    return ApiManager.instance.makeApiCall(
      callName: 'GetRandomQoute',
      apiUrl: 'https://api.api-ninjas.com/v1/quotes',
      callType: ApiCallType.GET,
      headers: {
        'X-Api-Key': 'Cf1lpN3kFbfrefbQDf0PyQ==bzRqYhZ35b8xihMD',
      },
      params: {},
      returnBody: true,
      encodeBodyUtf8: false,
      decodeUtf8: false,
      cache: false,
      isStreamingApi: false,
      alwaysAllowBody: false,
    );
  }

  static String? quote(dynamic response) => castToType<String>(getJsonField(
        response,
        r'''$[:].quote''',
      ));
  static String? author(dynamic response) => castToType<String>(getJsonField(
        response,
        r'''$[:].author''',
      ));
  static String? category(dynamic response) => castToType<String>(getJsonField(
        response,
        r'''$[:].category''',
      ));
}

class GetSentimentCall {
  static Future<ApiCallResponse> call({
    String? text = '',
  }) async {
    final ffApiRequestBody = '''
{
  "inputs": "${escapeStringForJson(text)}"
}''';
    return ApiManager.instance.makeApiCall(
      callName: 'getSentiment',
      apiUrl:
          'https://cgtjp3xbkfh4h069.us-east-1.aws.endpoints.huggingface.cloud/predict',
      callType: ApiCallType.POST,
      headers: {
        'Authorization': 'Bearer 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',
        'Content-Type': 'application/json; charset=UTF-8',
      },
      params: {},
      body: ffApiRequestBody,
      bodyType: BodyType.JSON,
      returnBody: true,
      encodeBodyUtf8: false,
      decodeUtf8: false,
      cache: false,
      isStreamingApi: false,
      alwaysAllowBody: false,
    );
  }

  static String? topLabel(dynamic response) => castToType<String>(getJsonField(
        response,
        r'''$[:].label''',
      ));
  static double? topScore(dynamic response) => castToType<double>(getJsonField(
        response,
        r'''$[:].score''',
      ));
}

class ApiPagingParams {
  int nextPageNumber = 0;
  int numItems = 0;
  dynamic lastResponse;

  ApiPagingParams({
    required this.nextPageNumber,
    required this.numItems,
    required this.lastResponse,
  });

  @override
  String toString() =>
      'PagingParams(nextPageNumber: $nextPageNumber, numItems: $numItems, lastResponse: $lastResponse,)';
}

String _toEncodable(dynamic item) {
  if (item is DocumentReference) {
    return item.path;
  }
  return item;
}

String _serializeList(List? list) {
  list ??= <String>[];
  try {
    return json.encode(list, toEncodable: _toEncodable);
  } catch (_) {
    if (kDebugMode) {
      print("List serialization failed. Returning empty list.");
    }
    return '[]';
  }
}

String _serializeJson(dynamic jsonVar, [bool isList = false]) {
  jsonVar ??= (isList ? [] : {});
  try {
    return json.encode(jsonVar, toEncodable: _toEncodable);
  } catch (_) {
    if (kDebugMode) {
      print("Json serialization failed. Returning empty json.");
    }
    return isList ? '[]' : '{}';
  }
}

String? escapeStringForJson(String? input) {
  if (input == null) {
    return null;
  }
  return input
      .replaceAll('\\', '\\\\')
      .replaceAll('"', '\\"')
      .replaceAll('\n', '\\n')
      .replaceAll('\t', '\\t');
}
