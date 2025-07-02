class CodeError {
  static String getFirebaseErrorMessage(String code) {
    switch (code) {
      case 'permission-denied':
        return 'Bạn không có quyền truy cập dữ liệu này.';
      case 'unavailable':
        return 'Máy chủ đang bận hoặc mất kết nối. Vui lòng thử lại.';
      case 'not-found':
        return 'Không tìm thấy dữ liệu.';
      case 'unauthenticated':
        return 'Bạn chưa đăng nhập. Vui lòng đăng nhập để tiếp tục.';
      case 'deadline-exceeded':
        return 'Kết nối quá thời gian chờ. Kiểm tra mạng và thử lại.';
      case 'resource-exhausted':
        return 'Đã vượt quá giới hạn truy cập. Vui lòng thử lại sau.';
      default:
        return 'Đã xảy ra lỗi không xác định. Vui lòng thử lại.';
    }
  }
}
