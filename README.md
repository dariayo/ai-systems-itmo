# Отчет по модулю №1

---

`Шевченко Дарья Павловна`
`P3330` `369053`


---

## Описание целей проекта и его значимости

Предметная область: игра Valorant

Цели:

- создать базу знаний в языке программирования Prolog и реализовать набор запросов, используя эту базу знаний.
  Познакомиться со средой разработки онтологий Protege и перевести базу знаний, созданной в Prolog в
  онтологическую форму в Protege.
- разработка программы (рекомендательной системы), которая будет использовать базу знаний или онтологию для
  предоставления рекомендаций на основе введенных пользователем данных. (Knowledge-based
  support system)

Значимостью данного проекта заключается во введении в курс искусственного интеллекта.

--- 

## Анализ требований

Определение основных требований к системе поддержки принятия решений:

1) Система должна предоставить пользователю выбрать интересующие его роли агентов
2) Система должна на основе проведенного с пользователем диалога предоставить ему список подходящих агентов
3) Система должна предоставить пользователю завершить работу программы командой 'Выход'

Определение основных требований к базе знаний и онтологии:

1) Должны быть представлены роли агентов, имена агентов, названия способностей и оружий
2) У каждого оружия и способности есть стоимость
3) У каждого агента есть показатели здоровья и брони
4) У каждого агента есть начальное количество кредитов
5) У каждого оружия и способности есть количество урона, который они наносят
6) Должны быть правила для логического вывода и принятия решений (например, правило о том, какое оружие может позволить
   себе агент).

--- 

## Изучение основных концепций и инструментов

Обзор основных концепций баз знаний и онтологий: Базы знаний (БЗ) и онтологии представляют собой структуры для хранения
и организации информации. Базы знаний обеспечивают систему правил и фактов, которые используются для логического вывода,
в то время как онтологии помогают формализовать и классифицировать объекты и их отношения в контексте определённой
области.

Prolog — это логический язык программирования, широко используемый для создания систем искусственного интеллекта. Его
основная особенность
заключается в том, что программирование в Prolog строится на основе фактов и правил, которые позволяют системе выводить
заключения на основе заданных условий.

В рамках лабораторной работы используется библиотека pyswip, которая предоставляет интерфейс для взаимодействия с Prolog
через Python.
Библиотека позволяет легко интегрировать логику Prolog с программированием на Python, что удобно для разработки гибких и
мощных систем. SWI-Prolog - учебная версия Prolog (содержит консольный интерфейс)

## Реализация системы искусственного интеллекта

### Пример

```
Выберите роль агента:
1. duelist
2. specialist
3. initiator
4. sentinel
> 2
Ваш выбор: 2
Что бы вы хотели узнать?
1. Агенты с ультой
2. Агенты с высокой защитой
3. Агенты с несколькими способностями
4. Выбрать новую роль
5. Информация об агенте
6. Рекомендации по оружию для выбранных агентов
7. Выход
> 3
Ваш выбор: 3
Агенты с несколькими базовыми способностями для роли specialist:
- viper
- omen
Что бы вы хотели узнать?
1. Агенты с ультой
2. Агенты с высокой защитой
3. Агенты с несколькими способностями
4. Выбрать новую роль
5. Информация об агенте
6. Рекомендации по оружию для выбранных агентов
7. Выход
> 6
Ваш выбор: 6
Рекомендованное оружие для агентов с ролью specialist:
Для агента viper рекомендовано оружие: ghost, sheriff
Для агента omen рекомендовано оружие: ghost, sheriff
Что бы вы хотели узнать?
1. Агенты с ультой
2. Агенты с высокой защитой
3. Агенты с несколькими способностями
4. Выбрать новую роль
5. Информация об агенте
6. Рекомендации по оружию для выбранных агентов
7. Выход
> 2
Ваш выбор: 2
Агенты с высокой защитой для роли specialist:
- omen

```

--- 

## Оценка и интерпретация результатов

### Пример запросов к базе знаний в Prolog:

![img_3.png](png/img_3.png)

### Пример запросов к онтологии:

![img.png](png/img.png)

![img_1.png](png/img_1.png)

![img_2.png](png/img_2.png)

Результаты показали, что система отвечает всем базовым требованиям.

---

## Заключение

Разработанная система на базе Prolog эффективно использует возможности логического вывода для принятия решений и
обработки данных. Prolog позволяет формализовать знания и создавать правила, которые система использует для
генерирования рекомендаций.


