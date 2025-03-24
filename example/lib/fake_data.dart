import 'package:flutter/material.dart';

final data = {
  "elements": [
    {
      "id": "ab905350-e92c-11ef-8ac6-9df0d6f153e3",
      "type": "text",
      "x": 100,
      "y": 15,
      "width": 600,
      "height": 95,
      "properties": {
        "document":
            "[{\"insert\":\"Detailed note taking is an integral part of successful and diligent social care workand crucial in promoting the safety and wellbeing of the people we support.\\n\\nDaily note taking and incident reporting are part of your responsibility in working as a support worker for 360Care.\\n\"}]",
      },
    },
    {
      "id": "ab907a60-e92c-11ef-8ac6-9df0d6f153e3",
      "type": "image",
      "x": 100,
      "y": 140,
      "width": 600,
      "height": 450,
      "properties": {
        "imageUrl":
            "https://firebasestorage.googleapis.com/v0/b/care-divisions-h0ny80.appspot.com/o/users%2FYXnMYoBmTgSCjki1u0FqmCtFoB22%2Fuploads%2F1733311880682000.jpg?alt=media&token=8d1d3837-902f-4eb7-9c1b-fe9e75c3c595",
        "borderRadius": 0,
      },
    },
    {
      "id": "ab90ef90-e92c-11ef-8ac6-9df0d6f153e3",
      "type": "text",
      "x": 100,
      "y": 620,
      "width": 600,
      "height": 247,
      "properties": {
        "document":
            "[{\"insert\":\"Think about the following when writing daily notes and incident reports:\\n\\n- Notes and incident reports should be completed before the end of each shift. If you are unable to upload your notes within 1   hour after the end of your shift, report this in the Signal chat immediately.\\n\\n- You should be writing your notes throughout your shift, adding any details/information as your shift progresses. Notes are to be completed in two-hour   time frames (8:00 -10:00, 10:00 – 12:00 etc).\\n\\n- Use clinical language and appropriate phrasing when writing your notes. Avoid phrases such as “kicking off, freaking out, being naughty” etc. \\n\\n- Notes should be clear and factual, and should not include any personal opinion.\\n\\n\"}]",
      },
    },
  ],
  "settings": {
    "backgroundColor": const Color.fromARGB(255, 240, 240, 240).getValue,
    "canvasColor": Colors.white.getValue,
    "gridColor": const Color.fromARGB(255, 240, 240, 240).getValue,
    "gridSize": "medium",
    "name": "Page 1",
    "fontFamily": "Roboto",
  },
};

extension on Color {
  static int _floatToInt8(double x) {
    return (x * 255.0).round() & 0xff;
  }

  int get getValue =>
      _floatToInt8(a) << 24 |
      _floatToInt8(r) << 16 |
      _floatToInt8(g) << 8 |
      _floatToInt8(b) << 0;
}
