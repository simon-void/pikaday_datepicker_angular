import 'package:angular/angular.dart';

import 'package:pikaday_datepicker_angular/pikaday_datepicker_angular.dart';

void main() {
  bootstrap(AppComponent);
}

// example app to showcase the PikadayComponent.
@Component(
    selector: 'showcase-pikadate-component',
    template: '''<pikaday [(day)]="selectedDay" format="DD-MM-YYYY"
                          firstDay="1" minDate="2010-1-1" maxDate="2025-12-31"
                          placeholder="select a day" showDayOnInit="true">
                 </pikaday>
                 <div>selectedDay: {{selectedDay | date}}</div>''',
    directives: const [PikadayComponent],
    pipes: const [COMMON_PIPES])
class AppComponent {
  DateTime selectedDay = new DateTime(2015, 2, 1);
}