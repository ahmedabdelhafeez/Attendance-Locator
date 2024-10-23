import 'package:flutter/material.dart';
import 'package:sizer/sizer.dart';
import 'package:webview_flutter/webview_flutter.dart';
import '../../../../config/app_color.dart';
import '../../../../core/widget/back_button_widget.dart';
import '../../../language/presentation/provider/language_provider.dart';

class WebViewPage extends StatefulWidget {
  final String title;
  final String link;
  const WebViewPage({required this.title,required this.link,Key? key}) : super(key: key);

  @override
  State<WebViewPage> createState() => _WebViewPageState();
}

class _WebViewPageState extends State<WebViewPage> {
  WebViewController controller = WebViewController();
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    controller = WebViewController()
      ..setJavaScriptMode(JavaScriptMode.unrestricted)
      ..setBackgroundColor(const Color(0x00000000))
      ..setNavigationDelegate(
        NavigationDelegate(
          onProgress: (int progress) {
            // Update loading bar.
          },
          onPageStarted: (String url) {},
          onPageFinished: (String url) {},
          onWebResourceError: (WebResourceError error) {},
          onNavigationRequest: (NavigationRequest request) {

            return NavigationDecision.navigate;
          },
        ),
      )
      ..loadRequest(Uri.parse(widget.link));

  }
  @override
  Widget build(BuildContext context) {

    // if (Platform.isAndroid) WebView.platform = AndroidWebView();
    return Scaffold(
      appBar: AppBar(
        toolbarHeight: 5.5.h,
        title: Text(LanguageProvider.translate("more", widget.title),style: TextStyle(fontSize: 14.sp,color: Colors.white,
            fontWeight: FontWeight.bold),),
        leading: const BackButtonWidget(),
        centerTitle: false,
        backgroundColor: AppColor.defaultColor,

      ),
      body: WebViewWidget(controller: controller),
    );
  }
}