import 'package:indriveclone/core/class/status_request.dart';

StatusRequest handlingStatusRequestData(response) {
  if (response is StatusRequest) {
    return response;
  } else {
    return StatusRequest.success;
  }
}
