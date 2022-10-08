class Api {
  static const _baseUrl = 'http://kpu-cimahi.com/api';

  // API LOGIN
  static const login = '$_baseUrl/auth/login';

  // API PROFILE
  static const getProfile = '$_baseUrl/profile/view';

  // API DOCUMENT
  //static const getHotlineDoc = '$_baseUrl/document/';
  static const getAllDocument = '$_baseUrl/document/list?page=1';
  static const UploadDocument = '$_baseUrl/document/upload';

  //API EMPLOYEE
  static const getAllEmployee = '$_baseUrl/employee';
  static const storeEmployee = '$_baseUrl/employee/store';
  static const updateEmployee = '$_baseUrl/employee/update';
  static const deleteEmployee = '$_baseUrl/employee/';

  static const user = '$_baseUrl/user';
  static const product = '$_baseUrl/product';
  static const history = '$_baseUrl/history';
  static const inout = '$_baseUrl/inout';

  static const add = 'add.php';
  static const update = 'update.php';
  static const delete = 'delete.php';
  static const gets = 'get.php';
  static const search = 'search.php';
  static const count = 'count.php';
}
