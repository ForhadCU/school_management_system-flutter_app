class ExamApis{
  // make this class singleton 
    ExamApis._internal();
    static final ExamApis _singleton = ExamApis._internal();
    factory ExamApis() {
      return _singleton;
    }
  // codes start from here
  // All methods should be static to maintain singleton instances
  
}
