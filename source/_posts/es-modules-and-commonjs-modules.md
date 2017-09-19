---
title: Notes of ES Modules and CommonJS Modules
date: 2017-09-16
tags:
  - ECMAScript
  - Node
---

Notes of [ES Modules](http://exploringjs.com/es6/ch_modules.html) and [CommonJS Modules](http://wiki.commonjs.org/wiki/Modules/1.1)

<!-- more -->

## Node

> Node version: v8.5.0

[Node Modules](https://nodejs.org/api/modules.html)
[Node ECMAScript Modules](https://nodejs.org/api/esm.html)
[Node EP for ES Modules](https://github.com/nodejs/node-eps/blob/master/002-es-modules.md)

- The `--experimental-modules` flag can be used to enable features for loading ES modules
- ES modules imports will be loaded asynchronously
- ES modules files will use `.mjs` extension
- The `.mjs` file extension will not be loadable via `require()`

### ES consuming CommonJS

`cjs.js`:

```js
module.exports = { v: 1 }
module.exports.f = () => 2
```

`esm.mjs`:

```js
import assert from 'assert'
import cjs from './cjs'

assert.equal(cjs.v, 1)
assert.equal(cjs.f(), 2)
```

<!--
### CommonJS consuming ES
-->

### Unsupported Features

- `import()`
- `import.meta`
- Loader Hooks

## Babel Transform Plugin

> Babel version: v6.26.0
> Babel plugin [transform-es2015-modules-commonjs](http://babeljs.io/docs/plugins/transform-es2015-modules-commonjs)

### Export

In:

```js
export default { v: 1 }
export const f = () => 2
```

Out:

```js
Object.defineProperty(exports, '__esModule', { value: true })
exports.default = { v: 1 }
const f = exports.f = () => 2
```

### Import

In:

```js
import x from 'x'

x.v
```

Out:

```js
const __x = require('x')

const _x = _interopRequireDefault(__x)

const x = _x.default

function _interopRequireDefault(o) {
  return o && o.__esModule ? o : { default: o }
}

x.v
```

---

In:

```js
import { y } from 'y'

y.v
```

Out:

```js
const _y = require('y')

const y = _y.y

y.v
```

---

In:

```js
import * as z from 'z'

z.v
```

Out:

```js
const _z = require('z')

const z = _interopRequireWildcard(_z)

function _interopRequireWildcard(o) {
  if (o && o.__esModule) {
    return o
  } else {
    const m = {}
    if (o != null) {
      for (let key in o) {
        if (Object.prototype.hasOwnProperty.call(o, key))
          m[key] = o[key]
      }
    }
    m.default = o
    return m
  }
}

z.v
```

<!--
## Typescript
-->

---
