---
draft: false
title: "[실해석학] 특수한 Poncelet's Closure Theorem의 증명"
date: 2025-08-30T23:46:41+09:00
isCJKLanguage: true
math: true
keywords:
    - 수학
    - Poncelet's Closure Theorem
    - 기하학
description: 기하 문제와 관련하여 풀지 못했던 Poncelet's Closure Theorem의 특수한 경우에 대하여 다룹니다.
---
저번에 [Dienes의 교수이론](/posts/math-education/geometry-learning)에 대해 다루면서, 정리 하나를 증명하지 못한 채로 글을 마무리했었습니다.
그 뒤로 몇 번이고 시도해봤지만 계산이 너무 복잡해서 포기하려던 참이었습니다.
그런데 이 상황에 적용할 수 있는 특수한 경우에서의 [Poncelet's Closure Theorem](https://en.wikipedia.org/wiki/Poncelet%27s_closure_theorem) 증명을 제시한 분이 있어 글로 옮겨 적어볼까 합니다.
아래는 그 도움이 된 YouTube 영상입니다.

{{< youtube id="o7AE9yozflY" >}}

## Poncelet's Closure Theorem과 증명
{{< theorem type="lemma" name="Special Case of Poncelet's Closure Theorem" >}}
중심이 $\mathrm{O}$이고 반지름이 $R$인 원 $C_1$와 중심이 $\mathrm{I}$이고 반지름이 $r$인 원 $C_2$에 대해 $\overline{\mathrm{OI}} + r < R$라고 하자.
$C_1$ 상의 한 점 $\mathrm{P}_0$를 지나고 $C_2$에 접하는 직선과 $C_1$이 $\mathrm{P}_0$가 아닌 점을 $\mathrm{P}_1$이라고 하자.
이와 같이 $\mathrm{P}_0$, $\mathrm{P}_1$, $\mathrm{P}_2$, $\cdots$를 정의할 때, 한 자연수 $N$에 대하여 $\mathrm{P}_0 = \mathrm{P}_N$이면 이와 같은 방식으로 구성되는 폐곡선 $\mathrm{P}_0\mathrm{P}_1\cdots\mathrm{P}_N$은 셀 수 없이 무한히 존재한다.
{{< /theorem >}}
{{< theorem type="proof" >}}
{{< figure alt="증명의 도식" src="figure-1.svg" invert="dark" >}}
<p>
$\mathrm{P}_i$ 근방의 점 $\mathrm{P}_i'$에 대하여 $\mathrm{P}_{i + 1}'$를 $\mathrm{P}_{i + 1}$와 같이 구성한다.
선분 $\mathrm{P}_i\mathrm{P}_{i + 1}$과 $\mathrm{P}_i'\mathrm{P}_{i + 1}'$의 교점을 $\mathrm{M}$이라고 하자.
원주각(inscribed angle)의 원리에 따라 
$$\angle \mathrm{P}_i\mathrm{P}_i'\mathrm{M} = \angle \mathrm{P}_i\mathrm{P}_i'\mathrm{P}_{i + 1}' = 
\angle \mathrm{P}_{i + 1}'\mathrm{P}_{i + 1}\mathrm{P}_i' = \angle \mathrm{P}_{i + 1}'\mathrm{P}_{i + 1}\mathrm{M} $$
이고 $\angle \mathrm{P}_{i + 1}\mathrm{M}\mathrm{P}_{i + 1}' = \angle \mathrm{P}_i'\mathrm{M}\mathrm{P}_i$이므로
$$\triangle \mathrm{P}_i\mathrm{M}\mathrm{P}_i' \simeq \triangle \mathrm{P}_{i + 1}'\mathrm{M}\mathrm{P}_{i + 1}$$
이다.
</p>
<p>
원 $C_1$ 상에서 가상의 한 축에 대해 $\mathrm{P}_i$의 동경을 $\theta_i$라고 하자.
$\theta_{i + 1}$은 $\theta_{i}$에 대한 다가함수(multi-valued function)인데, $\theta_i \leq \theta_{i + 1} \leq \theta_{i} + 2\pi$로 함수를 제한하면 $\theta_{i + 1}$은 $\theta_i$에 대한 매끄러운 함수이다.
$\mathrm{P}_i$와 $\mathrm{P}_i'$ 사이 동경 차이를 $\varDelta\theta_i$라고 하고 $\mathrm{P}_{i + 1}$와 $\mathrm{P}_{i + 1}'$ 사이 동경 차이를 $\varDelta\theta_{i + 1}$라고 하자.
이때, 
$$ \overline{\mathrm{P}_i\mathrm{P}_i'} = R\sin\left(\frac{1}{2}\varDelta\theta_i\right),\ \overline{\mathrm{P}_{i + 1}\mathrm{P}_{i + 1}'} = R\sin\left(\frac{1}{2}\varDelta\theta_{i + 1}\right) $$
이므로
$$ \lim_{\varDelta_i \to 0}{\frac{\mathrm{P}_{i + 1}\mathrm{P}_{i + 1}'}{\mathrm{P}_i\mathrm{P}_i'}} 
= \lim_{\varDelta\theta_i \to 0}\frac{\sin(\varDelta\theta_{i + 1} / 2)}{\sin(\varDelta\theta_{i} / 2)}
= \lim_{\varDelta\theta_i \to 0}\frac{\sin(\varDelta\theta_{i + 1} / 2)}{\varDelta\theta_{i + 1} / 2}\frac{\varDelta\theta_{i} / 2}{\sin(\varDelta\theta_{i} / 2)}\frac{\varDelta\theta_{i + 1}}{\varDelta\theta_{i}}
= \frac{d\theta_{i + 1}}{d\theta_{i}}
$$
이다.
한편 $C_2$와 선분 $\mathrm{P}_i\mathrm{P}_{i + 1}$의 교점을 $\mathrm{T}_i$, 선분 $\mathrm{P}_i'\mathrm{P}_{i + 1}'$의 교점을 $T_i'$라고 하자.
$\varDelta\theta_i \to 0$일 때 $\overline{\mathrm{P}_iM},\,\overline{\mathrm{P}_i'M} \to \overline{\mathrm{P}_i\mathrm{T}_i}$이다.
마찬가지로 선분 $\mathrm{P}_i\mathrm{T}_i$의 길이를 $\theta_i$에 대한 함수 $g(\theta_i)$로 나타내면 $g$는 양의 매끄러운 함수이다.
그리고 $\overline{\mathrm{P}_{i + 1}\mathrm{T}_i} = \overline{\mathrm{P}_{i + 1}\mathrm{T}_{i + 1}}$이므로
$$ \lim_{\varDelta_i \to 0}\frac{\mathrm{P}_{i + 1}'\mathrm{M}}{\mathrm{P}_i\mathrm{M}} = \frac{\mathrm{P}_{i + 1}\mathrm{T}_{i}}{\mathrm{P}_i\mathrm{T}_i} = \frac{g(\theta_{i + 1})}{g(\theta_i)} $$
이다.
이를 종합하면
$$\frac{d\theta_{i + 1}}{d\theta_i} = \frac{g(\theta_{i + 1})}{g(\theta_i)}$$
를 얻는다.
</p>
<p>
초기 조건으로 주어진 $\mathrm{P}_0$의 동경, $\theta_0^*$와 적당한 자연수 $N$과 $m$에 대해 $\mathrm{P}_N$의 동경 $\theta_N^*$이 $\theta_N* = \theta_0* + 2\pi m$를 만족한다고 하자.
이때 $g(\theta_N^*) = g(\theta_0^*)$이므로 ${g(\theta_N^*)}/{g(\theta_0^*)} = 1$이다.
한편 연쇄법칙(chain rule)에 의하여
$$\begin{aligned}
    \frac{d\theta_{N}}{d\theta_0} &= \frac{d\theta_{N}}{d\theta_{N - 1}}\frac{d\theta_{N - 1}}{d\theta_{N - 2}}\cdots\frac{d\theta_1}{d\theta_0} \\\\
    &= \frac{g(\theta_N)}{g(\theta_{N - 1})}\frac{g(\theta_{N - 1})}{g(\theta_{N - 2})}\cdots\frac{g(\theta_1)}{g(\theta_0)} \\\\
    &= \frac{g(\theta_N)}{g(\theta_0)}
\end{aligned}$$
인데, $\theta_0 = \theta_0^*$이면 $d\theta_N/d\theta_0 = 1$이다.
미분방정식의 해는 $\theta_N = \theta_0 + 2\pi m$과 같이 나타나며, 따라서 임의의 $\theta_0$에 대해 $\mathrm{P}_0\mathrm{P}_1\cdots\mathrm{P}_N$은 폐곡선이다.
</p>
{{< /theorem >}}
{{< theorem type="remark" >}}
<p>
미분방정식
$$\frac{d\theta_N}{d\theta_0} = \frac{g(\theta_N)}{g(\theta_0)}$$
에 대한 해를 구해봅시다.
먼저 양의 실수 $R$, $r$, $d$에 대해 $d + r < R$라고 합시다.
$\mathrm{O}$가 원점이고 $\mathrm{I}$의 좌표가 $(d,\,0)$이 되도록 두 원 $C_1$, $C_2$을 좌표평면 위에 배치합니다.
$C_1$ 위의 점 $P$의 좌표를 $(R\cos{\theta},\,R\sin{\theta})$와 같이 나타낼 때, $g(\theta)$는
$$ g(\theta) = \sqrt{(R-d)^2 - r^2 + 4dR\sin^2(\theta / 2)} $$
입니다.
</p>
<p>
$1/g(\theta)$의 한 부정적분을 $G(\theta)$라고 합시다.
미분방정식은 $d\theta_N/g(\theta_N) = d\theta_0/g(\theta_0)$이므로 부정적분을 사용하면 한 상수 $C$에 대해
$G(\theta_N) = G(\theta_0) + C$
가 성립합니다.
이때 $g(\theta) > 0$이므로 $G$는 순증가함수이며, 따라서 $\theta_N = G^{-1}(G(\theta_0) + C)$입니다.
</p>
<p>
초기 조건이 $\theta_N^* = \theta_0^* + 2\pi m$으로 주어졌으므로 상수 $C$는 $G(\theta_0^* + 2\pi m) - G(\theta_0^*)$로 결정할 수 있습니다.
여기서 $G$의 다음 성질을 이용하려고 합니다:
<blockquote>
임의 실수 $x$, $y$에 대해, $n$이 정수이면 $G(x + 2\pi n) - G(x) = G(y + 2\pi n) - G(y)$이다.
</blockquote>
이는 $G$의 도함수 $1/g$의 주기가 $2\pi$임에서 유도됩니다.
여기서 $x = \theta_0$, $y = \theta_0^*$라고 하면
$$G(\theta_0 + 2\pi m) = G(\theta_0) + G(\theta_0^* + 2\pi m) - G(\theta_0^*) = G(\theta_0) + C$$
이므로 결국
$$ \theta_N = G^{-1}(G(\theta_0) + C) = \theta_0 + 2\pi m $$
입니다.
</p>
{{< /theorem >}}

증명에 따르면, 외접원과 내접원이 있을 때 선분으로 이루어진 폐곡선이 형성되면 곡선이 시작되는 점을 외접원 상에서 임의로 결정할 수 있다는 결론이 나옵니다.
그러면 마침내 Euler의 삼각형 정리를 다음과 같이 일반화할 수 있습니다.
{{< theorem name="Generalization of Euler's Theorem in Geometry" >}}
중심이 $\mathrm{O}$이고 반지름이 $R$인 원 $C_1$과 중심이 $\mathrm{I}$이고 반지름이 $r$인 원 $C_2$에 대하여 $d$를 선분 $\mathrm{OI}$의 길이라고 하고 $r < R/2$, $d + r < R$이라고 하자. 
$C_1$ 상의 임의의 점 $A$에서 $C_2$에 그은 접선이 $C_2$와 만나는 $A$가 아닌 두 점 $B$, $C$라고 할 때, 삼각형 $\mathrm{ABC}$가 $C_2$를 내접원으로 가지는 것은 $d=\sqrt{R^2 - 2rR}$인 것과 동치이다. 
{{< /theorem >}}
{{< theorem type="proof" >}}
<p>
충분조건에 대해서는 증명한 바 있으므로 필요조건만을 증명하면 충분하다.
따라서 $d = \sqrt{R^2 - 2rR}$을 가정하자.
</p>
<p>
$\mathrm{O}$의 좌표를 $(0,\,0)$, $\mathrm{I}$의 좌표를 $(d,\,0)$이 되도록 $C_1$과 $C_2$를 배치한다.
$A = (-R,\,0)$이고 $\angle\mathrm{BAO} = \alpha$라고 할 때, $\sin{\alpha} = {r}/(R + d)$이고 $\mathrm{B}$와 $\mathrm{C}$의 $x$좌표는 $R\cos{2\alpha}$이다.
직선 $BC$와 $I$ 사이 거리는 이들 $x$좌표의 차이이고,
$$\begin{aligned}
    R\cos{2\alpha} - d &= R(1 - 2\sin^2{\alpha}) - d \\\\
    &= R\left( 1 - \frac{2r^2}{(R+d)^2} \right) - d \\\\
    &= R - \frac{2r^2(R-d)^2R}{(R^2 - d^2)^2} - d \\\\
    &= R - \frac{(R-d)^2}{2R} - d \\\\
    &= \frac{1}{2}R - \frac{d^2}{2R} \\\\
    &= r
\end{aligned}$$
이다.
즉, 직선 $\mathrm{BC}$는 $C_2$와 접한다.
Poncelet's Closure Theorem에 따라서 임의의 $C_1$ 상의 점 $\mathrm{A}$에 대하여 삼각형 $\mathrm{ABC}$의 내접원은 $C_2$이다.
</p>
{{< /theorem >}}