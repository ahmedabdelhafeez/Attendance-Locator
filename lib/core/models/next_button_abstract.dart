abstract class NextButtonAbstract {
  final String title;
  NextButtonAbstract({
    required this.title,
  });
}

abstract class SuperAbstracNextWidget{
  List<NextButtonAbstract>? superList();
void onTap(int index);
}