import 'package:flutter/material.dart';

//Parent Manages Favorite C
class ParentManageC extends StatefulWidget {
  @override
  _ParentManageCState createState() => _ParentManageCState();
}

class _ParentManageCState extends State<ParentManageC> {
  int _favoriteCount = 41;

  void _handleTapboxChanged(bool newValue) {
    setState(() {
      if (newValue) {
        _favoriteCount += 1;
      } else {
        _favoriteCount -= 1;
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      child: FavoriteC(
        onChanged: _handleTapboxChanged,
        favoriteCount: _favoriteCount,
      ),
    );
  }
}

//FavoriteC
class FavoriteC extends StatefulWidget {
  FavoriteC({Key key, @required this.onChanged, this.favoriteCount})
      : super(key: key);

  final ValueChanged<bool> onChanged;
  final int favoriteCount;

  @override
  _FavoriteCState createState() => _FavoriteCState();
}

class _FavoriteCState extends State<FavoriteC> {
  bool isFavorited = true;

  get favoriteCount => widget.favoriteCount;

  void _handleTap() {
    setState(() {
      widget.onChanged(!isFavorited);
      isFavorited = !isFavorited;
    });
  }

  Widget build(BuildContext context) {
    return Row(
      children: [
        Container(
          child: IconButton(
            alignment: Alignment.centerRight,
            icon: (isFavorited ? Icon(Icons.star) : Icon(Icons.star_border)),
            color: Colors.red[500],
            onPressed: _handleTap,
          ),
        ),
        Text('$favoriteCount'),
      ],
    );
  }
}