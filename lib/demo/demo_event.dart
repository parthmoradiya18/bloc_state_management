abstract class DemoEvent {}

class InitEvent extends DemoEvent {}

class Sum_Event extends DemoEvent
{
      String s1,s2;
      Sum_Event(this.s1,this.s2);
}
class Sub_Event extends DemoEvent
{
  String s1,s2;
  Sub_Event(this.s1,this.s2);
}
class Str_Event extends DemoEvent
{
  String s1;
  Str_Event(this.s1);
}