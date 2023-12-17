class QuizWidgets {
  // make this class singleton 
    QuizWidgets._internal();
    static final QuizWidgets _singleton = QuizWidgets._internal();
    factory QuizWidgets() {
      return _singleton;
    }
  // codes start from here
  // All methods should be static to maintain singleton instances
  
}