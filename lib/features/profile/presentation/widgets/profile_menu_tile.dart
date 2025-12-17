import 'package:flutter/material.dart';

class ProfileMenuTile extends StatefulWidget {
  final IconData iconName;
  final String name;  
  final VoidCallback onTap;

  const ProfileMenuTile({super.key, required this.iconName, required this.name, required this.onTap});

  @override
  State<ProfileMenuTile> createState() => _ProfileMenuTileState();
}

class _ProfileMenuTileState extends State<ProfileMenuTile> {
  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: widget.onTap,
      child: Expanded(child: Container(        
        height: 110,        
        padding: EdgeInsets.symmetric(horizontal: 25),
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(12)
        ),
        child: Row(          
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          crossAxisAlignment: CrossAxisAlignment.center,          
          children: [
            Row(
              children: [
                Icon(widget.iconName, size: 35),
                SizedBox(width: 20),
                Text(widget.name),
              ],
            ),
            Icon(Icons.keyboard_arrow_right, size: 40)
          ],
        ),
      )),
    );
  }
}
