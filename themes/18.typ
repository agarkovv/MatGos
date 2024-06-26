#import "../conf.typ": *

= Достаточные условия сходимости тригонометрического ряда Фурье в точке
В доказательствах некоторых теорем этого и следующего билетов используется
интересный трюк: если у нас есть цепочка равенств $a = b$, то мы с лёгкостью
сможем продолжить её, написав $a = b = (a + b) / 2$. Если вы понимаете, что в
доказательстве теоремы с интегралами происходит какая-то дичь, то вспоминайте
этот трюк!

#definition[
  #eq[
    $L_(2 pi) := { f in L_1[-pi, pi] | f - 2 pi "периодическая"}$
  ]
]

#definition[
  *Ядром Дирихле* $D_n (u)$ называется выражение
  #eq[
    $D_n (u) = 1 / 2 + sum_(k = 1)^n cos(k u) = (sin((n + 1 / 2) u)) / (2 sin (u / 2))$
  ]
]

#definition[
  Пусть $f in L_(2 pi)$, тогда *частичной суммой тригонометрического ряда Фурье*
  называется
  #eq[
    $S_n (f, x) := a_0 / 2 + sum_(k = 1)^n (a_k cos(k x) + b_k sin (k x))$
  ]
  где
  #eq[
    $a_k := 1 / pi integral_(- pi)^pi f(t) cos(k t) dif mu(t); quad b_k = 1 / pi integral_(-pi)^pi f(t) sin (k t) dif mu(t)$
  ]
]

#lemma(
  "О представлении частичной суммы",
)[
  Если $f in L_(2 pi)$, то $n$-я частичная сумма тригонометрического ряда Фурье
  может быть представлена
  #eq[
    $\
    S_n (f, x) = 1 / pi integral_(-pi)^pi f(t) D_n (x - t) dif mu(t) = 1 / pi integral_(-pi)^pi f(x + u) D_n (u) dif mu(u)$
  ]
]

#theorem(
  "Теорема Римана об осцилляции",
)[
  Если $f in L_1(I)$, где $I$ -- конечный или бесконечный промежуток, то
  #eq[
    $lim_(lambda -> oo) integral_I f(x) cos(lambda x) dif mu(x) = lim_(lambda -> oo) integral_I f(x) sin(lambda x) dif mu(x) = 0$
  ]
]

#theorem("Признак Дини")[
  Если $f in L_(2 pi)$ и $phi_x_0 in L_1(0, delta), delta > 0$, где
  #eq[
    $\ phi_x_0 (t) := (f(x_0 + t) + f(x_0 - t) - 2 S (x_0)) / t$
  ]
  то тригонометрический ряд Фурье функции $f(x)$ сходится к $S(x_0)$
] <dini>

#proof[
  Рассмотрим разность $S_n (f, x_0) - S(x_0)$, пользуясь леммой о представлении,
  можем записать её как
  #eq[
    $S_n (f, x_0) - S(x_0) attach(=, t: "трюк") 1 / pi integral_0^pi (f(x + u) + f(x - u) - 2S(x_0))D_n (u) dif mu(u)$
  ]
  В данном переходе мы воспользовались сразу несколькими фактами:
  - Подынтегральная функция чётная относительно $u$
  - Интеграл по $[-pi, pi]$ от ядра Дирихле равен $pi$
  - Если заменить в представлении частичной суммы $t$ на $-t$, то ничего не
    изменится.

  Продолжим цепочку преобразований, раскрыв в формуле ядра Дирихле
  #eq[
    $sin((n + 1 / 2) t) = sin(n t) cos(t / 2) + cos(n t) sin(t / 2)$
  ]
  А также добавим и вычтем интеграл
  #eq[
    $1 / pi integral_0^delta (f(x + t) + f(x - t) - 2S(x_0)) / t sin(n t) dif mu(t)$
  ]
  Итак, приступим
  #eq[
    $S_n (f, x_0) - S(x_0) = \
    1 / pi integral_0^delta (f(x + t) + f(x - t) - 2S(x_0)) / t sin(n t) dif mu(t) + \ 1 / pi integral_0^pi (f(x + t) + f(x - t) - 2S(x_0)) cos(n t) / 2 dif mu(t) + \
    1 / pi integral_delta^pi (f(x + t) + f(x - t) - 2S(x_0)) (sin(n t) cos(t / 2)) / (2 sin(t / 2)) dif mu(t) + \
    1 / pi integral_0^delta (f(x + t) + f(x - t) - 2S(x_0)) sin(n t) (cos(t / 2) / (2 sin(t / 2)) - 1 / t) dif mu(t) $
  ]
  По условию $phi_x_0$ сумирумая, значит по теореме Римана об осцилляции первое
  слагаемое стремится к нулю.

  $f(x + t) + f(x - t) - 2S(x_0)$ суммируема как сумма суммируемых и константы,
  значит по теореме Римана об осцилляции второе слагаемое стремится к нулю.

  В третьем cлагаемом $(f(x + t) + f(x - t) - 2S(x_0)) (cos(t / 2)) / (2 sin(t / 2)) in L_1[delta, pi]$,
  так как мы отделились от нуля и по теореме Римана об осцилляции третье слагаемое
  стремится к нулю.

  Для четвёртого слагаемого рассмотрим разность:
  #eq[
    $cos(t / 2) / (2 sin(t / 2)) - 1 /t attach(tilde.op, t: t -> 0) (1 - t^2 / 8) / (2 (t / 2 - t^3 / 48))) - 1 / t = (t - t^3 / 8 - t + t^3 / 24) / (t^2) = 0$
  ]
  Значит мы умножили суммируемую функцию $f(x + t) + f(x - t) - 2S(x_0)$ на
  другую, имеющую устранимый разрыв в нуле, а значит
  #eq[
    $(f(x + t) + f(x - t) - 2S(x_0))(cos(t / 2) / (2 sin(t / 2)) - 1 /t) in L_1[0, delta]$
  ]
  И опять применяем теорему об осцилляции.
]

#definition[
  Будем говорить, что функция $f$ удовлетворяет *условию Гёльдера* порядка $alpha in (0, 1]$ в
  точке $x_0$, если существуют конечные односторонние пределы $f(x_0 plus.minus 0)$ и
  константы $C > 0, delta > 0$ такие, что
  #eq[
    $forall t, 0 < t < delta : space abs(f(x_0 + t) - f(x_0 + 0)) <= C t^alpha and abs(f(x_0 - t) - f(x_0 - 0)) <= C t^alpha$
  ]
]

#theorem(
  "Признак Липшица",
)[
  Если $f in L_(2 pi)$ удовлетворяет условию Гёльдера порядка $alpha$ в точке $x_0$,
  то тригонометрический ряд Фурье функции $f(x)$ сходится в точке $x_0$ к $(f(x_0 + 0) + f(x_0 - 0)) / 2$
]

#proof[
  По условию теоремы, хотим
  #eq[
    $S(x_0) = (f(x_0 + 0) + f(x_0 - 0)) / 2$
  ]
  Значит функция $phi_x_0$ из признака Дини будет иметь вид
  #eq[
    $\
    phi_x_0 (t) = (f(x_0 + t) - f(x_0 + 0) + (f(x_0 - t) - f(x_0 - 0))) / t$
  ]
  То что $phi$ измерима -- очевидно. Осталось доказать ограниченность интеграла
  #eq[
    $abs(integral_0^delta phi_x_0 (t) dif mu(t)) <= integral_0^delta abs(f(x_0 + t) - f(x_0 + 0)) / t dif mu(t) + integral_0^delta abs(f(x_0 - t) - f(x_0 - 0)) / t dif mu(t) <= \
    2 C integral_0^delta t^(alpha - 1) dif mu(t) = 2C delta^alpha / alpha$
  ]
  Значит мы можем применить признак Дини и всё доказано.
]
