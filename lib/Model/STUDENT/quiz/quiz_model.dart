class QuizApis{
  // make this class singleton 
    QuizApis._internal();
    static final QuizApis _singleton = QuizApis._internal();
    factory QuizApis() {
      return _singleton;
    }
  // codes start from here
  // All methods should be static to maintain singleton instances
  
}
