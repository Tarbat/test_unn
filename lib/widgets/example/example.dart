import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:test_unn/domain/api/api_client.dart';
import 'package:test_unn/widgets/example/example_model.dart';

class Example extends StatefulWidget {
  Example({Key? key}) : super(key: key);

  @override
  _ExampleState createState() => _ExampleState();
}

class _ExampleState extends State<Example> {
  final model = ExampleWidgetModels();

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        home: Scaffold(
            backgroundColor: Colors.indigo,
            appBar: AppBar(
              title: Text("Less"),
              centerTitle: true,
            ),
            body: SafeArea(
              child: ExamleModelsProvider(
                model: model,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    const _ReloadButton(),
                    const _PrewButton(),
                    const _NextButton(),
                    const Expanded(
                        child: Padding(
                      padding: EdgeInsets.symmetric(horizontal: 20),
                      child: _LessWidget(),
                    ))
                  ],
                ),
              ),
            )));
  }
}

class _ReloadButton extends StatelessWidget {
  const _ReloadButton({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
        onPressed: () =>
            ExamleModelsProvider.read(context)?.model.reloadLess(),
        child: const Text('Обновить занятия'));
  }
}

class _PrewButton extends StatelessWidget {
  const _PrewButton({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
        onPressed: () =>
            ExamleModelsProvider.read(context)?.model.decrementWeek(),
        child: const Text('Предыдущая неделя'));
  }
}

class _NextButton extends StatelessWidget {
  const _NextButton({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
        onPressed: () =>
            ExamleModelsProvider.read(context)?.model.incrementWeek(),
        child: const Text('Следующая неделя'));
  }
}

class _LessWidget extends StatelessWidget {
  const _LessWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemCount: ExamleModelsProvider.watch(context)?.model.less.length ?? 0,
      itemBuilder: (BuildContext context, int index) {
        return _LessRowWidget(index: index);
      },
    );
  }
}

class _LessRowWidget extends StatelessWidget {
  final int index;

  const _LessRowWidget({Key? key, required this.index}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final less = ExamleModelsProvider.read(context)!.model.less[index];
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(less.auditorium.toString(), style: TextStyle(fontWeight: FontWeight.bold, fontSize: 18.0)),
        const SizedBox(
          height: 10,
        ),
        Text(less.beginLesson.toString()),
        const SizedBox(
          height: 10,
        ),
        Text(less.endLesson.toString()),
        const SizedBox(
          height: 10,
        ),
        Text(less.date.toString()),
        const SizedBox(
          height: 10,
        ),
        Text(less.dayOfWeekString.toString()),
        const SizedBox(
          height: 10,
        ),
        Text(less.building.toString()),
        const SizedBox(
          height: 10,
        ),
        Text(less.discipline.toString()),
        const SizedBox(
          height: 10,
        ),
        Text(less.kindOfWork.toString()),
        const SizedBox(
          height: 10,
        ),
        Text(less.lecturer.toString()),
        const SizedBox(
          height: 10,
        ),
        Text(less.stream.toString()),
        const SizedBox(
          height: 10,
        ),
      ],
    );
  }
}
