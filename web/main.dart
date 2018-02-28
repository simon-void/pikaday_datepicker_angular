import 'package:angular/angular.dart';

import 'package:pikaday_datepicker_angular/pikaday_datepicker_angular.dart';

void main() {
  bootstrap(PickerExampleComponent);
}

// example app to showcase the PikadayComponent.
@Component(
  selector: 'showcase-pikadate-component',
  template: '''<pick-day-component ></pick-day-component><br />
               <pick-day-time-component ></pick-day-time-component>''',
  directives: const [DayTimePickerComponent, DayPickerComponent],
)
class PickerExampleComponent {}

// example of how to use the PikadayComponent to display a day picker.
@Component(
    selector: 'pick-day-component',
    template: '''<pikaday [(day)]="selectedDay" format="YYYY-MM-DD"
                          placeholder="select a day">
                 </pikaday>
                 <div>day: {{selectedDay | date}}</div>''',
    directives: const [PikadayComponent],
    pipes: const [COMMON_PIPES])
class DayPickerComponent {
  DateTime selectedDay = new DateTime(2015, 2, 1);
}

// example of how to use the PikadayComponent to display a day and time picker.
@Component(
    selector: 'pick-day-time-component',
    template: '''<pikaday [(day)]="selectedDayTime" format="YYYY-MM-DD h:mm A"
                          firstDay="1" minDate="2010-1-1" maxDate="2025-12-31"
                          [showTime]="true" [autoClose]="false" [incrementMinuteBy]="5"
                          placeholder="select a day and time">
                 </pikaday>
                 <div>day: {{selectedDayTime | date}}</div>
                 <div>time: {{daytime24}} o'clock</div>''',
    directives: const [PikadayComponent],
    pipes: const [COMMON_PIPES])
class DayTimePickerComponent {
  String get daytime24 =>
      "${selectedDayTime.hour}:${_padTimeAs2Chars(selectedDayTime.minute)}";
  DateTime selectedDayTime = new DateTime(2015, 2, 1, 13, 30);

  String _padTimeAs2Chars(int hoursOrMinutes) =>
      hoursOrMinutes < 10 ? "0$hoursOrMinutes" : hoursOrMinutes.toString();
}
