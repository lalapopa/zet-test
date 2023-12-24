# How to create notes

Showdown is a Javascript Markdown to HTML converter, based on the original
works by John Gruber. It can be used client side (in the browser) or server
side (with Node or io). 


## Download tarball

Some text 

1. Li 1
1. Li 2
1. some text1
1. some text2
1. some text3
1. some text4
1. some text5
1. some text6
1. some text7
1. some text8
1. some text9


> There block quote wdwawkjdlwak jd.a dlkjwa ldj lkawjd.akw djlka jw
> Another part kwajd lkwaj dljwa d/aw kjdj


Some example of code:
```javascript
/**
 * showdownjs helper functions
 */

if (!showdown.hasOwnProperty('helper')) {
    showdown.helper = {};
}

if (typeof this === 'undefined' && typeof window !== 'undefined') {
    showdown.helper.document = window.document;
} else {
    if (typeof this.document === 'undefined' && typeof this.window === 'undefined') {
        var jsdom = require('jsdom');
        this.window = new jsdom.JSDOM('', {}).window; // jshint ignore:line
    }
    showdown.helper.document = this.window.document;
}

```

```python
import numpy as np

a = np.array([1,2,3,4,5])
def super_function(a):
    return a*50

for i in range(10):
    print(i)

class Cat:
    def __init__(self, model, age, price):
        self.model = model
        self.age = str(age)
        self.price = float(price)

print(f'This is awsome text {Cat('Tarugi', '12.02.4343', 123132)}')
```
This is the end. Hold your breath and count to ten... 

Tags:

    #Example #Vim #markdown
