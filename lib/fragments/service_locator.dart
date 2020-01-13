import 'package:project/fragments/messages_service.dart';
import 'package:get_it/get_it.dart' ;

GetIt locator = GetIt();

void setupLocator() {
  locator.registerSingleton(MessagesService());
}