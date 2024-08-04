import 'package:flutter/material.dart';

class BookmarkButton extends StatefulWidget {
  bool isBookmarkd;
  final ValueChanged<bool> onBookmarkd;
  String text;
  BookmarkButton(
      {Key? key, required this.isBookmarkd, required this.onBookmarkd,required this.text})
      : super(key: key);

  @override
  State<BookmarkButton> createState() => _BookmarkButtonState();
}

class _BookmarkButtonState extends State<BookmarkButton>
    with SingleTickerProviderStateMixin {
  late final AnimationController _controller = AnimationController(
      vsync: this,
      value: widget.isBookmarkd ? 1.0 : 0.0,
      duration: const Duration(milliseconds: 200));

  @override
  void dispose() {
    super.dispose();
    _controller.dispose();
  }

  @override
  void didUpdateWidget(covariant BookmarkButton oldWidget) {
    if (widget.isBookmarkd != oldWidget.isBookmarkd) {
      widget.isBookmarkd ? _controller.forward() : _controller.reverse();
    }
    super.didUpdateWidget(oldWidget);
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        if (widget.onBookmarkd != null) {
          widget.onBookmarkd!(!widget.isBookmarkd);
        }
        widget.isBookmarkd = !widget.isBookmarkd;
        widget.onBookmarkd(widget.isBookmarkd);
        setState(() {});
      },
      child: Row(
        children: [
          ScaleTransition(
            scale: Tween(begin: 0.7, end: 1.0).animate(
                CurvedAnimation(parent: _controller, curve: Curves.easeOut)),
            child: widget.isBookmarkd
                ? const Icon(
                    Icons.bookmark, // Changed to thumbs up icon
                    size: 30,
                    color: Color.fromARGB(255, 238, 131, 73),
                  )
                : const Icon(
                    Icons.bookmark_border_sharp, // Thumbs up outlined icon
                    size: 30,
                  ),
          ),
          SizedBox(
            width: 8,
          ),
          Text(widget.text,style: TextStyle(fontSize: 16),),
        ],
      ),
    );
  }
}
