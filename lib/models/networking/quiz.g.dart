// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'quiz.dart';

// **************************************************************************
// TypeAdapterGenerator
// **************************************************************************

class QuizQuastionAdapter extends TypeAdapter<QuizQuastion> {
  @override
  final int typeId = 0;

  @override
  QuizQuastion read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return QuizQuastion(
      isProblem: fields[1] as bool,
      image: fields[2] as String?,
      questionBody: fields[3] as String,
      questionNo: fields[4] as int,
      choices: (fields[5] as List).cast<dynamic>(),
    );
  }

  @override
  void write(BinaryWriter writer, QuizQuastion obj) {
    writer
      ..writeByte(6)
      ..writeByte(0)
      ..write(obj.selectedChioce.toString())
      ..writeByte(1)
      ..write(obj.isProblem)
      ..writeByte(2)
      ..write(obj.image)
      ..writeByte(3)
      ..write(obj.questionBody)
      ..writeByte(4)
      ..write(obj.questionNo)
      ..writeByte(5)
      ..write(obj.choices);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is QuizQuastionAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}

class QuizChoiceAdapter extends TypeAdapter<QuizChoice> {
  @override
  final int typeId = 1;

  @override
  QuizChoice read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return QuizChoice(
      questionNo: fields[0] as int,
      choiceBody: fields[1] as String,
      isCorrect: fields[2] as bool,
    );
  }

  @override
  void write(BinaryWriter writer, QuizChoice obj) {
    writer
      ..writeByte(3)
      ..writeByte(0)
      ..write(obj.questionNo)
      ..writeByte(1)
      ..write(obj.choiceBody)
      ..writeByte(2)
      ..write(obj.isCorrect);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is QuizChoiceAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}
