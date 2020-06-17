!classDefinition: #TerniLapilliTests category: #TerniLapilli!
TestCase subclass: #TerniLapilliTests
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'TerniLapilli'!

!TerniLapilliTests methodsFor: 'as yet unclassified' stamp: 'LR 6/11/2020 20:52:38'!
test01GameIsNotOverIfNeverStarted
	|game|
	
	game := TerniLapilli new.
	self deny: (game isOver)! !

!TerniLapilliTests methodsFor: 'as yet unclassified' stamp: 'LR 6/11/2020 20:52:58'!
test02XStartsTheGame
	|game|
	
	game := TerniLapilli new.
	self assert: (game isPlayingX)! !

!TerniLapilliTests methodsFor: 'as yet unclassified' stamp: 'LR 6/11/2020 20:53:06'!
test03ODoesNotStartTheGame
	|game|
	
	game := TerniLapilli new.
	self deny: (game isPlayingO)! !

!TerniLapilliTests methodsFor: 'as yet unclassified' stamp: 'LR 6/16/2020 20:00:26'!
test04PutXInAnInvalidPositionWillRaiseAnError
	|game|
	
	game := TerniLapilli new.
	[game putXAt: 4@1. self fail.]
	on: Error 
	do: [self success: true.]! !

!TerniLapilliTests methodsFor: 'as yet unclassified' stamp: 'LR 6/16/2020 20:00:32'!
test05PutOInAnInvalidPositionWillRaiseAnError
	|game|
	
	game := TerniLapilli new.
	game putXAt: 1@1.
	[game putOAt: 4@1. self fail.]
	on: Error 
	do: [self success: true.]! !

!TerniLapilliTests methodsFor: 'as yet unclassified' stamp: 'LR 6/16/2020 20:00:48'!
test06OCantPlayIfIsXTurn
	|game|
	
	game := TerniLapilli new.
	[game putOAt: 1@1. self fail.]
	on: Error 
	do: [ self success: true. ]
	! !

!TerniLapilliTests methodsFor: 'as yet unclassified' stamp: 'LR 6/16/2020 20:00:57'!
test07XCantPlayIfIsOTurn
	|game|
	
	game := TerniLapilli new.
	game putXAt: 1@1.
	[game putXAt: 2@1. self fail.]
	on: Error 
	do: [ self success: true. ]
	! !

!TerniLapilliTests methodsFor: 'as yet unclassified' stamp: 'LR 6/16/2020 20:01:05'!
test08AfterXIsOTurn
	|game|
	
	game := TerniLapilli new.
	game putXAt: 1@1.
	self deny: (game isPlayingX).
	self assert: (game isPlayingO).! !

!TerniLapilliTests methodsFor: 'as yet unclassified' stamp: 'LR 6/16/2020 20:01:14'!
test09AfterOIsXTurn
	|game|
	
	game := TerniLapilli new.
	game putXAt: 2@1.
	game putOAt: 1@1.
	self assert: (game isPlayingX).
	self deny: (game isPlayingO).! !

!TerniLapilliTests methodsFor: 'as yet unclassified' stamp: 'LR 6/16/2020 20:01:25'!
test10CantPutAChipInATakenSpace
	|game|
	
	game := TerniLapilli new.
	game putXAt: 1@1.
	[game putOAt: 1@1. self fail.]
	on: Error
	do: [self success: true.]! !

!TerniLapilliTests methodsFor: 'as yet unclassified' stamp: 'LR 6/16/2020 20:01:52'!
test11AfterAll6ChipsInTheBoardOnlyCanMovePreviousChips
	|game|
	
	game := TerniLapilli new.
	game putXAt: 1@1.
	game putOAt: 2@1.
	
	game putXAt: 1@2.
	game putOAt: 1@3.

	game putXAt: 2@2.
	game putOAt: 2@3.
	
	[game putXAt: 3@2. self fail.]
	on: Error
	do: [self success: true.]! !

!TerniLapilliTests methodsFor: 'as yet unclassified' stamp: 'LR 6/16/2020 20:21:46'!
test12CantMoveXChipIfSourcePositionIsFilledByAnOChip
	|game|
	
	game := TerniLapilli new.
	game putXAt: 1@1. 
	game putOAt: 2@1.
	
	game putXAt: 1@2.
	game putOAt: 1@3.

	game putXAt: 2@2.
	game putOAt: 2@3.
	
	[game moveXAt: 2@3 to: 3@3. self fail.]
	on: Error
	do: [self success: true.]! !

!TerniLapilliTests methodsFor: 'as yet unclassified' stamp: 'LR 6/16/2020 20:22:13'!
test13CantMoveOChipIfSourcePositionIsFilledByAnXChip
	|game|
	
	game := TerniLapilli new.
	game putXAt: 1@1. 
	game putOAt: 2@1.
	
	game putXAt: 1@2.
	game putOAt: 1@3.

	game putXAt: 2@2.
	game putOAt: 2@3.
	
	game moveXAt: 2@2 to: 3@2.
	[game moveOAt: 3@2 to: 3@3. self fail.]
	on: Error
	do: [self success: true.]! !

!TerniLapilliTests methodsFor: 'as yet unclassified' stamp: 'LR 6/16/2020 20:22:53'!
test14CantMoveOChipIfIsXTurn
	|game|
	
	game := TerniLapilli new.
	game putXAt: 1@1. 
	game putOAt: 2@1.
	
	game putXAt: 1@2.
	game putOAt: 1@3.

	game putXAt: 2@2.
	game putOAt: 2@3.
	
	[game moveOAt: 2@1 to: 3@1. self fail.]
	on: Error
	do: [self success: true.]! !

!TerniLapilliTests methodsFor: 'as yet unclassified' stamp: 'LR 6/16/2020 20:21:14'!
test15CantMoveXChipIfIsOTurn
	|game|
	
	game := TerniLapilli new.
	game putXAt: 1@1. 
	game putOAt: 2@1.
	
	game putXAt: 1@2.
	game putOAt: 1@3.

	game putXAt: 2@2.
	game putOAt: 2@3. 
	
	game moveXAt: 2@2 to: 3@2.
	[game moveXAt: 3@2 to: 3@3. self fail.]
	on: Error
	do: [self success: true.]! !

!TerniLapilliTests methodsFor: 'as yet unclassified' stamp: 'LR 6/16/2020 20:33:20'!
test16CanNotMoveXChipToATakenPosition
	|game|
	
	game := TerniLapilli new.
	game putXAt: 1@1. 
	game putOAt: 2@1.
	
	game putXAt: 1@2.
	game putOAt: 1@3.

	game putXAt: 2@2.
	game putOAt: 2@3.
	
	[game moveXAt: 1@1 to: 1@2. self fail.]
	on: Error
	do: [self success: true.]! !

!TerniLapilliTests methodsFor: 'as yet unclassified' stamp: 'LR 6/16/2020 20:34:22'!
test17CanNotMoveOChipToATakenPosition
	|game|
	
	game := TerniLapilli new.
	game putXAt: 1@1. 
	game putOAt: 2@1.
	
	game putXAt: 1@2.
	game putOAt: 1@3.

	game putXAt: 2@2.
	game putOAt: 2@3.
	
	game moveXAt: 2@2 to: 3@3.
	[game moveOAt: 2@1 to: 1@1. self fail.]
	on: Error
	do: [self success: true.]! !

!TerniLapilliTests methodsFor: 'as yet unclassified' stamp: 'LR 6/16/2020 20:50:10'!
test18CanNotMoveXChipToAnInvalidPosition
	|game|
	
	game := TerniLapilli new.
	game putXAt: 2@1. 
	game putOAt: 1@1.
	
	game putXAt: 1@3.
	game putOAt: 1@2.

	game putXAt: 2@3.
	game putOAt: 2@2.
	
	[game moveXAt: 2@3 to: 3@2. self fail.]
	on: Error
	do: [self success:true].! !

!TerniLapilliTests methodsFor: 'as yet unclassified' stamp: 'LR 6/16/2020 21:27:15'!
test19CanNotMoveOChipToAnInvalidPosition
	|game|
	
	game := TerniLapilli new.
	game putXAt: 2@1. 
	game putOAt: 1@1.
	
	game putXAt: 1@3.
	game putOAt: 1@2.

	game putXAt: 2@3.
	game putOAt: 2@2.
	
	game moveXAt: 2@3 to: 3@3.
	[game moveOAt: 1@2 to: 2@3. self fail.]
	on: Error
	do: [self success:true].! !

!TerniLapilliTests methodsFor: 'as yet unclassified' stamp: 'LR 6/16/2020 22:10:13'!
test20IfXHasThreeOnAColumnAfter3MovementsXWins
	|game|
	
	game := TerniLapilli new.
	game putXAt: 1@1.
	game putOAt: 2@1.
	game putXAt: 1@2.
	game putOAt: 2@2.	
	game putXAt: 1@3.
	
	self assert: game hasPlayerXWon.
	self deny: game hasPlayerOWon.	! !

!TerniLapilliTests methodsFor: 'as yet unclassified' stamp: 'LR 6/16/2020 22:10:23'!
test21IfOHasThreeOnAColumnAfter3MovementsOWins
	|game|
	
	game := TerniLapilli new.
	game putXAt: 1@1.
	game putOAt: 2@1.
	game putXAt: 1@2.
	game putOAt: 2@2.	
	game putXAt: 3@3.
	game putOAt: 2@3.	
	
	self deny: game hasPlayerXWon.
	self assert: game hasPlayerOWon.	! !

!TerniLapilliTests methodsFor: 'as yet unclassified' stamp: 'LR 6/16/2020 22:11:20'!
test22IfXHasThreeOnARowAfter3MovementsXWins
	|game|
	
	game := TerniLapilli new.
	game putXAt: 1@1.
	game putOAt: 3@3.
	game putXAt: 2@1.
	game putOAt: 2@2.	
	game putXAt: 3@1.
	
	self assert: game hasPlayerXWon.
	self deny: game hasPlayerOWon.	! !

!TerniLapilliTests methodsFor: 'as yet unclassified' stamp: 'LR 6/16/2020 22:12:31'!
test23IfOHasThreeOnARowAfter3MovementsOWins
	|game|
	
	game := TerniLapilli new.
	game putXAt: 1@2.
	game putOAt: 3@3.
	game putXAt: 2@1.
	game putOAt: 2@3.	
	game putXAt: 3@1.
	game putOAt: 1@3.
	
	self assert: game hasPlayerOWon.
	self deny: game hasPlayerXWon.	! !

!TerniLapilliTests methodsFor: 'as yet unclassified' stamp: 'LR 6/16/2020 22:23:12'!
test24IfXHasThreeOnADiagonalAfter3MovementsXWins
	|game|
	
	game := TerniLapilli new.
	game putXAt: 3@1.
	game putOAt: 1@2.
	game putXAt: 2@2.
	game putOAt: 2@3.	
	game putXAt: 1@3.
	
	self assert: game hasPlayerXWon.
	self deny: game hasPlayerOWon.	! !

!TerniLapilliTests methodsFor: 'as yet unclassified' stamp: 'LR 6/16/2020 22:18:43'!
test25IfOHasThreeOnADiagonalAfter3MovementsOWins
	|game|
	
	game := TerniLapilli new.
	game putXAt: 3@1.
	game putOAt: 1@1.
	game putXAt: 2@3.
	game putOAt: 2@2.	
	game putXAt: 1@3.
	game putOAt: 3@3.
	
	self deny: game hasPlayerXWon.
	self assert: game hasPlayerOWon.	! !

!TerniLapilliTests methodsFor: 'as yet unclassified' stamp: 'LR 6/16/2020 22:20:33'!
test26IfAPlayerHasThreeOnARowTheGameIsOver
	|game|
	
	game := TerniLapilli new.
	game putXAt: 1@1.
	game putOAt: 2@1.
	game putXAt: 1@2.
	game putOAt: 2@2.	
	game putXAt: 1@3.
	
	self assert: game isOver.
	! !

!TerniLapilliTests methodsFor: 'as yet unclassified' stamp: 'LR 6/16/2020 22:23:35'!
test27IfTheGameIsOverNobodyCanPutAnotherChip
	|game|
	
	game := TerniLapilli new.
	game putXAt: 1@1.
	game putOAt: 2@1.
	game putXAt: 1@2.
	game putOAt: 2@2.	
	game putXAt: 1@3.
	
	[game putOAt: 3@3. self fail.]
	on: Error
	do: [self success: true].
	! !

!TerniLapilliTests methodsFor: 'as yet unclassified' stamp: 'LR 6/16/2020 22:27:50'!
test28IfXHasThreeOnARowInAnyPositionAfterMoreThan3MovementsXWins
	|game|
	
	game := TerniLapilli new.
	game putXAt: 1@1.
	game putOAt: 2@1.
	game putXAt: 1@2.
	game putOAt: 3@2.	
	game putXAt: 3@3.
	game putOAt: 3@1.
	
	game moveXAt: 1@2 to: 2@2.
	
	self assert: game hasPlayerXWon.
	self deny: game hasPlayerOWon.	! !

!TerniLapilliTests methodsFor: 'as yet unclassified' stamp: 'LR 6/16/2020 22:29:29'!
test29IfOHasThreeOnARowInAnyPositionAfterMoreThan3MovementsOWins
	|game|
	
	game := TerniLapilli new.
	game putXAt: 1@1.
	game putOAt: 2@3.
	game putXAt: 1@2.
	game putOAt: 3@2.	
	game putXAt: 3@3.
	game putOAt: 3@1.
	
	game moveXAt: 3@3 to: 2@2.
	game moveOAt: 2@3 to: 3@3.
		
	self deny: game hasPlayerXWon.
	self assert: game hasPlayerOWon.	! !

!TerniLapilliTests methodsFor: 'as yet unclassified' stamp: 'LR 6/16/2020 22:31:52'!
test30IfTheGameIsOverXCanNotMoveAnotherChip
	|game|
	
	game := TerniLapilli new.
	game putXAt: 1@1.
	game putOAt: 2@3.
	game putXAt: 1@2.
	game putOAt: 3@2.	
	game putXAt: 3@3.
	game putOAt: 3@1.
	
	game moveXAt: 3@3 to: 2@2.
	game moveOAt: 2@3 to: 3@3.

	[game moveXAt: 2@2 to: 1@3. self fail.]
	on: Error
	do: [self success:true].! !

!TerniLapilliTests methodsFor: 'as yet unclassified' stamp: 'LR 6/16/2020 22:32:35'!
test31IfTheGameIsOverOCanNotMoveAnotherChip
	|game|
	
	game := TerniLapilli new.
	game putXAt: 1@1.
	game putOAt: 2@3.
	game putXAt: 1@2.
	game putOAt: 3@2.	
	game putXAt: 3@3.
	game putOAt: 3@1.
	
	game moveXAt: 1@2 to: 2@2.
	[game moveOAt: 2@3 to: 3@3. self fail.]
	on: Error
	do: [self success:true].! !


!classDefinition: #Player category: #TerniLapilli!
Object subclass: #Player
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'TerniLapilli'!

!Player methodsFor: 'ternilapilli operations' stamp: 'LR 6/17/2020 18:09:23'!
isPlayingO
	self subclassResponsibility ! !

!Player methodsFor: 'ternilapilli operations' stamp: 'LR 6/17/2020 18:09:22'!
isPlayingX
	self subclassResponsibility ! !

!Player methodsFor: 'ternilapilli operations' stamp: 'LR 6/17/2020 18:09:27'!
playO
	self subclassResponsibility ! !

!Player methodsFor: 'ternilapilli operations' stamp: 'LR 6/17/2020 18:09:25'!
playX
	self subclassResponsibility ! !

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'Player class' category: #TerniLapilli!
Player class
	instanceVariableNames: ''!

!Player class methodsFor: 'errors' stamp: 'LR 6/17/2020 18:07:53'!
notYourTurnErrorMessageDescription
	^'its not your turn'! !


!classDefinition: #PlayerO category: #TerniLapilli!
Player subclass: #PlayerO
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'TerniLapilli'!

!PlayerO methodsFor: 'ternilapilli operations' stamp: 'LR 6/17/2020 18:04:43'!
isPlayingO
	^true! !

!PlayerO methodsFor: 'ternilapilli operations' stamp: 'LR 6/17/2020 18:04:48'!
isPlayingX
	^false! !

!PlayerO methodsFor: 'ternilapilli operations' stamp: 'LR 6/17/2020 18:08:14'!
playO! !

!PlayerO methodsFor: 'ternilapilli operations' stamp: 'LR 6/17/2020 18:09:00'!
playX
	^self error: self class notYourTurnErrorMessageDescription! !


!classDefinition: #PlayerX category: #TerniLapilli!
Player subclass: #PlayerX
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'TerniLapilli'!

!PlayerX methodsFor: 'ternilapilli operations' stamp: 'LR 6/17/2020 18:08:23'!
isPlayingO
	^false! !

!PlayerX methodsFor: 'ternilapilli operations' stamp: 'LR 6/17/2020 18:08:27'!
isPlayingX
	^true! !

!PlayerX methodsFor: 'ternilapilli operations' stamp: 'LR 6/17/2020 18:09:05'!
playO
	^self error: self class notYourTurnErrorMessageDescription
	! !

!PlayerX methodsFor: 'ternilapilli operations' stamp: 'LR 6/17/2020 18:08:34'!
playX! !


!classDefinition: #TerniLapilli category: #TerniLapilli!
Object subclass: #TerniLapilli
	instanceVariableNames: 'player winner board playedChips validMoves players playerIndex playerX'
	classVariableNames: ''
	poolDictionaries: ''
	category: 'TerniLapilli'!

!TerniLapilli methodsFor: 'private' stamp: 'LR 6/16/2020 21:58:22'!
checkAllColumns
	|index|
	index := 1.
	
	3 timesRepeat: [
		self checkColumnNumber: index.
		index := index + 1.
	]! !

!TerniLapilli methodsFor: 'private' stamp: 'LR 6/16/2020 22:17:48'!
checkAllDiagonals
	
	| downLeftCorner downRightCorner medium upperLeftCorner upperRightCorner |
	
	upperLeftCorner := board at: 1@1.
	upperRightCorner := board at: 3@1.
	medium := board at: 2@2.
	downLeftCorner := board at: 1@3.
	downRightCorner := board at: 3@3.
	
	(medium = nil) ifTrue: [^self].
	
	(((upperLeftCorner = downRightCorner) and: (upperLeftCorner = medium)) or:
	((upperRightCorner = downLeftCorner) and: (upperRightCorner = medium) )) ifTrue: [winner := medium].! !

!TerniLapilli methodsFor: 'private' stamp: 'LR 6/16/2020 22:04:49'!
checkAllRows
	|index|
	index := 1.
	
	3 timesRepeat: [
		self checkRowNumber: index.
		index := index + 1.
	]! !

!TerniLapilli methodsFor: 'private' stamp: 'LR 6/16/2020 22:09:17'!
checkColumnNumber: columnNumber 
	| firstElement secondElement thirdElement |
	
	firstElement := board at: columnNumber@1.
	secondElement := board at: columnNumber@2.	
	thirdElement := board at: columnNumber@3.

	((firstElement = secondElement) and: (secondElement = thirdElement) and: (thirdElement ~= nil))
	ifTrue: [winner := firstElement].! !

!TerniLapilli methodsFor: 'private' stamp: 'LR 6/16/2020 22:04:30'!
checkRowNumber: rowNumber 
	| firstElement secondElement thirdElement |
	
	firstElement := board at: 1@rowNumber.
	secondElement := board at: 2@rowNumber.	
	thirdElement := board at: 3@rowNumber.

	((firstElement = secondElement) and: (secondElement = thirdElement) and: (thirdElement ~= nil))
	ifTrue: [winner := firstElement].! !

!TerniLapilli methodsFor: 'private' stamp: 'LR 6/16/2020 21:52:05'!
checkThreeOnARow
	self checkAllColumns.
	self checkAllRows.
	self checkAllDiagonals.! !

!TerniLapilli methodsFor: 'private' stamp: 'LR 6/16/2020 23:16:05'!
finishTurn
	self checkThreeOnARow.
	self nextPlayer.! !

!TerniLapilli methodsFor: 'private' stamp: 'LR 6/17/2020 17:06:50'!
isTaken: aPosition
	^(board at: aPosition) ~= nil! !

!TerniLapilli methodsFor: 'private' stamp: 'LR 6/17/2020 17:06:22'!
isValidMoveFrom: sourcePoint to: destinationPoint 
	^(validMoves at: sourcePoint) includes: destinationPoint .! !

!TerniLapilli methodsFor: 'private' stamp: 'LR 6/17/2020 17:51:13'!
move: aChip at: sourcePosition to: destinationPosition
	(board at: sourcePosition) = aChip ifFalse: [self error: self class notYourChipPositionErrorMessageDescription].
	(self isTaken: destinationPosition) ifTrue: [self error: self class takenPositionErrorMessageDescription].
	(self isValidMoveFrom: sourcePosition to: destinationPosition) ifFalse: [self error: self class invalidMovementErrorMessageDescription].
	
	board at: sourcePosition put: nil.
	board at: destinationPosition put: aChip.
	
	self finishTurn.! !

!TerniLapilli methodsFor: 'private' stamp: 'LR 6/16/2020 23:22:32'!
nextPlayer
	playerIndex := ((playerIndex + 1) \\ 2).! !

!TerniLapilli methodsFor: 'private' stamp: 'LR 6/17/2020 18:11:21'!
put: aChip at: aPoint 
	(self isTaken: aPoint) ifTrue: [self error: self class takenPositionErrorMessageDescription].

	playedChips := playedChips+1.
	board at: aPoint put: aChip.
	self finishTurn.! !

!TerniLapilli methodsFor: 'private' stamp: 'LR 6/17/2020 17:35:16'!
state
	^TerniLapilliState stateFor: self
	! !


!TerniLapilli methodsFor: 'initialization' stamp: 'LR 6/17/2020 18:10:40'!
initialize
	players := Dictionary new.
	players at: 0 put: PlayerX new.
	players at: 1 put: PlayerO new.
	playerIndex := 0.
	
	board := Array2D height: 3 width: 3.
	playedChips := 0.
	
	validMoves := Dictionary new.
	validMoves at: 1@1 put: (Set withAll: {2@1. 2@2. 1@2.}).
	validMoves at: 2@1 put: (Set withAll: {1@1. 2@2. 3@1.}).
	validMoves at: 3@1 put: (Set withAll: {2@1. 3@2. 2@2.}).
	
	validMoves at: 1@2 put: (Set withAll: {1@1. 2@2. 1@3.}).
	validMoves at: 2@2 put: (Set withAll: {1@1. 1@2. 1@3. 2@1. 2@3. 3@1. 3@2. 3@3.}).
	validMoves at: 3@2 put: (Set withAll: {3@1. 3@3. 2@2.}).
	
	validMoves at: 1@3 put: (Set withAll: {1@2. 2@2. 2@3.}).
	validMoves at: 2@3 put: (Set withAll: {1@3. 2@2. 3@3.}).
	validMoves at: 3@3 put: (Set withAll: {2@3. 2@2. 3@2.}).! !


!TerniLapilli methodsFor: 'moving' stamp: 'LR 6/17/2020 18:10:20'!
moveOAt: sourcePosition to: destinationPosition
	self player playO.
	self state move: #O at: sourcePosition to: destinationPosition.! !

!TerniLapilli methodsFor: 'moving' stamp: 'LR 6/17/2020 18:07:24'!
moveXAt: sourcePosition to: destinationPosition
	self player playX.
	self state move: #X at: sourcePosition to: destinationPosition.! !

!TerniLapilli methodsFor: 'moving' stamp: 'LR 6/17/2020 18:12:13'!
putOAt: aPoint 
	self player playO.
	self state put: #O at: aPoint.! !

!TerniLapilli methodsFor: 'moving' stamp: 'LR 6/17/2020 18:12:01'!
putXAt: aPoint 
	self player playX.
	self state put: #X at: aPoint.! !


!TerniLapilli methodsFor: 'state' stamp: 'LR 6/16/2020 22:06:33'!
hasPlayerOWon
	^winner = #O.! !

!TerniLapilli methodsFor: 'state' stamp: 'LR 6/16/2020 22:06:25'!
hasPlayerXWon
	^winner = #X.! !

!TerniLapilli methodsFor: 'state' stamp: 'LR 6/17/2020 17:35:00'!
isOver
	^self state isOver.! !

!TerniLapilli methodsFor: 'state' stamp: 'LR 6/17/2020 18:14:05'!
isPlayingO
	^self player isPlayingO! !

!TerniLapilli methodsFor: 'state' stamp: 'LR 6/17/2020 18:14:10'!
isPlayingX
	^self player isPlayingX! !

!TerniLapilli methodsFor: 'state' stamp: 'LR 6/17/2020 18:12:50'!
playedChips
	^playedChips! !

!TerniLapilli methodsFor: 'state' stamp: 'LR 6/17/2020 17:52:06'!
player
	^players at: playerIndex.! !

!TerniLapilli methodsFor: 'state' stamp: 'LR 6/17/2020 17:43:04'!
winner
	^winner! !

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'TerniLapilli class' category: #TerniLapilli!
TerniLapilli class
	instanceVariableNames: ''!

!TerniLapilli class methodsFor: 'as yet unclassified' stamp: 'LR 6/16/2020 21:34:19'!
invalidMovementErrorMessageDescription
	^'invalid movement'! !

!TerniLapilli class methodsFor: 'as yet unclassified' stamp: 'LR 6/16/2020 21:37:08'!
moveExistingChipsErrorMessageDescription
	^'should move existing chips'! !

!TerniLapilli class methodsFor: 'as yet unclassified' stamp: 'LR 6/17/2020 17:51:01'!
notYourChipPositionErrorMessageDescription
	^'the chip you are trying to move is not yours'! !

!TerniLapilli class methodsFor: 'as yet unclassified' stamp: 'LR 6/16/2020 21:34:46'!
takenPositionErrorMessageDescription
	^'taken position'! !


!classDefinition: #TerniLapilliState category: #TerniLapilli!
Object subclass: #TerniLapilliState
	instanceVariableNames: 'game'
	classVariableNames: ''
	poolDictionaries: ''
	category: 'TerniLapilli'!

!TerniLapilliState methodsFor: 'initialization' stamp: 'LR 6/17/2020 17:39:59'!
initializeFor: aTerniLapilli

	game _ aTerniLapilli! !


!TerniLapilliState methodsFor: 'ternilapilli operations' stamp: 'LR 6/17/2020 17:37:40'!
isOver
	self subclassResponsibility ! !

!TerniLapilliState methodsFor: 'ternilapilli operations' stamp: 'LR 6/17/2020 18:13:30'!
move: aChip at: aSourcePosition to: aDestinationPosition
	self subclassResponsibility ! !

!TerniLapilliState methodsFor: 'ternilapilli operations' stamp: 'LR 6/17/2020 18:13:43'!
put: aChip at: aPosition
	self subclassResponsibility ! !

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'TerniLapilliState class' category: #TerniLapilli!
TerniLapilliState class
	instanceVariableNames: ''!

!TerniLapilliState class methodsFor: 'instance creation' stamp: 'LR 6/17/2020 17:39:14'!
for: aTerniLapilli

	^self new initializeFor: aTerniLapilli! !


!TerniLapilliState class methodsFor: 'state selection' stamp: 'LR 6/17/2020 17:39:32'!
canHandle: aTeriLapilli

	self subclassResponsibility ! !

!TerniLapilliState class methodsFor: 'state selection' stamp: 'LR 6/17/2020 17:38:53'!
stateFor: aTerniLapilli

	^(self subclasses detect: [:aTerniLapilliStateClass | aTerniLapilliStateClass canHandle: aTerniLapilli ]) for: aTerniLapilli! !


!TerniLapilliState class methodsFor: 'errors' stamp: 'LR 6/17/2020 17:28:58'!
gameOverErrorMessageDescription
	^'game is over'! !

!TerniLapilliState class methodsFor: 'errors' stamp: 'LR 6/17/2020 17:59:23'!
moveExistingChipsErrorMessageDescription
	^'should move existing chips'! !

!TerniLapilliState class methodsFor: 'errors' stamp: 'LR 6/17/2020 17:29:16'!
notYourTurnErrorMessageDescription
	^'its not your turn'! !

!TerniLapilliState class methodsFor: 'errors' stamp: 'LR 6/17/2020 18:01:16'!
putAllChipsErrorMessageDescription
	^'should put all your chips in the board'! !


!classDefinition: #TerniLapilliStateAllChipsSet category: #TerniLapilli!
TerniLapilliState subclass: #TerniLapilliStateAllChipsSet
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'TerniLapilli'!

!TerniLapilliStateAllChipsSet methodsFor: 'ternilapilli operations' stamp: 'LR 6/17/2020 17:35:41'!
isOver
	^false! !

!TerniLapilliStateAllChipsSet methodsFor: 'ternilapilli operations' stamp: 'LR 6/17/2020 17:57:40'!
move: aChip at: sourcePosition to: destinationPosition
	^game move: aChip at: sourcePosition to: destinationPosition.! !

!TerniLapilliStateAllChipsSet methodsFor: 'ternilapilli operations' stamp: 'LR 6/17/2020 17:59:42'!
put: aChip at: aPosition
	^self error: self class moveExistingChipsErrorMessageDescription.! !

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'TerniLapilliStateAllChipsSet class' category: #TerniLapilli!
TerniLapilliStateAllChipsSet class
	instanceVariableNames: ''!

!TerniLapilliStateAllChipsSet class methodsFor: 'state selection' stamp: 'LR 6/17/2020 17:56:08'!
canHandle: aTerniLapilli
	^aTerniLapilli playedChips = 6.! !


!classDefinition: #TerniLapilliStateNotAllChipsSet category: #TerniLapilli!
TerniLapilliState subclass: #TerniLapilliStateNotAllChipsSet
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'TerniLapilli'!

!TerniLapilliStateNotAllChipsSet methodsFor: 'ternilapilli operations' stamp: 'LR 6/17/2020 17:35:45'!
isOver
	^false! !

!TerniLapilliStateNotAllChipsSet methodsFor: 'ternilapilli operations' stamp: 'LR 6/17/2020 18:01:33'!
move: aChip at: sourcePosition to: destinationPosition
	^self error: self class putAllChipsErrorMessageDescription.! !

!TerniLapilliStateNotAllChipsSet methodsFor: 'ternilapilli operations' stamp: 'LR 6/17/2020 18:01:52'!
put: aChip at: aPosition
	^game put: aChip at: aPosition.! !

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'TerniLapilliStateNotAllChipsSet class' category: #TerniLapilli!
TerniLapilliStateNotAllChipsSet class
	instanceVariableNames: ''!

!TerniLapilliStateNotAllChipsSet class methodsFor: 'state selection' stamp: 'LR 6/17/2020 17:56:20'!
canHandle: aTerniLapilli
	^aTerniLapilli playedChips < 6.! !


!classDefinition: #TerniLapilliStateOver category: #TerniLapilli!
TerniLapilliState subclass: #TerniLapilliStateOver
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'TerniLapilli'!

!TerniLapilliStateOver methodsFor: 'ternilapilli operations' stamp: 'LR 6/17/2020 17:35:36'!
isOver
	^true! !

!TerniLapilliStateOver methodsFor: 'ternilapilli operations' stamp: 'LR 6/17/2020 18:02:18'!
move: aChip at: sourcePosition to: destinationPosition
	^self error: self class gameOverErrorMessageDescription! !

!TerniLapilliStateOver methodsFor: 'ternilapilli operations' stamp: 'LR 6/17/2020 18:02:27'!
put: aChip at: aPosition
	^self error: self class gameOverErrorMessageDescription! !

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'TerniLapilliStateOver class' category: #TerniLapilli!
TerniLapilliStateOver class
	instanceVariableNames: ''!

!TerniLapilliStateOver class methodsFor: 'state selection' stamp: 'LR 6/17/2020 17:40:49'!
canHandle: aTerniLapilli
	^aTerniLapilli winner ~= nil! !
