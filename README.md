# `max_amount`

[![Gem Version](https://img.shields.io/gem/dt/max_amount.svg)][gem]
[![Gem](https://img.shields.io/gem/v/max_amount)][gem]
[![Build Status](https://github.com/ProfessorNemo/max_amount/actions/workflows/ci.yml/badge.svg)][actions]
[![Test Coverage](https://codecov.io/gh/ProfessorNemo/max_amount/graph/badge.svg)](https://codecov.io/gh/ProfessorNemo/max_amount)
[![Depfu](https://img.shields.io/depfu/ProfessorNemo/max_amount?style=flat-square)](https://depfu.com/repos/github/ProfessorNemo/max_amount)

[gem]: https://rubygems.org/gems/max_amount
[gem]: https://rubygems.org/gems/max_amount
[actions]: https://github.com/ProfessorNemo/max_amount/actions
[coveralls]: https://coveralls.io/r/ProfessorNemo/max_amount
###### Язык написания - Ruby

## Скрипт выполняет следующее:
* читает из входящего потока текстовые данные;
* по завершении ввода выводит n самых больших целых чисел, встретившихся в
полученных текстовых данных.
Дополнительные сведения:
* числом считается любая непрерывная последовательность цифр в тексте;
* чисел длиннее 1000 цифр во входных данных нет;
* числа n,l и m - консольные параметры;

## Установка:

Добавьте

``` rb
gem 'max_amount'
```

И сделайте

    bundle

Или сделайте

    gem install max_amount

## Использование:

``` rb
require 'max_amount'

user_string = '24b6be4d91faa7d3469b9a0cc17d1d5267d21c5f8653ba4f70e3ef007'

user_string = nil if user_string.nil?

$stdout.print "\n\n== Результат: ==\n\n"

puts MaxAmount.result(user_string: user_string)
```

## Запуск:

``` 
$ ruby name_programm.rb --h

Результат:

Чтение из входящего потока текстовых данных:
        --h                          Справка
        --n Nmax                     n самых больших целых чисел (n > 0)
        --l length                   длина строки 
        --m choice                   тестовая строка (m=1) / случайно сгенерированная строка (m=2) / пользовательская строка (m=3)


$ ruby name_programm.rb --n 10 --l 300 --m 3

== Результат: ==

8653
5267
3469
91
70
24
21
17
9
7
```

## Помочь в разработке:

Шлите ваши пулреквесты в https://github.com/ProfessorNemo/max_amount.

## Лицензия:

[MIT License](https://opensource.org/licenses/MIT)
