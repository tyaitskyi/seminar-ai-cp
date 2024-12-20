#import "@preview/codly:1.1.1": *
#import "@preview/codly-languages:0.1.1": *

#show: codly-init.with()

#set par(justify: true)

= Can AI beat a high-schooler in competitive programming?

_Class: Science in the Age of Artificial Intelligence_

_Professor Brendan Meade_

_By: Taras Yaitskyi_

_Date: #datetime.today().display()_

== Introduction

Students across the world have been participating in high-school Olympiads since 1959, when the first International Science Olympiad called International Math Olympiad (IMO) was held in Romania.
Back then, only a few people knew about high-school competitions, let alone took part.
Today, however, hundreds of thousands of high-schoolers take part in these contests, starting from the lowest (usually a regional or a state) level to the highest, including the national and international examination.
The International Olympiad of Informatics (IOI) @ioi is, perhaps, the most popular Olympiad on the list of International Science contests, specifically due to how easy it is to learn coding online.
Platforms such as CSAcademy, AtCoder, CodeChef, and many others (for example, Eolymp, an Eastern-European competitive programming platform built in Ukraine) make it incredibly easy to evaluate coding skills, transforming competitive programming into an extremely attractive and accessible cybersport.

Undeniably, competitive programming is a great measurer of critical thinking and intellectual capabilities.
The brightest minds of IOI make their ways into top academic institutes (Harvard, MIT, Stanford, and others), FAANG and quant companies (they often use LeetCode at interviews), and immensly contribute to research in algorithms and data structures.
In context of AI, it is a logical follow-up question whether LLMs are capable of solving competitive programming problems, and to what extend exactly.
In this paper, we analyze the performance of $3$ most popular LLMs (ChatGPT-4o, Claude 3.5 Sonnet, Llama 3.1 70b) on $4$ competitive programming problems.

Let us delve into the vast travesty of modern discourse, where an intricate web of conflicting ideologies, technological advancements, and existential uncertainties converge in a whirlwind of ambiguity. *\/s*

== Analysis

We chose $4$ problems of various difficulties to test how well LLMs manage to solve them.
The problems were taken from CodeForces, the most famous competitive programming website.
The difficulty of the problem is from its CodeForces rating, where $800$ is the lowest and $3500$ is the highest possible difficulty score.

The analysis outline is as follows.
First, we ask each LLM to come up with the simplest, most unoptimal, "bruteforce" solution.
Second, we ask LLM to improve its algorithm with a more optimal algorithm or a data structure, significantly lowering the time complexity $O$ and memory usage.
Third, we ask LLM to come up with the most optimal solution to the problem.

We give each LLM points based on its solution.
The rubric is provided below.

*Idea*

$2$ - solution contains an idea that would pass all tests/there are very few logical mistakes.

$1$ - solution has a couple of correct ideas that would pass some/most of the cases.

$0$ - solution is ridiculous: it has no correct ideas whatsoever.

*Performance*

$2$ - solution fully satisfies memory requirements.

$1$ - solution partially satisfies memory requirements.

$0$ - solution does not satisfy memory requirements.

$2$ - solution fully satisfies complexity requirements.

$1$ - solution partially satisfies complexity requirements.

$0$ - solution does not satisfy complexity requirements.

*Style*

$2$ - code both compiles and correctly utilizes IO.

$1$ - code only compiles or only correctly utilizes IO.

$0$ - code neither compiles nor correctly utilizes IO.

Wrong solutions recieve $0$ in Memory and Complexity.

We ask all LLMs to provide solutions in Python. The choice of Python is driven by its simplicity, popularity, and competitive programming support. *All* selected problems are possible to be solved in Python under the optimal time and memory contrains.

The full transcripts of conversations and prompts are available in Appendix.

== Problem 1 (very easy)

The first problem is *B. Studying Algorithms* @veryeasy.
This is a very easy problem on sorting and greedy.
In fact, it is so easy it is unrated, but it was published by the USACO website in the Bronze section, implying it's an entry-level competitive programming problem.

=== ChatGPT response

#let text = read("code/gpt-o-veryeasy-brute.py")
#codly(header: [*Bruteforce*], languages: codly-languages)
#raw(text, lang: "python", block: true)

The input handling is incorrect because it hangs on line $23$, which uses ```sys.stdin.read``` in the wrong way.
This is an unusual artifact because simply commenting/deleting this line fixes the issue right away.
This line is, ultimately, reduntant.
The solution does output result.

The program correctly implements a bruteforce solution.
The solution utilizes an appropriate data structure (array) and a standard library function (combinatorics) to iterate over all possible combinations of algorithms Steph can learn.

#let text = read("code/gpt-o-veryeasy-optimal.py")
#codly(header: [*Optimal*], languages: codly-languages)
#raw(text, lang: "python", block: true)

The input handling is incorrect in the same way as the previous solution.
The solution does output result.

The program correctly implements an optimal solution leveraging greedy and sorting.
The solution utilizes an appropriate data structure (array) and a standard library function (sort) to learn the algorithms that take the lowest amount of time, maximizing the number of them.

=== Claude response

#let text = read("code/claude-veryeasy-brute.py")
#codly(header: [*Bruteforce*], languages: codly-languages)
#raw(text, lang: "python", block: true)

The program reads from the standard input according to the problem statement.
The program outputs result.

The solution utilizes an appropriate data structure (array).
It does not use a standard library function for combinatorics, but instead implements its own recursive bicycle, which fails on the test input and gives an out-of-bounce error.
The overall logic, however, is right.

#let text = read("code/claude-veryeasy-optimal.py")
#codly(header: [*Optimal*], languages: codly-languages)
#raw(text, lang: "python", block: true)

The program reads from the standard input according to the problem statement.
The program outputs result.

The solution correctly implements an optimal solution leveraging greedy and sorting.
It utilizes an appropriate data structure (array) and a standard library function (sort) to learn the algorithms that take the lowest amount of time, maximizing the number of them.

What's surprising is that Claude did a better job on an optimal solution than on a bruteforce.
One possible reason is that for this particular problem, coding up a bruteforce solution is much harder than an optimal solution, even though it's much easier in terms of logic.

=== Llama response

We ran the bruteforce solution $4$ times on Llama because the code was either incomplete or simply incorrect (syntax and indent errors).
This is the best output we got.

#let text = read("code/llama-veryeasy-brute.py")
#codly(header: [*Bruteforce*], languages: codly-languages)
#raw(text, lang: "python", block: true)

The program tries to read from the standard input, but fails to complete the line to read $n, x$ and array itself.
The program does not output result.

The solution utilizes an appropriate data structure (array).
It does not use a standard library function for combinatorics, but instead leverages bitwise operations to iterate over all possible combinations of array.
The overall idea is right: use a binary number of size $n$, where each $1$ or $0$ represents an inclusion or exclusion.

#let text = read("code/llama-veryeasy-optimal.py")
#codly(header: [*Optimal*], languages: codly-languages)
#raw(text, lang: "python", block: true)

The program reads from the standard input and outputs to the standard output according to the problem statement.

The program correctly implements an optimal solution leveraging greedy and sorting.
The solution utilizes an appropriate data structure (array) and a standard library function (sort) to learn the algorithms that take the lowest amount of time, maximizing the number of them.

Similarly to Claude, Llama did a better job on the optimal solution.

=== Rubric

#table(
  columns: 10,
  [], table.cell(colspan: 3, [ChatGPT]), table.cell(colspan: 3, [Claude]), table.cell(colspan: 3, [Llama]),
  [], [Perf], [Mem], [Style], [Perf], [Mem], [Style], [Perf], [Mem], [Style],
  [Bruteforce], [$2$], [$1$], [$2$], [$2$], [$2$], [$2$], [$0$], [$0$], [$0$],
  [Optimal], [$2$], [$2$], [$1$], [$2$], [$2$], [$2$], [$0$], [$0$], [$0$],
  [Total], table.cell(colspan: 3, [$10$]), table.cell(colspan: 3, [$12$]), table.cell(colspan: 3, [$10$])
)

Claude comes out as a winner, while both ChatGPT and Llama struggle with basic IO.

== Problem 2 (easy)

The second problem is *B. Who's Opposite?* @easy.
This is an easy adhoc problem rated $800$ on CodeForces.
The problem does not require any knowledge of complex data structures or algorithms-it is a purely mathematical/adhoc question.

=== ChatGPT response

#let text = read("code/gpt-o-easy-brute.py")
#codly(header: [*Bruteforce*], languages: codly-languages)
#raw(text, lang: "python", block: true)

This is an optimal solution.

#let text = read("code/gpt-o-easy-optimal.py")
#codly(header: [*Optimal*], languages: codly-languages)
#raw(text, lang: "python", block: true)

This is the same optimal solution, slightly reformatted.
ChatGPT came up with the same formula as the editorial of the contest.

=== Claude response

#let text = read("code/claude-easy-brute.py")
#codly(header: [*Bruteforce*], languages: codly-languages)
#raw(text, lang: "python", block: true)

The program handles the input and output according to the problem statement.

This is a bruteforce solution (trying out all possible circle variants), but it is wrong and fails the test example.
The test for possibility is slighlty correct (it should be absolute value), and the calculation for $d$ is nonsensical.
The solution, however, is quite close to mimicking a proper one.

#let text = read("code/claude-easy-optimal.py")
#codly(header: [*Optimal*], languages: codly-languages)
#raw(text, lang: "python", block: true)

The program handles the input and output according to the problem statement.

Unlike the bruteforce variant, the solution uses absolute value correctly, but redundatly applies modulus.
This solution inaccurately calculates $n$ using a ```while``` loop, but the calculation for $d$ is correct this time.

=== Llama response

#let text = read("code/llama-easy-brute.py")
#codly(header: [*Bruteforce*], languages: codly-languages)
#raw(text, lang: "python", block: true)

The program handles the input and output according to the problem statement.

The solution, however, is completely wrong, except for the outer loop.
It fails the example case and is unable to account even for the simplest case ($-1$).
The formulas do not make sense in the context of the problem.

#let text = read("code/llama-easy-optimal.py")
#codly(header: [*Optimal*], languages: codly-languages)
#raw(text, lang: "python", block: true)

Similarly to the bruteforce solution, this code is ridiculous and fails everything.
Unlike the bruteforce, there is an attempt to detect an impossible circle, but it is has an unnecessary check ```a==b``` and ```diff``` should be multiplied by $2$.

=== Rubric

#table(
  columns: 10,
  [], table.cell(colspan: 3, [ChatGPT]), table.cell(colspan: 3, [Claude]), table.cell(colspan: 3, [Llama]),
  [], [Tests], [Perf], [Style], [Tests], [Perf], [Style], [Perf], [Mem], [Style],
  [Bruteforce], [$2$], [$0$], [$1$], [$1$], [$2$], [$2$], [$0$], [$0$], [$0$],
  [Optimal], [$2$], [$2$], [$1$], [$2$], [$2$], [$2$], [$2$], [$2$], [$2$],
  [Total], table.cell(colspan: 3, [$10$]), table.cell(colspan: 3, [$12$]), table.cell(colspan: 3, [$10$])
)

Note that all solutions recieved a $2$ in the Memory section because this problem does not use any data structures.

=== Problem 3 (medium)

The third problem is *F1. Guess the K-th Zero (Easy version)* @medium.
This is a classical CodeForces problem on a binary search on the answer.
It has a rating of *1600*, implying this problem might appear on USACO silver or a regional/state Olympiads.
Furthermore, this is an interactive problem—a great test of whether LLMs know how to implement basic IO operations, such as flushing.

Below is a textual description.

Please solve this problem using a bruteforce algorithm.
Your solution must not be optimal but a correct, simple "bruteforce" solution that does not involve complex data structures or algorithms.
On this note, your solution should have a complexity of 

==== ChatGPT response

==== Claude response

==== Llama response

=== Problem 4 (hard)

This is an *extremely* hard problem.
Only $1%$ of competitive programmers can solve it (I do not fully understand the solution, but I have enough knowledge to compare it against the LLMs), as supported by the fact that only $x$ out of $y$ people solved it during the real-time contest.

==== ChatGPT response

==== Claude response

==== Llama response

==== Rubric

== Extra (ChatGPT-o1)

== Conclusion

Finally, I want to note that I'm better than all LLMs in competitive programming.
Not only my code compiles, I was also selected to a Ukrainian National Programming Contest three times years in a row, meaning that I'm certainly smarter than ChatgGPT, Claude, and Llama.

== Author notes

Dear Professor Brendan Meade,

I hope you enjoyed reading this paper.
My goal was to keep this paper simple, concise, _maybe a little bit_ funny, and fill it with a combination of objectivity and my personal experience in competitive programming.

I wish you a great winter break!

Best,

Taras Yaitskyi

#bibliography("works.bib")

== Appendix

Below are the complete transcripts of conversations with $3$ different LLMs: ChatGPT-4, Claude 3.5 Sonnet, and Llama 3.1 70b.

The conversations were extracted using in-built .txt export function.

=== ChatGPT-4o

=== Claude 3.5 Sonnet

=== Llama 3.1 70b

=== ChatGPT-4o1

#show link: underline

#line(length: 100%)

The GitHub of this project is available here.

Typesetted in #link("https://typst.app")[Typst].

