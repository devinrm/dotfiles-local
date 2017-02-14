# 4-step engineering problem solving approach:

  1. Understand the problem
      a. Clarify the problem
      b. Model the system and break the problem into pieces
      c. Research similar solutions
  2. Come up with a Plan
      a. Prioritize your work
      b. Map out your strategy
  3. Implement the Plan
  4. Examine your results for accuracy

  > "What most people don't understand is that most of the significant effort goes
  > into the first two parts of the process. If you fail either of those, it hardly
  > matters whether you've carried out your plan perfectly or accurately. So if you
  > want to think like an engineer, solve your problems fully BEFORE diving into the
  > implementation of your solution."

# 5 Key Components of Agile:

  1. Expectation of changes in the project requirements
  2. Short development cycles
  3. Heavy client involvement throughout the project
  4. Frequent re-evaluation of priorities and needs
  5. Working in small cross-functional teams

# Writing Great User Stories:
  https://help.rallydev.com/writing-great-user-story


# Testing

  - Unit Testing -- isolating a very specific unit of code (by faking any inputs/outputs/methods inside it)
  and testing its characteristics. Is the function working as expected?

  - Integration Testing -- Verify the interfaces between units. This can occur on many levels,
  from small modules to high level architectural components.

  - System Testing -- Verify that the fully integrated system meets its requirements
  and without corrupting its environment.

  - Acceptance Testing -- The system is delivered to the user (or Product Owner in Agile)
  for acceptance or rejection.

# Rules of Thumb for What to Test

  - Anything you would otherwise manually test (e.g. by checking the page to verify it loaded properly)

  - All critical paths the users will take (like signing in and using the app's core functions)

  - Anything that might reasonably break later (e.g. if it relies on code that may get changed later or produce unexpected outputs)

  - All critical methods that are run during the critical user paths (often unit tests for your models)

  - Any bugs you discovered along the way (write a test for the bug that fails, then fix the bug, then your test will pass)
