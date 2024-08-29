import 'package:flutter/material.dart';
import 'package:ndula/widgets/Requests/Requests.dart';

class AnimatedLikeButton extends StatefulWidget {
  // final Function() onPressed;
  final int number;
  final id;

  const AnimatedLikeButton(
      {Key? key,
      // required this.onPressed,
      required this.number,
      required this.id})
      : super(key: key);

  @override
  _AnimatedLikeButtonState createState() => _AnimatedLikeButtonState();
}

class _AnimatedLikeButtonState extends State<AnimatedLikeButton>
    with SingleTickerProviderStateMixin {
  late AnimationController _controller;
  late Animation<double> _sizeAnimation;
  late Animation<Color?> _colorAnimation;
  bool isLiked = false;

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(
      duration: const Duration(milliseconds: 300),
      vsync: this,
    );

    _sizeAnimation = TweenSequence<double>([
      TweenSequenceItem(tween: Tween<double>(begin: 24, end: 30), weight: 50),
      TweenSequenceItem(tween: Tween<double>(begin: 30, end: 24), weight: 50),
    ]).animate(_controller);

    _colorAnimation = ColorTween(
      begin: Colors.grey,
      end: Colors.red,
    ).animate(_controller);
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        setState(() {
          isLiked = !isLiked;
          if (isLiked) {
            _controller.forward();
            Requests.addLike(id: widget.id, likes: widget.number);
          } else {
            _controller.reverse();
            int liked = widget.number - 1;
            Requests.addLike(id: widget.id, likes: liked);
            
      
          }
        });
        // widget.onPressed();
      },
      child: Row(
        children: [
          AnimatedBuilder(
            animation: _controller,
            builder: (context, child) {
              return Icon(
                isLiked ? Icons.favorite : Icons.favorite_border,
                color: _colorAnimation.value,
                size: _sizeAnimation.value,
              );
            },
          ),
          SizedBox(width: 4),
          Text('${widget.number}'),
        ],
      ),
    );
  }
}
