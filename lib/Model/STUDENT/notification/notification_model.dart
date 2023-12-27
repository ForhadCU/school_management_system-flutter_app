class NotificationApis{
  // make this class singleton 
    NotificationApis._internal();
    static final NotificationApis _singleton = NotificationApis._internal();
    factory NotificationApis() {
      return _singleton;
    }
  // codes start from here
  // All methods should be static to maintain singleton instances
  
}
