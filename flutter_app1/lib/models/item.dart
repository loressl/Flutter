class Item{
  String title;
  bool done;
  //se passar entre {} já está esperando os parâmetros e já esta esperando passar
  Item({this.title, this.done});

  //dynamic tipo objeto
  Item.fromJson(Map<String, dynamic> json){
    title = json['title'];
    done = json['done'];
  }
  //retorna no formato json
  Map<String, dynamic> toJson(){
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['title'] = this.title;
    data['done'] = this.done;
    return data;
  }
}