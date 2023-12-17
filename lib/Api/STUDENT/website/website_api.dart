class WebsiteApis{
  // make this class singleton 
    WebsiteApis._internal();
    static final WebsiteApis _singleton = WebsiteApis._internal();
    factory WebsiteApis() {
      return _singleton;
    }
  // codes start from here
  // All methods should be static to maintain singleton instances
}
