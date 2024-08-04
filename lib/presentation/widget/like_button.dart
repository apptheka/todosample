import 'package:flutter/material.dart';

class LikeButton extends StatefulWidget {
  bool isLiked;
  final ValueChanged<bool> onLiked;
  String text;
  // String Icon;
  LikeButton(
      {Key? key,
      required this.isLiked,
      required this.onLiked,
      required this.text,
      })
      : super(key: key);

  @override
  State<LikeButton> createState() => _LikeButtonState();
}

class _LikeButtonState extends State<LikeButton>
    with SingleTickerProviderStateMixin {
  late final AnimationController _controller = AnimationController(
      vsync: this,
      value: widget.isLiked ? 1.0 : 0.0,
      duration: const Duration(milliseconds: 200));

  @override
  void dispose() {
    super.dispose();
    _controller.dispose();
  }

  @override
  void didUpdateWidget(covariant LikeButton oldWidget) {
    if (widget.isLiked != oldWidget.isLiked) {
      widget.isLiked ? _controller.forward() : _controller.reverse();
    }
    super.didUpdateWidget(oldWidget);
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        // if (widget.onLiked != null) {
        //   widget.onLiked!(!widget.isLiked);
        // }
        widget.isLiked = !widget.isLiked;
        widget.onLiked(widget.isLiked);
        setState(() {});
      },
      child: Row(
        children: [
          ScaleTransition(
            scale: Tween(begin: 0.7, end: 1.0).animate(
                CurvedAnimation(parent: _controller, curve: Curves.easeOut)),
            child: widget.isLiked
                ? const Icon(
                    Icons.thumb_up_sharp, // Changed to thumbs up icon
                    size: 30,
                    color: Color.fromARGB(255, 238, 131, 73),
                  )
                : const Icon(
                    Icons.thumb_up_outlined, // Thumbs up outlined icon
                    size: 30,
                  ),
          ),
          SizedBox(
            width: 8,
          ),
          Text(
            widget.text,
            style: TextStyle(fontSize: 16),
          )
        ],
      ),
    );
  }
}
