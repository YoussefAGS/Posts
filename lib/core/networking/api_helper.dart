

import 'api_error_handler.dart';
import 'api_result.dart';

class ApiHelper {
  // Generic function to handle API calls and error handling for all repos
  static Future<ApiResult<T>> handleApiCall<T>(Future<T> Function() apiCall) async {
    try {
      final response = await apiCall();
      return ApiResult.success(response);
    } catch (error) {
      return ApiResult.failure(ErrorHandler.handle(error));
    }
  }
}
