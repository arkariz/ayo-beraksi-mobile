// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'laporan_api_service.dart';

// **************************************************************************
// RetrofitGenerator
// **************************************************************************

class _LaporanApiService implements LaporanApiService {
  _LaporanApiService(this._dio, {this.baseUrl}) {
    baseUrl ??= 'http://194.31.53.214:1702';
  }

  final Dio _dio;

  String? baseUrl;

  @override
  Future<HttpResponse<LaporanModel>> addLaporanPenyuapan(
      token, accept, type, body) async {
    const _extra = <String, dynamic>{};
    final queryParameters = <String, dynamic>{};
    queryParameters.removeWhere((k, v) => v == null);
    final _headers = <String, dynamic>{
      r'Authorization': token,
      r'Accept': accept,
      r'Content-Type': type
    };
    _headers.removeWhere((k, v) => v == null);
    final _data = <String, dynamic>{};
    _data.addAll(body);
    final _result = await _dio.fetch<Map<String, dynamic>>(
        _setStreamType<HttpResponse<LaporanModel>>(Options(
                method: 'POST',
                headers: _headers,
                extra: _extra,
                contentType: type)
            .compose(_dio.options, '/api/actions/laporan-penyuapan/add',
                queryParameters: queryParameters, data: _data)
            .copyWith(baseUrl: baseUrl ?? _dio.options.baseUrl)));
    final value = LaporanModel.fromJson(_result.data!);
    final httpResponse = HttpResponse(value, _result);
    return httpResponse;
  }

  @override
  Future<HttpResponse<PengaduanModel>> addLaporanPengaduan(
      token, accept, type, body) async {
    const _extra = <String, dynamic>{};
    final queryParameters = <String, dynamic>{};
    queryParameters.removeWhere((k, v) => v == null);
    final _headers = <String, dynamic>{
      r'Authorization': token,
      r'Accept': accept,
      r'Content-Type': type
    };
    _headers.removeWhere((k, v) => v == null);
    final _data = <String, dynamic>{};
    _data.addAll(body);
    final _result = await _dio.fetch<Map<String, dynamic>>(
        _setStreamType<HttpResponse<PengaduanModel>>(Options(
                method: 'POST',
                headers: _headers,
                extra: _extra,
                contentType: type)
            .compose(_dio.options, '/api/actions/laporan-pengaduan/add',
                queryParameters: queryParameters, data: _data)
            .copyWith(baseUrl: baseUrl ?? _dio.options.baseUrl)));
    final value = PengaduanModel.fromJson(_result.data!);
    final httpResponse = HttpResponse(value, _result);
    return httpResponse;
  }

  @override
  Future<HttpResponse<GratifikasiModel>> addLaporanGratifikasi(
      token, accept, type, body) async {
    const _extra = <String, dynamic>{};
    final queryParameters = <String, dynamic>{};
    queryParameters.removeWhere((k, v) => v == null);
    final _headers = <String, dynamic>{
      r'Authorization': token,
      r'Accept': accept,
      r'Content-Type': type
    };
    _headers.removeWhere((k, v) => v == null);
    final _data = <String, dynamic>{};
    _data.addAll(body);
    final _result = await _dio.fetch<Map<String, dynamic>>(
        _setStreamType<HttpResponse<GratifikasiModel>>(Options(
                method: 'POST',
                headers: _headers,
                extra: _extra,
                contentType: type)
            .compose(_dio.options, '/api/actions/laporan-gratifikasi/add',
                queryParameters: queryParameters, data: _data)
            .copyWith(baseUrl: baseUrl ?? _dio.options.baseUrl)));
    final value = GratifikasiModel.fromJson(_result.data!);
    final httpResponse = HttpResponse(value, _result);
    return httpResponse;
  }

  @override
  Future<HttpResponse<FeedbackModel>> addFeedback(accept, type, body) async {
    const _extra = <String, dynamic>{};
    final queryParameters = <String, dynamic>{};
    queryParameters.removeWhere((k, v) => v == null);
    final _headers = <String, dynamic>{
      r'Accept': accept,
      r'Content-Type': type
    };
    _headers.removeWhere((k, v) => v == null);
    final _data = <String, dynamic>{};
    _data.addAll(body);
    final _result = await _dio.fetch<Map<String, dynamic>>(
        _setStreamType<HttpResponse<FeedbackModel>>(Options(
                method: 'POST',
                headers: _headers,
                extra: _extra,
                contentType: type)
            .compose(_dio.options, '/api/feedback/add',
                queryParameters: queryParameters, data: _data)
            .copyWith(baseUrl: baseUrl ?? _dio.options.baseUrl)));
    final value = FeedbackModel.fromJson(_result.data!);
    final httpResponse = HttpResponse(value, _result);
    return httpResponse;
  }

  @override
  Future<HttpResponse<LaporanListModel>> getLaporanList(
      token, accept, type) async {
    const _extra = <String, dynamic>{};
    final queryParameters = <String, dynamic>{};
    queryParameters.removeWhere((k, v) => v == null);
    final _headers = <String, dynamic>{
      r'Authorization': token,
      r'Accept': accept,
      r'Content-Type': type
    };
    _headers.removeWhere((k, v) => v == null);
    final _data = <String, dynamic>{};
    final _result = await _dio.fetch<Map<String, dynamic>>(
        _setStreamType<HttpResponse<LaporanListModel>>(Options(
                method: 'GET',
                headers: _headers,
                extra: _extra,
                contentType: type)
            .compose(_dio.options, '/api/actions/laporan/get-list/all',
                queryParameters: queryParameters, data: _data)
            .copyWith(baseUrl: baseUrl ?? _dio.options.baseUrl)));
    final value = LaporanListModel.fromJson(_result.data!);
    final httpResponse = HttpResponse(value, _result);
    return httpResponse;
  }

  RequestOptions _setStreamType<T>(RequestOptions requestOptions) {
    if (T != dynamic &&
        !(requestOptions.responseType == ResponseType.bytes ||
            requestOptions.responseType == ResponseType.stream)) {
      if (T == String) {
        requestOptions.responseType = ResponseType.plain;
      } else {
        requestOptions.responseType = ResponseType.json;
      }
    }
    return requestOptions;
  }
}
