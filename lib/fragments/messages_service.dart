import 'package:url_launcher/url_launcher.dart';

class MessagesService {
  void sendSms(String debtorContactNumber) => launch("sms:$debtorContactNumber");
}