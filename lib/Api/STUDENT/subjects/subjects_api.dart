class SubjectsApis{
  // make this class singleton 
    SubjectsApis._internal();
    static final SubjectsApis _singleton = SubjectsApis._internal();
    factory SubjectsApis() {
      return _singleton;
    }
  // codes start from here
  // All methods should be static to maintain singleton instances
  
}
