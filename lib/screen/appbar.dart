
import 'package:flutter/material.dart';
 class  CustomAppBar extends StatelessWidget {

  final Widget tittle;
  final List<Widget>action;
  final  leading;
  final bool centertitle;
  CustomAppBar(this.tittle, this.action, this.leading, this.centertitle);


  @override
  Widget build(BuildContext context) {
return Container(
  decoration:  BoxDecoration(
    color: Colors.black26,
    border: Border(
      bottom: BorderSide(
        color: Colors.blue,
      width: 1.4,
        style: BorderStyle.solid,
      )

    )
  ),
  child: AppBar(
    backgroundColor: Colors.blueGrey,
    elevation: 0,
    leading: leading,
    actions: action,
    centerTitle: centertitle,
    title: tittle,
  ),
);
  }

 final Size preferredSize=const Size.fromHeight(kToolbarHeight+10);
}