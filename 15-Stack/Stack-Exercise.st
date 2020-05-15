!classDefinition: #OOStackTest category: #'Stack-Exercise'!
TestCase subclass: #OOStackTest
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'Stack-Exercise'!

!OOStackTest methodsFor: 'test' stamp: 'HernanWilkinson 5/7/2012 11:30'!
test01StackShouldBeEmptyWhenCreated

	| stack |
	
	stack := OOStack new.
	
	self assert: stack isEmpty! !

!OOStackTest methodsFor: 'test' stamp: 'NR 5/13/2020 13:29:55'!
test02PushAddElementsToTheStack

	| stack |
	
	stack := OOStack new.
	stack push: 'something'.
	
	self deny: stack isEmpty! !

!OOStackTest methodsFor: 'test' stamp: 'NR 5/13/2020 13:30:01'!
test03PopRemovesElementsFromTheStack

	| stack |
	
	stack := OOStack new.
	stack push: 'something'.
	stack pop.
	
	self assert: stack isEmpty! !

!OOStackTest methodsFor: 'test' stamp: 'NR 5/13/2020 13:30:09'!
test04PopReturnsLastPushedObject

	| stack pushedObject |
	
	stack := OOStack new.
	pushedObject := 'something'.
	stack push: pushedObject.
	
	self assert: stack pop = pushedObject! !

!OOStackTest methodsFor: 'test' stamp: 'NR 5/13/2020 13:30:48'!
test05StackBehavesLIFO

	| stack firstPushedObject secondPushedObject |
	
	stack := OOStack new.
	firstPushedObject := 'first'.
	secondPushedObject := 'second'.
	
	stack push: firstPushedObject.
	stack push: secondPushedObject.
	
	self assert: stack pop = secondPushedObject.
	self assert: stack pop = firstPushedObject.
	self assert: stack isEmpty 
	! !

!OOStackTest methodsFor: 'test' stamp: 'NR 5/13/2020 13:30:20'!
test06TopReturnsLastPushedObject

	| stack pushedObject |
	
	stack := OOStack new.
	pushedObject := 'something'.
	
	stack push: pushedObject.
	
	self assert: stack top = pushedObject.
	! !

!OOStackTest methodsFor: 'test' stamp: 'NR 5/13/2020 13:30:24'!
test07TopDoesNotRemoveObjectFromStack

	| stack pushedObject |
	
	stack := OOStack new.
	pushedObject := 'something'.
	
	stack push: pushedObject.
	
	self assert: stack size = 1.
	stack top.
	self assert: stack size = 1.
	! !

!OOStackTest methodsFor: 'test' stamp: 'HAW 4/14/2017 22:48:26'!
test08CanNotPopWhenThereAreNoObjectsInTheStack

	| stack  |
	
	stack := OOStack new.
	self
		should: [ stack pop ]
		raise: Error - MessageNotUnderstood 
		withExceptionDo: [ :anError |
			self assert: anError messageText = OOStack stackEmptyErrorDescription ]
		
! !

!OOStackTest methodsFor: 'test' stamp: 'NR 5/13/2020 13:30:31'!
test09CanNotPopWhenThereAreNoObjectsInTheStackAndTheStackHadObjects

	| stack  |
	
	stack := OOStack new.
	stack push: 'something'.
	stack pop.
	
	self
		should: [ stack pop ]
		raise: Error - MessageNotUnderstood 
		withExceptionDo: [ :anError |
			self assert: anError messageText = OOStack stackEmptyErrorDescription ]
		
! !

!OOStackTest methodsFor: 'test' stamp: 'HAW 4/14/2017 22:48:44'!
test10CanNotTopWhenThereAreNoObjectsInTheStack

	| stack  |
	
	stack := OOStack new.
	self
		should: [ stack top ]
		raise: Error - MessageNotUnderstood 
		withExceptionDo: [ :anError |
			self assert: anError messageText = OOStack stackEmptyErrorDescription ]
		
! !


!classDefinition: #SentenceFinderByPrefixTest category: #'Stack-Exercise'!
TestCase subclass: #SentenceFinderByPrefixTest
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'Stack-Exercise'!


!classDefinition: #Element category: #'Stack-Exercise'!
Object subclass: #Element
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'Stack-Exercise'!

!Element methodsFor: 'as yet unclassified' stamp: 'LR 5/14/2020 23:00:42'!
isNull
	self subclassResponsibility ! !

!Element methodsFor: 'as yet unclassified' stamp: 'LR 5/14/2020 23:00:53'!
value
	self subclassResponsibility! !


!classDefinition: #NullElement category: #'Stack-Exercise'!
Element subclass: #NullElement
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'Stack-Exercise'!

!NullElement methodsFor: 'as yet unclassified' stamp: 'LR 5/14/2020 23:08:24'!
ifCanGetValue: interrogator
	^interrogator cantGetValue! !

!NullElement methodsFor: 'as yet unclassified' stamp: 'LR 5/14/2020 22:59:49'!
isNull
	^true.! !

!NullElement methodsFor: 'as yet unclassified' stamp: 'LR 5/14/2020 23:01:01'!
value
	self error! !


!classDefinition: #RealElement category: #'Stack-Exercise'!
Element subclass: #RealElement
	instanceVariableNames: 'value'
	classVariableNames: ''
	poolDictionaries: ''
	category: 'Stack-Exercise'!

!RealElement methodsFor: 'as yet unclassified' stamp: 'LR 5/14/2020 23:08:04'!
ifCanGetValue: interrogator
	^interrogator canGetValue: self value.! !

!RealElement methodsFor: 'as yet unclassified' stamp: 'LR 5/14/2020 23:10:53'!
initializeWith: anElement
	value := anElement! !

!RealElement methodsFor: 'as yet unclassified' stamp: 'LR 5/14/2020 22:59:59'!
isNull
	^false.! !

!RealElement methodsFor: 'as yet unclassified' stamp: 'LR 5/14/2020 23:01:08'!
value
	^value! !

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'RealElement class' category: #'Stack-Exercise'!
RealElement class
	instanceVariableNames: ''!

!RealElement class methodsFor: 'as yet unclassified' stamp: 'LR 5/14/2020 23:10:38'!
newWith: anElement
	^RealElement new initializeWith: anElement.! !


!classDefinition: #OOStack category: #'Stack-Exercise'!
Object subclass: #OOStack
	instanceVariableNames: 'xxxxxxxxxCollection'
	classVariableNames: ''
	poolDictionaries: ''
	category: 'Stack-Exercise'!

!OOStack methodsFor: 'as yet unclassified' stamp: 'LR 5/14/2020 23:06:33'!
canGetValue: value
	^value.! !

!OOStack methodsFor: 'as yet unclassified' stamp: 'LR 5/14/2020 23:07:20'!
cantGetValue
	^self emptyStackError.! !

!OOStack methodsFor: 'as yet unclassified' stamp: 'LR 5/14/2020 23:07:11'!
emptyStackError
	^self error: self class stackEmptyErrorDescription! !

!OOStack methodsFor: 'as yet unclassified' stamp: 'LR 5/14/2020 23:02:14'!
initialize
	xxxxxxxxxCollection := OrderedCollection new.
	xxxxxxxxxCollection add: NullElement new.! !

!OOStack methodsFor: 'as yet unclassified' stamp: 'LR 5/14/2020 23:02:08'!
isEmpty
	^xxxxxxxxxCollection last isNull.! !

!OOStack methodsFor: 'as yet unclassified' stamp: 'LR 5/14/2020 23:05:26'!
pop
	^xxxxxxxxxCollection removeLast ifCanGetValue: self.! !

!OOStack methodsFor: 'as yet unclassified' stamp: 'LR 5/14/2020 23:09:27'!
push: anElement
	xxxxxxxxxCollection add: (RealElement newWith: anElement).! !

!OOStack methodsFor: 'as yet unclassified' stamp: 'LR 5/14/2020 22:53:20'!
size
	^xxxxxxxxxCollection size - 1.! !

!OOStack methodsFor: 'as yet unclassified' stamp: 'LR 5/14/2020 23:05:20'!
top
	^xxxxxxxxxCollection last ifCanGetValue: self.! !

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'OOStack class' category: #'Stack-Exercise'!
OOStack class
	instanceVariableNames: ''!

!OOStack class methodsFor: 'error descriptions' stamp: 'HernanWilkinson 5/7/2012 11:51'!
stackEmptyErrorDescription
	
	^ 'Stack is empty'! !



!classDefinition: #SentenceFinderByPrefix category: #'Stack-Exercise'!
Object subclass: #SentenceFinderByPrefix
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'Stack-Exercise'!


!classDefinition: #Stack category: #'Stack-Exercise'!
Object subclass: #Stack
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'Stack-Exercise'!


!classDefinition: #NullStack category: #'Stack-Exercise'!
Stack subclass: #NullStack
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'Stack-Exercise'!

!NullStack methodsFor: 'as yet unclassified' stamp: 'LR 5/14/2020 22:38:54'!
canotPopFromEmptyStack
	^self error: self class stackEmptyErrorDescription! !

!NullStack methodsFor: 'as yet unclassified' stamp: 'LR 5/14/2020 22:39:30'!
canotTopFromEmptyStack
	^self error: self class stackEmptyErrorDescription! !

!NullStack methodsFor: 'as yet unclassified' stamp: 'LR 5/14/2020 22:10:08'!
isEmpty
	^true.! !

!NullStack methodsFor: 'as yet unclassified' stamp: 'LR 5/14/2020 22:11:16'!
pop
	^self canotPopFromEmptyStack.! !

!NullStack methodsFor: 'as yet unclassified' stamp: 'LR 5/14/2020 22:27:52'!
push: anElement
	^RealStack newWith: anElement.! !

!NullStack methodsFor: 'as yet unclassified' stamp: 'LR 5/14/2020 22:39:22'!
top
	^self canotTopFromEmptyStack.! !

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'NullStack class' category: #'Stack-Exercise'!
NullStack class
	instanceVariableNames: ''!

!NullStack class methodsFor: 'as yet unclassified' stamp: 'LR 5/14/2020 22:38:38'!
stackEmptyErrorDescription
	^ 'Stack is empty'! !


!classDefinition: #RealStack category: #'Stack-Exercise'!
Stack subclass: #RealStack
	instanceVariableNames: 'value'
	classVariableNames: ''
	poolDictionaries: ''
	category: 'Stack-Exercise'!

!RealStack methodsFor: 'as yet unclassified' stamp: 'LR 5/14/2020 22:51:59'!
initializeWith: anElement.
	value := anElement.! !

!RealStack methodsFor: 'as yet unclassified' stamp: 'LR 5/14/2020 22:17:09'!
isEmpty
	^false.! !

!RealStack methodsFor: 'as yet unclassified' stamp: 'LR 5/14/2020 22:52:09'!
pop
	^value.! !

!RealStack methodsFor: 'as yet unclassified' stamp: 'LR 5/14/2020 22:51:32'!
push: anElement
	^RealStack newWith: anElement.! !

!RealStack methodsFor: 'as yet unclassified' stamp: 'LR 5/14/2020 22:52:48'!
top
	^value.! !

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'RealStack class' category: #'Stack-Exercise'!
RealStack class
	instanceVariableNames: ''!

!RealStack class methodsFor: 'as yet unclassified' stamp: 'LR 5/14/2020 22:28:02'!
newWith: anElement
	^RealStack new initializeWith: anElement.! !
