---
title: Notes of Learning Concurrent Programming in Scala
date: 2017-12-12
tags:
  - JVM
  - Scala
---

Notes of [Learning Concurrent Programming in Scala](https://concurrent-programming-in-scala.github.io/)

<!-- more -->

## basic

### processes and threads

- 1 : 1
- deterministic / nondeterministic

#### thread states

- new
- runnable
- running
- waiting
- terminated

### monitors and synchronization

- monitor locks aka intrinsic locks
- synchronized statements
- wait and notify
- deadlocks
- guarded blocks
- interrupting threads and graceful shutdown

### [lock optimizations](https://blog.wqlin.me/2017/07/08/java-synchronized-keyword/)

- adaptive spinning
- lock elimination
- lock coarsening
- lightweight locking
- biased locking

### volatile variables

- reordering
- visible

### [memory model](http://www.cs.umd.edu/~pugh/java/memoryModel/jsr-133-faq.html)

- sequential consistency
- happens before

### immutable objects

- final fields

## traditional building blocks

### thread pools

- Executor
- ExecutorService
- ExecutionContext
- ForkJoinPool

- starvation

### atomic variables

- compare and swap (cas)
- linearizable and atomic
- lock-free programming
- implementing locks explicitly
- the aba problem
  <br/>(store immutable values inside the atomic references)

### lazy values

- double-checked locking idiom
  <br/>(never invoke blocking operations inside lazy value initialization expressions)
  <br/>(never call synchronized on publicly available objects; always use a dedicated, private dummy object for synchronization)

### concurrent collections

#### concurrent queues

- BlockingQueue
- ArrayBlockingQueue (bounded)
- LinkedBlockingQueue (unbounded)

| operation     | enqueue | dequeue | inspect |
| ------------- | ------- | ------- | ------- |
| exception     | add     | remove  | element |
| special value | offer   | poll    | peek    |
| timed         | offer   | poll    | &nbsp;  |
| blocking      | put     | take    | &nbsp;  |

- weakly consistent iterators
  <br/>(use iterators on concurrent data structures only when you can ensure that no other thread will modify the data structure from the point where the iterator was created until the point where the iterator's hasnext method returns false)

#### concurrent maps

- concurrent Map
- ConcurrentHashMap asScala
- ConcurrentSkipListSet asScala

##### complex linearizable methods

- putIfAbsent
- remove/2
- replace/2
- replace/3
  <br/>(equivalent on 'equals method')

##### linearizable methods

- +=
- -=
- put
- update
- get
- apply
- remove
  <br/>(avoid using the null value as a key or a value in a concurrent data structure)

#### concurrent traversals

- [TrieMap](https://www.scala-lang.org/api/current/scala/collection/concurrent/TrieMap.html)
  <br/>(use TrieMap if you require consistent iterators and ConcurrentHashMap when the get and apply operations are the bottlenecks in your program)

### processes

- [scala.sys.process](https://www.scala-lang.org/api/current/scala/sys/process/)

## asynchronous

### [futures](https://docs.scala-lang.org/overviews/core/futures.html)

- apply
- foreach
- onComplete
- failed
- map
- flatMap

### promises

- apply
- success
- failure
- complete
- tryComplete

- cancellation

### await

- ready
- result
- blocking (BlockContext)

### async

- [scala async library](https://github.com/scala/scala-async)

## [data parallel collections](https://docs.scala-lang.org/overviews/parallel-collections/overview.html)

- trivially parallelizable
- modified exclusive shared invalid (mesi)
- resource contention
  - memory contention
    <br/>(writing to the same memory location with proper synchronization leads to performance bottlenecks and contention; avoid this in data-parallel operations)

### hierarchy

- GenTraversable
  - GenIterable
    - ParIterable
      - ParSeq
      - ParMap
      - ParSet

### parallelism level

- TaskSupport

### measuring performance

- interpreted mode
- steady state

### caveats

#### parallelizable collections

- Range
- Vector
- HashMap
- HashSet
- mutable Array
- mutable ArrayBuffer
- mutable HashMap
- mutable HashSet
- concurrent TrieMap

#### parallelizable operations

- fold
- reduce
- aggregate

#### non-parallelizable operations

- foldLeft
- foldRight
- reduceLeft
- reduceRight
- reduceLeftOption
- reduceRightOption
- scanLeft
- scanRight
- toList
- toStream

### side effects

(to avoid the need for synchronization and ensure better scalability, favor declarative-style parallel operations instead of the side effects in parallel for loops)

### nondeterministic parallel operations

- find

### associative operators

- monoid

### implementing custom parallel collections

- immutable ParSeq
- Splitter
  - IterableSplitter
  - SeqSplitter
- Combiner

## reactive extensions

### observables

- cold observables
- hot observables

#### constructors

- from
- just
- timer
- interval
- error
- create
- apply

#### transformers

- map
- filter
- take
- concat
- flatten
- flatMap
- timeout
- merge
- retry
- repeat
- scan
- onErrorReturn
- onErrorResumeNext
- observeOn

#### accessors

- subscribe

### observers

- onNext
- onError
- onCompleted

### subscriptions

- apply
- unsubscribe

### schedulers

- ComputationScheduler
- IOScheduler
- NewThreadScheduler
- Schedulers from

### subjects

- Subject
- ReplaySubject
- BehaviorSubject
- AsyncSubject

- top-down programming style

## software transactional memory

- memory transactions
- isolation
- composability

### interaction between transactions and side effects

(only use the transactional context within the thread that started the transaction)

(avoid external side effects inside the transactions, as the transactions can be re-executed multiple times)

(use the Txn's afterCommit and afterRollback methods to perform side-effecting operations in the transactions without the danger of executing them multiple times)

### single-operation transactions

(use single-operation transactions for single read, write, and cas-like operations in order to avoid the syntactic boilerplate associated with the atomic blocks)

### nesting transactions

(nested atomic blocks result in a transaction that starts when the top-level atomic block starts, and can commit only after the top-level atomic block completes)

### transactions and exceptions

(when an exception is thrown inside a transaction, the transaction is rolled back and the exception is rethrown at the point where the top-level atomic block started)

### retrying transactions

(avoid long-running transactions whenever possible. never execute an infinite loop inside a transaction, as it can cause deadlocks)

(use the retry statement to block the transaction until a specific condition is fulfilled, and retry the transaction automatically once its read set changes)

### retrying with timeouts

(when a timeout represents exceptional program behavior, use the withRetryTimeout method to set the timeout duration in the transaction; when the transaction proceeds normally after a timeout, use the retryFor method)

### transactional collections

- transaction-local variable
- transactional arrays
- transactional maps

## actor

### ops on actor-ref

- `!` tell / bang
- forward
- `?` ask (pattern)
- pipeTo (pattern)

### ops on system

- actorOf
- actorSelection
- terminate

### ops on context

- system
- props
- self
- sender
- children
- parent
- become
- watch
- stop

### messages

- Identify
- ActorIdentity
- Kill
- PoisonPill
- Terminated

unhandled

### life cycles

- preStart
- postStop
- preRestart
- postRestart

### supervisions

- Restart
- Resume
- Stop
- Escalate

#### strategies

- OneForOne
- AllForOne

## concurrency in practice

(there is no one-size-fits-all technology, use your own best judgment when deciding which concurrency framework to use for a specific programming task)

### utilities

- jvisualvm
- scalameter

## references

- <https://hongjiev.github.io/2017/07/05/Threads-And-Locks-md/>
- <https://docs.oracle.com/javase/specs/>
