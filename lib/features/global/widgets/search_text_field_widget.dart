import 'package:flutter/material.dart';
import 'package:flutter1_a_l/features/app/manger/color_manger.dart';

class SearchTextFieldWidget extends StatelessWidget {
  final TextEditingController? textEditingController;
  final VoidCallback? onTap;

  const SearchTextFieldWidget({
    Key? key,
    this.textEditingController,
    this.onTap,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return _searchTextField();
  }

  Widget _searchTextField() {
    return Container(
      margin: const EdgeInsets.only(bottom: 10, left: 4, right: 4),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.end,
        children: [
          Expanded(
            child: Container(
              decoration: BoxDecoration(
                color: Colors.grey.shade100,
                borderRadius: BorderRadius.circular(20),
              ),
              child: TextField(
                style: const TextStyle(fontSize: 14),
                controller: textEditingController,
                maxLines: null,
                decoration: InputDecoration(
                    suffixIcon: textEditingController!.text.isEmpty
                        ? SizedBox()
                        : IconButton(
                            onPressed: () {
                              textEditingController!.clear();
                            },
                            icon: Icon(
                              Icons.close,
                              size: 20,
                              color: Colors.grey,
                            ),
                          ),
                    focusedBorder: OutlineInputBorder(
                      borderSide: const BorderSide(
                        color: Colors.green,
                      ),
                      borderRadius: BorderRadius.circular(20),
                    ),
                    filled: true,
                    // fillColor: Mycolor.mwhite,
                    border: OutlineInputBorder(
                        borderSide: BorderSide.none,
                        borderRadius: BorderRadius.circular(20)),
                    hintText: "ex: what is flutter ?"),
              ),
            ),
          ),
          const SizedBox(
            width: 5,
          ),
          Container(
            decoration: BoxDecoration(
                color: textEditingController!.text.isEmpty
                    ? Colors.green.withOpacity(.4)
                    : Colors.green,
                borderRadius: BorderRadius.circular(40)),
            padding: const EdgeInsets.all(10),
            child: InkWell(
              onTap: textEditingController!.text.isEmpty ? null : onTap,
              child: const Icon(
                Icons.arrow_upward_outlined,
                color: Colors.white,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
