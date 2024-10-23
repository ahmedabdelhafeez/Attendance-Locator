import 'package:firebase_messaging/firebase_messaging.dart';

// class AccessTokenFireBase {
//   static String firebaseMessagingScope =
//       "https://www.googleapis.com/auth/firebase.messaging";
//   Future<String> getAccessToken() async {
//     final client = await clientViaServiceAccount(
//         ServiceAccountCredentials.fromJson(
//           {
//             "type": "service_account",
//             "project_id": "untitled-f9fd7",
//             "private_key_id": "bebad1a7e7967bbb76f9083a684d270155adb158",
//             "private_key":
//                 "-----BEGIN PRIVATE KEY-----\nMIIEvgIBADANBgkqhkiG9w0BAQEFAASCBKgwggSkAgEAAoIBAQDGjNRhDvjecDgb\nd2Vv/45hp0+m01oJ2RqS/KvfZzLsd9YP/VrtXAHnRHgBikmDKAfkXXemz+Rkjcbo\nvqQMH8E14eY5HDSXTaX0/Zy/jCm+CYE4rvadgSgbUgZ7tF98389B9y/GR+apzkEt\nVUr8kFiIw/LhiPYonfwtLOCJgHGnXsQQcuSE9i5j+YA/nucH1LjjfJbQlPZSiTAt\nMEBdmADEGtbLAGyF+eaWt6CcLQv8MoEl/GY6JKabZ+OPxYsgeq+VGqrDn/Jhszfq\nU1WxWNx8yXOrt/YRKnvOW8vUbtZaEFeUcwwDW2MXKj48SEONaAfx9PdRAfSyWf3L\nRKHh7a0BAgMBAAECggEAXPF2x5qBIGtqsFzTVLrOFWODU0Yzq1GAcZcrA7Ck83Hj\neGeypVMBJxfzj1EDOYzHKP0h8in2MaX2m2QGmhBRWx5MraZI7hzwl38S3c3Iioeb\ngIPSuQdJVYSvuT/FxUhllm0WZZyp2wpMk2KOcC1H7HnBnBcHmBrgfes4jtVcHqrX\n+HWKREo9frR8fL/KomF+pQfV/7tpBWh26NfvInu1dD9fhS4l0pqUfxqf0hHvGwEx\nGorm+0SKQw/r5EV4EOaOCPVTjpTHJ6yXShvNbd3cp7cUcX1r9K3eLMViQMQzDRdp\nSu0hPXFt8tXgdjSaB9mefRqZlmDcjEpvkz+ewTgkIwKBgQDuY2nMGgGMW3ytt29x\nX4mm3buVDMbcB7WUlQ6hCfC1ZamtXdUiJBg6lsn2EFvmjE3K3SYleUHsTyh5IzB8\njTzmUiNDV60avlEAF6rPrtjV4QoBpEKLtIyo7k1WrJO/P30XcXbFXFXW6Zbg3uza\nPWvu1DJF+F63miaP67IFhEF1UwKBgQDVN/b8VvDld2RIkZIcShXyy/e7Bu4LMstT\nyU6yKUbW8gFc26RWXxdQeGpG3kOEFQW33jfEjywn5SHDd8PjYnMN9Ets+t44iUNT\nnfpgGlz9pUikVpMypN2WCadihmz2vbIkquYcf8E0xkAA9+T8p09P1pwH1YcScajN\nJoeIhyeV2wKBgQCenmlsFDXJhapdEHxHrLEz5cAF+h1rlHme5tt4DdwrZvzSzWee\nsvOoMGMrplDwA5VTkXjrYFab/UPJ7r85cOT/v9GU4obdD5tn+1d9nzLKhVWaKAjb\nWoRpdz7gmC4rB/ydF7NWuQyo1n69G7fvswTZQjo9Unj7o8da5hJrF0hS3wKBgGXk\nu9R1W+Pc/YCsiG2afgisrrOjKSkS2hYtUr1TenYH6tzMXimkgcjD8s3xM8SwIy5u\nNKprXUeneU4nMua8So11nIH1FTNhbVpNWbSJhLz2OtPGR8vg+7/S1zn/UZ1MpBBf\n113xM4yb3URZMwYGkqFtxtz7jvQieu+nJQf6xtEXAoGBANWiNn1MxbChKV8HICMZ\nAfRdySrQW5uZCLnJo/by9FH9NuuSctBnvxGJcPHPL8kcFyhtpeRdPL4n0WY3X91f\nQ8B+1yCYrcAsZafD2tfhdjxs0JuM1C0bvpq6fEoZ8586qUQLas/+6lFvl87HZyQB\nR+fK3jBQ7NWVcbWEC4yzc72W\n-----END PRIVATE KEY-----\n",
//             "client_email":
//                 "firebase-adminsdk-onst0@untitled-f9fd7.iam.gserviceaccount.com",
//             "client_id": "108406079048112839634",
//             "auth_uri": "https://accounts.google.com/o/oauth2/auth",
//             "token_uri": "https://oauth2.googleapis.com/token",
//             "auth_provider_x509_cert_url":
//                 "https://www.googleapis.com/oauth2/v1/certs",
//             "client_x509_cert_url":
//                 "https://www.googleapis.com/robot/v1/metadata/x509/firebase-adminsdk-onst0%40untitled-f9fd7.iam.gserviceaccount.com",
//             "universe_domain": "googleapis.com"
//           },
//         ),
//         [firebaseMessagingScope]);
//     final accessToken = client.credentials.accessToken.data;
//     return accessToken;
//   }
// }
// bool inChat = false; // var to know if you in chat page ot not

Future notificationsFirebase() async {
  FirebaseMessaging.onMessage.listen((event) async {
    if (event.notification != null) {
      appNotifications(event.notification!,
          payload: event.data, fromWhereClicked: 1);
    }
  });

  FirebaseMessaging.onMessageOpenedApp.listen((event) async {
    if (event.notification != null) {
      appNotifications(event.notification!,
          click: true, fromWhereClicked: 2, payload: event.data);
    }
  });
  NotificationSettings settings = await FirebaseMessaging.instance
      .requestPermission(
          sound: true,
          badge: false,
          alert: true,
          criticalAlert: true,
          provisional: true);

  if (settings.authorizationStatus == AuthorizationStatus.authorized) {
  } else if (settings.authorizationStatus == AuthorizationStatus.provisional) {
  } else {}
}

void appNotifications(RemoteNotification data2,
    {bool click = false,
    bool start = false,
    Map? payload,
    required int fromWhereClicked}) async {
  bool showNotificationLocal = true;

  if (payload!.containsKey('message_type_')) {
    if (payload['message_type_'] == "order") {
      // int orderId = convertStringToInt(jsonDecode(payload['data_']));
      // OrderDetailsProvider orderDetailsProvider =
      //     Provider.of(Constants.globalContext(), listen: false);
      // if (orderDetailsProvider.orderEntity != null &&
      //     orderDetailsProvider.orderEntity!.id == orderId) {
      //   orderDetailsProvider.getOrderDetails(orderId, updateOrderPage: true);
      //   showNotificationLocal = false;
      // }
    }
  }
  // if (click && AuthProvider.isLogin() && fromWhereClicked == 2) {
  //   clickNoti(jsonEncode(payload));
  //   NotificationLocalClass.notificationsPlugin.cancelAll();
  // }
  // if (showNotificationLocal && AuthProvider.isLogin() && !click) {
  //   NotificationLocalClass.showNoti(
  //       title: data2.title ?? "",
  //       body: data2.body ?? "",
  //       payload: jsonEncode(payload));
  // }
}
