# Objective-C для iOS-разработчиков. Обучение в записи
## Урок 6. Семинар: Работа с памятью в Objective-C, ARC и MRC
<br><br>

1. Переписать всю программу, которую проходили на семинаре на ARC.<br><br>

2. Смоделировать и разработать программу «Стая птиц».<br>
   В данной программе должны быть классы Bird, SuperBird наследник Bird, SlowBird наследник Bird, также есть класс Nest.<br>
   У класса Nest есть поля bird(weak), area, occupancy.<br>
   У Bird есть 2 метода fly, fall, eat.<br>
   Реализовать все эти методы в наследниках с применением ручного управления памятью. <br>
   Воссоздать retain cycle и решить его.<br>
   (*Можете добавлять свои поля, чтобы лучше изучить работу MRC / ARC) <br><br>

    - **Улучшить созданную программу из задания 1: применить пул автоматического освобождения (ARC).** <br><br>

3. Воссоздайте ситуацию, в которой происходит цикл сохранения (retain cycle).<br><br>

4. Убедитесь, что объекты не освобождены. Для этого реализуйте метод dealloc.<br><br>

5. Обеспечьте реализацию геттера и сеттера для свойств в MRC:<br>
   @property (nonatomic, retain) id object1;<br>
   @property (nonatomic) id object2;<br>
   @property (nonatomic,copy) NSMutableArray *array;<br>
   @property (atomic,retain) NSNumber *number;<br>
   @property NSUInteger баланс;