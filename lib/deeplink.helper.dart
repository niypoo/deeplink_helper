import 'dart:async';
import 'package:app_links/app_links.dart';
import 'package:deeplink_helper/abstracts/dynamicLinkHandler.abstract.dart';

class DeeplinkHelper {
  static final _appLinks = AppLinks();
  static late StreamSubscription<Uri> _linkSubscription;

  // Initialization
  static Future<void> init({
    required DynamicLinkServiceHandler handler,
  }) async {
    // Get the initial/first link.
    // This is useful when app was terminated (i.e. not started)
    // Try to get initial value (app just open)
    handler.handler(await _appLinks.getInitialAppLink());

    // // Listen to dynamic (app has opened)
    _linkSubscription =
        _appLinks.uriLinkStream.listen((uri) => handler.handler(uri));
  }

  static dispose() => _linkSubscription.cancel();

  // create link
  static String create({
    required String schema,
    required String url,
    required String path,
    String? params,
  }) {
    return '$schema://$url/$path${params != null ? '?$params' : ''}';
  }
}
