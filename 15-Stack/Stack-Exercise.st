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
	instanceVariableNames: 'emptySentenceFinder sentenceFinderWithElements stackFromSentenceFinder'
	classVariableNames: ''
	poolDictionaries: ''
	category: 'Stack-Exercise'!

!SentenceFinderByPrefixTest methodsFor: 'testing' stamp: 'LR 5/18/2020 21:55:59'!
test01FindFromEmptyStackWithValidPrefixShouldReturnEmptyCollection
	self assert: (emptySentenceFinder find: 'holis') isEmpty.! !

!SentenceFinderByPrefixTest methodsFor: 'testing' stamp: 'LR 5/18/2020 21:56:28'!
test02FindFromStackAValidPrefixThatDoesntExistShouldReturnEmptyCollection

	self assert: (sentenceFinderWithElements find: 'holis') isEmpty.! !

!SentenceFinderByPrefixTest methodsFor: 'testing' stamp: 'LR 5/20/2020 22:58:36'!
test03FindFromStackAValidPrefixThatExistsShouldReturnAllItsAppearancesAndNothingElse
	
	|sentences|
	
	sentences := sentenceFinderWithElements find: 'something'.
	self assert: (sentences size = 2 
		and: (sentences includes: 'something') 
		and: (sentences includes: 'something else')
		and: (sentences includes: 'sOmEtHiNgS') not
		and: (sentences includes: 'some thing') not ).! !

!SentenceFinderByPrefixTest methodsFor: 'testing' stamp: 'LR 5/20/2020 22:57:26'!
test04FindIsCaseSensitiveShouldReturnEmptyCollection
	"En el stack tenemos las siguientes oraciones: [something, some thing, somethingSSSS, something else, SomeThing]
	Ante el prefijo SOME ninguna oración debería ser retornada ya que Find es case SENSITIVE."
	self assert: (sentenceFinderWithElements find: 'SOME') isEmpty.
	
	! !

!SentenceFinderByPrefixTest methodsFor: 'testing' stamp: 'LR 5/20/2020 22:58:09'!
test05AfterFindStackStillTheSame

	sentenceFinderWithElements find: 'something'.
	
	self assert: stackFromSentenceFinder pop = 'SomeThing'.	
	self assert: stackFromSentenceFinder pop = 'something else'.
	self assert: stackFromSentenceFinder pop = 'sOmEtHiNgS'.
	self assert: stackFromSentenceFinder pop = 'some thing'.
	self assert: stackFromSentenceFinder pop = 'something'.! !

!SentenceFinderByPrefixTest methodsFor: 'testing' stamp: 'LR 5/18/2020 21:12:27'!
test06FindWithEmptyPrefixShouldReturnError

	[sentenceFinderWithElements find: ''.
		self fail.]
	on: Error
	do: [:anError | self assert: anError messageText =  sentenceFinderWithElements class invalidPrefixDescription].! !

!SentenceFinderByPrefixTest methodsFor: 'testing' stamp: 'LR 5/18/2020 21:13:01'!
test07FindWithEmptySpacesPrefixShouldReturnError

	[sentenceFinderWithElements find: 'some thing'.
		self fail.]
	on: Error
	do: [:anError | self assert: anError messageText =  sentenceFinderWithElements class invalidPrefixDescription].! !

!SentenceFinderByPrefixTest methodsFor: 'testing' stamp: 'LR 5/18/2020 21:13:38'!
test08FindEmptyStackWithEmptySpacesPrefixShouldReturnError

	[emptySentenceFinder find: 'some thing'.
		self fail.]
	on: Error
	do: [:anError | self assert: anError messageText =  sentenceFinderWithElements class invalidPrefixDescription].! !

!SentenceFinderByPrefixTest methodsFor: 'testing' stamp: 'LR 5/20/2020 22:54:53'!
test09FindEmptyStackWithEmptyPrefixShouldReturnError

	[emptySentenceFinder find: ''.
		self fail.]
	on: Error
	do: [:anError | self assert: anError messageText =  sentenceFinderWithElements class invalidPrefixDescription].! !


!SentenceFinderByPrefixTest methodsFor: 'setUp/tearDown' stamp: 'LR 5/20/2020 22:58:20'!
setUp
	
	emptySentenceFinder := SentenceFinderByPrefix newWith: OOStack new.
	
	stackFromSentenceFinder := OOStack new.
	
	(OrderedCollection with: 'something' with: 'some thing' with: 'sOmEtHiNgS' with: 'something else' with: 'SomeThing') do: [
		:elem |
			stackFromSentenceFinder push: elem.
		].

	sentenceFinderWithElements := SentenceFinderByPrefix newWith: stackFromSentenceFinder.! !


!classDefinition: #Node category: #'Stack-Exercise'!
Object subclass: #Node
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'Stack-Exercise'!

!Node methodsFor: 'as yet unclassified' stamp: 'LR 5/18/2020 17:35:43'!
parent
	self subclassResponsibility ! !

!Node methodsFor: 'as yet unclassified' stamp: 'LR 5/18/2020 17:33:19'!
sendValueTo: interrogator
	self subclassResponsibility ! !

!Node methodsFor: 'as yet unclassified' stamp: 'LR 5/18/2020 17:33:05'!
size
	self subclassResponsibility ! !

!Node methodsFor: 'as yet unclassified' stamp: 'LR 5/18/2020 17:33:32'!
value
	self subclassResponsibility ! !


!classDefinition: #NullNode category: #'Stack-Exercise'!
Node subclass: #NullNode
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'Stack-Exercise'!

!NullNode methodsFor: 'accessing' stamp: 'LR 5/20/2020 23:01:30'!
parent
	^self error: 'Null Node has no parent'! !

!NullNode methodsFor: 'accessing' stamp: 'LR 5/20/2020 23:05:01'!
sendValueTo: anInterrogator
	^anInterrogator nodeNull.! !

!NullNode methodsFor: 'accessing' stamp: 'LR 5/18/2020 17:27:19'!
size
	^0.! !

!NullNode methodsFor: 'accessing' stamp: 'LR 5/20/2020 23:01:38'!
value
	^self error: 'Null Node has no value'! !

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'NullNode class' category: #'Stack-Exercise'!
NullNode class
	instanceVariableNames: 'uniqueInstance'!

!NullNode class methodsFor: 'instance creation' stamp: 'LR 5/20/2020 18:36:44'!
new
	^uniqueInstance	! !


!NullNode class methodsFor: 'initialization' stamp: 'LR 5/20/2020 18:40:40'!
initialize
	uniqueInstance := self basicNew ! !


!classDefinition: #RealNode category: #'Stack-Exercise'!
Node subclass: #RealNode
	instanceVariableNames: 'value parent'
	classVariableNames: ''
	poolDictionaries: ''
	category: 'Stack-Exercise'!

!RealNode methodsFor: 'initialization' stamp: 'LR 5/18/2020 17:20:43'!
initializeWith: aValue childOf: aNode 
	value := aValue.
	parent := aNode.! !


!RealNode methodsFor: 'accessing' stamp: 'LR 5/18/2020 17:35:50'!
parent
	^parent! !

!RealNode methodsFor: 'accessing' stamp: 'LR 5/20/2020 23:04:49'!
sendValueTo: anInterrogator
	^anInterrogator nodeValue: self value.! !

!RealNode methodsFor: 'accessing' stamp: 'LR 5/18/2020 17:27:11'!
size
	^ 1 + parent size.! !

!RealNode methodsFor: 'accessing' stamp: 'LR 5/18/2020 17:32:46'!
value
	^value! !

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'RealNode class' category: #'Stack-Exercise'!
RealNode class
	instanceVariableNames: ''!

!RealNode class methodsFor: 'instance creation' stamp: 'LR 5/18/2020 17:28:26'!
newWith: aValue childOf: aNode
	^RealNode new initializeWith: aValue childOf: aNode.! !


!classDefinition: #OOStack category: #'Stack-Exercise'!
Object subclass: #OOStack
	instanceVariableNames: 'last'
	classVariableNames: ''
	poolDictionaries: ''
	category: 'Stack-Exercise'!

!OOStack methodsFor: 'state' stamp: 'LR 5/18/2020 17:26:37'!
isEmpty
	^self size = 0.! !

!OOStack methodsFor: 'state' stamp: 'LR 5/18/2020 17:26:50'!
size
	^last size.! !


!OOStack methodsFor: 'adding' stamp: 'LR 5/18/2020 17:29:35'!
push: anElement
	
	last := RealNode newWith: anElement childOf: self last.! !


!OOStack methodsFor: 'initialization' stamp: 'LR 5/18/2020 17:24:58'!
initialize
	last := NullNode new.! !


!OOStack methodsFor: 'errors' stamp: 'LR 5/14/2020 23:07:11'!
emptyStackError
	^self error: self class stackEmptyErrorDescription! !

!OOStack methodsFor: 'errors' stamp: 'LR 5/20/2020 22:17:35'!
nodeNull
	^self emptyStackError.! !


!OOStack methodsFor: 'removing' stamp: 'LR 5/18/2020 17:47:04'!
pop
	|popedElementValue|
	
	popedElementValue := self top. 
	last := last parent.
	^popedElementValue.
	
	! !


!OOStack methodsFor: 'accessing' stamp: 'LR 5/18/2020 17:29:47'!
last
	^last! !

!OOStack methodsFor: 'accessing' stamp: 'LR 5/20/2020 22:16:40'!
nodeValue: aValue.
	^aValue.! !

!OOStack methodsFor: 'accessing' stamp: 'LR 5/18/2020 17:31:13'!
top
	^last sendValueTo: self.! !

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'OOStack class' category: #'Stack-Exercise'!
OOStack class
	instanceVariableNames: ''!

!OOStack class methodsFor: 'error descriptions' stamp: 'HernanWilkinson 5/7/2012 11:51'!
stackEmptyErrorDescription
	
	^ 'Stack is empty'! !


!classDefinition: #SentenceFinderByPrefix category: #'Stack-Exercise'!
Object subclass: #SentenceFinderByPrefix
	instanceVariableNames: 'stack'
	classVariableNames: ''
	poolDictionaries: ''
	category: 'Stack-Exercise'!

!SentenceFinderByPrefix methodsFor: 'errors' stamp: 'LR 5/18/2020 21:31:58'!
invalidPrefixError
	^self error: self class invalidPrefixDescription! !


!SentenceFinderByPrefix methodsFor: 'initialization' stamp: 'LR 5/18/2020 18:48:48'!
initializeWith: aStack
	stack := aStack.! !


!SentenceFinderByPrefix methodsFor: 'accessing' stamp: 'LR 5/18/2020 21:40:31'!
find: aPrefix

	"find returns all the sentences that begins with aPrefix (case sensitive) from the underlying stack.
	Empty prefixes or prefixes with empty spaces are not supported."
	
	|sentences|
	
	(self isInvalidPrefix: aPrefix) ifTrue: [^self invalidPrefixError].
	
	sentences := self getSentences.

	^sentences select: [:sentence | sentence beginsWith: aPrefix].! !

!SentenceFinderByPrefix methodsFor: 'accessing' stamp: 'LR 5/18/2020 19:10:14'!
getSentences

	| sentences popedSentence |
	
	sentences := OrderedCollection new.
	
	stack isEmpty ifTrue: [^sentences].	
	
	stack size timesRepeat: [
		popedSentence := stack pop.
		sentences addFirst: popedSentence.
		].
	
	sentences do: [:sentence | stack push: sentence].
	
	^sentences.! !


!SentenceFinderByPrefix methodsFor: 'comparing' stamp: 'LR 5/18/2020 21:30:41'!
isInvalidPrefix: aPrefix
	^aPrefix = '' or: (aPrefix includesSubString: ' ').! !

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'SentenceFinderByPrefix class' category: #'Stack-Exercise'!
SentenceFinderByPrefix class
	instanceVariableNames: ''!

!SentenceFinderByPrefix class methodsFor: 'as yet unclassified' stamp: 'LR 5/18/2020 21:07:11'!
invalidPrefixDescription
	^'Prefix cant be empty and cant have empty spaces'! !

!SentenceFinderByPrefix class methodsFor: 'as yet unclassified' stamp: 'LR 5/18/2020 18:52:21'!
newWith: aStack
	^SentenceFinderByPrefix new initializeWith: aStack.! !

NullNode initialize!