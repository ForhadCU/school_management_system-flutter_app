class LogioutApis{
  // make this class singleton 
    LogioutApis._internal();
    static final LogioutApis _singleton = LogioutApis._internal();
    factory LogioutApis() {
      return _singleton;
    }
  // codes start from here
  // All methods should be static to maintain singleton instances
  
}
