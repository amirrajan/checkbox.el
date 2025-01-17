# [checkbox.el][1]

[![Build status][2]][3]

A tiny library for working with textual checkboxes in Emacs buffers.
Use it to keep grocery lists in text files, feature requests in source
files, or task lists on GitHub PRs.

Installation
------------

Download the `checkbox.el` file and add it somewhere in your
`load-path`.  Then add `(require 'checkbox)` to your `.emacs` file.

I'd recommend globally binding `checkbox/toggle` to a convenient
keystroke.  For example:

```elisp
(global-set-key (kbd "C-c C-t") 'checkbox/toggle)
```

Usage
-----

If you have a simple to-do list in a Markdown file
like this:

```md
- [ ] Buy gin<point>
- [ ] Buy tonic
```

And you invoke `checkbox/toggle`, you'll get the following:

```md
- [x] Buy gin<point>
- [ ] Buy tonic
```

Invoke it again and you're back to the original unchecked version.

```md
- [ ] Buy gin<point>
- [ ] Buy tonic
```

Next, if we add a line without a checkbox...

```md
- [ ] Buy gin
- [ ] Buy tonic
- Buy limes<point>
```

We can invoke the command again to insert a new checkbox.

```md
- [ ] Buy gin
- [ ] Buy tonic
- [ ] Buy limes<point>
```

If we want to remove a checkbox entirely we can do so by passing a
prefix argument (`C-u`) to `checkbox-toggle`.

Finally, checkbox.el treats programming modes specially, wrapping
inserted checkboxes in comments so we can quickly go from this:

```elisp
(save-excursion
  (beginning-of-line)<point>
  (let ((beg (point)))
```

To this:

```elisp
(save-excursion
  (beginning-of-line)                ; [ ] <point>
  (let ((beg (point)))
```

If you prefer to use an alternate set of checkboxes, you can do so by
changing the value of `checkbox/markers`, a buffer-local variable.
Less advanced users may prefer to do this through the `customize`
facility:

```
M-x customize-group RET checkbox RET
```

Advanced users may prefer to do so via their `.emacs` file:

```elisp
(require 'checkbox)
(setq-default checkbox/markers '("TODO" "DONE" "WAITING"))
```

Additionally, a convenient way to give a file a unique set of checkbox
markers is via [File Variables][4] (also see the handy
`add-file-local-variable` function), allowing us to specify the marker
set we want to use via a small comment near the end of the file. For
example, in a Markdown file:

```md
<!-- Local Variables: -->
<!-- checkbox/markers: ("TODO" "DONE" "WAITING") -->
<!-- End: -->
```

Passing a prefix argument to `checkbox/toggle` allows us to directly
choose a checkbox to insert via its position in `checkbox/markers`,
which is useful when we have more than two markers.  For example,
assuming the custom marker set above and a buffer with the following
contents:

```md
- Review report<>
```

`C-u 2 C-c C-t` will yield:

```md
- WAITING Review report<>
```

Note that the first marker is 0.

Alternatives
------------

For a more featureful alternative, check out the amazing
[org-mode][5].  I love and use org-mode, but org-mode generally
expects to be running as a major mode whereas checkbox.el will happily
handle your checkbox needs inside of any mode.

Testing
-------

To run the full test suite (unit + integration) simply run:

```sh
$ make
```

License
-------

Copyright (C) 2014 Cameron Desautels

This program is free software; you can redistribute it and/or modify
it under the terms of the GNU General Public License as published by
the Free Software Foundation, either version 3 of the License, or (at
your option) any later version.

This program is distributed in the hope that it will be useful, but
WITHOUT ANY WARRANTY; without even the implied warranty of
MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the GNU
General Public License for more details.

You should have received a copy of the GNU General Public License
along with this program.  If not, see <http://www.gnu.org/licenses/>.

**Author:** Cameron Desautels \<<camdez@gmail.com>\>  
**Source:** <https://github.com/camdez/checkbox.el>

[1]: https://github.com/camdez/checkbox.el
[2]: https://travis-ci.org/camdez/checkbox.el.svg?branch=master
[3]: https://travis-ci.org/camdez/checkbox.el
[4]: https://www.gnu.org/software/emacs/manual/html_node/emacs/File-Variables.html
[5]: http://orgmode.org
