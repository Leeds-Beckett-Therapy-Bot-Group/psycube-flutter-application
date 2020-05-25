import 'dart:math';
import 'task.dart';

class TaskManager {

  // todo: add more tasks
  List<Task> _taskDataLevel1 = [
    Task(
        taskTitle: 'Dish Master',
        taskDescription: 'Do the dishes',
        taskPoint: 100,
        taskLevel: 1
    ),
    Task(
      taskTitle: 'Clean Dude',
      taskDescription: 'Have a shower and groom',
      taskPoint: 150,
      taskLevel: 1
    ),
    Task(
      taskTitle: 'Roadrunner',
      taskDescription: 'Go for a 30 minutes jog',
      taskPoint: 300,
      taskLevel: 1
    ),
    Task(
        taskTitle: 'Smart cat',
        taskDescription: 'Do 1 hour on a project',
        taskPoint: 300,
        taskLevel: 1
    ),
    Task(
    taskTitle: 'rise and shine',
    taskDescription: 'Wake up and get out of bed',
    taskPoint: 10,
    taskLevel: 1,
    ),

  // needs slightly reformatting

    Task(
    taskTitle: 'Pearly whites',
    taskDescription: 'brush your teeth',
    taskPoint: 10,
    taskLevel: 1,
    ),

    Task (
    taskTitle: 'That wasn\'t how i left it',
    taskDescription: 'Make your bed',
    taskPoint: 10,
    taskLevel: 1,
    ),

    Task (
    taskTitle: 'Some fresh Aqua',
    taskDescription: 'Drink a glass of water',
    taskPoint: 10,
    taskLevel: 1,
    ),

    Task (
    taskTitle: 'That\'ll wake ya up',
    taskDescription: 'Wash your face',
    taskPoint: 10,
    taskLevel: 1,
    ),

    Task (
    taskTitle: 'Time for a munch munch crunch',
    taskDescription: 'Eat some breakfast',
    taskPoint: 10,
    taskLevel: 1
    ),

    Task (
    taskTitle: 'must....resist....snooze....',
    taskDescription: 'Wake up before 12pm',
    taskPoint: 10,
    taskLevel: 1,
    ),

    Task (
    taskTitle: 'An apple a day....',
    taskDescription: 'eat some fruit',
    taskPoint: 10,
    taskLevel: 1,
    ),

    Task (
    taskTitle: 'lookin\' sharp',
    taskDescription: 'get dressed',
    taskPoint: 10,
    taskLevel: 1
    ),

    Task (
    taskTitle: 'baby steps',
    taskDescription: 'open your curtains/blinds and windows',
    taskPoint: 10,
    taskLevel: 1
    ),

    // Level 2

    Task (
    taskTitle: 'mmmmm simply delicious',
    taskDescription: 'eat lunch',
    taskPoint: 20,
    taskLevel: 2
    ),

    Task (
    taskTitle: 'soak up some \'rays',
    taskDescription: 'go outside on a walk for at least 15mins',
    taskPoint: 20,
    taskLevel: 2
    ),

    Task (
    taskTitle: 'the early bird.....',
    taskDescription: 'wake up before 11am',
    taskPoint: 20,
    taskLevel: 2
    ),

    Task (
    taskTitle: 'dont scare the dog!',
    taskDescription: 'hoover your room',
    taskPoint: 20,
    taskLevel: 2
    ),

    Task (
    taskTitle: 'Nice n Neat',
    taskDescription: 'Tidy your room',
    taskPoint: 20,
    taskLevel: 2
    ),

    Task (
    taskTitle: 'corner to corner',
    taskDescription: 'change your bed sheets',
    taskPoint: 20,
    taskLevel: 2
    ),

    Task (
    taskTitle: 'nice and clean and fresh',
    taskDescription: 'have a bath/shower',
    taskPoint: 20,
    taskLevel: 2
    ),

    Task (
    taskTitle: 'dont scare the dog and the cat!',
    taskDescription: 'hoover your living room',
    taskPoint: 20,
    taskLevel: 2
    ),

    Task (
    taskTitle: 'Productive buzz',
    taskDescription: 'tidy your living room',
    taskPoint: 20,
    taskLevel: 2
    ),

    Task (
    taskTitle: 'Filling up',
    taskDescription: 'Eat dinner/tea',
    taskPoint: 20,
    taskLevel: 2
    ),

/*//Level 3

  Task (

  taskTile: the even earlier bird.......
  taskDescription: wake up before 10am
  taskPoints: 30
  taskLevel: 3

  ),

  Task (

  taskTile: Some fresh air
  taskDescription: go outside on a walk for at least 30mins
  taskPoints: 30
  taskLevel: 3

  ),

  Task (

  taskTile: Fitness is my passion
  taskDescription: Do at least 10mins of exercise in your home
  taskPoints: 30
  taskLevel: 3

  ),

  Task (

  taskTile: Runner in the making
  taskDescription: go outside on a jog for at least 15mins
  taskPoints: 30
  taskLevel: 3

  ),

  Task (

  taskTile: Do i have to?
  taskDescription: Be brave and clean your bathroom
  taskPoints: 30
  taskLevel: 3

  ),

  Task (

  taskTile: helth
  taskDescription: prepare a healthy breakfast
  taskPoints: 30
  taskLevel: 3

  ),

  Task (

  taskTile: Gordon better watch out
  taskDescription: prepare and cook your lunch
  taskPoints: 30
  taskLevel: 3

  ),

  Task (

  taskTile: Master Chef
  taskDescription: Prepare and cook your dinner/tea
  taskPoints: 30
  taskLevel: 3

  ),

  Task (

  taskTile: Underwater ceramic expert
  taskDescription: Wash the dishes
  taskPoints: 30
  taskLevel: 3

  ),

  Task (

  taskTile: Helpful helper
  taskDescription: take the bins out
  taskPoints: 30
  taskLevel: 3

  ),

//level 4

  Task (

  taskTile: An even earlier bird
  taskDescription: get up before 9am
  taskPoints: 40
  taskLevel: 4

  ),

  Task (

  taskTile: healthy body healthy mind
  taskDescription: do at least 30 mins of excercise in your home
  taskPoints: 40
  taskLevel: 4

  ),

  Task (

  taskTile: one with nature
  taskDescription:  go outside for a walk for at least an hour
  taskPoints: 40
  taskLevel: 4

  ),

  Task (

  taskTile: makin gains
  taskDescription: go outside for exercise for at least 30 mins
  taskPoints: 40
  taskLevel: 4

  ),

  Task (

  taskTile: my body is a temple
  taskDescription: prepare and eat a healthy meal
  taskPoints: 40
  taskLevel: 4

  ),

  Task (

  taskTile: sight seer
  taskDescription: pay a visit to a local landmark
  taskPoints: 40
  taskLevel: 4

  ),

  Task (

  taskTile: cleanliness is next to godliness
  taskDescription: clean your entire living space
  taskPoints: 40
  taskLevel: 4

  ),

  Task (

  taskTile: contact is key
  taskDescription: message a friend or family member
  taskPoints: 40
  taskLevel: 4

  ),

  Task (

  taskTile: missed u
  taskDescription: meet up with a friend or family member
  taskPoints: 40
  taskLevel: 4

  ),

  Task (

  taskTile: you're a stunner
  taskDescription: look at yourself and smile
  taskPoints: 40
  taskLevel: 4

  ),

//level 5

  Task (

  taskTile: Praise the sun
  taskDescription: Wake up and get out of bed for 3 days in a row
  taskPoints: 50
  taskLevel: 5

  ),

  Task (

  taskTile: clean Chompers
  taskDescription: brush your teeth for 3 days in a row
  taskPoints: 50
  taskLevel: 5

  ),

  Task (

  taskTile: consistency is key
  taskDescription: Make your bed for 3 days in a row
  taskPoints: 50
  taskLevel: 5

  ),

  Task (

  taskTile: glub glub glub
  taskDescription: Drink a glass of water for 3 days in a row
  taskPoints: 50
  taskLevel: 5

  ),

  Task (

  taskTile: ooo brisk
  taskDescription: Wash your face for 3 days in a row
  taskPoints: 50
  taskLevel: 5

  ),

  Task (

  taskTile: the most important meal of the day
  taskDescription: Eat some breakfast for 3 days in a row
  taskPoints: 50
  taskLevel: 5

  ),

  Task (

  taskTile: a consistent early bird
  taskDescription: Wake up before 12pm for 3 days in a row
  taskPoints: 50
  taskLevel: 5

  ),

  Task (

  taskTile: P** off doctor
  taskDescription: eat some fruit for 3 days in a row
  taskPoints: 50
  taskLevel: 5

  ),

  Task (

  taskTile: well dressed
  taskDescription: get dressed for 3 days in a row
  taskPoints: 50
  taskLevel: 5

  ),

  Task (

  taskTile: photosynthesis
  taskDescription: open your curtains/blinds and windows for 3 days in a row
  taskPoints: 50
  taskLevel: 5

  ),

  \\Level 6

  Task (

  taskTile: om nom nom nom
  taskDescription: eat lunch for 3 days in a row
  taskPoints: 60
  taskLevel: 6

  ),

  Task (

  taskTile: gettin a tan
  taskDescription: go outside on a walk for at least 15mins for 3 days in a row
  taskPoints: 60
  taskLevel: 6

  ),

  Task (

  taskTile: a consistent earlier bird
  taskDescription: wake up before 11am for 3 days in a row
  taskPoints: 60
  taskLevel: 6

  ),

  Task (

  taskTile: i really hope you're not scaring the dog
  taskDescription: hoover your room for 3 days in a row
  taskPoints: 60
  taskLevel: 6

  ),

  Task (

  taskTile: time for a de-clutter
  taskDescription: Tidy your room for 3 days in a row
  taskPoints: 60
  taskLevel: 6

  ),

  Task (

  taskTile: aaa the smell of fresh linen
  taskDescription: change your bed sheets for 3 days in a row
  taskPoints: 60
  taskLevel: 6

  ),

  Task (

  taskTile: squeaky clean
  taskDescription: have a bath/shower for 3 days in a row
  taskPoints: 60
  taskLevel: 6

  ),

  Task (

  taskTile: i hope you're not scaring the dog and the cat!
  taskDescription: hoover your living room for 3 days in a row
  taskPoints: 60
  taskLevel: 6

  ),

  Task (

  taskTile: keeping things tidy
  taskDescription: tidy your living room for 3 days in a row
  taskPoints: 60
  taskLevel: 6

  ),

  Task (

  taskTile: yummy yummy
  taskDescription: Eat dinner/tea for 3 days in a row
  taskPoints: 60
  taskLevel: 6

  ),

//Level 7

  Task (

  taskTile: a consistent even earlier bird
  taskDescription: wake up before 10am for 3 days in a a row
  taskPoints: 70
  taskLevel: 7

  ),

  Task (

  taskTile: that cloud looks like a dog
  taskDescription: go outside on a walk for at least 30mins for 3 days in a a row
  taskPoints: 70
  taskLevel: 7

  ),

  Task (

  taskTile: feeling the results
  taskDescription: Do at least 10mins of exercise in your home for 3 days in a a row
  taskPoints: 70
  taskLevel: 7

  ),

  Task (

  taskTile: Gotta go fast
  taskDescription: go outside on a jog for at least 15mins for 3 days in a a row
  taskPoints: 70
  taskLevel: 7

  ),

  Task (

  taskTile: brave face
  taskDescription: Be brave and clean your bathroom for 3 days in a a row
  taskPoints: 70
  taskLevel: 7

  ),

  Task (

  taskTile: helth stonks
  taskDescription: prepare a healthy breakfast for 3 days in a a row
  taskPoints: 70
  taskLevel: 7

  ),

  Task (

  taskTile: better than the chef
  taskDescription: prepare and cook your lunch for 3 days in a a row
  taskPoints: 70
  taskLevel: 7

  ),

  Task (

  taskTile: ultimate Master Chef
  taskDescription: Prepare and cook your dinner/tea for 3 days in a a row
  taskPoints: 70
  taskLevel: 7

  ),

  Task (

  taskTile: Underwater ceramic master
  taskDescription: Wash the dishes for 3 days in a a row
  taskPoints: 70
  taskLevel: 7

  ),

  Task (

  taskTile: dont forget to recycle
  taskDescription: take the bins out for 3 days in a a row
  taskPoints: 70
  taskLevel: 7

  ),

//level 8

  Task (

  taskTile: the earliest bird
  taskDescription: get up before 9am for 3 days in a a row
  taskPoints: 80
  taskLevel: 8

  ),

  Task (

  taskTile: fitness guru
  taskDescription: do at least 30 mins of excercise in your home for 3 days in a a row
  taskPoints: 80
  taskLevel: 8

  ),

  Task (

  taskTile: half druid
  taskDescription:  go outside for a walk for at least an hour for 3 days in a a row
  taskPoints: 80
  taskLevel: 8

  ),

  Task (

  taskTile: seeing the results
  taskDescription: go outside for exercise for at least 30 mins for 3 days in a a row
  taskPoints: 80
  taskLevel: 8

  ),

  Task (

  taskTile: clean kitchen
  taskDescription: prepare and eat a healthy meal for 3 days in a a row
  taskPoints: 80
  taskLevel: 8

  ),

  Task (

  taskTile: dont forget your camera
  taskDescription: pay a visit to a local landmark for 3 days in a a row
  taskPoints: 80
  taskLevel: 8

  ),

  Task (

  taskTile: not a speck of dust in sight
  taskDescription: clean your entire living space for 3 days in a a row
  taskPoints: 80
  taskLevel: 8

  ),

  Task (

  taskTile: BFFs
  taskDescription: message a friend or family member for 3 days in a a row
  taskPoints: 80
  taskLevel: 8

  ),

  Task (

  taskTile: 2 feet apart
  taskDescription: meet up with a friend or family member(Whist not in lockdown)
  taskPoints: 80
  taskLevel: 8

  ),

  Task (

  taskTile: you're still a stunner
  taskDescription: look at yourself and smile
  taskPoints: 80
  taskLevel: 8

  ),*/

  ];

  List<Task> _taskDataLevel2 = [
    Task(
        taskTitle: 'Cool guy',
        taskDescription: 'Clean your fridge',
        taskPoint: 300,
        taskLevel: 2
    ),
    Task(
        taskTitle: 'Fashion connoisuer',
        taskDescription: 'Try a new style',
        taskPoint: 150,
        taskLevel: 2
    ),
    Task(
        taskTitle: 'Champion',
        taskDescription: 'Go for a 1 hour jog',
        taskPoint: 350,
        taskLevel: 2
    ),
    Task(
        taskTitle: 'Educator',
        taskDescription: 'Do 2 hours on a project',
        taskPoint: 350,
        taskLevel: 2
    )
  ];

  // randomize integer within the bounds of the array length
  int randomTaskNum() {
    int _taskNumber = _taskDataLevel1.length;
    return (new Random().nextInt(_taskNumber));
  }

  String getTaskTitle() {
    return _taskDataLevel1[randomTaskNum()].taskTitle;
  }

  String getTaskDescription() {
    return _taskDataLevel1[randomTaskNum()].taskDescription;
  }

  int getTaskPoint() {
    return _taskDataLevel1[randomTaskNum()].taskPoint;
  }

  int getTaskLevel() {
    // todo: return task level and use it to only show certain tasks
    return 0;
  }

}