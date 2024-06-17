#import "../conf.typ": *

= Исследование функций одной переменной при помощи первой и второй производных на монотонность, локальные экстремумы, выпуклость. Необходимые условия, достаточные условия.
== Необходимые и достаточные условия монотонности функции

#theorem("Предельный переход в неравенстве")[
  Пусть заданы две последовательности ${x_n}, {y_n}$. Если $lim_(n -> oo) x_n = a, lim_(n -> oo) y_n = b$ и, начиная
  с некоторого $N: forall n > N : x_n <= y_n$, то $a <= b$.
]

#theorem[
  Пусть $f$ дифференцируема на $(a, b)$. Тогда
  + $forall x in (a, b) : f'(x) >= 0 <=> f - "неубывающая на" (a, b)$
  + $forall x in (a, b) : f'(x) <= 0 <=> f - "невозрастающая на" (a, b)$
  + $forall x in (a, b) : f'(x) > 0 => f - "возрастающая на" (a, b)$
  + $forall x in (a, b) : f'(x) < 0 => f - "убывающая на" (a, b)$
]

#proof[
  + $f'(x) >= 0 =>$ По теореме Лагранжа:
    #eq[
      $forall x_1, x_2 : a < x_1 < x_2 < b: exists xi in (x_1, x_2) : f(x_2) - f(x_1) = f'(xi)(x_2 - x_1) >= 0$
    ]
    То есть для произвольных $x_1 < x_2: f(x_1) <= f(x_2)$.

    Обратно, пусть $f(x)$ неубывающая. Тогда
    #eq[
      $forall x_0 in (a, b) : forall Delta x : "sign" (f(x_0 + Delta x) - f(x_0)) = "sign" Delta x $
    ]
    Ну и тогда при $abs(Delta x) < min(x_0 - a, b - x_0)$:
    #eq[
      $(f(x_0 + Delta x) - f(x_0)) / (Delta x) >= 0$
    ]
    Совершим предельный переход в неравенстве и получим требуемое.

  + Аналогично предыдущему пункту
  + Контрпримером для $arrow.l.double$ является $f(x) = x^3$ в точке 0
  + Контрпримером для $arrow.l.double$ является $f(x) = -x^3$ в точке 0
]

== Достаточные условия локальных экстремумов

#theorem(
  "Первое достаточное условие экстремума функции",
)[
  Пусть $f$ непрерывна в $U_delta_0 (x_0)$ и дифференцируема в $dot(U)_delta_0 (x_0), delta_0 > 0$:
  + Если $exists delta > 0 : forall x in (x_0 - delta, x_0) : f'(x) > 0$ и $forall x in (x_0, x_0 + delta) : f'(x) < 0$,
    то $x_0$ -- точка строгого локального максимума $f$
  + Если $exists delta > 0 : forall x in (x_0 - delta, x_0) : f'(x) < 0$ и $forall x in (x_0, x_0 + delta) : f'(x) > 0$,
    то $x_0$ -- точка строгого локального минимума $f$
]

#proof[
  По сути просто заменили в определении локального экстремума монотонность на
  достаточное условие знакопостоянности производной из предыдущей теоремы.
]

#theorem(
  "Второе достаточное условие локального экстремума",
)[
  Если $f$ $n$ раз дифференцируема в точке $x_0$, $f^((k))(x_0) != 0, forall k = overline("1, n-1"): f^((n))(x_0) = 0$,
  то
  + Если $n$ чётно, то $f$ имеет в точке $x_0$ локальный минимум при $f^((n))(x_0) > 0$ и
    локальный максимум при $f^((n))(x_0) < 0$.
  + Если $n$ нечётное, то $f$ не имеет локального экстремума в точке $x_0$.
]

#proof[
  + Воспользуемся разложением в Тейлора с остаточным членом в форме Пеано (учитывая
    факт нулевых производных):
    #eq[
      $f(x) = f(x_0) + (f^((n))(x_0)) / n! (x - x_0)^n + o((x - x_0)^n), x -> x_0$
    ]
    Так как $n$ чётно, то $n = 2m$:
    #eq[
      $(f(x) - f(x_0)) / (x - x_0)^(2m) = (f^((n))(x_0)) / n! + o(1), x -> x_0$
    ]
    Левая часть в некоторой окрестности точки $x_0$ имеет тот же знак, что и правая.
    Тогда в силу чётной степени в знаменателе левой части получаем, что разность $f(x) - f(x_0)$ одного
    знака с $n$-ой производной.
  + Рассмотрим $f(x) = x^3$.
]

== Необходимые и достаточные условия выпуклости
#definition[
  $f$ называется *выпуклой (вниз) (вогнутой вверх)* на $(a, b)$, если её график
  лежит не выше хорды, стягивающей любые две точки этого графика над $(a, b)$.

  $f$ называется *выпуклой (вверх) (вогнутой вниз)* на $(a, b)$, если её график
  лежит не ниже хорды, стягивающей любые две точки этого графика над $(a, b)$.
]

#theorem[
  Пусть $f$ дважды дифференцируема на $(a, b)$:
  + $f$ выпукла вниз на $(a, b) <=> forall x in (a, b) : f''(x) >= 0$.
  + $f$ выпукла вверх на $(a, b) <=> forall x in (a, b) : f''(x) <= 0$
  + $f$ строго выпукла вниз на $(a, b) arrow.l.double forall x in (a, b) : f''(x) > 0$.
  + $f$ строго выпукла вверх на $(a, b) arrow.l.double forall x in (a, b) : f''(x) < 0$
]

#proof[
  + $arrow.l.double$ Рассмотрим эквивалентное определение выпуклости:
    #eq[
      $forall x_0, x_1 : a < x_0 < x_1 < b : forall t in [0, 1] : \
      x_t := t x_0 + (1 - t) x_1 : space f(x_t) <= t f(x_0) + (1 - t) f(x_1)$
    ]
    Разложим $f$ в формулу Тейлора с остаточным членом в форме Лагранжа с центром в
    точке $x_t$:
    #eq[
      $exists xi_1 in (x_0, x_t) : f(x_0) = f(x_t) + f'(x_t)(x_0 - x_t) + (f''(xi_1)) / 2! (x_0 - x_t)^2 \
      exists xi_2 in (x_1, x_t) : f(x_1) = f(x_t) + f'(x_t)(x_1 - x_t) + (f''(xi_2)) / 2! (x_1 - x_t)^2$
    ]
    Из-за знакопостоянности второй производной из этих равенств следуют следующие
    неравенства:
    #eq[
      $f(x_0) >= f(x_t) + f'(x_t)(x_0 - x_t) \
      f(x_1) >= f(x_t) + f'(x_t)(x_1 - x_t) $
    ]
    Умножим первое на $t$, второе на $1 - t$ и сложим их:
    #eq[
      $t f (x_0) + (1 - t) f(x_1) >= f(x_t) + underbrace(f'(x_t)(t x_0 + (1 - t) x_1 - x_t), 0)$
    ]
    $=>$ Рассмотрим произвольную точку $x_0 in (a, b)$ и достаточно малую
    окрестность $delta := min(x_0 - a, b - x_0)$. Тогда
    #eq[
      $forall u in (-delta, delta) : x_0 = 1 / 2 (x_0 - u) + 1/2 (x_0 + u) : space f(x_0) <= 1 / 2 f(x_0 - u) + 1 / 2 f(x_0 + u )$
    ]
    Применим формулу Тейлора с остаточным членом в форме Пеано:
    #eq[
      $f(x_0 plus.minus u) = f(x_0) plus.minus f'(x_0) u + (f''(x_0)) / 2 u^2 + o(u^2), u -> 0$
    ]
    В прошлой строчке мы записали сразу два равенства благодаря $plus.minus$,
    давайте умножим каждое на $1 / 2$ и сложим их:
    #eq[
      $1 / 2 f(x_0 - u) + 1 / 2 f(x_0 + u) = f(x_0) + (f''(x_0)) / 2 u^2 + o(u^2), u -> 0$
    ]
    Тогда при достаточно малых $u$ $(f''(x_0)) / 2 u^2$ обязано будет стать такого
    же знака, как и $1 / 2 f(x_0 - u) + 1 / 2 f(x_0 + u) - f(x_0) >= 0$
  + Аналогично
  + $arrow.l.double$ аналогично только со строгими неравенствами, а $=>$ вообще
    говоря не верно, например, для $f(x) = x^4$
  + $arrow.l.double$ аналогично только со строгими неравенствами, а $=>$ вообще
    говоря не верно, например, для $f(x) = -x^4$
]
