class SubjectsWidgets {
  // make this class singleton 
    SubjectsWidgets._internal();
    static final SubjectsWidgets _singleton = SubjectsWidgets._internal();
    factory SubjectsWidgets() {
      return _singleton;
    }
  // codes start from here
  // All methods should be static to maintain singleton instances
  
}