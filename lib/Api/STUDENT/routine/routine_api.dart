class RoutineApis{
  // make this class singleton 
    RoutineApis._internal();
    static final RoutineApis _singleton = RoutineApis._internal();
    factory RoutineApis() {
      return _singleton;
    }
  // codes start from here
  // All methods should be static to maintain singleton instances
  
}
