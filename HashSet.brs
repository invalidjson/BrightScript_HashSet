'******************************************************************'
'File: HashSet
'Author: Jason Dixon
'Description: hashset data structure wrapper using Associative Array
'******************************************************************'
Function HashSet() as Object
    this = {
        HashSetInit:        HashSet_Init
        addToHashSet:       HashSet_Add
        hashSet_Contains:   HashSet_Containsve
    }
    return this
End Function


'******************************************************************'
' init hashset using values in a delimiter-separated string
'******************************************************************'
Function HashSet_Init(list as String, delimiter)
	hashset = CreateObject("roAssociativeArray")
	regex = CreateObject("roRegex", delimiter, "")
	splitList = regex.split(list)

	for each item in splitList
		'enforce traditional definition of a set - No duplicates
		if(Data_Structures().hashSet_Contains(hashset, item) = false) then
			hashset.AddReplace(item, "")
		end if
	end for

	return hashset
end Function


'******************************************************************'
' add element to hashset
'******************************************************************'
Function HashSet_Add(hashset as Object, element as String)
	if(Data_Structures().hashSet_Contains(hashset, item) = false) then
		return hashset.AddReplace(element, "")
	else
		return false
	end if
end  Function


'******************************************************************'
' lookup if hashset contains value, return boolean result
'******************************************************************'
Function HashSet_Contains(hashset as Object, lookupItem as String)
	return hashset.DoesExist(lookupItem)
end Function
