#import "@preview/codly:1.1.1": *
#import "@preview/codly-languages:0.1.1": *

#show: codly-init.with()

#set par(justify: true)

#show link: underline

= Can AI beat a high-schooler in competitive programming?

_Class: Science in the Age of Artificial Intelligence_

_Professor Brendan Meade_

_By: Taras Yaitskyi_

_Date: #datetime.today().display()_

== Introduction

Students across the globe have been participating in high-school Olympiads since 1959, when the first International Science Olympiad, called the International Math Olympiad (IMO), was held in Romania.
Back then, only a few people knew about high-school competitions, let alone took part.
Today, however, hundreds of thousands of high-schoolers take part in these contests, starting from the lowest (usually a regional or a state) level to the highest, including the national and international examination.
The International Olympiad of Informatics (IOI) @ioi is, perhaps, the most popular Olympiad on the list of International Science contests, specifically due to how easy it is to learn coding online.
Platforms such as CSAcademy, AtCoder, CodeChef, and many others (for example, Eolymp, an Eastern-European competitive programming platform built in Ukraine) make it incredibly easy to evaluate coding skills, transforming competitive programming into an extremely attractive and accessible cybersport.

Undeniably, competitive programming is an excellent measure of critical thinking and intellectual capabilities.
The brightest minds of IOI make their way into top academic institutes (Harvard, MIT, Stanford, and others), FAANG, and quant companies (they often use LeetCode at interviews) and immensely contribute to research in algorithms and data structures.
In the context of AI, it is a logical follow-up question of whether LLMs are capable of solving competitive programming problems and to what extent exactly.
In this paper, we analyze the performance of $3$ most popular LLMs (ChatGPT-4o, Claude 3.5 Sonnet, Llama 3.1 70b) on $4$ competitive programming problems.

Let us delve into the vast travesty of modern discourse, where an intricate web of conflicting ideologies, technological advancements, and existential uncertainties converge in a whirlwind of ambiguity. *\/s*

== Analysis

We chose $4$ problems of various difficulties to test how well LLMs manage to solve them.
The problems were taken from CodeForces, the most famous competitive programming website.
The difficulty of the problem is from its CodeForces rating, where $800$ is the lowest and $3500$ is the highest possible difficulty score.

The analysis outline is as follows.
First, we ask each LLM to come up with the simplest, most suboptimal, "bruteforce" solution.
Second, we ask LLM to come up with the most optimal solution to the problem in terms of algorithms, data structures, time complexity, and memory usage.
Third, if the problem is too hard, we give each LLM a hint.

We assign each LLM points based on its solution.
The rubric is provided below.

*Idea*

$2$ - solution contains an idea that would pass all tests/there are very few logical mistakes.

$1$ - solution has a couple of correct ideas that would pass some/most of the cases.

$0$ - solution is ridiculous: it has no correct ideas whatsoever.

*Performance*

$2$ - solution fully satisfies both complexity and memory requirements.

$1$ - solution partially satisfies complexity and memory requirements.

$0$ - solution does not satisfy complexity and memory requirements.

*Style*

$2$ - code both compiles and correctly utilizes IO.

$1$ - code only compiles or only correctly utilizes IO.

$0$ - code neither compiles nor correctly utilizes IO.

Since we use Python, compiles means it does not crash on any tests (it might still output a wrong answer) or halts in an infinite loop.

We ask all LLMs to provide solutions in Python. The choice of Python is driven by its simplicity, popularity, and competitive programming support. *All* selected problems are possible to be solved in Python under the optimal time and memory contrains.

The full transcripts of conversations and prompts are available in the Appendix.

== Problem 1 (very easy)

The first problem is *B. Studying Algorithms* @veryeasy.
This is a very easy problem on sorting and greedy.
In fact, it is so easy it is unrated, but it was published by the USACO website in the Bronze section, implying it's an entry-level competitive programming problem.

=== ChatGPT response

#let text = read("code/gpt-o-veryeasy-brute.py")
#codly(header: [*Bruteforce*], languages: codly-languages)
#raw(text, lang: "python", block: true)

The input handling is incorrect because it hangs on line $23$, which uses ```\sys.stdin.read``` in the wrong way.
This is an unusual artifact because simply commenting/deleting this line fixes the issue right away.
This line is, ultimately, redundant.
The solution does output the result.

The program correctly implements a bruteforce solution.
The solution utilizes an appropriate data structure (array) and a standard library function (combinatorics) to iterate over all possible combinations of algorithms Steph can learn.

#let text = read("code/gpt-o-veryeasy-optimal.py")
#codly(header: [*Optimal*], languages: codly-languages)
#raw(text, lang: "python", block: true)

The input handling is incorrect in the same way as the previous solution.
The solution does output the result.

The program correctly implements an optimal solution leveraging greedy and sorting.
The solution utilizes an appropriate data structure (array) and a standard library function (sort) to learn the algorithms that take the lowest amount of time, maximizing the number of them.

=== Claude response

#let text = read("code/claude-veryeasy-brute.py")
#codly(header: [*Bruteforce*], languages: codly-languages)
#raw(text, lang: "python", block: true)

The program reads from the standard input according to the problem statement.
The program outputs the result.

The solution utilizes an appropriate data structure (array).
It does not use a standard library function for combinatorics but instead implements its own recursive bicycle, which fails on the test input and gives an out-of-bounce error.
The overall logic, however, is right.

#let text = read("code/claude-veryeasy-optimal.py")
#codly(header: [*Optimal*], languages: codly-languages)
#raw(text, lang: "python", block: true)

The program reads from the standard input according to the problem statement.
The program outputs the result.

The solution correctly implements an optimal solution leveraging greedy and sorting.
It utilizes an appropriate data structure (array) and a standard library function (sort) to learn the algorithms that take the lowest amount of time, maximizing the number of them.

What's surprising is that Claude did a better job on an optimal solution than on a bruteforce.
One possible reason is that for this particular problem, coding up a bruteforce solution is much harder than an optimal solution, even though it's much easier in terms of logic.

=== Llama response

We ran the bruteforce solution $4$ times on Llama because the code was either incomplete or simply incorrect (syntax and indent errors).
This is the best output we have.

#let text = read("code/llama-veryeasy-brute.py")
#codly(header: [*Bruteforce*], languages: codly-languages)
#raw(text, lang: "python", block: true)

The program tries to read from the standard input but fails to complete the line to read $n, x$ and the array itself.
The program does not output the result.

The solution utilizes an appropriate data structure (array).
It does not use a standard library function for combinatorics but instead leverages bitwise operations to iterate over all possible combinations of arrays.
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
  [], [Tests], [Perf], [Style], [Tests], [Perf], [Style], [Tests], [Perf], [Style],
  [Bruteforce], [$2$], [$2$], [$1$], [$2$], [$2$], [$2$], [$2$], [$2$], [$1$],
  [Optimal], [$2$], [$2$], [$1$], [$2$], [$2$], [$2$], [$2$], [$2$], [$2$],
  [Total], table.cell(colspan: 3, [$10$]), table.cell(colspan: 3, [$12$]), table.cell(colspan: 3, [$11$])
)

Claude comes out as a winner, while both ChatGPT and Llama struggle with basic IO.

== Problem 2 (easy)

The second problem is *B. Who's Opposite?* @easy.
This is an easy ad-hoc problem rated $800$ on CodeForces.
The problem does not require any knowledge of complex data structures or algorithms; it is a purely mathematical/ad-hoc question.

=== ChatGPT response

#let text = read("code/gpt-o-easy-brute.py")
#codly(header: [*Bruteforce*], languages: codly-languages)
#raw(text, lang: "python", block: true)

This is an optimal solution.

#let text = read("code/gpt-o-easy-optimal.py")
#codly(header: [*Optimal*], languages: codly-languages)
#raw(text, lang: "python", block: true)

This is the same optimal solution, slightly reformatted.
ChatGPT came up with the same exact formulas as the editorial of the contest.

=== Claude response

#let text = read("code/claude-easy-brute.py")
#codly(header: [*Bruteforce*], languages: codly-languages)
#raw(text, lang: "python", block: true)

The program handles the input and output according to the problem statement.

This is a bruteforce solution (trying out all possible circle variants), but it is wrong and fails the test example.
The test for possibility is slighlty wrong (it should be absolute value), and the calculation for $d$ is nonsensical.
The solution, however, is quite close to mimicking a proper one.

#let text = read("code/claude-easy-optimal.py")
#codly(header: [*Optimal*], languages: codly-languages)
#raw(text, lang: "python", block: true)

The program handles the input and output according to the problem statement.

Unlike the bruteforce variant, the solution uses absolute value correctly but redundantly applies modulus afterwards.
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

Similar to the bruteforce solution, this code is ridiculous and fails everything.
Unlike bruteforce, there is an attempt to detect an impossible circle, but it has an unnecessary check ```\a==b``` and ```diff``` should be multiplied by $2$.

=== Rubric

#table(
  columns: 10,
  [], table.cell(colspan: 3, [ChatGPT]), table.cell(colspan: 3, [Claude]), table.cell(colspan: 3, [Llama]),
  [], [Idea], [Perf], [Style], [Idea], [Perf], [Style], [Idea], [Perf], [Style],
  [Bruteforce], [$2$], [$0$], [$1$], [$1$], [$2$], [$2$], [$0$], [$2$], [$2$],
  [Optimal], [$2$], [$2$], [$1$], [$1$], [$2$], [$2$], [$0$], [$2$], [$2$],
  [Total], table.cell(colspan: 3, [$8$]), table.cell(colspan: 3, [$10$]), table.cell(colspan: 3, [$8$])
)

Things started getting interesting.
Llama is shockingly behind and is unable to solve an easy competitive programming problem.
Even though Llama receives the same score of $8$ as ChatGPT, it is meaningless because Llama does not solve the problem at all.
Passing all tests, ChatGPT is extremely precise, but it does not always satisfy the prompt requirements (specifically, when asking for a bruteforce solution).
On the other hand, Claude struggles to finish its ideas, but the overall direction of Claude's produced code is right, receiving $1$ in Idea for both bruteforce and optimal.

=== Problem 3 (medium)

The third problem is *F1. Guess the K-th Zero (Easy version)* @medium.
This is a classical CodeForces problem on a binary search for the answer.
It has a rating of *1600*, implying this problem might appear on USACO silver or regional/state Olympiads.
Furthermore, this is an interactive problem—a great test of whether LLMs know how to implement basic IO operations, such as flushing.

==== ChatGPT response

#let text = read("code/gpt-o-medium-brute.py")
#codly(header: [*Bruteforce*], languages: codly-languages)
#raw(text, lang: "python", block: true)

The solution flushes after each output and request but fails to use a standard library input function.

The bruteforce logic is correct: ChatGPT uses intervals of length $1$ to check whether the current index is a zero.

#let text = read("code/gpt-o-medium-optimal.py")
#codly(header: [*Optimal*], languages: codly-languages)
#raw(text, lang: "python", block: true)

The solution flushes after each request and output, but fails to use a standard library input function.

The program utilizes a binary search on the answer, which is the most optimal solution to this problem.

==== Claude response

#let text = read("code/claude-medium-brute.py")
#codly(header: [*Bruteforce*], languages: codly-languages)
#raw(text, lang: "python", block: true)

The solution correctly implements bruteforce logic and IO, flushing after each request.

#let text = read("code/claude-medium-optimal.py")
#codly(header: [*Optimal*], languages: codly-languages)
#raw(text, lang: "python", block: true)

The solution passes all tests, using binary search on the answer and stdio flushing.

==== Llama response

#let text = read("code/llama-medium-brute.py")
#codly(header: [*Bruteforce*], languages: codly-languages)
#raw(text, lang: "python", block: true)

The solution correctly implements bruteforce logic and IO, flushing after each request.

#let text = read("code/llama-medium-optimal.py")
#codly(header: [*Optimal*], languages: codly-languages)
#raw(text, lang: "python", block: true)

The solution passes all tests, using binary search on the answer and stdio flushing.

=== Rubric

#table(
  columns: 10,
  [], table.cell(colspan: 3, [ChatGPT]), table.cell(colspan: 3, [Claude]), table.cell(colspan: 3, [Llama]),
  [], [Idea], [Perf], [Style], [Idea], [Perf], [Style], [Idea], [Perf], [Style],
  [Bruteforce], [$2$], [$2$], [$1$], [$2$], [$2$], [$2$], [$2$], [$2$], [$2$],
  [Optimal], [$2$], [$2$], [$1$], [$2$], [$2$], [$2$], [$2$], [$2$], [$2$],
  [Total], table.cell(colspan: 3, [$10$]), table.cell(colspan: 3, [$12$]), table.cell(colspan: 3, [$12$])
)

All LLMs did well on this test, with Claude and Llama recieving full score.
This is not surprising, given how fundamental binary search technique is.
What's surprising is that all LLMs were not confused by an interactive problem and ensured proper flushing after printing.
ChatGPT continuosly fails on stdio's ```read```, confusing functions and variables, which partially makes sense given how dynamical Python type system is.

=== Problem 4 (hard)

The last problem is *F. Nora's Toy Boxes*.
This is an *extremely* hard problem, rated $3500$ on the CodeForces (current absolute maximum).
Only $1%$ of competitive programmers can solve it (I do not fully understand the solution, but I have enough knowledge to compare it against the LLMs), as supported by the fact that only $1$!!! person (IOI and ICPC multiple-time champion) solved it during the real-time contest.

The editorial provides some hints/lemmas for the solution, and we feed these into LLMs to help them come up with a solution.

==== ChatGPT response

#let text = read("code/gpt-o-hard-brute.py")
#codly(header: [*Bruteforce*], languages: codly-languages)
#raw(text, lang: "python", block: true)

The solution is overall wrong.

The backtracking part is supposed to be DFS, but it uses some additional data structures and makes unnecessary checks.
Furthermore, both conditions ```len(p) > max_length``` and ```len(p) == max_length``` are never true, as supported by the fact that the code fails all tests and never outputs an answer bigger than $0$.

#let text = read("code/gpt-o-hard-brute.py")
#codly(header: [*Optimal*], languages: codly-languages)
#raw(text, lang: "python", block: true)

The optimal solution has some correct ideas, including the usage of dp and bitwise operations.
The logic, however, is incomplete without correct DFS and component traversal.
Furthermore, ChatGPT makes wrong assumptions about editorial lemmas, mentioning that lemmas 2 and 3 are false or do not have complete information to prove them.

Hence, we give ChatGPT a hint by saying these $3$ lemmas are indeed true.

#let text = read("code/gpt-o-hard-hint.py")
#codly(header: [*Hint*], languages: codly-languages)
#raw(text, lang: "python", block: true)

The solution is similar to the previous ones, with the same exact errors and logical misconceptions.

==== Claude response

#let text = read("code/claude-hard-brute.py")
#codly(header: [*Bruteforce*], languages: codly-languages)
#raw(text, lang: "python", block: true)

The variable types are wrong (using list as integers and vice versa), and even though the idea of using dynamic programming is in the right direction, the implementation is half-baked.

#let text = read("code/claude-hard-optimal.py")
#codly(header: [*Optimal*], languages: codly-languages)
#raw(text, lang: "python", block: true)

This code is a reformatted previous solution, which does not use Editorial's lemmas.
Similarly to ChatGPT, Claude responds that Lemma 1 from the editorial is false (gives different answers on different runs as well).
Hence, we give Claude a hint by saying these $3$ lemmas are indeed true.

#let text = read("code/claude-hard-optimal.py")
#codly(header: [*Hint*], languages: codly-languages)
#raw(text, lang: "python", block: true)

The solution degraded in its quality after the hint.
There are no signs of dp, bitops, and graphs, but instead, square root formulas are not applicable to the problem.

==== Llama response

#let text = read("code/llama-hard-brute.py")
#codly(header: [*Bruteforce*], languages: codly-languages)
#raw(text, lang: "python", block: true)

This is a wrong bruteforce solution that attempts to use DP.

#let text = read("code/llama-hard-optimal.py")
#codly(header: [*Optimal*], languages: codly-languages)
#raw(text, lang: "python", block: true)

Again, wrong solution, and not even optimal: the use of combinations on $n$ instantly yields an exponential $O$.
Like Claude, Llama rejects Llema 1.
Hence, since Llama has failed, we give it (or him/her?) a hint.

#let text = read("code/llama-hard-hint.py")
#codly(header: [*Hint*], languages: codly-languages)
#raw(text, lang: "python", block: true)

The logic of this code parallel's ChatGPT's optimal solution, which is not entirely correct.

==== Rubric

#table(
  columns: 10,
  [], table.cell(colspan: 3, [ChatGPT]), table.cell(colspan: 3, [Claude]), table.cell(colspan: 3, [Llama]),
  [], [Idea], [Perf], [Style], [Idea], [Perf], [Style], [Idea], [Perf], [Style],
  [Bruteforce], [$1$], [$1$], [$1$], [$1$], [$1$], [$2$], [$1$], [$1$], [$2$],
  [Optimal], [$1$], [$1$], [$1$], [$0$], [$0$], [$2$], [$0$], [$0$], [$2$],
  [Total], table.cell(colspan: 3, [$6$]), table.cell(colspan: 3, [$6$]), table.cell(colspan: 3, [$6$])
)

This problem is hard.

Real hard.

There is no shame LLMs can't solve it.

Only the best of the best can solve it under $2$ hours.

Even I couldn't...

=== Extra (ChatGPT-o1)

Although outside the scope of this assignment, we tried ChatGPT-o1 to find an optimal solution for each problem.
We found out that o1 successfully solved every problem, except for the last one.
The sources of this project are available #link("https://github.com/tyaitskyi/seminar-ai-cp")[here] on GitHub.
Funnily, o1 fails IO as well and does not know how to use ```stdio```.

== Conclusion

All $3$ LLMs showed a strong performance on the problem set.
ChatGPT is the smartest LLM with a score of $14$ in Idea, followed behind by more narrow-minded friends Claude () and Llama ().
On the other hand, while Claude and Llama have a score of $16$ and $15$ in Style, ChatGPT ($8$) struggles behind with basic IO issues.
Performance-wise, ChatGPT can sometimes neglect prompt requirements (problem 2), but does a better on the harder problems than Claude and Llama.
In general, ChatGPT and Claude are relatively comparable, but Llama falls short with its terrible math skills (problem 2).
It is safe to say that for now, students taking part in competitive programming are safe from AI taking over their online contests.

However, for how long?
Just recently OpenAI has released gpt-o3 @o3, which has a rating of $2773$ on CodeForces.
That alone would put this model in top $0.1%$ of Codeforces, and well above Harvard ICPC team.
Even though there are occasional artifacts and off by $1$ mistakes, eventually, some model will come to challenge the greatest competitive programmer (Gennady Korotkevich, $4000$ on CodeForces).

== Author notes

Dear Professor Brendan Meade,

I hope you enjoyed reading this paper.
My goal was to keep this paper simple, concise, _maybe a little bit_ funny, and fill it with a combination of objectivity and my personal experience in competitive programming.
I hope the number of pages didn't scare you away. Most of it is code that you can skim over.

It was interesting to compare these LLMs against my own skills.
I'm confident I'd beat all of them in a real contest, but o3... Well, maybe I'm not that smart.
It actually shocks me how ChatGPT went from CF rating of $273$ to $2773$ in two years... Not even a human could do that! Well, except Sam Altman of course, he is a superhuman.

Anyways, I wish you a great winter break! I hope we will see each other some time in spring.

Best,

Taras Yaitskyi

#bibliography("works.bib")

== Appendix

Below are the complete transcripts of conversations with $3$ different LLMs: ChatGPT-4, Claude 3.5 Sonnet, and Llama 3.1 70b.

The conversations were extracted using in-built .txt export function.

Please note that Claude and Llama converations are a little bit corrupted because HUIT sandbox kept deleting/clearing the chats, so some memory did not carry over and had to be reprompted.

=== ChatGPT-4o

#raw(read("./data/gpt-o-cp.txt"))

=== Claude 3.5 Sonnet

#raw(read("./data/claude-cp-1.txt"))
#raw(read("./data/claude-cp-2.txt"))
#raw(read("./data/claude-cp-3.txt"))

=== Llama 3.1 70b

#raw(read("./data/llama-cp-1.txt"))
#raw(read("./data/llama-cp-2.txt"))

=== ChatGPT-o1

Unlike HUIT, the OpenAI website does not have an extract function.

Here is a #link("https://chatgpt.com/share/67661a3d-bf1c-8001-baf3-d8850367f1ea")[link] to the chat.

#line(length: 100%)

Typesetted in #link("https://typst.app")[Typst].

