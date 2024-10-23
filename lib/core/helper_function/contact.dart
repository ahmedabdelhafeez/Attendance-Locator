import 'package:url_launcher/url_launcher.dart';


void launchLink(String link)async{
  await launchUrl(Uri.parse(link));
}

void openWhatsApp(String phone){
  launchLink('https://wa.me/$phone');
}
void openTelegram(String phone){
  launchLink('https://telegram.me/$phone');
}
void callPhone(String phone){
  launchLink('tel:$phone');
}