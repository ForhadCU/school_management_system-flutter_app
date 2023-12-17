class HelpDeskWidgets {
  // make this class singleton 
    HelpDeskWidgets._internal();
    static final HelpDeskWidgets _singleton = HelpDeskWidgets._internal();
    factory HelpDeskWidgets() {
      return _singleton;
    }
  // codes start from here
  // All methods should be static to maintain singleton instances
  
}