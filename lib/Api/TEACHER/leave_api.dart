class LeaveApis {
  // make this class singleton
  LeaveApis._internal();
  static final LeaveApis _singleton = LeaveApis._internal();
  factory LeaveApis() {
    return _singleton;
  }
  // codes start from here
  // All methods should be static to maintain singleton instances

  
}
