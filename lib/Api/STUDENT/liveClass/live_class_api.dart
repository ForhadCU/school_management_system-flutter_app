class LiveClassApis{
  // make this class singleton 
    LiveClassApis._internal();
    static final LiveClassApis _singleton = LiveClassApis._internal();
    factory LiveClassApis() {
      return _singleton;
    }
  // codes start from here
  // All methods should be static to maintain singleton instances
  
}
