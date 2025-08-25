// ignore_for_file: depend_on_referenced_packages

import 'dart:async';
import 'package:nex_live_chat/common/widget/extensions/nex_button.dart';
import 'package:webview_flutter/webview_flutter.dart';
import 'package:webview_flutter_wkwebview/webview_flutter_wkwebview.dart';
import '../commons.dart';

class WebViewScreen extends StatefulWidget {
  const WebViewScreen({super.key, this.title, required this.url, this.navigationDelegate, this.showAppBar = false});
  final String? title;
  final String url;
  final bool showAppBar;

  final FutureOr<NavigationDecision> Function(NavigationRequest request)? navigationDelegate;

  @override
  State<WebViewScreen> createState() => _WebViewScreenState();
}

class _WebViewScreenState extends State<WebViewScreen> {
  late final WebViewController _controller;
  late final PlatformWebViewControllerCreationParams params;

  bool isLoading = true;
  @override
  void initState() {
    super.initState();
    if (WebViewPlatform.instance is WebKitWebViewPlatform) {
      params = WebKitWebViewControllerCreationParams(
        allowsInlineMediaPlayback: true,
        mediaTypesRequiringUserAction: const <PlaybackMediaTypes>{},
      );
    } else {
      params = const PlatformWebViewControllerCreationParams();
    }

    final WebViewController controller = WebViewController.fromPlatformCreationParams(params);

    controller
      ..setJavaScriptMode(JavaScriptMode.unrestricted)
      ..setBackgroundColor(const Color(0x00000000))
      ..setNavigationDelegate(
        NavigationDelegate(
          onProgress: (int progress) {
            debugPrint('WebView is loading (progress : $progress%)');
          },
          onPageStarted: (String url) {
            debugPrint('Page started loading: $url');
          },
          onPageFinished: (String url) {
            if (mounted) {
              setState(() {
                isLoading = false;
              });
            }
          },
          onNavigationRequest: widget.navigationDelegate,
          // onNavigationRequest: widget.navigationDelegate,
        ),
      )
      ..loadRequest(Uri.parse(widget.url))
      ..enableZoom(false);

    _controller = controller;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: widget.showAppBar
          ? AppBar(
              title: Text(widget.title ?? '', maxLines: 2, textAlign: TextAlign.center, style: textTheme.bodyMedium),
              leading: const LeadingBackButton(),
            )
          : null,
      body: SafeArea(
        top: false,
        left: false,
        right: false,
        child: Stack(
          children: [
            WebViewWidget(controller: _controller),
            isLoading ? const Center(child: CircularProgressIndicator()) : const Stack(),
          ],
        ),
      ),
    );
  }
}
