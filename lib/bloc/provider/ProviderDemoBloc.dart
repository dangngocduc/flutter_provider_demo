


class ProviderDemoBloc {

  int counter = 0;

  increment() {
    counter++;
    print("ProviderDemoBloc " + counter.toString());
  }

  decrement() {
    counter--;
    print("ProviderDemoBloc " + counter.toString());
  }

  demo({String name = "default", String name2 = "", String name3 = "default" }) {
    print(name + "-" + name2 + "-" + name3);
  }

  demo2([String name = "default", String name2 = "default", String name3 = "default" ]) {
    print(name + "-" + name2 + "-" + name3);
  }
}