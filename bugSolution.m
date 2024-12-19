```objectivec
@interface MyObject : NSObject
@property (nonatomic, strong) NSString *myString;
@end

@implementation MyObject
- (void)observeValueForKeyPath:(NSString *)keyPath ofObject:(id)object change:(NSDictionary *)change context:(void *)context {
    // ... handle changes ...
}

- (void)dealloc {
    [self removeObserver:self forKeyPath:@"myString"];
    [super dealloc];
}
@end

// In another class:
MyObject *myObj = [[MyObject alloc] init];
[myObj addObserver:self forKeyPath:@"myString" options:NSKeyValueObservingOptionNew context:NULL];
// ... later, explicitly remove the observer:
[myObj removeObserver:self forKeyPath:@"myString"];
// ... or, allow the observer to be automatically removed in -dealloc.
```
This solution demonstrates removing the observer either explicitly using `removeObserver:forKeyPath:` before the observed object is released, or by including the observer removal within the `-dealloc` method of the observed object.  The latter approach ensures that the observer is always removed when the observed object is deallocated.