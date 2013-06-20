### Rspec

Installing the RSpec Gem
Installing Guard-RSpec
RSpec Syntax: describe, context, it, and expect

### Fruit Stand

Git clone RSpec Workshop - Fruit Stand
Start Guard
Fix Broken Specs
Write missing Specs

### Additional RSpec Syntax

Using before in nested contexts
Using let, subject, and described_class
Refactor the existing tests to make them more succinct

### New Feature - Ripe and Unripe

An apple is ripe 10 seconds after it is initialized.
Write a test that acurrately tests the new methods Apple#unripe? and Apple#ripe?.
Remember to consider both situations when the fruit is unripe and ripe.

### RSpec’s Stub Syntax

Using stub, with, and and_return

### New Feature - Size

Not all apples are created equal. Apples are created actually created with a random size from 5 slices to 9 slices.

Create a new specification to capture this new feature.
Update your existing specifications so that they still reliably work.

### RSpec’s Mock Syntax

Using should_receive, with, and and_return

### New Feature - Weather Service

Actually the randomness in apple size is determined by the response from the Fruit::Weather.report(:apples) which will return the correct size for the apple. IT is necessary that when an apple is created that it checks with the weather service to determine its size.

Create a new specification to capture this new feature.
Update your existing specifications so that they still reliably work.
