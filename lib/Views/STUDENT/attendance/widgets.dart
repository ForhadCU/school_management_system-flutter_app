class AttendanceWidgets {
  // make this class singleton 
    AttendanceWidgets._internal();
    static final AttendanceWidgets _singleton = AttendanceWidgets._internal();
    factory AttendanceWidgets() {
      return _singleton;
    }
  // codes start from here
  // All methods should be static to maintain singleton instances
  
}