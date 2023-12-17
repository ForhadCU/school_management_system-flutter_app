class WebsiteWidgets {
  // make this class singleton 
    WebsiteWidgets._internal();
    static final WebsiteWidgets _singleton = WebsiteWidgets._internal();
    factory WebsiteWidgets() {
      return _singleton;
    }
  // codes start from here
  // All methods should be static to maintain singleton instances
  
}