### Temperament

- Systematic, patient temperament when facing with a problem.
- Focusing on systematically coming up with possible solution, instead of sinking in your emotion.

#### Reading Error Messages
  Read stack trace and find the key information.

#### Online Resources
- Search engine
- Stack overflow
- Documentation

#### Steps to Debugging
- Reproduce the Error
- Determine the boundaries of the error
- Trace the Code
- Understand the Problem Well
- Implement a Fix
  One very important note is to fix one problem at a time.
- Test the Fix

#### Techniques for debugging
- Line by line
  Patient temperament is the key.
  All other debugging tips and tools won't matter if you aren't detail oriented.
- Rubber Duck
  Try to explain your code line by line to an object or a person. This will force you to articulate every detail in your program. The effectiveness of this method has been proven.
- Walking Away
  Leave your table and go for a walk -- after you have been thinking about the problem for a while. Focusing mode and diffusion mode.
- Using pry
```ruby
gem install pry
require 'pry'
binding.pry
exit-program
```
- Using a Debugger

### Summary

In summary, debugging is arguably the most important skill you need to learn as a programmer.
