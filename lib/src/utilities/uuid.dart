import 'package:uuid/uuid.dart';

var uuid = Uuid();

String newID() {
  return uuid.v1();
}
