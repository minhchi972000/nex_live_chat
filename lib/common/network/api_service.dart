import 'package:dio/dio.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:nex_live_chat/common/widget/nex_progress.dart';
import 'package:nex_live_chat/main.dart';
import 'package:nex_live_chat/model/base_response_model.dart';
import 'package:nex_live_chat/service/app_storage.dart';
import 'package:sentry_dio/sentry_dio.dart';

import '../commons.dart';

class AppService extends BaseService {
  final List<CancelToken> _activeCancelTokens = [];

  AppService() {
    initAppService();
  }

  CancelToken _createCancelToken() {
    final cancelToken = CancelToken();
    _activeCancelTokens.add(cancelToken);
    return cancelToken;
  }

  void _removeCancelToken(CancelToken cancelToken) {
    _activeCancelTokens.remove(cancelToken);
  }

  void cancelAllRequests([String? reason]) {
    for (final token in _activeCancelTokens) {
      if (!token.isCancelled) {
        token.cancel(reason ?? 'All requests cancelled');
      }
    }
    _activeCancelTokens.clear();
  }

  bool get hasActiveRequests => _activeCancelTokens.isNotEmpty;
  int get activeRequestsCount => _activeCancelTokens.length;

  Future<BaseResponseModel> get(
    String path, {
    Map<String, dynamic>? queryParameters,
    Function(String)? customErrorRes,
    Function(DioException)? customErrorCatch,
    CancelToken? cancelToken,
  }) async {
    final requestCancelToken = cancelToken ?? _createCancelToken();

    try {
      queryParameters = {
        ...queryParameters ?? {},
        'platform_type': "NexNow",
        'lang': AppStorage.read<String>(AppConstants.keyLanguage)?.isEmpty == true
            ? getCurrentLocale?.languageCode
            : AppStorage.read<String>(AppConstants.keyLanguage),
      };
      queryParameters.removeWhere((key, value) => value == null);
      AppLog.info('TOKEN: $token\nPARAMS: $queryParameters', 'GET:${_dio.options.baseUrl}$path');

      final res = await _dio.get(path, queryParameters: queryParameters, cancelToken: requestCancelToken);

      if (cancelToken == null) _removeCancelToken(requestCancelToken);

      AppLog.info('PARAMS: $queryParameters\n${'RESPONSE: $res'}', 'GET:${_dio.options.baseUrl}$path');
      if (isSuccess(res)) {
        return BaseResponseModel(isSuccess: true, data: responseData(res));
      } else {
        if (!checkSpecialError(res)) return BaseResponseModel(isSuccess: false, data: null);
        if (customErrorRes != null) {
          customErrorRes.call(getMessage(res));
        } else {
          NexDialog.showNexDialogTitleMessage(title: 'notification'.tr(), message: getMessage(res));
        }
      }
    } on DioException catch (e) {
      if (cancelToken == null) _removeCancelToken(requestCancelToken);

      NexProgress.dismiss();
      if (CancelToken.isCancel(e)) {
        debugPrint('Request cancelled: GET $path');
      } else {
        if (customErrorCatch != null) {
          customErrorCatch.call(e);
          AppLog.error('PARAMS: ${queryParameters ?? ''}\n${'ERROR: $e'}', 'GET:$path');
        } else {
          checkError(e, methodPath: 'GET:$path');
        }
      }
    }
    return BaseResponseModel(isSuccess: false, data: null);
  }

  Future<BaseResponseModel> post(
    String path, {
    Map<String, dynamic>? queryParameters,
    dynamic data,
    Function(Response response)? customErrorRes,
    bool showError = true,
    Function(DioException)? customErrorCatch,
    CancelToken? cancelToken,
    bool isUseProgress = true,
  }) async {
    final requestCancelToken = cancelToken ?? _createCancelToken();

    try {
      queryParameters = {
        ...queryParameters ?? {},
        'platform_type': "NexNow",
        'lang': AppStorage.read<String>(AppConstants.keyLanguage)?.isEmpty == true
            ? getCurrentLocale?.languageCode
            : AppStorage.read<String>(AppConstants.keyLanguage),
      };

      queryParameters.removeWhere((key, value) => value == null);
      AppLog.info('TOKEN: $token\nPARAMS: $queryParameters\nDATA: ${data ?? ''}', 'POST:${_dio.options.baseUrl}$path');

      if (isUseProgress) NexProgress.show();

      final res = await _dio.post(path, queryParameters: queryParameters, data: data, cancelToken: requestCancelToken);
      if (isUseProgress) NexProgress.dismiss();

      if (cancelToken == null) _removeCancelToken(requestCancelToken);

      AppLog.info('PARAMS: $queryParameters\nDATA: ${data ?? ''}\n${'RESPONSE: $res'}', 'POST:${_dio.options.baseUrl}$path');
      if (isSuccess(res)) {
        return BaseResponseModel(isSuccess: true, data: responseData(res));
      } else {
        AppLog.error('PARAMS: $queryParameters\nDATA: ${data ?? ''}\n${'ERROR: ${getMessage(res)}'}', 'POST:$path');

        if (!checkSpecialError(res)) return BaseResponseModel(isSuccess: false, data: null);

        recordLogApp(
          'Error API',
          "API: ${_dio.options.baseUrl}$path\n"
              "Data: $data \n"
              "PARAMS: $queryParameters \n"
              "Response: $res",
        );

        if (customErrorRes != null) {
          customErrorRes.call(res);
        } else {
          if (showError) {
            NexDialog.showNexDialogTitleMessage(title: 'notification'.tr(), message: getMessage(res));
          }
        }
      }
    } on DioException catch (e) {
      if (cancelToken == null) _removeCancelToken(requestCancelToken);

      NexProgress.dismiss();
      if (CancelToken.isCancel(e)) {
        debugPrint('Request cancelled: POST $path');
      } else {
        if (customErrorCatch != null) {
          customErrorCatch.call(e);
          AppLog.error('PARAMS: ${queryParameters ?? ''}\nDATA: ${data ?? ''}\n${'ERROR: $e'}', 'POST:$path');
        } else {
          checkError(e, methodPath: 'POST:$path');
        }
      }
    }
    return BaseResponseModel(isSuccess: false, data: null);
  }

  Future<BaseResponseModel> put(String path, {Map<String, dynamic>? queryParameters, dynamic data, CancelToken? cancelToken}) async {
    final requestCancelToken = cancelToken ?? _createCancelToken();

    try {
      queryParameters = {...queryParameters ?? {}};
      queryParameters.removeWhere((key, value) => value == null);
      AppLog.info('TOKEN: $token\nPARAMS: $queryParameters\nDATA: ${data ?? ''}', 'PUT:${_dio.options.baseUrl}$path');

      final res = await _dio.put(path, queryParameters: queryParameters, data: data, cancelToken: requestCancelToken);

      if (cancelToken == null) _removeCancelToken(requestCancelToken);

      AppLog.info('PARAMS: $queryParameters\nDATA: ${data ?? ''}\n${'RESPONSE: $res'}', 'PUT:${_dio.options.baseUrl}$path');
      if (isSuccess(res)) {
        return BaseResponseModel(isSuccess: true, data: responseData(res));
      } else {
        if (!checkSpecialError(res)) return BaseResponseModel(isSuccess: false, data: null);
      }
    } on DioException catch (e) {
      if (cancelToken == null) _removeCancelToken(requestCancelToken);

      if (CancelToken.isCancel(e)) {
        debugPrint('Request cancelled: PUT $path');
      } else {
        checkError(e, methodPath: 'PUT:$path');
      }
    }
    return BaseResponseModel(isSuccess: false, data: null);
  }

  Future<BaseResponseModel> patch(String path, {Map<String, dynamic>? queryParameters, dynamic data, CancelToken? cancelToken}) async {
    final requestCancelToken = cancelToken ?? _createCancelToken();

    try {
      queryParameters = {...queryParameters ?? {}};
      queryParameters.removeWhere((key, value) => value == null);
      AppLog.info('TOKEN: $token\nPARAMS: $queryParameters\nDATA: ${data ?? ''}', 'PATCH:${_dio.options.baseUrl}$path');

      final res = await _dio.patch(path, queryParameters: queryParameters, data: data, cancelToken: requestCancelToken);

      if (cancelToken == null) _removeCancelToken(requestCancelToken);

      AppLog.info('PARAMS: $queryParameters\nDATA: ${data ?? ''}\n${'RESPONSE: $res'}', 'PATCH:${_dio.options.baseUrl}$path');
      if (isSuccess(res)) {
        return BaseResponseModel(isSuccess: true, data: responseData(res));
      } else {
        NexProgress.dismiss();
      }
    } on DioException catch (e) {
      if (cancelToken == null) _removeCancelToken(requestCancelToken);

      NexProgress.dismiss();
      if (CancelToken.isCancel(e)) {
        debugPrint('Request cancelled: PATCH $path');
      } else {
        checkError(e, methodPath: 'PATCH:$path');
      }
    }
    return BaseResponseModel(isSuccess: false, data: null);
  }

  Future<BaseResponseModel> delete(String path, {Map<String, dynamic>? queryParameters, dynamic data, CancelToken? cancelToken}) async {
    final requestCancelToken = cancelToken ?? _createCancelToken();

    try {
      queryParameters = {...queryParameters ?? {}};
      queryParameters.removeWhere((key, value) => value == null);
      AppLog.info('TOKEN: $token\nPARAMS: $queryParameters\nDATA: ${data ?? ''}', 'DELETE:${_dio.options.baseUrl}$path');

      final res = await _dio.delete(path, queryParameters: queryParameters, data: data, cancelToken: requestCancelToken);

      if (cancelToken == null) _removeCancelToken(requestCancelToken);

      AppLog.info('PARAMS: $queryParameters\nDATA: ${data ?? ''}\n${'RESPONSE: $res'}', 'DELETE:${_dio.options.baseUrl}$path');
      if (isSuccess(res)) {
        return BaseResponseModel(isSuccess: true, data: responseData(res));
      } else {
        NexProgress.dismiss();
      }
    } on DioException catch (e) {
      if (cancelToken == null) _removeCancelToken(requestCancelToken);

      NexProgress.dismiss();
      if (CancelToken.isCancel(e)) {
        debugPrint('Request cancelled: DELETE $path');
      } else {
        checkError(e, methodPath: 'DELETE:$path');
      }
    }
    return BaseResponseModel(isSuccess: false, data: null);
  }
}

abstract class BaseService {
  late Dio _dio;
  String? _token;

  String get token => _token ?? '';

  Dio get dio => _dio;

  // bool _isShowTokenExpired = false;

  void initAppService() {
    final headers = <String, dynamic>{'content-type': 'application/json', 'accept': 'application/json'};
    if (_token?.isNotEmpty == true) {
      headers.addAll({'Authorization': 'Bearer $_token'});
    }
    debugPrint('---Header: $headers');

    _dio = Dio(BaseOptions(baseUrl: '', responseType: ResponseType.json, headers: headers));
    _dio.addSentry();
    _dio.interceptors.add(
      InterceptorsWrapper(
        onRequest: (options, handler) async {
          return handler.next(options);
        },
        onResponse: (Response response, handler) {
          return handler.next(response);
        },
        onError: (DioException error, handler) async {
          recordLogApp(error.message, error.stackTrace);
          return handler.next(error);
        },
      ),
    );
  }

  void setToken(String? token) {
    AppStorage.write(AppConstants.keyToken, token);
    _token = token;
    initAppService();
  }

  bool isSuccess(Response response, {bool isCreate = false}) {
    if (response.data['statusValue'] == 'TOKEN_IS_INCORRECT') {
      // NexProgress.dismiss();
      // getIt<AppCubit>().onLogout();
      // setToken(null);
      // if (!_isShowTokenExpired) {
      //   _isShowTokenExpired = true;
      //   NexDialog.showNexDialogTitleMessage(title: 'notification'.tr(), message: 'TOKEN Expired').then((e) {
      //     _isShowTokenExpired = false;
      //   });
      // }

      return true;
    }
    if (response.data['success'] == true) {
      return true;
    }
    return false;
  }

  String getMessage(Response response) {
    if (response.statusCode == 500) {
      return 'An error is occurring, please try again later!';
    }
    return response.data['statusValue'];
  }

  bool checkSpecialError(Response response) {
    if (response.data['statusValue'] == 'DONT_HAVE_PERMISSION') {
      return false;
    }
    return true;
  }

  dynamic responseData(Response response) {
    try {
      final a = response.data['data'];
      if (a != null) {
        return a;
      }
      return response.data;
    } catch (e) {
      return response.data;
    }
  }

  void checkError(DioException e, {String? methodPath}) {
    if (e.response?.statusCode == 401) {
    } else {
      String textError = 'An error is occurring, please try again later!';
      if (e.type == DioExceptionType.connectionTimeout ||
          e.type == DioExceptionType.receiveTimeout ||
          e.type == DioExceptionType.connectionError ||
          e.type == DioExceptionType.sendTimeout) {
        textError = 'The network connection is not stable, please check again!';
      } else {
        if (e.response?.statusCode == 400) {
          try {
            textError = e.response!.data['statusValue'];
          } catch (E) {
            textError = 'An error is occurring, please try again later!';
          }
        }
      }

      AppLog.error(textError, methodPath ?? '---Whoops API---');

      recordLogApp('Error API', "API: ${_dio.options.baseUrl}$methodPath\n");

      NexDialog.showNexDialogTitleMessage(title: 'notification'.tr(), message: textError);
    }
  }

  void recordLogApp(dynamic reason, dynamic exception) {
    // SentryService.recordCrash(reason, exception);
  }
}

mixin AutoCancelAppServiceMixin<T extends StatefulWidget> on State<T> {
  final _service = getIt.get<AppService>();

  @override
  void dispose() {
    final activeCount = _service.activeRequestsCount;
    if (activeCount > 0) {
      debugPrint('🛑 Cancelling $activeCount active requests for ${widget.runtimeType}');
    }
    _service.cancelAllRequests('Widget ${widget.runtimeType} disposed');
    super.dispose();
  }

  void cancelAllRequests([String? reason]) {
    _service.cancelAllRequests(reason);
  }

  bool get hasActiveRequests => _service.hasActiveRequests;

  int get activeRequestsCount => _service.activeRequestsCount;
}
