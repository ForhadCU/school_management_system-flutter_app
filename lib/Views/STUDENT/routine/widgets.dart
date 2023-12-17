class RoutineWidgets {
  // make this class singleton 
    RoutineWidgets._internal();
    static final RoutineWidgets _singleton = RoutineWidgets._internal();
    factory RoutineWidgets() {
      return _singleton;
    }
  // codes start from here
  // All methods should be static to maintain singleton instances
  
}