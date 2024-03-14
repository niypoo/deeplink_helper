abstract class DynamicLinkServiceHandler {
  // abstract
  void handler(Uri? payload);

  // Get Path
  String? getPath(Uri? payload) => payload?.path;

  // Get Params
  Map<String, String>? getParams(Uri? payload) => payload?.queryParameters;
}
