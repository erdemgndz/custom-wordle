import 'package:flutter/material.dart';

class GameKeyboard extends StatelessWidget {
  final Function(String) onKeyPressed;
  final Function onEnterPressed;
  final Function onDeletePressed;

  const GameKeyboard({
    Key? key,
    required this.onKeyPressed,
    required this.onEnterPressed,
    required this.onDeletePressed,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    List<String> row1 = "QWERTYUIOPĞÜ".split('');
    List<String> row2 = "ASDFGHJKLŞİ".split('');
    List<String> row3 = "ZXCVBNMÖÇ".split('');
    Size media_size = MediaQuery.of(context).size;

    return Container(
      padding: const EdgeInsets.all(8.0),
      height: MediaQuery.of(context).size.height * 0.35,
      child: Column(
        children: [
          _buildKeyboardRow(row1,media_size),
          _buildKeyboardRow(row2,media_size),
          _buildKeyboardRow(row3, media_size,includeDeleteEnter: true),
        ],
      ),
    );
  }

  Widget _buildKeyboardRow(List<String> keys,Size size,{bool includeDeleteEnter = false}) {
    return Expanded(
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          if (includeDeleteEnter) ...[
            _buildKey('DELETE', size, onDeletePressed),
          ],
          ...keys.map((key) => _buildKey(key,size, () => onKeyPressed(key))).toList(),
          if (includeDeleteEnter) ...[
            _buildKey('ENTER',size,onEnterPressed),
          ],
        ],
      ),
    );
  }

  Widget _buildKey(String label, Size size, Function onPressed) {
    return GestureDetector(
      onTap: () => onPressed(),
      child: Container(
        margin: const EdgeInsets.all(4.0),
        width: size.width * 0.06,
        height: size.height * 0.07,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(4.0),
          color: Colors.grey.shade300,
        ),
        child: Center(
          child: label == "ENTER" || label == "DELETE"
              ? Icon(
            label == "ENTER" ? Icons.check : Icons.backspace,
            size: 20.0,
            color: Colors.black,
          )
              : Text(
            label,
            style: const TextStyle(
              fontSize: 18.0,
              fontWeight: FontWeight.bold,
            ),
          ),
        ),
      ),
    );
  }

}
