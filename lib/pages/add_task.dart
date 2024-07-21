import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import '../controller/dashboard_controller.dart';
import '../helpers/color_utils.dart';
import '../helpers/constants.dart';
import '../helpers/date_utils.dart' as date_util;

class AddTaskPage extends StatefulWidget {
  const AddTaskPage({super.key});

  @override
  State<AddTaskPage> createState() => _AddTaskPageState();
}

class _AddTaskPageState extends State<AddTaskPage> {
  final DashboardController _dashboardController = Get.put(DashboardController());
  final TextEditingController _controller = TextEditingController();
  final FocusNode _focusNode = FocusNode();
  int _selectedIndex = 0;
  bool isSelected = false;
  List<Map<String, dynamic>> _items = [];
  List<TextEditingController> _controllers = [];
  List<String> choices = ["Design","Development","Coding","Meeting", "Office Time", "User Experience"];
  late ScrollController scrollController;
  List<DateTime> currentMonthList = List.empty();
  DateTime currentDateTime = DateTime.now();

  @override
  void initState() {
    currentMonthList = date_util.DateUtils.daysInMonth(currentDateTime);
    currentMonthList.sort((a,b) => a.day.compareTo(b.day));
    currentMonthList = currentMonthList.toSet().toList();
    scrollController = ScrollController(initialScrollOffset: 70.0 * currentDateTime.day);
    super.initState();
  }

  void _continue() {

  }

  @override
  void dispose() {
    // _controller.dispose();
    // _focusNode.dispose();
    for (var controller in _controllers) {
      controller.dispose();
    }
    super.dispose();
  }

  void addTextField() {
    setState(() {
      _items.add({'checked': false});
      _controllers.add(TextEditingController());
    });
  }


  @override
  Widget build(BuildContext context) {
    return  SingleChildScrollView(
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 20),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const SizedBox(height: 20,),
            Text(
              "Create New Task",
              style: TextStyle(
                fontSize: 25,
                fontWeight: FontWeight.bold,
                color: Color(Constants.primaryBlack())
              ),
            ),
            const SizedBox(height: 20),
            TextFormField(
              decoration: InputDecoration(
                isDense: true,
                filled: true,
                hintText: 'Task Title',
                hintStyle: TextStyle(color: Color(Constants.primaryGrey())),
                fillColor: Color(Constants.primaryWhite()),
                border: OutlineInputBorder(
                    borderRadius:
                    BorderRadius.circular(8.0)),
                enabledBorder: OutlineInputBorder(
                  borderRadius:
                  BorderRadius.circular(8.0),
                  // borderSide: BorderSide(
                  //     color:
                  //     Color(Constants.primaryGrey())),
                ),
                focusedBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(8.0),
                    borderSide: BorderSide(
                        color: Color(Constants.primaryTeal())
                    )
                ),
                errorBorder: OutlineInputBorder(
                    borderRadius:
                    BorderRadius.circular(8.0),
                    borderSide:
                    BorderSide(color: Colors.red)),
              ),
              onChanged: (v) {},
              validator: (v) {
                if (v == null || v.isEmpty) {
                  return 'Enter your task title';
                } else {
                  return null;
                }
              },
              keyboardType: TextInputType.text,
            ),
            const SizedBox(height: 15,),
            TextFormField(
              decoration: InputDecoration(
                isDense: true,
                filled: true,
                hintText: 'Add your task details',
                hintStyle: TextStyle(color: Color(Constants.primaryGrey())),
                fillColor: Color(Constants.primaryWhite()),
                border: OutlineInputBorder(
                    borderRadius:
                    BorderRadius.circular(8.0)),
                enabledBorder: OutlineInputBorder(
                  borderRadius:
                  BorderRadius.circular(8.0),
                  // borderSide: BorderSide(
                  //     color:
                  //     Color(Constants.primaryGrey())),
                ),
                focusedBorder: OutlineInputBorder(
                    borderRadius:
                    BorderRadius.circular(8.0),
                    borderSide: BorderSide(
                        color: Color(
                            Constants.primaryTeal()))),
                errorBorder: OutlineInputBorder(
                    borderRadius:
                    BorderRadius.circular(8.0),
                    borderSide:
                    BorderSide(color: Colors.red)),
              ),
              onChanged: (v) {},
              validator: (v) {
                if (v == null || v.isEmpty) {
                  return 'Enter your task details';
                } else {
                  return null;
                }
              },
              maxLines: 5,
              keyboardType: TextInputType.text,
            ),
            const SizedBox(height: 20,),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                InkWell(
                   onTap: () {},
                   child: Image.asset("assets/images/paper_clip.png",height: 30,width: 30,),
                 ),
                InkWell(
                  onTap: () {},
                  child: Image.asset("assets/images/add_person.png",height: 30,width: 30,),
                )
              ],
            ),
            const SizedBox(height: 20,),
            Text(
              "Task Deadline",
              style: TextStyle(
                  fontSize: 16,
                  fontWeight: FontWeight.w600,
                  color: Color(Constants.primaryBlack())
              ),
            ),
            Container(
              height: 110,
              width: double.infinity,
              child: ListView.builder(
                itemCount: currentMonthList.length,
                  controller: scrollController,
                  scrollDirection: Axis.horizontal,
                  physics: const ClampingScrollPhysics(),
                  shrinkWrap: true,
                  itemBuilder: (BuildContext context, int index) {
                    return capsuleView(index);
                  }),
            ),
            const SizedBox(height: 20,),
            Text(
                "Category",
                style: TextStyle(
                    fontSize: 18,
                    fontWeight: FontWeight.w600,
                    color: Color(Constants.primaryBlack())
                ),
              ),
            const SizedBox(height: 15,),
            Wrap(
              spacing: 10,
              children: List<Widget>.generate(
                  choices.length,
                      (index) {
                        return ChoiceChip(
                          label: Text(choices[index]),
                          selected: _selectedIndex == index,
                          onSelected: (bool selected) {
                            setState(() {
                              _selectedIndex = selected ? index : _selectedIndex;
                            });
                          },
                          selectedColor: Color(Constants.primaryTeal()),
                          backgroundColor: Color(Constants.primaryWhite()),
                        );
                      }
              )
            ),
            const SizedBox(height: 20,),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  "Get alert for this task",
                  style: TextStyle(
                    fontWeight: FontWeight.w600,
                    fontSize: 18,
                    color: Color(Constants.primaryBlack())
                  ),
                ),
               CupertinoSwitch(
                   value: _dashboardController.isAlerted.value,
                   activeColor: Color(Constants.primaryTeal()),
                   onChanged: (v) {
                     setState(() {
                       _dashboardController.isAlerted.value = v;
                     });
                   })
              ],
            ),
            const SizedBox(height: 32,),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 0.0, vertical: 8),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    "Today's tasks",
                    style: TextStyle(
                      fontWeight: FontWeight.w600,
                      fontSize: 18,
                      color: Color(Constants.primaryBlack())
                    ),
                  ),
                  IconButton(
                    icon: Icon(
                      Icons.add,
                      size: 30,
                      color: Color(Constants.primaryBlack()),),
                    onPressed: addTextField,
                  ),
                ],
              ),
            ),
            // const SizedBox(height: 20,),
            SizedBox(
              height: 300,
              width: double.infinity,
              child: ListView.builder(
                itemCount: _controllers.length,
                  itemBuilder: (context, index) {
                  return Container(
                    padding: const EdgeInsets.all(8.0),
                    color: Color(Constants.primaryLightGrey()),
                    child: Row(
                      children: [
                        Expanded(
                          flex: 1,
                          child: Checkbox(
                                value: _items[index]['checked'],
                                onChanged: (bool? value) {
                                  setState(() {
                                    _items[index]['checked'] = value!;
                                  });
                                },
                              ),
                        ),
                        Expanded(
                          flex: 3,
                          child: TextField(
                               controller: _controllers[index],
                                focusNode: _focusNode,
                                decoration: InputDecoration(
                                  isDense: true,
                                  filled: true,
                                  hintText: 'Enter subtask ${index +1}',
                                  hintStyle: TextStyle(
                                      color:
                                      Color(Constants.primaryGrey())),
                                  fillColor:
                                  Color(Constants.primaryWhite()),
                                  border: OutlineInputBorder(
                                      borderRadius:
                                      BorderRadius.circular(8.0)),
                                  enabledBorder: OutlineInputBorder(
                                    borderRadius:
                                    BorderRadius.circular(8.0),
                                    borderSide: BorderSide(
                                        color:
                                        Color(Constants.primaryGrey())),
                                  ),
                                  focusedBorder: OutlineInputBorder(
                                      borderRadius:
                                      BorderRadius.circular(8.0),
                                      borderSide: BorderSide(
                                          color: Color(
                                              Constants.primaryGrey()))),
                                  errorBorder: OutlineInputBorder(
                                      borderRadius:
                                      BorderRadius.circular(8.0),
                                      borderSide:
                                      BorderSide(color: Colors.red)),
                                ),
                                onChanged: (v) {},
                                keyboardType: TextInputType.name,
                              ) ,
                        ),
                        Expanded(
                          flex: 1,
                          child: PopupMenuButton<int>(
                                onSelected: (int result) {
                                  // Handle the menu selection
                                  if (result == 0) {
                                    print('Option 1 selected');
                                  } else if (result == 1) {
                                    print('Option 2 selected');
                                  } else if (result == 2) {
                                    print('Option 3 selected');
                                  }
                                },
                                itemBuilder: (context) => <PopupMenuEntry<int>>[
                                  PopupMenuItem<int>(
                                      child: Text("Remove subtask"),
                                    value: 0,
                                  ),
                                  PopupMenuItem<int>(
                                      child: Text("Remove subtask"),
                                    value: 1,
                                  ),
                                  PopupMenuItem<int>(
                                      child: Text("Remove subtask"),
                                    value: 2,
                                  ),
                                  PopupMenuItem<int>(
                                      child: Text("Remove subtask"),
                                    value: 3,
                                  ),
                                ],
                                child: Icon(
                                  Icons.more_vert,
                                  size: 30,
                                  color: Color(Constants.primaryWhite()),
                                ),
                              ),
                        )
                      ],
                    ),
                  );
                  } ),
            ),
            Center(
              child: ElevatedButton(
                  style: ElevatedButton.styleFrom(
                      backgroundColor: Color(Constants.primaryTeal()),
                      minimumSize: const Size(double.infinity , 50),
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(12.0)
                      )
                  ),
                  onPressed: _continue,
                  child:  Text(
                    "Create Task",
                    style: TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 16,
                        color: Color(Constants.primaryWhite())
                    ),
                  )
              ),
            ),
          ],
        ),
      ),
    );

  }

  Widget capsuleView(int index) {
    return Padding(
      padding: const EdgeInsets.fromLTRB(8, 0, 0, 0),
      child: GestureDetector(
        onTap: () {
          setState(() {
            currentDateTime = currentMonthList[index];
          });
        },
        child: Container(
          height: 100,
          width: 60,
          decoration: BoxDecoration(
            color: (currentMonthList[index].day != currentDateTime.day)
                ? Color(Constants.primaryLightGrey())
                : Color(Constants.primaryTeal()) ,
            borderRadius: BorderRadius.circular(40),
          ),
          child: Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  currentMonthList[index].day.toString(),
                  style: TextStyle(
                    fontSize: 20,
                    fontWeight: FontWeight.w600,
                    color: (currentMonthList[index].day != currentDateTime.day)
                        ?  Color(Constants.primaryGrey())
                        : Colors.white
                  ),
                ),
                Text(
                  date_util.DateUtils.weekdays[currentMonthList[index].weekday -1],
                  style: TextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.w600,
                    color: (currentMonthList[index].day != currentDateTime.day)
                        ? Color(Constants.primaryGrey())
                        : Colors.white
                  ),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }


}
