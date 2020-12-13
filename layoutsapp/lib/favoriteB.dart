import 'package:flutter/material.dart';

//Parent Manages Favorite B

class ParentManageB extends StatefulWidget {
  @override
  _ParentManageBState createState() => _ParentManageBState();
}

class _ParentManageBState extends State<ParentManageB> {
  bool _isFavorited = true;
  int _favoriteCount = 41;

  void _handleTapboxChanged(bool newValue) {
    setState(() {
      _isFavorited = newValue;
      if (_isFavorited) {
        _favoriteCount += 1;
      } else {
        _favoriteCount -= 1;
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      child: FavoriteB(
          isFavorited: _isFavorited,
          onChanged: _handleTapboxChanged,
          favoriteCount: _favoriteCount),
    );
  }
}

//Favorite B

class FavoriteB extends StatelessWidget {
  FavoriteB(
      {Key key,
      this.isFavorited: false,
      @required this.onChanged,
      this.favoriteCount})
      : super(key: key);

  final bool isFavorited;
  final favoriteCount;
  final ValueChanged<bool> onChanged;

  void _handleTap() {
    onChanged(!isFavorited);
  }

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisSize: MainAxisSize.min,
      children: [
        Container(
          padding: EdgeInsets.all(0),
          child: IconButton(
            padding: EdgeInsets.all(0),
            alignment: Alignment.centerRight,
            icon: (isFavorited ? Icon(Icons.star) : Icon(Icons.star_border)),
            color: Colors.red[500],
            onPressed: _handleTap,
          ),
        ),
        SizedBox(
          width: 18,
          child: Container(
            child: Text('$favoriteCount'),
          ),
        ),
      ],
    );
  }
}