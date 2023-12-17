class AttendanceApis{
  // make this class singleton 
    AttendanceApis._internal();
    static final AttendanceApis _singleton = AttendanceApis._internal();
    factory AttendanceApis() {
      return _singleton;
    }
  // codes start from here
  // All methods should be static to maintain singleton instances
  
}
