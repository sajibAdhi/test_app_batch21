import 'package:flutter/material.dart';

class TaskWidget extends StatelessWidget {
  const TaskWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Card(
      margin: EdgeInsets.symmetric(vertical: 5, horizontal: 10),
      elevation: 10,
      child: ListTile(
        // Alert, Popup, Prompt
        onTap: () => showDialog(
          context: context,
          builder: (context) => AlertDialog(
            actions: [
              TextButton(
                onPressed: () {},
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Icon(
                      Icons.delete_rounded,
                      color: Colors.teal,
                    ),
                    Text(
                      'Delete',
                      style: TextStyle(
                        color: Colors.red,
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
        onLongPress: () {},
        contentPadding: EdgeInsets.symmetric(horizontal: 20, vertical: 10),
        leading: Container(
          padding: EdgeInsets.symmetric(
            horizontal: 10,
          ),
          decoration: BoxDecoration(
            border: Border(
              right: BorderSide(width: 3),
            ),
          ),
          child: CircleAvatar(
            radius: 20,
            child: Image.network(
              'https://image.similarpng.com/thumbnail/2021/05/Whatsapp-icon-design-with-dark-black-brush-on-transparent-background-PNG.png',
              fit: BoxFit.cover,
            ),
          ),
        ),
        title: Text(
          'Title',
          maxLines: 2,
          overflow: TextOverflow.ellipsis,
          style: TextStyle(
            fontWeight: FontWeight.bold,
          ),
        ),
        subtitle: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Icon(
              Icons.linear_scale_outlined,
              color: Colors.teal,
            ),
            Text(
              "Lorem Ipsum is simply dummy text of the printing and typesetting industry."
              "Lorem Ipsum has been the industry's standard dummy text ever since the 1500s."
              "When an unknown printer took a galley of type and scrambled it to make a type specimen book.",
              maxLines: 2,
              overflow: TextOverflow.ellipsis,
            )
          ],
        ),
        trailing: Icon(
          Icons.keyboard_arrow_right,
          color: Colors.teal,
          size: 30,
        ),
      ),
    );
  }
}
