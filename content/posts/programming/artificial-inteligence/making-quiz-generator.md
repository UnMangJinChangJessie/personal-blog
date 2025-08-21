---
draft: false
title: "[인공지능] 문제를 만드는 인공지능을 만들게 된 일에 대하여"
date: 2025-08-21T07:51:15.674Z
isCJKLanguage: true
math: false
keywords:
    - 인공지능
    - 교육학
    - Qwen
    - 프로그래밍
---

## 배경

저는 현재 중등교사임용시험을 준비하면서 교육학을 천천히 복습하고 있습니다.
벌써 8월이 끝나가는데 교육학을 한 과목도 끝내지 못 한 것을 보니 이번 년도에도 시험을 응시하기에는 그른 듯 합니다만&hellip; 그래도 포기는 않고 있습니다.
그런데 공부하면서 느낀 것이 하나 있는데, 교육학을 공부하는 것은 하나도 재미가 없다는 것입니다.
교재를 읽는 중에는 그래도 문장을 천천히 읽어나가면 학자들의 생각이 이해될 듯하지만 막상 책을 덮고 아는 것을 확인하려고 하면 쓸 수 없는 것이 없었습니다.
가장 초반에 있는 '교육행정의 발전 과정'을 공부하고 있었는데, 고전이론학자 Taylor, Fayol, Urwick & Gulick, Weber, 인간관계론자 Follet, 행동과학론자 Simon과 Barnard를 떠올릴 수는 있었지만 그 학자의 세부사항이나 의의점까지 세부적으로 쓰지는 못 하는 식이었죠.

저는 이 문제를 *연습문제의 부재*가 원인인 것으로 판단했습니다.
물론 수학도 교재를 읽다 보면 문맥을 놓치고 개념 이해가 지연되는 경우가 많습니다.
T1 공간, Hausdorff 공간, 정칙공간, 정규공간 간의 정의가 헷갈리고 배운 동치조건도 기억하지 못 하는 경우가 많지요.
그런데 전공수학을 공부할 때는 항상 단원마다 연습문제가 존재해서 배운 수학적 개념과 응용을 체험할 수 있는 기회가 부여됩니다.
시간은 매우 오래 걸립니다만, 문제들을 모두 풀고 나면 배운 개념은 어느 상황에 적용하며 그 방법론에 대해서도 학습하게 되지요.
그런데 교육학 과목들, 수학교육론 교재를 읽다 보면 연습문제가 있는 경우가 드물고 있어도 대부분 *~에 대하여 논하시오*와 같은 식의 질문이 몇 개 있는 식이라 많아도 10분만을 소비하는 질문로부터 제가 무언가를 공부하기는 어려웠습니다.
그래서 중등교사임용시험의 교육학 문제들을 가져와 풀어보는 것으로 학습 수준을 파악하기로 했습니다.

현재의 시험 방식인 논술형으로 연습을 하면 책 없이는 시작조차 할 수도 없어서 풀고 답을 맞혀볼 수 있는 과거의 선택형 문제들로 지식을 점검하는 편이었습니다.
하지만 이때 문제는 선택형 문제는 폐지되었기 때문에 2008-2013학년도 분의 *소량의 기출문제만이 유일한 재원*이었습니다.
독자 역시도 수능을 준비할 때 기출문제를 몇 번 풀어보다 보면 정답의 번호는 물론이요 언제적 시험의 몇 번 문제인지도 외우는 수준에 도달함을 경험해 보았을 것입니다.
저도 그것을 피하고 싶었기 때문에 *내 지식을 점검해 볼 수 있는 문제를 더 구할 수 있을까?* 하는 고민이 생겼습니다.

## 인공지능의 활용

그러면서 인공지능을 활용하는 방안을 생각했습니다.
특히 대형 언어 모델(LLM) 인공지능 기술이 많이 발전하여 교육 분야에서도 사용된다는 소식이 들려오기 시작했기에 저도 이것을 사용해 보면 어떨까 싶었죠.
그런데 막상 시작하기 전에는 될까 싶은 의심도 많이 들었습니다.
당장 GPT나 Gemini 등 현존하는 첨단 LLM도 지식을 효과적으로 사용한다고 보기도 어렵고, 무엇보다 언어 모델의 환각 현상이 집에서 가용한 인공지능 수준에서는 더 심하지 않을까 하는 걱정이었죠. 
그리고 문제를 생성하려면 배경지식도 제공해 주어야 하는데 제가 언어 모델은 만져본 적이 없는 만큼 방법도 알기 어려웠고요.
그럼에도 문제를 바로 생성하여 공부를 할 수 있으면 좋겠고, 수학이면 모를까 글로만 학습하는 교육학은 AI가 효과적일 수 있다는 희망도 생겼고, 무엇보다 *재미있어 보이니까* 어떻게든 해보자는 생각으로 뛰어들었습니다. 

## 과정&hellip;

먼저 모델을 선택해야 했습니다.
집에서 가용 가능한 VRAM이 8GB였기에 빠른 생성을 위해서는 GPU에 모든 가중치와 KV 사전을 올릴 수 있도록 가충치 수 8억 아래의 모델을 골라야 합니다.
그리고 이 용량으로는 세부조정(fine-tuning)은 택도 없었기에 공개된 가중치를 받았을 때 성능이 괜찮은 것을 하나 골라야 했습니다.
DeepSeek-R1:7B나 Qwen3:8B를 시험해 보았는데, DeepSeek은 한글을 읽거나 출력하면서 중국어나 영어가 섞이는 현상이 잦아서 이러한 현상이 보이지 않는 Qwen3를 쓰기로 결정했습니다.

다음으로는 정보를 제공해야 하는데, 이게 사실 제일 어려웠습니다.
필요할 때마다 개념을 인터넷에서 찾게 둘 수도 있겠지만 언어 모델이 인터넷 자료를 검증할 수 없는 만큼 공신력 있는 자료를 사용하는 것이 좋겠다 싶었습니다.
그래서 교육행정학 교재 뒤에 있는 참조문헌을 찾아봤는데, 돈을 내고 볼 수 있는 논문들도 많고 논문 하나씩을 통째로 LLM에 먹이면서 문제를 출제하게 둘 수도 없는 노릇이라 이 방법은 포기했습니다.

그래서 처음 시도한 것은 Markdown으로 작성한 *요약 노트*를 프롬프트에 입력하는 것이었습니다.
문제를 생성하는 일련의 방법을 문제를 출제할 영역의 노트와 함께 제시한 것입니다.
지금 남은 것은 이 스크린샷밖에 없지만, 비록 문제의 질은 매우 떨어지더라도 명령한 형식에 적당히 맞추어 문제를 생성한 것을 확인했습니다.
{{< figure src="figure-1.webp" alt="처음으로 AI에게 출제를 명령하는 모습" >}}
Markdown 형식도 엉성했고 문제 생성 프롬프트 역시 허점이 많아 문제의 질이 높지는 않은 것을 확인할 수 있습니다.

> 행동과학론의 핵심 이론 중 하나인 '교육행정의 이론화 운동'의 주요 기여(에 대한 설명) 중 옳은 것은?
> 1. 교육행정 연구에 정량적 방법을 중심으로 접근해야 한다고 주장하였다.
> 2. 교육행정은 기업경영과 다른 독자적인 분야로 연구되어야 한다고 강조하였다.
> 3. 교육행정 연구에 행동과학적인 접근이 필요하다고 제안하였다.
> 4. 교육행정에 대한 이론화는 구성원의 동기 개발을 무시할 수 없다고 지적하였다.
> 5. 교육행정을 사회 체제로 파악할 필요가 없다고 단정하였다.

보통 이런 선택형 문제를 만들 때 *"단정한다", "절대", "무조건", "항상" 등의 극단적인 용어 사용을 지양한다*고 배우지만, 언어 모델이 이런 훈련을 받았을 리가 없으며 이를 명령에 세세히 명시하지 않았기 때문에 5번 선택지에서 오답임을 유추할 수 있는 선지가 나왔습니다.
그리고 문장 자체도 필기한 내용에서 그대로 가져온 티가 났고, 가끔 중요하지 않은 지엽적인 사항을 가지고 정오를 가르는 경우도 있었습니다.
따라서 이런 것들을 세세하게 관찰하면서 프롬프트를 발전시켜야 하는 것이지요.
그렇게 현재 출제를 명령하는 질의는 다음과 같이 수정되었고, 앞으로도 수정을 거듭할 것입니다.

```markdown
-----
# 과제
<조건>을 만족하는 문제 하나와 해설을 다음과 같이 분리하여 제작하시오. 

## 문제
1. Markdown으로 작성된 제시문에서 <조건>에서 주어진 영역을 학습한다. 
1. 제시된 이론을 주제로 하여 문제를 제작한다. 
1. 문제와 선택지만을 작성한다. 

## 정답

1. 문제에 대한 답을 표기한다.

## 해설

1. 주어진 각 문제의 답이 올바른 이유를 다섯 문장 내외로 해설한다. 
------
# <조건>

1. 주제는 '{chapter}' 단원의 '{subchapter}'이다.
2. 정답은 {answer}번이고 나머지 번호는 오답이어야 한다.
3. '{subchapter}'에 관련된 명제(proposition) 중 가장 알맞은 것 하나를 고르는 문제이다.
4. 따라서 알맞지 않은 것을 고르는 문제는 생성하지 않는다.
5. 질문은 하나의 사실을 묻는 하나의 의문문(question)으로 이루어진다.
6. 명제는 5개의 완전한 문장으로 생성되어 주어진다.
7. 명제에서 **강조 표시**는 제거한다.

# 유의사항

1. 교수/학습 과정에서 중요하지 않고 지엽적인 질문이나 명제는 제작하지 않는다.
2. 용어(term)의 정의(definition)나 개념(concept)을 묻는 질문의 경우, 용어에 대한 정의나 개념을 먼저 질문한 다음 그 용어나 개념에 대한 명제를 선택지에 열거한다.
3. 문항을 보고 정답을 유추할 수 없도록 질문에 많은 정보를 포함하지 않는다.
4. 제시문의 문장을 그대로 인용하지 않고 의미가 같도록 변형하여 사용한다.
5. 선택지의 명제는 가능한 단순하게 구성한다.
6. 선택지의 명제는 서로 독립적(independent to each other)이어야 한다.
7. 선택지의 명제 각각에 같은 단어나 구절(phrase)이 반복하지 않도록 한다.
8. 선택지의 명제의 문법적 구조와 내용은 유사하게 한다.
9. 선택지의 명제의 글자 수는 비슷하게 한다.
10. 선택지의 명제에서 "절대", "반드시", "항상", "~만을(only)" 등과 같은 강한 어휘의 사용을 금지한다.

# 예시

아래 예시는 생성되어야 할 문제의 질문과 명제의 대략적인 형태를 제시한 것으로, 글의 주제나 정답 번호와는 무관하니 참고 바랍니다.

- 효과적인 교수/학습을 위해 행동주의 관점에서 강화를 사용하고자 할 때 올바른 방법은?
    1. 새로운 주제의 초기 학습 단계라면 계속강화계획보다 간헐강화 계획을 사용한다.
    2. 학생의 나쁜 습관을 없애고자 한다면 그 행동을 보일 때 부적강화를 사용한다.
    3. 학습이 진행되는 동안 점진적으로 강화의 제시 횟수를 줄이고 제시 간격을 넓힌다.
    4. 강화 제공의 시점을 특별히 정해두지 않았다면 즉시강화보다 지연강화를 사용한다.
    5. 학습자의 반응 지속성을 높이기 위해서는 변동강화계획보다 고정강화계획을 사용한다.

- ...

```
[^1]
[^1]: 예시로 주어진 문제들은 한국교육과정평가원에서 출제한 중등교사임용시험 교육학/수학 기출문제에서 가져왔습니다.

여기서 중괄호로 싸인 부분은 Python에서 주제를 원하는 대로 삽입하기 위하여 배치하였습니다.
`{answer}`가 있는 이유도 궁금해 할 것 같은데, 이를 지정하지 않고 임의로 선택하게 하는 경우 정답이 특정한 번호에 편향되는 현상이 있었기 때문에 강제로 정해준 것으로, 각 문제에 대해 `random.randint`를 통해 정해집니다.

```python
# generate_quiz.py
from ollama import chat, Options, ChatResponse
import sys
from generate_prompt import generate_prompt, QuestionType
from separate_markdown import sect_markdown
from random import sample

with open(sys.argv[1], mode='r') as f:
	markdown_sections = sect_markdown(f.read())

try:
	# how many questions are you going to make from a single subsection?
	question_count = int(sys.argv[2])
except:
	question_count = 1
finally:
	pass

for chapter in markdown_sections.children:
	for subchapter in chapter.children:
		for i in range(question_count):
			stream = chat(
				model='qwen3:custom',
				messages=[
				{
					'role': 'user',
					'content': generate_prompt(
						str(subchapter), 
						question_type = sample(
							[QuestionType.SELECT_ONE_TRUE_PROPOSITION, QuestionType.SELECT_ONE_FALSE_PROPOSITION], 
							k=1
						)[0],
						chapter = chapter.head_title,
						subchapter = subchapter.head_title
					)
				}
			], stream=True, keep_alive = 0 if (i + 1) == question_count else None)
			print_chunk = False
			for chunk in stream:
				content: str = chunk['message']['content'];
				print(content, end='', flush=True, file=(sys.stdout if print_chunk else sys.stderr))
				if content.strip() == '</think>':
					print_chunk = True;
					print(file=sys.stderr)
			print('\n')

# generate_prompt.py
from enum import Enum
from random import randint
from typing import TypedDict
import sys
class QuestionType(Enum):
		SELECT_ONE_TRUE_PROPOSITION = 0
		SELECT_ONE_FALSE_PROPOSITION = 1
		SELECT_ONE_TRUE_FROM_GIVEN_TEXT = 2
		SELECT_ONE_FALSE_FROM_GIVEN_TEXT = 3
		SELECT_ALL_TRUE_FROM_GIVEN_TEXT = 4
		SELECT_ONE_MISSING_WORD = 5
		SELECT_ONE_TRUE_TERM = 6
class PromptOption(TypedDict):
	question_type: QuestionType
	chapter: str
	subchapter: str

GUIDELINE_BASE = '''------
# 과제
<조건>을 만족하는 문제 하나와 해설을 다음과 같이 분리하여 제작하시오. 

## 문제
1. Markdown으로 작성된 제시문에서 <조건>에서 주어진 영역을 학습한다. 
1. 제시된 이론을 주제로 하여 문제를 제작한다. 
1. 문제와 선택지만을 작성한다. 

## 정답

1. 문제에 대한 답을 표기한다.

## 해설

1. 주어진 각 문제의 답이 올바른 이유를 다섯 문장 내외로 해설한다. 
------
'''
QUESTION_PROMPT_DICT = {
	QuestionType.SELECT_ONE_TRUE_PROPOSITION: {
		'condition': open('prompts/select-one-true-proposition').read()
	},
	QuestionType.SELECT_ONE_FALSE_PROPOSITION: {
		'condition': open('prompts/select-one-false-proposition').read()
	}
}
def generate_prompt(content: str, **kwargs: PromptOption) -> str:
	answer = randint(1, 5);
	question_type: QuestionType = kwargs['question_type']
	chapter: str = kwargs['chapter']
	subchapter: str = kwargs['subchapter']
	condition_string: str = QUESTION_PROMPT_DICT[question_type]['condition']
	result = content + GUIDELINE_BASE + condition_string.format(
		chapter = chapter, 
		subchapter = subchapter, 
		answer = answer
	) + '------'
	return result

# separate_markdown.py
from typing import Optional, Self


class MarkdownSection:
	def __init__(self):
		self.head_level = 1
		self.head_title = ''
		self.content = ''
		self.parent: Optional[Self] = None
		self.children: list[Self] = []

	def add_child(self, child: Self):
		child.parent = self
		self.children.append(child)

	def __str__(self):
		result = '{sharps} {title}\n\n{content}'.format(sharps = '#' * self.head_level, title = self.head_title, content = self.content)
		for child in self.children:
			result += str(child)
		node = self.parent
		while node != None:
			result = '{sharps} {title}\n\n{content}\n'.format(sharps = '#' * node.head_level, title = node.head_title, content = node.content) + result
			node = node.parent
		return result


def sect_markdown(input_md: str) -> Optional[MarkdownSection]:
	'''
	Here we might assume that:
	  - The sections are well-formed (i.e. there's no skipping ascending of levels for heading levels.)
	  - The H1 heading(title) uniquely exist at the top of the document.
	'''
	section = MarkdownSection()
	current_level = section
	for line in input_md.splitlines():
		sharp_count = 0
		for char in line:
			if char != '#':
				break
			sharp_count += 1
		if sharp_count == 0:
			if line.strip() == "": 
				continue
			current_level.content += line + '\n';
		elif sharp_count == 1:
			current_level.head_level = 1
			current_level.head_title += line[2:]
		elif sharp_count > current_level.head_level:
			child = MarkdownSection()
			child.head_title = line[sharp_count + 1:]
			child.head_level = sharp_count
			current_level.add_child(child)
			current_level = child
		else:
			while current_level.head_level >= sharp_count:
				current_level = current_level.parent
			child = MarkdownSection()
			child.head_title = line[sharp_count + 1:]
			child.head_level = sharp_count
			current_level.add_child(child)
			current_level = child
	return section

if __name__ == '__main__':
	TEST_STRING = '''# 고양이는 너무 귀여워

귀여운 고양이에 대해서 알아봐요!

## 특징

고양이는 독립적이고, 청결하며, 사냥 본능이 강하다.

### 종류

페르시안, 샴, 러시안블루 등 다양한 품종이 있다.

## 돌봄

고양이에게는 깨끗한 물과 사료, 그리고 적절한 놀이가 필요하다.
'''
	dissected = sect_markdown(TEST_STRING)
	print(dissected)
	print(dissected.children[0].children[0])
```

그리고 정보 면에서도 필기한 내용만으로 출제하는 것은 무리가 있다고 판단되었습니다.
필기한 내용은 압축된 내용을 다루다 보니 언어 모델이 중요한 점을 정확하게 파악하지 못 하는 것으로 추정했는데,
이에 따라서 저는 책의 내용을 그대로 가져와서 필요한 부분을 제시문으로 입력하고 싶었습니다.
그런데 이것을 일일히 적으려고 하니 너무 시간이 오래 걸리고, 책을 스캔해 주는 업체를 찾아가기에는 비용과 시간 문제가 있으며, OCR을 사용하려고도 했지만 OpenCV를 통해 OCR이 잘 읽히도록 하는 것도 어려웠습니다.
그래서 휴대전화로 일일히 사진을 찍고 갤럭시의 OCR 기능으로 일일히 글자를 뽑아낸 뒤 한 단어씩 검토하는 과정을 통해 책의 내용을 텍스트로 가져왔습니다.
(그러면서 글을 읽고 있으면 내용이 조금씩은 들어오긴 하더라고요&hellip;)

그러고 나니 확실히 문제의 질이 향상되었고, 직접 풀어보니 생각보다 생각을 해보게 되는 문제들이 나왔습니다.
그러면서도 개선해야 할 점들도 보게 됩니다.

> Weber의 관료제론에 따른 학교조직의 특징으로 옳은 것은?
> 1. 교사의 의사결정에 개인적인 감정이 개입되어 조직의 공정성이 약화된다.
> 2. 조직의 운영은 엄격한 규칙과 절차에 따라 이루어지며, 권위의 위계가 명확하다.
> 3. 직원의 승진은 관계나 특권에 의존하며, 전문성과 실적과는 무관하다.
> 4. 조직 구성원은 직무 수행에 있어 형식적 관계보다 인간적 유대를 우선시한다.
> 5. 직무 분배는 임의로 이루어지며, 전문성과 경력에 따른 선정이 이루어지지 않는다.

다음은 관료제론(bureaucracy theory)에 대하여 묻는 문제이고 이가 학교조직에서 어떤 형식으로 나타나는지를 아는지 평가하려는 의도로 생각됩니다.
이는, 요약하자면, 학교조직은 다른 공무원 조직과 같이 계급에 따라 수직적인 권위가 주어져 있고, 이러한 권위는 비교적 엄격한 법률과 규정 등으로 정해져 있는---즉, 합법적 권위를 가진다---등 이상적인 관료제의 특성을 띠지만 학생과의 관계에서는 몰인정성이 나타나지 않고 수업에서 교사의 자율권이 주어지는 등 관료제적 특성을 완전히 반영하지 않는다는 것이 중심인 개념에 관한 것입니다.
3번과 4번, 5번은 경력 우대성 원리, 몰인정성 원리, 분업과 전문성 보장 원리를 부정한 것이고, 1번 역시 몰인정성을 부정한 것으로 관료제의 특성에 해당하지 않아 정답이 아님은 알 수 있습니다. 
2번은 위에서 설명한 것처럼 정답인 선지입니다.
그런데 AI는 이 문제의 답을 1번으로 대답했습니다.
그러면서도 뒤에 따르는 해설에서는 2번 선지에 대한 내용이 맞다는 말이 나오는 것으로 보아 중간 사고 과정에서 오류가 있지 않았나 싶습니다. 
그 외에도 맞는 설명을 틀린 것으로 주장하고, 복수정답을 내는 등의 오류를 일으켜 더 많은 수정을 해야 할 것으로 보입니다.

## 의의

아직은 불안정하지만 Context window의 크기를 늘려 많은 사고 과정 이후에도 제시문과 문제가 일관되도록 하며 유의사항을 충실하게 따르도록 할 필요가 보입니다.
그리고 더 다채로운 문제를 만들기 위해 문제에 <보기> 등을 삽입하여 제시문을 읽도록 하는 문제 유형을 만들 수 있도록 수정한다면 좋을 듯 싶습니다.
몇 번의 수정을 거치고 문제를 풀어 출력을 검토하는 과정에서 저도 언어 모델을 이해함과 더불어 교육학 이론도 더 재미있게 배울 수 있을 것으로 기대합니다. 
