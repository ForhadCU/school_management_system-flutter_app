class HelpdeskApi{
  // make this class singleton 
    HelpdeskApi._internal();
    static final HelpdeskApi _singleton = HelpdeskApi._internal();
    factory HelpdeskApi() {
      return _singleton;
    }
  // codes start from here
  // All methods should be static to maintain singleton instances
  
}
