class ExamWidgets {
  // make this class singleton 
    ExamWidgets._internal();
    static final ExamWidgets _singleton = ExamWidgets._internal();
    factory ExamWidgets() {
      return _singleton;
    }
  // codes start from here
  // All methods should be static to maintain singleton instances
  
}