//
// import 'dart:io';
//
// import 'package:firebase_dynamic_links/firebase_dynamic_links.dart';
// import 'package:flutter/material.dart';
// import 'package:flutter/services.dart';
// import 'package:image_picker/image_picker.dart';
// import 'package:path_provider/path_provider.dart';
// import 'package:share_plus/share_plus.dart';
// import '../../features/language/presentation/provider/language_provider.dart';
//
// FirebaseDynamicLinks dynamicLinks = FirebaseDynamicLinks.instance;
// Future<String> createDynamicLink({required String id,bool isUser = false}) async {
//   String DynamicLink = 'https://sharyapp.page.link?${isUser?"userId":"adId"}%3D$id';
//   final DynamicLinkParameters parameters = DynamicLinkParameters(
//     uriPrefix: 'https://sharyapp.page.link/share',
//     longDynamicLink: Uri.parse(
//       'https://sharyapp.page.link/?link=https://sharyapp.page.link?${isUser?"userId":"adId"}%3D$id&isi=6478088270&ibi=com.user.shary&efr=1&apn=com.user.shary',
//     ),
//     link: Uri.parse(DynamicLink),
//     androidParameters: const AndroidParameters(
//       packageName: 'com.user.shary',
//       minimumVersion: 0,
//     ),
//     iosParameters: const IOSParameters(
//         bundleId: 'com.user.shary',
//         minimumVersion: '1',
//         ipadBundleId: 'com.user.shary',
//         appStoreId: '6478088270'
//     ),
//   );
//
//   Uri url;
//   final ShortDynamicLink shortLink =
//   await dynamicLinks.buildShortLink(parameters);
//   url = shortLink.shortUrl;
//   return url.toString();
// }
// void share(context,
//     {required String description,
//       required int id,
//       required bool isUser,
//       required String image,
//       required String name})async{
//   // loading();
//   final box = context.findRenderObject() as RenderBox?;
//   String des = description.length>40?description.substring(40):description;
//   String url2 = await createDynamicLink(id: id.toString(),isUser: isUser);
//   Uint8List bytes = (await NetworkAssetBundle(Uri.parse(image))
//       .load(image))
//       .buffer
//       .asUint8List();
//   final temp = await getTemporaryDirectory();
//   final path = '${temp.path}/share.jpeg';
//   File(path).writeAsBytesSync(bytes);
//   // navPop(context);
//   await Share.shareXFiles(path==''?[]:[XFile(path)],
//     text: "$name\n$des\n\n$url2\n\n\n${LanguageProvider.translate('profile', 'share')}",subject: url2,
//     sharePositionOrigin: Constants.isTablet?
//     (box!.localToGlobal(Offset.zero) & box.size):null,
//   );
// }