class ClassroomWidgets {
  // make this class singleton 
    ClassroomWidgets._internal();
    static final ClassroomWidgets _singleton = ClassroomWidgets._internal();
    factory ClassroomWidgets() {
      return _singleton;
    }
  // codes start from here
  // All methods should be static to maintain singleton instances
  
}