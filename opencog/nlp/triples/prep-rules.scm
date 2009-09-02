;
; prep-rules.txt
;
; An experimental set of copula/preposition-mangling rules. 
;
; See "rules.txt" for more information about the file format.
;
; Copyright (c) 2009 Linas Vepstas <linasvepstas@gmail.com>
;
; -----------------------------------------------------------
; The following rules create word-preposition linkages; these must
; be created in advance, before the later rules run. These do not
; need to be precise (its OK to generate some garbage, I think(??)
; but its important that all prep phrases be considered
;
# IF %ListLink("# APPLY TRIPLE RULES", $sent)
		^ %WordInstanceLink($var1,$sent)  ; limit scope of rule
		^ _obj(be,$var1)
      ^ $prep($var1,$var2)              ; preposition
      ^ %LemmaLink($var1,$word1)        ; word of word instance
      THEN ^3_&scm:make-prep-phrase($word1,$prep)

# IF %ListLink("# APPLY TRIPLE RULES", $sent)
		^ %WordInstanceLink($var1,$sent)  ; limit scope of rule
		^ _subj(be,$var1)
      ^ $prep($var1,$var2)              ; preposition
      ^ %LemmaLink($var1,$word1)        ; word of word instance
      THEN ^3_&scm:make-prep-phrase($word1,$prep)

; Sentence: "The color of the sky is blue."
# IF %ListLink("# APPLY TRIPLE RULES", $sent)
		^ %WordInstanceLink($var1,$sent)  ; limit scope of rule
		^ _predadj($var1,$var0)
      ^ $prep($var1,$var2)              ; preposition 
      ^ %LemmaLink($var1,$word1)        ; word of word instance
      THEN ^3_&scm:make-prep-phrase($word1,$prep)

; Sentence: "Pottery is made from clay."
# IF %ListLink("# APPLY TRIPLE RULES", $sent)
		^ %WordInstanceLink($var1,$sent)  ; limit scope of rule
		^ _obj($var0,$var1)
      ^ $prep($var0,$var2)              ; preposition 
      ^ %LemmaLink($var0,$word0)        ; word of word instance
      THEN ^3_&scm:make-prep-phrase($word0,$prep)
