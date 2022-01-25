// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'notification_api_service.dart';

// **************************************************************************
// RetrofitGenerator
// **************************************************************************

class _NotificationApiService implements NotificationApiService {
  _NotificationApiService(this._dio, {this.baseUrl}) {
    baseUrl ??= 'http://194.31.53.214:1702';
  }

  final Dio _dio;

  String? baseUrl;

  @override
  Future<HttpResponse<FcmModel>> postFcmToken(token, accept, type, body) async {
    const _extra = <String, dynamic>{};
    final queryParameters = <String, dynamic>{};
    queryParameters.removeWhere((k, v) => v == null);
    final _headers = <String, dynamic>{r'Authorization': token, r'Accept': accept, r'Content-Type': type};
    _headers.removeWhere((k, v) => v == null);
    final _data = <String, dynamic>{};
    _data.addAll(body);
    final _result = await _dio.fetch<List<dynamic>>(_setStreamType<HttpResponse<FcmModel>>(
        Options(method: 'POST', headers: _headers, extra: _extra, contentType: type)
            .compose(_dio.options, '/api/save-token', queryParameters: queryParameters, data: _data)
            .copyWith(baseUrl: baseUrl ?? _dio.options.baseUrl)));
    final value = FcmModel.fromJson(_result.data!);
    final httpResponse = HttpResponse(value, _result);
    return httpResponse;
  }

  RequestOptions _setStreamType<T>(RequestOptions requestOptions) {
    if (T != dynamic &&
        !(requestOptions.responseType == ResponseType.bytes || requestOptions.responseType == ResponseType.stream)) {
      if (T == String) {
        requestOptions.responseType = ResponseType.plain;
      } else {
        requestOptions.responseType = ResponseType.json;
      }
    }
    return requestOptions;
  }
}
