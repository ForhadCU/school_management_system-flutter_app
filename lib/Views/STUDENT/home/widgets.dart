class HomeWidgets {
  // make this class singleton 
    HomeWidgets._internal();
    static final HomeWidgets _singleton = HomeWidgets._internal();
    factory HomeWidgets() {
      return _singleton;
    }
  // codes start from here
  // All methods should be static to maintain singleton instances
  
}