class Users{
  String? uid;
  String? name;
  String? email;
  String? username;
  String? status='';
  String state='';
  String? profilephoto;
  Users({required this.uid,
    required this.name, required this.email, required this.username, required this.status, required this.state,
    required this.profilephoto});

  Map<String,dynamic>tomap(Users user){
    Map<String,dynamic>data=Map();
    data['uid']=user.uid;
    data['name']=user.name;
    data['email']=user.email;
    data['username']=user.username;
    data['status']=user.status;
    data['state']=user.state;
    data['profilephoto']=user.profilephoto;

    return data;
  }

   Users.fromMap(Map mapdata){
    this.uid=mapdata['uid'];
    this.name=mapdata['name'];
    this.email=mapdata['email'];
    this.username=mapdata['username'];
    this.status=mapdata['status'];
    this.state=mapdata['state'];
    this.profilephoto=mapdata['profilephoto'];


  }

}