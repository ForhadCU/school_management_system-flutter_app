class CalendarWidgets {
  // make this class singleton 
    CalendarWidgets._internal();
    static final CalendarWidgets _singleton = CalendarWidgets._internal();
    factory CalendarWidgets() {
      return _singleton;
    }
  // codes start from here
  // All methods should be static to maintain singleton instances
  
}