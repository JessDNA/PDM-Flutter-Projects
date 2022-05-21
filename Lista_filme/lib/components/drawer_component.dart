import 'package:flutter/material.dart';

class DrawerComponent extends StatelessWidget {
  const DrawerComponent({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: ListView(
        children: [
          Image.network("https://cdn.folhape.com.br/upload/dn_arquivo/2021/11/arcane.jpg"),
        UserAccountsDrawerHeader(
              accountName: Text("UserName"),
              accountEmail: Text("User@email.com"),
            currentAccountPicture: CircleAvatar(
              backgroundImage: NetworkImage("https://pbs.twimg.com/media/FCynXr4VkAoKLlE.jpg:small"),
            ),
          ),
          ListTile(
            leading: Icon(Icons.list),
            title: Text("Listar Filmes"),
            subtitle: Text("listagem de filmes Top 10"),
            trailing: Icon(Icons.arrow_forward),
            onTap: () {
              print("Listar filmes");
              Navigator.pop(context);
            },
          )
        ],
      ),
    );
  }
}
 