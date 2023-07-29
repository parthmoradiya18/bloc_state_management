class DemoState {
  DemoState init() {
    return DemoState();
  }

  DemoState clone() {
    return DemoState();
  }
}
class init_class extends DemoState{
  int s;
  init_class(this.s);
}
class sum_state extends DemoState
{
    int s;
    sum_state(this.s);
}
class sub_state extends DemoState
{
  int s;
  sub_state(this.s);
}
class str_state extends DemoState
{
  String s;
  str_state(this.s);
}