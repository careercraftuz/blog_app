String baseUrl = 'http://example.com';

// gets all user
String getAllUserURL = '$baseUrl/api/users';
// gets user by id function
String getUserByIdURL(int id) => '$baseUrl/api/users/$id';
// create user
String createUserURL = '$baseUrl/api/create-user';
// login user
String loginUserURL = '$baseUrl/api/login-user';

// gets all post
String getAllPostURL = '$baseUrl/api/posts';
// gets post by id function
String getPostByIdURL(int id) => '$baseUrl/api/posts/$id';
// create post
String createPostUrl = '$baseUrl/api/create-post';
// update post
String updatePostURL(int id) => '$baseUrl/api/update/$id';
// delete post
String deletePostURL(int id) => '$baseUrl/api/delete/$id';
