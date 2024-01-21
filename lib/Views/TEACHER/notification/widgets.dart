class NotificationWidgets {
  // make this class singleton 
    NotificationWidgets._internal();
    static final NotificationWidgets _singleton = NotificationWidgets._internal();
    factory NotificationWidgets() {
      return _singleton;
    }
  // codes start from here
  // All methods should be static to maintain singleton instances
  
}