# Objective-C KVO Memory Management Bug

This repository demonstrates a common, yet subtle, bug in Objective-C related to Key-Value Observing (KVO) and memory management.  The bug arises from failing to remove KVO observers, leading to crashes or unexpected behavior when the observed object is deallocated.

## Bug Description
The `bug.m` file contains code that adds a KVO observer but does not remove it properly. This can cause a dangling pointer if the observed object is deallocated while the observer is still registered.

## Solution
The `bugSolution.m` file provides a corrected version, demonstrating how to properly remove the observer using `removeObserver:forKeyPath:` to prevent memory management issues.

## How to Reproduce
1. Clone this repository.
2. Compile and run `bug.m`. Observe the crash or unexpected behavior.
3. Compile and run `bugSolution.m` to see the corrected version.
