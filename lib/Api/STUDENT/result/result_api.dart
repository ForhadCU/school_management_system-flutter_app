class ResultApis{
  // make this class singleton 
    ResultApis._internal();
    static final ResultApis _singleton = ResultApis._internal();
    factory ResultApis() {
      return _singleton;
    }
  // codes start from here
  // All methods should be static to maintain singleton instances
  
}
