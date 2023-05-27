const String baseUrl = 'https://python2022g.pythonanywhere.com/';

// gets all user
const String getAllUserURL = '$baseUrl/api/users';
// gets user by id function
String getUserByIdURL(int id) => '$baseUrl/api/users/$id';
// create user
const String createUserURL = '$baseUrl/api/create-user/';
// login user
const String loginUserURL = '$baseUrl/api/login-user';

// gets all post
const String getAllPostURL = '$baseUrl/api/posts';
// gets post by id function
String getPostByIdURL(int id) => '$baseUrl/api/posts/$id';
// create post
const String createPostUrl = '$baseUrl/api/create-post';
// update post
String updatePostURL(int id) => '$baseUrl/api/update/$id';
// delete post
String deletePostURL(int id) => '$baseUrl/api/delete/$id';
