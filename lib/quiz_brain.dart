import 'question.dart';

class QuizBrain {
  int _questionNum = 0;
  bool _isFinished = false;
  List<Question> _questions = [
    Question(txt: 'Some cats are actually allergic to humans', ans: true),
    Question(txt: 'You can lead a cow down stairs but not up stairs.', ans: false),
    Question(txt: 'Approximately one quarter of human bones are in the feet.', ans: true),
    Question(txt: 'A slug\'s blood is green.', ans: true),
    Question(txt: 'Buzz Aldrin\'s mother\'s maiden name was \"Moon\".', ans: true),
    Question(txt: 'It is illegal to pee in the Ocean in Portugal.', ans: true),
    Question(txt: 'No piece of square dry paper can be folded in half more than 7 times.', ans: false),
    Question(txt: 'In London, UK, if you happen to die in the House of Parliament, you are technically entitled to a state funeral, because the building is considered too sacred a place.', ans: true),
    Question(txt: 'The loudest sound produced by any animal is 188 decibels. That animal is the African Elephant.', ans: false),
    Question(txt: 'The total surface area of two human lungs is approximately 70 square metres.', ans: true),
    Question(txt: 'Google was originally called \"Backrub\".', ans: true),
    Question(txt: 'Chocolate affects a dog\'s heart and nervous system; a few ounces are enough to kill a small dog.', ans: true),
    Question(txt: 'In West Virginia, USA, if you accidentally hit an animal with your car, you are free to take it home to eat.', ans: true),
  ];

  void nextQuestion() {
    if (_questionNum < _questions.length-1) {
      _questionNum++;
    }
    else {
      _isFinished = true;
    }
  }

  int getNumQuestions() {
    return _questions.length;
  }

  String getQuestionText() {
    return _questions[_questionNum].text;
  }

  bool getQuestionAns() {
    return _questions[_questionNum].answer;
  }

  bool isFinished() {
    return _isFinished;
  }

  void reset() {
    _isFinished = false;
    _questionNum = 0;
  }
}