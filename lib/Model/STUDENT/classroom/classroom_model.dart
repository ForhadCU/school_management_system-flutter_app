class ClassroomApis{
  // make this class singleton 
    ClassroomApis._internal();
    static final ClassroomApis _singleton = ClassroomApis._internal();
    factory ClassroomApis() {
      return _singleton;
    }
  // codes start from here
  // All methods should be static to maintain singleton instances
  
}
