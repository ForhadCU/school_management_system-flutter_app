class StuCalendarWidgets {
  // make this class singleton 
    StuCalendarWidgets._internal();
    static final StuCalendarWidgets _singleton = StuCalendarWidgets._internal();
    factory StuCalendarWidgets() {
      return _singleton;
    }
  // codes start from here
  // All methods should be static to maintain singleton instances
  
}